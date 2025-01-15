// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'MappableAnimal.dart';

class MappableAnimalMapper extends ClassMapperBase<MappableAnimal> {
  MappableAnimalMapper._();

  static MappableAnimalMapper? _instance;
  static MappableAnimalMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MappableAnimalMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MappableAnimal';

  static int _$id(MappableAnimal v) => v.id;
  static const Field<MappableAnimal, int> _f$id = Field('id', _$id);
  static String _$name(MappableAnimal v) => v.name;
  static const Field<MappableAnimal, String> _f$name = Field('name', _$name);
  static String? _$species(MappableAnimal v) => v.species;
  static const Field<MappableAnimal, String> _f$species =
      Field('species', _$species, opt: true);
  static int? _$age(MappableAnimal v) => v.age;
  static const Field<MappableAnimal, int> _f$age =
      Field('age', _$age, opt: true);

  @override
  final MappableFields<MappableAnimal> fields = const {
    #id: _f$id,
    #name: _f$name,
    #species: _f$species,
    #age: _f$age,
  };

  static MappableAnimal _instantiate(DecodingData data) {
    return MappableAnimal(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        species: data.dec(_f$species),
        age: data.dec(_f$age));
  }

  @override
  final Function instantiate = _instantiate;

  static MappableAnimal fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MappableAnimal>(map);
  }

  static MappableAnimal fromJson(String json) {
    return ensureInitialized().decodeJson<MappableAnimal>(json);
  }
}

mixin MappableAnimalMappable {
  String toJson() {
    return MappableAnimalMapper.ensureInitialized()
        .encodeJson<MappableAnimal>(this as MappableAnimal);
  }

  Map<String, dynamic> toMap() {
    return MappableAnimalMapper.ensureInitialized()
        .encodeMap<MappableAnimal>(this as MappableAnimal);
  }

  MappableAnimalCopyWith<MappableAnimal, MappableAnimal, MappableAnimal>
      get copyWith => _MappableAnimalCopyWithImpl(
          this as MappableAnimal, $identity, $identity);
  @override
  String toString() {
    return MappableAnimalMapper.ensureInitialized()
        .stringifyValue(this as MappableAnimal);
  }

  @override
  bool operator ==(Object other) {
    return MappableAnimalMapper.ensureInitialized()
        .equalsValue(this as MappableAnimal, other);
  }

  @override
  int get hashCode {
    return MappableAnimalMapper.ensureInitialized()
        .hashValue(this as MappableAnimal);
  }
}

extension MappableAnimalValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MappableAnimal, $Out> {
  MappableAnimalCopyWith<$R, MappableAnimal, $Out> get $asMappableAnimal =>
      $base.as((v, t, t2) => _MappableAnimalCopyWithImpl(v, t, t2));
}

abstract class MappableAnimalCopyWith<$R, $In extends MappableAnimal, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? name, String? species, int? age});
  MappableAnimalCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MappableAnimalCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MappableAnimal, $Out>
    implements MappableAnimalCopyWith<$R, MappableAnimal, $Out> {
  _MappableAnimalCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MappableAnimal> $mapper =
      MappableAnimalMapper.ensureInitialized();
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
  MappableAnimal $make(CopyWithData data) => MappableAnimal(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      species: data.get(#species, or: $value.species),
      age: data.get(#age, or: $value.age));

  @override
  MappableAnimalCopyWith<$R2, MappableAnimal, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MappableAnimalCopyWithImpl($value, $cast, t);
}
