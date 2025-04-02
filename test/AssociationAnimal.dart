import 'package:dart_mappable/dart_mappable.dart';
import 'package:super_model/super_model.dart';
part 'AssociationAnimal.mapper.dart';
part 'AssociationAnimal.g.dart';

@SuperModel()
@MappableSuperModel()
@MappableClass()
class Person extends SuperModelBase with PersonMappable, PersonMeta {
  Person({
    required this.id,
    required this.name
  });

  @SuperModelId()
  final int id;
  final String name;
}

// an animal model using full dart_mappable generation and implementing ISuperModel using @MappableSuperModel() macro
@MappableSuperModel()
@SuperModel()
@MappableClass()
class AssociationAnimal extends SuperModelBase with AssociationAnimalMappable, AssociationAnimalMeta {

  AssociationAnimal({
    required this.id,
    required this.name,
    this.species,
    this.age,
    this.person_id
  });

  @SuperModelId()
  final int id;
  final String name;
  final String? species;
  final int? age;

  @BelongsTo(Person,'person')
  final int? person_id;
}
