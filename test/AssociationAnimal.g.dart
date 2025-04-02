// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AssociationAnimal.dart';

// **************************************************************************
// MappableSuperModelGenerator
// **************************************************************************

// **************************************************************************
// MappableSuperModelGenerator
// **************************************************************************
class PersonMappableFields {
  static const String $id = 'id';
  static const String $name = 'name';
  static const fromJson = PersonMapper.fromJson;
  static const fromMap = PersonMapper.fromMap;
  static const $fromJson = PersonMapper.fromJson;
  static const $fromMap = PersonMapper.fromMap;
}

mixin PersonMappableMixin on SuperModelBase implements ISuperModel {
  @override
  ModelClassMeta get $classMeta => PersonSuperModelGeneratedFields.$meta;
  @override
  M $copyWithMap<M>(Map<String, dynamic> map) {
    final mergedMap = {...(this as Person).toMap(), ...map};
    return PersonMappableFields.fromMap(mergedMap) as M;
  }

  @override
  T? $get<T>(String key, [T? defaultValue]) {
    final property = $classMeta.fields[key];
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

  dynamic operator [](String key) {
    final property = $classMeta.fields[key];
    return property?.getValue(this);
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
// MappableSuperModelGenerator
// **************************************************************************
class AssociationAnimalMappableFields {
  static const String $id = 'id';
  static const String $name = 'name';
  static const String $species = 'species';
  static const String $age = 'age';
  static const String $owner = 'owner';
  static const fromJson = AssociationAnimalMapper.fromJson;
  static const fromMap = AssociationAnimalMapper.fromMap;
  static const $fromJson = AssociationAnimalMapper.fromJson;
  static const $fromMap = AssociationAnimalMapper.fromMap;
}

mixin AssociationAnimalMappableMixin on SuperModelBase implements ISuperModel {
  @override
  ModelClassMeta get $classMeta =>
      AssociationAnimalSuperModelGeneratedFields.$meta;
  @override
  M $copyWithMap<M>(Map<String, dynamic> map) {
    final mergedMap = {...(this as AssociationAnimal).toMap(), ...map};
    return AssociationAnimalMappableFields.fromMap(mergedMap) as M;
  }

  @override
  T? $get<T>(String key, [T? defaultValue]) {
    final property = $classMeta.fields[key];
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

  dynamic operator [](String key) {
    final property = $classMeta.fields[key];
    return property?.getValue(this);
  }

  AssociationAnimal $copyWith({
    int? id,
    String? name,
    String? species,
    int? age,
    Person? owner,
  }) {
    final self = this as AssociationAnimal;
    return AssociationAnimal(
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
extension PersonSuperModelGeneratedFields on Person {
  static const String $id = "id";
  static const String $name = "name";
  static ModelClassMeta $meta = ModelClassMeta(Person, null, "id", int, {
    $id: PropertyMeta($id, int, false, 'int', 'int', (o) => (o as Person).id),
    $name: PropertyMeta(
        $name, String, false, 'String', 'String', (o) => (o as Person).name),
  });
}

mixin PersonMeta on SuperModelBase {
  @override
  dynamic operator [](String key) {
    final property = $classMeta.fields[key];
    return property?.getValue(this);
  }

  @override
  ModelClassMeta get $classMeta => PersonSuperModelGeneratedFields.$meta;
  static const $fromJson = PersonMapper.fromJson;
  static const $fromMap = PersonMapper.fromMap;
}

// **************************************************************************
// SuperModelGenerator
// **************************************************************************
extension AssociationAnimalSuperModelGeneratedFields on AssociationAnimal {
  static const String $id = "id";
  static const String $name = "name";
  static const String $species = "species";
  static const String $age = "age";
  static const String $owner = "owner";
  static ModelClassMeta $meta =
      ModelClassMeta(AssociationAnimal, null, "id", int, {
    $id: PropertyMeta(
        $id, int, false, 'int', 'int', (o) => (o as AssociationAnimal).id),
    $name: PropertyMeta($name, String, false, 'String', 'String',
        (o) => (o as AssociationAnimal).name),
    $species: PropertyMeta($species, String, true, 'String', 'String?',
        (o) => (o as AssociationAnimal).species),
    $age: PropertyMeta(
        $age, int, true, 'int', 'int?', (o) => (o as AssociationAnimal).age),
    $owner: PropertyMeta($owner, Person, true, 'Person', 'Person?',
        (o) => (o as AssociationAnimal).owner),
  });
}

mixin AssociationAnimalMeta on SuperModelBase {
  @override
  dynamic operator [](String key) {
    final property = $classMeta.fields[key];
    return property?.getValue(this);
  }

  @override
  ModelClassMeta get $classMeta =>
      AssociationAnimalSuperModelGeneratedFields.$meta;
  static const $fromJson = AssociationAnimalMapper.fromJson;
  static const $fromMap = AssociationAnimalMapper.fromMap;
}
