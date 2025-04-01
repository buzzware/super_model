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
}
