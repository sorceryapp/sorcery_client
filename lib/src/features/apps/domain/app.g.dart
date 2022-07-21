// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetAppCollection on Isar {
  IsarCollection<App> get apps => collection();
}

const AppSchema = CollectionSchema(
  name: r'App',
  schema:
      r'{"name":"App","idName":"id","properties":[{"name":"appId","type":"Long"},{"name":"blueprint","type":"String"},{"name":"frameworkId","type":"Long"},{"name":"hashCode","type":"Long"},{"name":"name","type":"String"},{"name":"path","type":"String"},{"name":"permission","type":"String"},{"name":"typeId","type":"Long"}],"indexes":[],"links":[]}',
  idName: r'id',
  propertyIds: {
    r'appId': 0,
    r'blueprint': 1,
    r'frameworkId': 2,
    r'hashCode': 3,
    r'name': 4,
    r'path': 5,
    r'permission': 6,
    r'typeId': 7
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _appGetId,
  setId: _appSetId,
  getLinks: _appGetLinks,
  attachLinks: _appAttachLinks,
  serializeNative: _appSerializeNative,
  deserializeNative: _appDeserializeNative,
  deserializePropNative: _appDeserializePropNative,
  serializeWeb: _appSerializeWeb,
  deserializeWeb: _appDeserializeWeb,
  deserializePropWeb: _appDeserializePropWeb,
  version: 4,
);

int? _appGetId(App object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _appSetId(App object, int id) {
  object.id = id;
}

List<IsarLinkBase<dynamic>> _appGetLinks(App object) {
  return [];
}

const _appIsarBlueprintConverter = IsarBlueprintConverter();

void _appSerializeNative(IsarCollection<App> collection, IsarCObject cObj,
    App object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
  final blueprint$Converted =
      _appIsarBlueprintConverter.toIsar(object.blueprint);
  final blueprint$Bytes =
      IsarBinaryWriter.utf8Encoder.convert(blueprint$Converted);
  final name$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.name);
  IsarUint8List? path$Bytes;
  final path$Value = object.path;
  if (path$Value != null) {
    path$Bytes = IsarBinaryWriter.utf8Encoder.convert(path$Value);
  }
  final permission$Bytes =
      IsarBinaryWriter.utf8Encoder.convert(object.permission);
  final size = (staticSize +
      3 +
      (blueprint$Bytes.length) +
      3 +
      (name$Bytes.length) +
      3 +
      (path$Bytes?.length ?? 0) +
      3 +
      (permission$Bytes.length)) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
  writer.writeLong(offsets[0], object.appId);
  writer.writeByteList(offsets[1], blueprint$Bytes);
  writer.writeLong(offsets[2], object.frameworkId);
  writer.writeLong(offsets[3], object.hashCode);
  writer.writeByteList(offsets[4], name$Bytes);
  writer.writeByteList(offsets[5], path$Bytes);
  writer.writeByteList(offsets[6], permission$Bytes);
  writer.writeLong(offsets[7], object.typeId);
}

App _appDeserializeNative(IsarCollection<App> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = App(
    appId: reader.readLong(offsets[0]),
    blueprint:
        _appIsarBlueprintConverter.fromIsar(reader.readString(offsets[1])),
    frameworkId: reader.readLong(offsets[2]),
    name: reader.readString(offsets[4]),
    path: reader.readStringOrNull(offsets[5]),
    permission: reader.readString(offsets[6]),
    typeId: reader.readLong(offsets[7]),
  );
  object.id = id;
  return object;
}

P _appDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (_appIsarBlueprintConverter.fromIsar(reader.readString(offset)))
          as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Illegal propertyIndex');
  }
}

Object _appSerializeWeb(IsarCollection<App> collection, App object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, r'appId', object.appId);
  IsarNative.jsObjectSet(
      jsObj, r'blueprint', _appIsarBlueprintConverter.toIsar(object.blueprint));
  IsarNative.jsObjectSet(jsObj, r'frameworkId', object.frameworkId);
  IsarNative.jsObjectSet(jsObj, r'hashCode', object.hashCode);
  IsarNative.jsObjectSet(jsObj, r'id', object.id);
  IsarNative.jsObjectSet(jsObj, r'name', object.name);
  IsarNative.jsObjectSet(jsObj, r'path', object.path);
  IsarNative.jsObjectSet(jsObj, r'permission', object.permission);
  IsarNative.jsObjectSet(jsObj, r'typeId', object.typeId);
  return jsObj;
}

App _appDeserializeWeb(IsarCollection<App> collection, Object jsObj) {
  final object = App(
    appId: IsarNative.jsObjectGet(jsObj, r'appId') ??
        (double.negativeInfinity as int),
    blueprint: _appIsarBlueprintConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, r'blueprint') ?? ''),
    frameworkId: IsarNative.jsObjectGet(jsObj, r'frameworkId') ??
        (double.negativeInfinity as int),
    name: IsarNative.jsObjectGet(jsObj, r'name') ?? '',
    path: IsarNative.jsObjectGet(jsObj, r'path'),
    permission: IsarNative.jsObjectGet(jsObj, r'permission') ?? '',
    typeId: IsarNative.jsObjectGet(jsObj, r'typeId') ??
        (double.negativeInfinity as int),
  );
  object.id = IsarNative.jsObjectGet(jsObj, r'id');
  return object;
}

