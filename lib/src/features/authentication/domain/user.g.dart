// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable, no_leading_underscores_for_local_identifiers

extension GetUserCollection on Isar {
  IsarCollection<User> get users => getCollection();
}

const UserSchema = CollectionSchema(
  name: 'User',
  schema:
      '{"name":"User","idName":"id","properties":[{"name":"accountId","type":"Long"},{"name":"email","type":"String"},{"name":"firstName","type":"String"},{"name":"hashCode","type":"Long"},{"name":"lastName","type":"String"},{"name":"status","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'accountId': 0,
    'email': 1,
    'firstName': 2,
    'hashCode': 3,
    'lastName': 4,
    'status': 5
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _userGetId,
  setId: _userSetId,
  getLinks: _userGetLinks,
  attachLinks: _userAttachLinks,
  serializeNative: _userSerializeNative,
  deserializeNative: _userDeserializeNative,
  deserializePropNative: _userDeserializePropNative,
  serializeWeb: _userSerializeWeb,
  deserializeWeb: _userDeserializeWeb,
  deserializePropWeb: _userDeserializePropWeb,
  version: 4,
);

int? _userGetId(User object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _userSetId(User object, int id) {
  object.id = id;
}

List<IsarLinkBase> _userGetLinks(User object) {
  return [];
}

void _userSerializeNative(IsarCollection<User> collection, IsarCObject cObj,
    User object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.accountId;
  final _accountId = value0;
  final value1 = object.email;
  final _email = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_email.length) as int;
  final value2 = object.firstName;
  final _firstName = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_firstName.length) as int;
  final value3 = object.hashCode;
  final _hashCode = value3;
  final value4 = object.lastName;
  final _lastName = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_lastName.length) as int;
  final value5 = object.status;
  final _status = IsarBinaryWriter.utf8Encoder.convert(value5);
  dynamicSize += (_status.length) as int;
  final size = staticSize + dynamicSize;

  cObj.buffer = alloc(size);
  cObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _accountId);
  writer.writeBytes(offsets[1], _email);
  writer.writeBytes(offsets[2], _firstName);
  writer.writeLong(offsets[3], _hashCode);
  writer.writeBytes(offsets[4], _lastName);
  writer.writeBytes(offsets[5], _status);
}

User _userDeserializeNative(IsarCollection<User> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = User(
    accountId: reader.readLong(offsets[0]),
    email: reader.readString(offsets[1]),
    firstName: reader.readString(offsets[2]),
    lastName: reader.readString(offsets[4]),
    status: reader.readString(offsets[5]),
  );
  object.id = id;
  return object;
}

P _userDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _userSerializeWeb(IsarCollection<User> collection, User object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'accountId', object.accountId);
  IsarNative.jsObjectSet(jsObj, 'email', object.email);
  IsarNative.jsObjectSet(jsObj, 'firstName', object.firstName);
  IsarNative.jsObjectSet(jsObj, 'hashCode', object.hashCode);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'lastName', object.lastName);
  IsarNative.jsObjectSet(jsObj, 'status', object.status);
  return jsObj;
}

User _userDeserializeWeb(IsarCollection<User> collection, dynamic jsObj) {
  final object = User(
    accountId:
        IsarNative.jsObjectGet(jsObj, 'accountId') ?? double.negativeInfinity,
    email: IsarNative.jsObjectGet(jsObj, 'email') ?? '',
    firstName: IsarNative.jsObjectGet(jsObj, 'firstName') ?? '',
    lastName: IsarNative.jsObjectGet(jsObj, 'lastName') ?? '',
    status: IsarNative.jsObjectGet(jsObj, 'status') ?? '',
  );
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  return object;
}

