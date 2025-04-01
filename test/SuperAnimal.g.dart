// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SuperAnimal.dart';

// **************************************************************************
// MappableSuperModelGenerator
// **************************************************************************

// **************************************************************************
// MappableSuperModelGenerator
// **************************************************************************
extension SuperAnimalMappableFields on SuperAnimal {
  static const String $id = 'id';
  static const String $name = 'name';
  static const String $species = 'species';
  static const String $age = 'age';
  static const fromJson = SuperAnimalMapper.fromJson;
  static const fromMap = SuperAnimalMapper.fromMap;
  static const $fromJson = SuperAnimalMapper.fromJson;
  static const $fromMap = SuperAnimalMapper.fromMap;
  static Map<String, dynamic Function(SuperAnimal)> _$getters = {
    $id: (SuperAnimal o) => o.id,
    $name: (SuperAnimal o) => o.name,
    $species: (SuperAnimal o) => o.species,
    $age: (SuperAnimal o) => o.age,
  };
}

mixin SuperAnimalMappableMixin on SuperModelBase implements ISuperModel {
  @override
  ModelClassMeta get $classMeta => SuperAnimalSuperModelGeneratedFields.$meta;
  @override
  M $copyWithMap<M>(Map<String, dynamic> map) {
    final mergedMap = {...(this as SuperAnimal).toMap(), ...map};
    return SuperAnimalMappableFields.fromMap(mergedMap) as M;
  }

  @override
  T? $get<T>(String key, [T? defaultValue]) {
    final getter = SuperAnimalMappableFields._$getters[key];
    if (getter == null) return defaultValue;
    return getter(this as SuperAnimal) as T?;
  }

  @override
  Map<String, dynamic> $toMap() {
    if (this is SuperAnimal) {
      return (this as SuperAnimal).toMap();
    }
    throw UnimplementedError("toMap() not implemented in ${this.runtimeType}");
  }

  @override
  String $toJson() {
    if (this is SuperAnimal) {
      return (this as SuperAnimal).toJson();
    }
    throw UnimplementedError("toJson() not implemented in ${this.runtimeType}");
  }

  dynamic operator [](String key) {
    final getter = SuperAnimalMappableFields._$getters[key];
    return getter == null ? null : getter(this as SuperAnimal);
  }

  SuperAnimal $copyWith({
    int? id,
    String? name,
    String? species,
    int? age,
  }) {
    final self = this as SuperAnimal;
    return SuperAnimal(
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
extension SuperAnimalSuperModelGeneratedFields on SuperAnimal {
  static const String $id = "id";
  static const String $name = "name";
  static const String $species = "species";
  static const String $age = "age";
  static const ModelClassMeta $meta = ModelClassMeta(SuperAnimal, "id", int, {
    $id: const PropertyMeta($id, int, false, 'int', 'int'),
    $name: const PropertyMeta($name, String, false, 'String', 'String'),
    $species: const PropertyMeta($species, String, true, 'String', 'String?'),
    $age: const PropertyMeta($age, int, true, 'int', 'int?'),
  });
}

mixin SuperAnimalSuperModelMixin on SuperModelBase {
  @override
  Map<String, dynamic Function()> get $getters => {
        "id": () => (this as SuperAnimal).id,
        "name": () => (this as SuperAnimal).name,
        "species": () => (this as SuperAnimal).species,
        "age": () => (this as SuperAnimal).age
      };
  @override
  dynamic operator [](String key) {
    var getter = $getters[key];
    if (getter == null) return null;
    return getter();
  }

  @override
  ModelClassMeta get $classMeta => SuperAnimalSuperModelGeneratedFields.$meta;
}
