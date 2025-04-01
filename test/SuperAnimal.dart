import 'package:dart_mappable/dart_mappable.dart';
import 'package:super_model/super_model.dart';
part 'SuperAnimal.mapper.dart';
part 'SuperAnimal.g.dart';

// an animal model using full dart_mappable generation and implementing ISuperModel using @MappableSuperModel() macro
@SuperModel()
@MappableSuperModel()
@MappableClass()
class SuperAnimal extends SuperModelBase with SuperAnimalMappable, SuperAnimalSuperModelMixin, SuperAnimalMappableMixin {

  SuperAnimal({
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
  
  // Implementation of required method from SuperModelBase
  @override
  T getProperty<T>(String propertyName) {
    switch (propertyName) {
      case 'id': return id as T;
      case 'name': return name as T;
      case 'species': return species as T;
      case 'age': return age as T;
      default: throw Exception('Unknown property: $propertyName');
    }
  }
  
  // Add static serialization methods needed for tests
  static SuperAnimal fromJson(String json) => SuperAnimalMapper.fromJson(json);
  static SuperAnimal fromMap(Map<String, dynamic> map) => SuperAnimalMapper.fromMap(map);
  static SuperAnimal $fromJson(String json) => SuperAnimalMapper.fromJson(json);
  static SuperAnimal $fromMap(Map<String, dynamic> map) => SuperAnimalMapper.fromMap(map);
  
  // Add static field name constants for tests
  static const String $name = 'name';
  static const String $species = 'species';
  static const String $age = 'age';
  static const String $id = 'id';
  
  // Add static meta for tests
  static const ModelClassMeta $meta = ModelClassMeta(SuperAnimal, 'id', int, {
    $id: PropertyMeta($id, int, false, 'int', 'int'),
    $name: PropertyMeta($name, String, false, 'String', 'String'),
    $species: PropertyMeta($species, String, true, 'String', 'String?'),
    $age: PropertyMeta($age, int, true, 'int', 'int?'),
  });
}
