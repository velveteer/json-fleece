{-# LANGUAGE TypeFamilies #-}

module Fleece.Markdown.FleeceInstance
  ( Markdown
  , renderMarkdown
  ) where

import Data.Coerce (coerce)
import qualified Data.DList as DList
import qualified Data.Map.Strict as Map
import qualified Data.Text as T
import qualified Data.Text.Lazy as LT

import qualified Fleece.Core as FC
import Fleece.Markdown.Render (schemaDocumentationToMarkdown)
import Fleece.Markdown.SchemaDocumentation
  ( FieldDocumentation
      ( FieldDocumentation
      , fieldAllowsNull
      , fieldKeyRequired
      , fieldName
      , fieldSchemaDocs
      )
  , FieldList
  , MainEntry (ArrayEntry, EnumValues, Fields, NameOnly, NullableEntry, UnionEntry)
  , SchemaDocumentation
    ( SchemaDocumentation
    , schemaExcludeFromRender
    , schemaMainEntry
    , schemaName
    , schemaNullability
    , schemaReferences
    )
  , SchemaNullability (NotNull, Nullable)
  , schemaSelfReference
  )

newtype Markdown a = Markdown SchemaDocumentation

renderMarkdown :: Markdown a -> LT.Text
renderMarkdown (Markdown schemaDocs) =
  schemaDocumentationToMarkdown schemaDocs

instance FC.Fleece Markdown where
  newtype Object Markdown _object _a
    = Object FieldList

  newtype Field Markdown _object _a
    = Field FieldDocumentation

  newtype AdditionalFields Markdown _object _a
    = AdditionalFields FieldDocumentation

  data UnionMembers Markdown _allTypes _handledTypes
    = UnionMembers (DList.DList SchemaDocumentation)

  schemaName (Markdown schemaDoc) =
    schemaName schemaDoc

  number =
    primitiveMarkdown "number"

  text =
    primitiveMarkdown "string"

  boolean =
    primitiveMarkdown "boolean"

  array (Markdown itemSchemaDocs) =
    let
      arrayName =
        FC.annotateName (schemaName itemSchemaDocs) "array"
    in
      Markdown $
        SchemaDocumentation
          { schemaName = arrayName
          , schemaExcludeFromRender = True
          , schemaNullability = NotNull
          , schemaMainEntry = ArrayEntry (schemaMainEntry itemSchemaDocs)
          , schemaReferences = schemaSelfReference itemSchemaDocs
          }

  null =
    primitiveMarkdown "null"

  nullable =
    markNullable

  required name _accessor fieldSchema =
    Field (mkFieldDocs name True fieldSchema)

  optional name _accessor fieldSchema =
    Field (mkFieldDocs name False fieldSchema)

  mapField _f =
    coerce

  additionalFields _accessor fieldSchema =
    AdditionalFields (mkFieldDocs "All Other Keys" False fieldSchema)

  constructor _f =
    Object mempty

  field (Object fields) (Field fieldDocs) =
    Object (DList.snoc fields fieldDocs)

  additional (Object fields) (AdditionalFields fieldDocs) =
    Object (DList.snoc fields fieldDocs)

  objectNamed name (Object fields) =
    Markdown $
      SchemaDocumentation
        { schemaName = name
        , schemaExcludeFromRender = False
        , schemaNullability = NotNull
        , schemaMainEntry = Fields fields
        , schemaReferences = foldMap (schemaSelfReference . fieldSchemaDocs) fields
        }

  validateNamed _name _check _unvalidate (Markdown schemaDocs) =
    Markdown schemaDocs

  boundedEnumNamed name toText =
    let
      enumValues =
        map toText [minBound .. maxBound]
    in
      Markdown $
        SchemaDocumentation
          { schemaName = name
          , schemaExcludeFromRender = False
          , schemaNullability = NotNull
          , schemaMainEntry = EnumValues enumValues
          , schemaReferences = Map.empty
          }

  unionNamed name (UnionMembers membersDList) =
    Markdown $
      let
        members =
          DList.toList membersDList
      in
        SchemaDocumentation
          { schemaName = name
          , schemaExcludeFromRender = False
          , schemaNullability = NotNull
          , schemaMainEntry = UnionEntry (map schemaName members)
          , schemaReferences =
              Map.fromList
                . map (\docs -> (schemaName docs, docs))
                $ members
          }

  unionMemberWithIndex _index markdown =
    UnionMembers $
      let
        Markdown schemaDocs = markdown
      in
        DList.singleton schemaDocs

  unionCombine (UnionMembers left) (UnionMembers right) =
    UnionMembers (left <> right)

  jsonString (Markdown schemaDocs) =
    Markdown $
      schemaDocs
        { schemaName = FC.annotateName (schemaName schemaDocs) "(encoded as json string)"
        }

primitiveMarkdown :: String -> Markdown a
primitiveMarkdown nameString =
  let
    name =
      FC.unqualifiedName nameString
  in
    Markdown $
      SchemaDocumentation
        { schemaName = name
        , schemaExcludeFromRender = True
        , schemaNullability = NotNull
        , schemaMainEntry = NameOnly name
        , schemaReferences = Map.empty
        }

markNullable :: Markdown a -> Markdown (Either FC.Null a)
markNullable (Markdown schemaDocs) =
  Markdown $
    SchemaDocumentation
      { schemaName = FC.annotateName (schemaName schemaDocs) "nullable"
      , schemaExcludeFromRender = schemaExcludeFromRender schemaDocs
      , schemaNullability = Nullable schemaDocs
      , schemaMainEntry = NullableEntry (schemaMainEntry schemaDocs)
      , schemaReferences = schemaReferences schemaDocs
      }

mkFieldDocs ::
  String ->
  Bool ->
  Markdown a ->
  FieldDocumentation
mkFieldDocs name required (Markdown schemaDocs) =
  let
    nullAllowed =
      case schemaNullability schemaDocs of
        NotNull -> False
        Nullable _notNullSchema -> True
  in
    FieldDocumentation
      { fieldName = T.pack name
      , fieldKeyRequired = required
      , fieldAllowsNull = nullAllowed
      , fieldSchemaDocs = schemaDocs
      }
