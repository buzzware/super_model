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
}
