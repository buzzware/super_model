// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AssociationAnimal.dart';

// **************************************************************************
// SuperModelGenerator
// **************************************************************************

// **************************************************************************
// SuperModelGenerator
// **************************************************************************
mixin PersonMeta on SuperModelBase implements ISuperModel {
  static const String $id = "id";
  static const String $name = "name";
  static const fromJson = PersonMapper.fromJson;
  static const fromMap = PersonMapper.fromMap;
  static const $fromJson = PersonMapper.fromJson;
  static const $fromMap = PersonMapper.fromMap;
  static SuperModelInfo $info = SuperModelInfo(Person, null, "id", int, {
    $id: PropertyMeta($id, int, false, 'int', 'int', (o) => (o as Person).id),
    $name: PropertyMeta(
        $name, String, false, 'String', 'String', (o) => (o as Person).name),
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
    final mergedMap = {...(this as Person).toMap(), ...map};
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
    if (this is Person) {
      return (this as Person).toMap();
    }
    throw UnimplementedError("toMap() not implemented in ${this.runtimeType}");
  }

  @override
  String $toJson() {
    if (this is Person) {
      return (this as Person).toJson();
    }
    throw UnimplementedError("toJson() not implemented in ${this.runtimeType}");
  }

  Person $copyWith({
    int? id,
    String? name,
  }) {
    final self = this as Person;
    return Person(
      id: id ?? self.id,
      name: name ?? self.name,
    );
  }
}

// **************************************************************************
// SuperModelGenerator
// **************************************************************************
mixin AssociationAnimalMeta on SuperModelBase implements ISuperModel {
  static const String $id = "id";
  static const String $name = "name";
  static const String $species = "species";
  static const String $age = "age";
  static const String $person_id = "person_id";
  static const fromJson = AssociationAnimalMapper.fromJson;
  static const fromMap = AssociationAnimalMapper.fromMap;
  static const $fromJson = AssociationAnimalMapper.fromJson;
  static const $fromMap = AssociationAnimalMapper.fromMap;
  static SuperModelInfo $info =
      SuperModelInfo(AssociationAnimal, null, "id", int, {
    $id: PropertyMeta(
        $id, int, false, 'int', 'int', (o) => (o as AssociationAnimal).id),
    $name: PropertyMeta($name, String, false, 'String', 'String',
        (o) => (o as AssociationAnimal).name),
    $species: PropertyMeta($species, String, true, 'String', 'String?',
        (o) => (o as AssociationAnimal).species),
    $age: PropertyMeta(
        $age, int, true, 'int', 'int?', (o) => (o as AssociationAnimal).age),
    $person_id: PropertyMeta($person_id, int, true, 'int', 'int?',
        (o) => (o as AssociationAnimal).person_id),
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
    final mergedMap = {...(this as AssociationAnimal).toMap(), ...map};
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
    if (this is AssociationAnimal) {
      return (this as AssociationAnimal).toMap();
    }
    throw UnimplementedError("toMap() not implemented in ${this.runtimeType}");
  }

  @override
  String $toJson() {
    if (this is AssociationAnimal) {
      return (this as AssociationAnimal).toJson();
    }
    throw UnimplementedError("toJson() not implemented in ${this.runtimeType}");
  }

  AssociationAnimal $copyWith({
    int? id,
    String? name,
    String? species,
    int? age,
    int? person_id,
  }) {
    final self = this as AssociationAnimal;
    return AssociationAnimal(
      id: id ?? self.id,
      name: name ?? self.name,
      species: species ?? self.species,
      age: age ?? self.age,
      person_id: person_id ?? self.person_id,
    );
  }

  Person? _person;
  Person? get person => _person;
  set person(Person? value) {
    _person = value;
  }
}
