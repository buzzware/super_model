import 'package:dart_mappable/dart_mappable.dart';
import 'package:super_model/super_model.dart';
part 'AssociationAnimal.mapper.dart';
part 'AssociationAnimal.g.dart';

@SuperModel()
@MappableSuperModel()
@MappableClass()
class Person extends SuperModelBase with PersonMappable, PersonSuperModelMixin, PersonMappableMixin {
  Person({
    required this.id,
    required this.name
  });

  @SuperModelId()
  final int id;
  final String name;
  
  // Implementation of required method from SuperModelBase
  @override
  T getProperty<T>(String propertyName) {
    switch (propertyName) {
      case 'id': return id as T;
      case 'name': return name as T;
      default: throw Exception('Unknown property: $propertyName');
    }
  }
}

// an animal model using full dart_mappable generation and implementing ISuperModel using @MappableSuperModel() macro
@MappableSuperModel()
@SuperModel()
@MappableClass()
class AssociationAnimal extends SuperModelBase with AssociationAnimalMappable, AssociationAnimalSuperModelMixin, AssociationAnimalMappableMixin {

  AssociationAnimal({
    required this.id,
    required this.name,
    this.species,
    this.age,
  });

  @SuperModelId()
  final int id;
  final String name;
  final String? species;
  final int? age;
  
  @BelongsTo(foreignKey: 'animalId')
  Person? owner;
  
  // Implementation of required method from SuperModelBase
  @override
  T getProperty<T>(String propertyName) {
    switch (propertyName) {
      case 'id': return id as T;
      case 'name': return name as T;
      case 'species': return species as T;
      case 'age': return age as T;
      case 'owner': return owner as T;
      default: throw Exception('Unknown property: $propertyName');
    }
  }
  
  // Add static serialization methods needed for tests
  static AssociationAnimal fromJson(String json) => AssociationAnimalMapper.fromJson(json);
  static AssociationAnimal fromMap(Map<String, dynamic> map) => AssociationAnimalMapper.fromMap(map);
  static AssociationAnimal $fromJson(String json) => AssociationAnimalMapper.fromJson(json);
  static AssociationAnimal $fromMap(Map<String, dynamic> map) => AssociationAnimalMapper.fromMap(map);
  
  // Add static field name constants for tests
  static const String $name = 'name';
  static const String $species = 'species';
  static const String $age = 'age';
  static const String $id = 'id';
  static const String $owner = 'owner';
  
  // Add static meta for tests
  static const ModelClassMeta $meta = ModelClassMeta(AssociationAnimal, 'id', int, {
    $id: PropertyMeta($id, int, false, 'int', 'int'),
    $name: PropertyMeta($name, String, false, 'String', 'String'),
    $species: PropertyMeta($species, String, true, 'String', 'String?'),
    $age: PropertyMeta($age, int, true, 'int', 'int?'),
    $owner: PropertyMeta($owner, Person, true, 'Person', 'Person?'),
  });
}
