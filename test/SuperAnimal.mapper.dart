// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'SuperAnimal.dart';

class SuperAnimalMapper extends ClassMapperBase<SuperAnimal> {
  SuperAnimalMapper._();

  static SuperAnimalMapper? _instance;
  static SuperAnimalMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SuperAnimalMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SuperAnimal';

  static int _$id(SuperAnimal v) => v.id;
  static const Field<SuperAnimal, int> _f$id = Field('id', _$id);
  static String _$name(SuperAnimal v) => v.name;
  static const Field<SuperAnimal, String> _f$name = Field('name', _$name);
  static String? _$species(SuperAnimal v) => v.species;
  static const Field<SuperAnimal, String> _f$species =
      Field('species', _$species, opt: true);
  static int? _$age(SuperAnimal v) => v.age;
  static const Field<SuperAnimal, int> _f$age = Field('age', _$age, opt: true);

  @override
  final MappableFields<SuperAnimal> fields = const {
    #id: _f$id,
    #name: _f$name,
    #species: _f$species,
    #age: _f$age,
  };

  static SuperAnimal _instantiate(DecodingData data) {
    return SuperAnimal(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        species: data.dec(_f$species),
        age: data.dec(_f$age));
  }

  @override
  final Function instantiate = _instantiate;

  static SuperAnimal fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SuperAnimal>(map);
  }

  static SuperAnimal fromJson(String json) {
    return ensureInitialized().decodeJson<SuperAnimal>(json);
  }
}

mixin SuperAnimalMappable {
  String toJson() {
    return SuperAnimalMapper.ensureInitialized()
        .encodeJson<SuperAnimal>(this as SuperAnimal);
  }

  Map<String, dynamic> toMap() {
    return SuperAnimalMapper.ensureInitialized()
        .encodeMap<SuperAnimal>(this as SuperAnimal);
  }

  SuperAnimalCopyWith<SuperAnimal, SuperAnimal, SuperAnimal> get copyWith =>
      _SuperAnimalCopyWithImpl(this as SuperAnimal, $identity, $identity);
  @override
  String toString() {
    return SuperAnimalMapper.ensureInitialized()
        .stringifyValue(this as SuperAnimal);
  }

  @override
  bool operator ==(Object other) {
    return SuperAnimalMapper.ensureInitialized()
        .equalsValue(this as SuperAnimal, other);
  }

  @override
  int get hashCode {
    return SuperAnimalMapper.ensureInitialized().hashValue(this as SuperAnimal);
  }
}

extension SuperAnimalValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SuperAnimal, $Out> {
  SuperAnimalCopyWith<$R, SuperAnimal, $Out> get $asSuperAnimal =>
      $base.as((v, t, t2) => _SuperAnimalCopyWithImpl(v, t, t2));
}

abstract class SuperAnimalCopyWith<$R, $In extends SuperAnimal, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? name, String? species, int? age});
  SuperAnimalCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SuperAnimalCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SuperAnimal, $Out>
    implements SuperAnimalCopyWith<$R, SuperAnimal, $Out> {
  _SuperAnimalCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SuperAnimal> $mapper =
      SuperAnimalMapper.ensureInitialized();
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
  SuperAnimal $make(CopyWithData data) => SuperAnimal(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      species: data.get(#species, or: $value.species),
      age: data.get(#age, or: $value.age));

  @override
  SuperAnimalCopyWith<$R2, SuperAnimal, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SuperAnimalCopyWithImpl($value, $cast, t);
}