P _userDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'accountId':
      return (IsarNative.jsObjectGet(jsObj, 'accountId') ??
          double.negativeInfinity) as P;
    case 'email':
      return (IsarNative.jsObjectGet(jsObj, 'email') ?? '') as P;
    case 'firstName':
      return (IsarNative.jsObjectGet(jsObj, 'firstName') ?? '') as P;
    case 'hashCode':
      return (IsarNative.jsObjectGet(jsObj, 'hashCode') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'lastName':
      return (IsarNative.jsObjectGet(jsObj, 'lastName') ?? '') as P;
    case 'status':
      return (IsarNative.jsObjectGet(jsObj, 'status') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _userAttachLinks(IsarCollection col, int id, User object) {}

extension UserQueryWhereSort on QueryBuilder<User, User, QWhere> {
  QueryBuilder<User, User, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension UserQueryWhere on QueryBuilder<User, User, QWhereClause> {
  QueryBuilder<User, User, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<User, User, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<User, User, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<User, User, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<User, User, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension UserQueryFilter on QueryBuilder<User, User, QFilterCondition> {
  QueryBuilder<User, User, QAfterFilterCondition> accountIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'accountId',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> accountIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'accountId',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> accountIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'accountId',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> accountIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'accountId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'email',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'email',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> firstNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'firstName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> firstNameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'firstName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> firstNameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'firstName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> firstNameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'firstName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> firstNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'firstName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> firstNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'firstName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> firstNameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'firstName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> firstNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'firstName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> hashCodeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'hashCode',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'lastName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'lastName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'lastName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'lastName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'lastName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'lastName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'lastName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'lastName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> statusGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> statusLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> statusBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'status',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> statusContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> statusMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'status',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension UserQueryLinks on QueryBuilder<User, User, QFilterCondition> {}

extension UserQueryWhereSortBy on QueryBuilder<User, User, QSortBy> {
  QueryBuilder<User, User, QAfterSortBy> sortByAccountId() {
    return addSortByInternal('accountId', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByAccountIdDesc() {
    return addSortByInternal('accountId', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByEmail() {
    return addSortByInternal('email', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByEmailDesc() {
    return addSortByInternal('email', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByFirstName() {
    return addSortByInternal('firstName', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByFirstNameDesc() {
    return addSortByInternal('firstName', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByLastName() {
    return addSortByInternal('lastName', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByLastNameDesc() {
    return addSortByInternal('lastName', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByStatus() {
    return addSortByInternal('status', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByStatusDesc() {
    return addSortByInternal('status', Sort.desc);
  }
}

extension UserQueryWhereSortThenBy on QueryBuilder<User, User, QSortThenBy> {
  QueryBuilder<User, User, QAfterSortBy> thenByAccountId() {
    return addSortByInternal('accountId', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByAccountIdDesc() {
    return addSortByInternal('accountId', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByEmail() {
    return addSortByInternal('email', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByEmailDesc() {
    return addSortByInternal('email', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByFirstName() {
    return addSortByInternal('firstName', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByFirstNameDesc() {
    return addSortByInternal('firstName', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByLastName() {
    return addSortByInternal('lastName', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByLastNameDesc() {
    return addSortByInternal('lastName', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByStatus() {
    return addSortByInternal('status', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByStatusDesc() {
    return addSortByInternal('status', Sort.desc);
  }
}

extension UserQueryWhereDistinct on QueryBuilder<User, User, QDistinct> {
  QueryBuilder<User, User, QDistinct> distinctByAccountId() {
    return addDistinctByInternal('accountId');
  }

  QueryBuilder<User, User, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('email', caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByFirstName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('firstName', caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByHashCode() {
    return addDistinctByInternal('hashCode');
  }

  QueryBuilder<User, User, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<User, User, QDistinct> distinctByLastName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('lastName', caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('status', caseSensitive: caseSensitive);
  }
}

extension UserQueryProperty on QueryBuilder<User, User, QQueryProperty> {
  QueryBuilder<User, int, QQueryOperations> accountIdProperty() {
    return addPropertyNameInternal('accountId');
  }

  QueryBuilder<User, String, QQueryOperations> emailProperty() {
    return addPropertyNameInternal('email');
  }

  QueryBuilder<User, String, QQueryOperations> firstNameProperty() {
    return addPropertyNameInternal('firstName');
  }

  QueryBuilder<User, int, QQueryOperations> hashCodeProperty() {
    return addPropertyNameInternal('hashCode');
  }

  QueryBuilder<User, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<User, String, QQueryOperations> lastNameProperty() {
    return addPropertyNameInternal('lastName');
  }

  QueryBuilder<User, String, QQueryOperations> statusProperty() {
    return addPropertyNameInternal('status');
  }
}
