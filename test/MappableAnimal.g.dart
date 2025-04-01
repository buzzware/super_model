// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MappableAnimal.dart';

// **************************************************************************
// MappableSuperModelGenerator
// **************************************************************************

// **************************************************************************
// MappableSuperModelGenerator
// **************************************************************************
extension MappableAnimalMappableFields on MappableAnimal {
  static const String $id = 'id';
  static const String $name = 'name';
  static const String $species = 'species';
  static const String $age = 'age';
  static const fromJson = MappableAnimalMapper.fromJson;
  static const fromMap = MappableAnimalMapper.fromMap;
  static const $fromJson = MappableAnimalMapper.fromJson;
  static const $fromMap = MappableAnimalMapper.fromMap;
  static Map<String, dynamic Function(MappableAnimal)> _$getters = {
    $id: (MappableAnimal o) => o.id,
    $name: (MappableAnimal o) => o.name,
    $species: (MappableAnimal o) => o.species,
    $age: (MappableAnimal o) => o.age,
  };
}

mixin MappableAnimalMappableMixin on SuperModelBase implements ISuperModel {
  @override
  ModelClassMeta get $classMeta =>
      MappableAnimalSuperModelGeneratedFields.$meta;
  @override
  M $copyWithMap<M>(Map<String, dynamic> map) {
    final mergedMap = {...(this as MappableAnimal).toMap(), ...map};
    return MappableAnimalMappableFields.fromMap(mergedMap) as M;
  }

  @override
  T? $get<T>(String key, [T? defaultValue]) {
    final getter = MappableAnimalMappableFields._$getters[key];
    if (getter == null) return defaultValue;
    return getter(this as MappableAnimal) as T?;
  }

  @override
  Map<String, dynamic> $toMap() {
    if (this is MappableAnimal) {
      return (this as MappableAnimal).toMap();
    }
    throw UnimplementedError("toMap() not implemented in ${this.runtimeType}");
  }

  @override
  String $toJson() {
    if (this is MappableAnimal) {
      return (this as MappableAnimal).toJson();
    }
    throw UnimplementedError("toJson() not implemented in ${this.runtimeType}");
  }

  dynamic operator [](String key) {
    final getter = MappableAnimalMappableFields._$getters[key];
    return getter == null ? null : getter(this as MappableAnimal);
  }

  MappableAnimal $copyWith({
    int? id,
    String? name,
    String? species,
    int? age,
  }) {
    final self = this as MappableAnimal;
    return MappableAnimal(
      id: id ?? self.id,
      name: name ?? self.name,
      species: species ?? self.species,
      age: age ?? self.age,
    );
  }
}

// **************************************************************************
// SuperModelGenerator
// **************************************************************************

// **************************************************************************
// SuperModelGenerator
// **************************************************************************
extension MappableAnimalSuperModelGeneratedFields on MappableAnimal {
  static const String $id = "id";
  static const String $name = "name";
  static const String $species = "species";
  static const String $age = "age";
  static const ModelClassMeta $meta =
      ModelClassMeta(MappableAnimal, "id", int, {
    $id: const PropertyMeta($id, int, false, 'int', 'int'),
    $name: const PropertyMeta($name, String, false, 'String', 'String'),
    $species: const PropertyMeta($species, String, true, 'String', 'String?'),
    $age: const PropertyMeta($age, int, true, 'int', 'int?'),
  });
}

mixin MappableAnimalSuperModelMixin on SuperModelBase {
  @override
  Map<String, dynamic Function()> get $getters => {
        "id": () => (this as MappableAnimal).id,
        "name": () => (this as MappableAnimal).name,
        "species": () => (this as MappableAnimal).species,
        "age": () => (this as MappableAnimal).age
      };
  @override
  dynamic operator [](String key) {
    var getter = $getters[key];
    if (getter == null) return null;
    return getter();
  }

  @override
  ModelClassMeta get $classMeta =>
      MappableAnimalSuperModelGeneratedFields.$meta;
}