P _appDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'appId':
      return (IsarNative.jsObjectGet(jsObj, r'appId') ??
          (double.negativeInfinity as int)) as P;
    case r'blueprint':
      return (_appIsarBlueprintConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, r'blueprint') ?? '')) as P;
    case r'frameworkId':
      return (IsarNative.jsObjectGet(jsObj, r'frameworkId') ??
          (double.negativeInfinity as int)) as P;
    case r'hashCode':
      return (IsarNative.jsObjectGet(jsObj, r'hashCode') ??
          (double.negativeInfinity as int)) as P;
    case r'id':
      return (IsarNative.jsObjectGet(jsObj, r'id')) as P;
    case r'name':
      return (IsarNative.jsObjectGet(jsObj, r'name') ?? '') as P;
    case r'path':
      return (IsarNative.jsObjectGet(jsObj, r'path')) as P;
    case r'permission':
      return (IsarNative.jsObjectGet(jsObj, r'permission') ?? '') as P;
    case r'typeId':
      return (IsarNative.jsObjectGet(jsObj, r'typeId') ??
          (double.negativeInfinity as int)) as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _appAttachLinks(IsarCollection<dynamic> col, int id, App object) {}

extension AppQueryWhereSort on QueryBuilder<App, App, QWhere> {
  QueryBuilder<App, App, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AppQueryWhere on QueryBuilder<App, App, QWhereClause> {
  QueryBuilder<App, App, QAfterWhereClause> idEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<App, App, QAfterWhereClause> idNotEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<App, App, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<App, App, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<App, App, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppQueryFilter on QueryBuilder<App, App, QFilterCondition> {
  QueryBuilder<App, App, QAfterFilterCondition> appIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appId',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'appId',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'appId',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'appId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> blueprintEqualTo(
    Map<dynamic, dynamic> value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blueprint',
        value: _appIsarBlueprintConverter.toIsar(value),
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> blueprintGreaterThan(
    Map<dynamic, dynamic> value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blueprint',
        value: _appIsarBlueprintConverter.toIsar(value),
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> blueprintLessThan(
    Map<dynamic, dynamic> value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blueprint',
        value: _appIsarBlueprintConverter.toIsar(value),
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> blueprintBetween(
    Map<dynamic, dynamic> lower,
    Map<dynamic, dynamic> upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'blueprint',
        lower: _appIsarBlueprintConverter.toIsar(lower),
        includeLower: includeLower,
        upper: _appIsarBlueprintConverter.toIsar(upper),
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> blueprintStartsWith(
    Map<dynamic, dynamic> value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'blueprint',
        value: _appIsarBlueprintConverter.toIsar(value),
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> blueprintEndsWith(
    Map<dynamic, dynamic> value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'blueprint',
        value: _appIsarBlueprintConverter.toIsar(value),
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> blueprintContains(
      Map<dynamic, dynamic> value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'blueprint',
        value: _appIsarBlueprintConverter.toIsar(value),
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> blueprintMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'blueprint',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> frameworkIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frameworkId',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> frameworkIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frameworkId',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> frameworkIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frameworkId',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> frameworkIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frameworkId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> pathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'path',
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> pathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> pathGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> pathLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> pathBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'path',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> pathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> pathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> pathContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> pathMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'path',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> permissionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'permission',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> permissionGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'permission',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> permissionLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'permission',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> permissionBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'permission',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> permissionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'permission',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> permissionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'permission',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> permissionContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'permission',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> permissionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'permission',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> typeIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typeId',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> typeIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'typeId',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> typeIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'typeId',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> typeIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'typeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppQueryLinks on QueryBuilder<App, App, QFilterCondition> {}

extension AppQueryWhereSortBy on QueryBuilder<App, App, QSortBy> {
  QueryBuilder<App, App, QAfterSortBy> sortByAppId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appId', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByAppIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appId', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByBlueprint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blueprint', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByBlueprintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blueprint', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByFrameworkId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frameworkId', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByFrameworkIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frameworkId', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByPermission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permission', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByPermissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permission', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeId', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeId', Sort.desc);
    });
  }
}

extension AppQueryWhereSortThenBy on QueryBuilder<App, App, QSortThenBy> {
  QueryBuilder<App, App, QAfterSortBy> thenByAppId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appId', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByAppIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appId', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByBlueprint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blueprint', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByBlueprintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blueprint', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByFrameworkId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frameworkId', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByFrameworkIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frameworkId', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByPermission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permission', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByPermissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permission', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeId', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeId', Sort.desc);
    });
  }
}

extension AppQueryWhereDistinct on QueryBuilder<App, App, QDistinct> {
  QueryBuilder<App, App, QDistinct> distinctByAppId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appId');
    });
  }

  QueryBuilder<App, App, QDistinct> distinctByBlueprint(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'blueprint', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<App, App, QDistinct> distinctByFrameworkId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frameworkId');
    });
  }

  QueryBuilder<App, App, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<App, App, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<App, App, QDistinct> distinctByPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'path', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<App, App, QDistinct> distinctByPermission(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'permission', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<App, App, QDistinct> distinctByTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'typeId');
    });
  }
}

extension AppQueryProperty on QueryBuilder<App, App, QQueryProperty> {
  QueryBuilder<App, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<App, int, QQueryOperations> appIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appId');
    });
  }

  QueryBuilder<App, Map<dynamic, dynamic>, QQueryOperations>
      blueprintProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blueprint');
    });
  }

  QueryBuilder<App, int, QQueryOperations> frameworkIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frameworkId');
    });
  }

  QueryBuilder<App, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<App, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<App, String?, QQueryOperations> pathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'path');
    });
  }

  QueryBuilder<App, String, QQueryOperations> permissionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'permission');
    });
  }

  QueryBuilder<App, int, QQueryOperations> typeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'typeId');
    });
  }
}
