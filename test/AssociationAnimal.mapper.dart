// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'AssociationAnimal.dart';

class PersonMapper extends ClassMapperBase<Person> {
  PersonMapper._();

  static PersonMapper? _instance;
  static PersonMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PersonMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Person';

  static int _$id(Person v) => v.id;
  static const Field<Person, int> _f$id = Field('id', _$id);
  static String _$name(Person v) => v.name;
  static const Field<Person, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<Person> fields = const {
    #id: _f$id,
    #name: _f$name,
  };

  static Person _instantiate(DecodingData data) {
    return Person(id: data.dec(_f$id), name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Person fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Person>(map);
  }

  static Person fromJson(String json) {
    return ensureInitialized().decodeJson<Person>(json);
  }
}

mixin PersonMappable {
  String toJson() {
    return PersonMapper.ensureInitialized().encodeJson<Person>(this as Person);
  }

  Map<String, dynamic> toMap() {
    return PersonMapper.ensureInitialized().encodeMap<Person>(this as Person);
  }

  PersonCopyWith<Person, Person, Person> get copyWith =>
      _PersonCopyWithImpl(this as Person, $identity, $identity);
  @override
  String toString() {
    return PersonMapper.ensureInitialized().stringifyValue(this as Person);
  }

  @override
  bool operator ==(Object other) {
    return PersonMapper.ensureInitialized().equalsValue(this as Person, other);
  }

  @override
  int get hashCode {
    return PersonMapper.ensureInitialized().hashValue(this as Person);
  }
}

extension PersonValueCopy<$R, $Out> on ObjectCopyWith<$R, Person, $Out> {
  PersonCopyWith<$R, Person, $Out> get $asPerson =>
      $base.as((v, t, t2) => _PersonCopyWithImpl(v, t, t2));
}

abstract class PersonCopyWith<$R, $In extends Person, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? name});
  PersonCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PersonCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Person, $Out>
    implements PersonCopyWith<$R, Person, $Out> {
  _PersonCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Person> $mapper = PersonMapper.ensureInitialized();
  @override
  $R call({int? id, String? name}) => $apply(FieldCopyWithData(
      {if (id != null) #id: id, if (name != null) #name: name}));
  @override
  Person $make(CopyWithData data) => Person(
      id: data.get(#id, or: $value.id), name: data.get(#name, or: $value.name));

  @override
  PersonCopyWith<$R2, Person, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PersonCopyWithImpl($value, $cast, t);
}

class AssociationAnimalMapper extends ClassMapperBase<AssociationAnimal> {
  AssociationAnimalMapper._();

  static AssociationAnimalMapper? _instance;
  static AssociationAnimalMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AssociationAnimalMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AssociationAnimal';

  static int _$id(AssociationAnimal v) => v.id;
  static const Field<AssociationAnimal, int> _f$id = Field('id', _$id);
  static String _$name(AssociationAnimal v) => v.name;
  static const Field<AssociationAnimal, String> _f$name = Field('name', _$name);
  static String? _$species(AssociationAnimal v) => v.species;
  static const Field<AssociationAnimal, String> _f$species =
      Field('species', _$species, opt: true);
  static int? _$age(AssociationAnimal v) => v.age;
  static const Field<AssociationAnimal, int> _f$age =
      Field('age', _$age, opt: true);
  static Person? _$owner(AssociationAnimal v) => v.owner;
  static const Field<AssociationAnimal, Person> _f$owner =
      Field('owner', _$owner, mode: FieldMode.member);

  @override
  final MappableFields<AssociationAnimal> fields = const {
    #id: _f$id,
    #name: _f$name,
    #species: _f$species,
    #age: _f$age,
    #owner: _f$owner,
  };

  static AssociationAnimal _instantiate(DecodingData data) {
    return AssociationAnimal(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        species: data.dec(_f$species),
        age: data.dec(_f$age));
  }

  @override
  final Function instantiate = _instantiate;

  static AssociationAnimal fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AssociationAnimal>(map);
  }

  static AssociationAnimal fromJson(String json) {
    return ensureInitialized().decodeJson<AssociationAnimal>(json);
  }
}

mixin AssociationAnimalMappable {
  String toJson() {
    return AssociationAnimalMapper.ensureInitialized()
        .encodeJson<AssociationAnimal>(this as AssociationAnimal);
  }

  Map<String, dynamic> toMap() {
    return AssociationAnimalMapper.ensureInitialized()
        .encodeMap<AssociationAnimal>(this as AssociationAnimal);
  }

  AssociationAnimalCopyWith<AssociationAnimal, AssociationAnimal,
          AssociationAnimal>
      get copyWith => _AssociationAnimalCopyWithImpl(
          this as AssociationAnimal, $identity, $identity);
  @override
  String toString() {
    return AssociationAnimalMapper.ensureInitialized()
        .stringifyValue(this as AssociationAnimal);
  }

  @override
  bool operator ==(Object other) {
    return AssociationAnimalMapper.ensureInitialized()
        .equalsValue(this as AssociationAnimal, other);
  }

  @override
  int get hashCode {
    return AssociationAnimalMapper.ensureInitialized()
        .hashValue(this as AssociationAnimal);
  }
}

extension AssociationAnimalValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AssociationAnimal, $Out> {
  AssociationAnimalCopyWith<$R, AssociationAnimal, $Out>
      get $asAssociationAnimal =>
          $base.as((v, t, t2) => _AssociationAnimalCopyWithImpl(v, t, t2));
}

abstract class AssociationAnimalCopyWith<$R, $In extends AssociationAnimal,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? name, String? species, int? age});
  AssociationAnimalCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AssociationAnimalCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AssociationAnimal, $Out>
    implements AssociationAnimalCopyWith<$R, AssociationAnimal, $Out> {
  _AssociationAnimalCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AssociationAnimal> $mapper =
      AssociationAnimalMapper.ensureInitialized();
  @override
  $R call(
          {int? id,
          String? name,
          Object? species = $none,
          Object? age = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (species != $none) #species: species,
        if (age != $none) #age: age
      }));
  @override
  AssociationAnimal $make(CopyWithData data) => AssociationAnimal(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      species: data.get(#species, or: $value.species),
      age: data.get(#age, or: $value.age));

  @override
  AssociationAnimalCopyWith<$R2, AssociationAnimal, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AssociationAnimalCopyWithImpl($value, $cast, t);
}
