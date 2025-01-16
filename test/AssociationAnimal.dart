import 'package:dart_mappable/dart_mappable.dart';
import 'package:super_model/super_model.dart';
part 'AssociationAnimal.mapper.dart';

@MappableSuperModel()
@MappableClass()
class Person with PersonMappable implements ISuperModel {
  const Person({
    required this.id,
    required this.name
  });

  @SuperModelId()
  final int id;
  final String name;
}

// an animal model using full dart_mappable generation and implementing ISuperModel using @MappableSuperModel() macro
@MappableSuperModel()
@BelongsTo('Person','owner')
@MappableClass()
class AssociationAnimal with AssociationAnimalMappable implements ISuperModel {

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
}
