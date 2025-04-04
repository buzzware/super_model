// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SuperAnimal.dart';

// **************************************************************************
// SuperModelGenerator
// **************************************************************************

// **************************************************************************
// SuperModelGenerator
// **************************************************************************
mixin SuperAnimalMeta on SuperModelBase implements ISuperModel {
  static const String $id = "id";
  static const String $name = "name";
  static const String $species = "species";
  static const String $age = "age";
  static const fromJson = SuperAnimalMapper.fromJson;
  static const fromMap = SuperAnimalMapper.fromMap;
  static const $fromJson = SuperAnimalMapper.fromJson;
  static const $fromMap = SuperAnimalMapper.fromMap;
  static SuperModelInfo $info = SuperModelInfo(SuperAnimal, null, "id", int, {
    $id: PropertyMeta(
        $id, int, false, 'int', 'int', (o) => (o as SuperAnimal).id),
    $name: PropertyMeta($name, String, false, 'String', 'String',
        (o) => (o as SuperAnimal).name),
    $species: PropertyMeta($species, String, true, 'String', 'String?',
        (o) => (o as SuperAnimal).species),
    $age: PropertyMeta(
        $age, int, true, 'int', 'int?', (o) => (o as SuperAnimal).age),
  });
  @override
  dynamic operator [](String key) {
    final property = $classInfo.fields[key];
    return property?.getValue(this);
  }

  @override
  SuperModelInfo get $classInfo => $info;
  @override
  M $copyWithMap<M>(Map<String, dynamic> map) {
    final mergedMap = {...(this as SuperAnimal).toMap(), ...map};
    return fromMap(mergedMap) as M;
  }

  @override
  T? $get<T>(String key, [T? defaultValue]) {
    final property = $classInfo.fields[key];
    if (property == null) return defaultValue;
    return property.getValue(this) as T?;
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
