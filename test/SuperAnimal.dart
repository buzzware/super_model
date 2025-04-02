import 'package:dart_mappable/dart_mappable.dart';
import 'package:super_model/super_model.dart';
part 'SuperAnimal.mapper.dart';
part 'SuperAnimal.g.dart';

// an animal model using full dart_mappable generation and implementing ISuperModel using @MappableSuperModel() macro
@SuperModel()
@MappableSuperModel()
@MappableClass()
class SuperAnimal extends SuperModelBase with SuperAnimalMappable, SuperAnimalMeta {

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

  static ModelClassMeta $meta = SuperAnimalMeta.$meta;
}
