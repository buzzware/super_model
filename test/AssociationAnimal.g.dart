// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AssociationAnimal.dart';

// **************************************************************************
// MappableSuperModelGenerator
// **************************************************************************

// **************************************************************************
// MappableSuperModelGenerator
// **************************************************************************
extension PersonMappableFields on Person {
  static const String $id = 'id';
  static const String $name = 'name';
  static const fromJson = PersonMapper.fromJson;
  static const fromMap = PersonMapper.fromMap;
  static const $fromJson = PersonMapper.fromJson;
  static const $fromMap = PersonMapper.fromMap;
  static Map<String, dynamic Function(Person)> _$getters = {
    $id: (Person o) => o.id,
    $name: (Person o) => o.name,
  };
}

mixin PersonMappableMixin on SuperModelBase implements ISuperModel {
  @override
  ModelClassMeta get $classMeta => PersonSuperModelGeneratedFields.$meta;
  @override
  M $copyWithMap<M>(Map<String, dynamic> map) {
    final mergedMap = {...toMap(), ...map};
    return PersonMappableFields.fromMap(mergedMap) as M;
  }

  @override
  T? $get<T>(String key, [T? defaultValue]) {
    final getter = PersonMappableFields._$getters[key];
    if (getter == null) return defaultValue;
    return getter(this as Person) as T?;
  }

  @override
  Map<String, dynamic> $toMap() {
    return (this as Person).toMap();
  }

  @override
  String $toJson() => (this as Person).toJson();
  dynamic operator [](String key) {
    final getter = PersonMappableFields._$getters[key];
    return getter == null ? null : getter(this as Person);
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
extension AssociationAnimalMappableFields on AssociationAnimal {
  static const String $id = 'id';
  static const String $name = 'name';
  static const String $species = 'species';
  static const String $age = 'age';
  static const String $owner = 'owner';
  static const fromJson = AssociationAnimalMapper.fromJson;
  static const fromMap = AssociationAnimalMapper.fromMap;
  static const $fromJson = AssociationAnimalMapper.fromJson;
  static const $fromMap = AssociationAnimalMapper.fromMap;
  static Map<String, dynamic Function(AssociationAnimal)> _$getters = {
    $id: (AssociationAnimal o) => o.id,
    $name: (AssociationAnimal o) => o.name,
    $species: (AssociationAnimal o) => o.species,
    $age: (AssociationAnimal o) => o.age,
    $owner: (AssociationAnimal o) => o.owner,
  };
}

mixin AssociationAnimalMappableMixin on SuperModelBase implements ISuperModel {
  @override
  ModelClassMeta get $classMeta =>
      AssociationAnimalSuperModelGeneratedFields.$meta;
  @override
  M $copyWithMap<M>(Map<String, dynamic> map) {
    final mergedMap = {...toMap(), ...map};
    return AssociationAnimalMappableFields.fromMap(mergedMap) as M;
  }

  @override
  T? $get<T>(String key, [T? defaultValue]) {
    final getter = AssociationAnimalMappableFields._$getters[key];
    if (getter == null) return defaultValue;
    return getter(this as AssociationAnimal) as T?;
  }

  @override
  Map<String, dynamic> $toMap() {
    return (this as AssociationAnimal).toMap();
  }

  @override
  String $toJson() => (this as AssociationAnimal).toJson();
  dynamic operator [](String key) {
    final getter = AssociationAnimalMappableFields._$getters[key];
    return getter == null ? null : getter(this as AssociationAnimal);
  }

  AssociationAnimal $copyWith({
    int? id,
    String? name,
    String species,
    int age,
    Person owner,
  }) {
    final self = this as AssociationAnimal;
    return AssociationAnimal(
      id: id ?? self.id,
      name: name ?? self.name,
      species: species ?? self.species,
      age: age ?? self.age,
      owner: owner ?? self.owner,
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
  static const ModelClassMeta $meta = ModelClassMeta(Person,
      PersonSuperModelIdFields.idName, PersonSuperModelIdFields.idType, {
    $id: const PropertyMeta($id, int, false, 'int', 'int'),
    $name: const PropertyMeta($name, String, false, 'String', 'String'),
  });
}

mixin PersonSuperModelMixin on SuperModelBase {
  @override
  Map<String, dynamic Function()> get $getters =>
      {"id": () => (this as Person).id, "name": () => (this as Person).name};
  @override
  dynamic operator [](String key) {
    var getter = $getters[key];
    if (getter == null) return null;
    return getter();
  }

  @override
  ModelClassMeta get $classMeta => PersonSuperModelGeneratedFields.$meta;
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
  static const ModelClassMeta $meta = ModelClassMeta(
      AssociationAnimal,
      AssociationAnimalSuperModelIdFields.idName,
      AssociationAnimalSuperModelIdFields.idType, {
    $id: const PropertyMeta($id, int, false, 'int', 'int'),
    $name: const PropertyMeta($name, String, false, 'String', 'String'),
    $species: const PropertyMeta($species, String, true, 'String', 'String?'),
    $age: const PropertyMeta($age, int, true, 'int', 'int?'),
    $owner: const PropertyMeta($owner, Person, true, 'Person', 'Person?'),
  });
}

mixin AssociationAnimalSuperModelMixin on SuperModelBase {
  @override
  Map<String, dynamic Function()> get $getters => {
        "id": () => (this as AssociationAnimal).id,
        "name": () => (this as AssociationAnimal).name,
        "species": () => (this as AssociationAnimal).species,
        "age": () => (this as AssociationAnimal).age,
        "owner": () => (this as AssociationAnimal).owner
      };
  @override
  dynamic operator [](String key) {
    var getter = $getters[key];
    if (getter == null) return null;
    return getter();
  }

  @override
  ModelClassMeta get $classMeta =>
      AssociationAnimalSuperModelGeneratedFields.$meta;
}
