import 'package:dart_mappable/dart_mappable.dart';
import 'package:super_model/super_model.dart';
part 'SuperAnimal.mapper.dart';
part 'SuperAnimal.g.dart';

// an animal model using full dart_mappable generation and implementing ISuperModel using @MappableSuperModel() macro
@SuperModel()
@MappableSuperModel()
@MappableClass()
class SuperAnimal extends SuperModelBase with SuperAnimalMappable, SuperAnimalMeta, SuperAnimalMappableMixin {

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

  static SuperAnimal fromJson(String json) => SuperAnimalMapper.fromJson(json);
  static SuperAnimal fromMap(Map<String, dynamic> map) => SuperAnimalMapper.fromMap(map);
  static SuperAnimal $fromJson(String json) => SuperAnimalMapper.fromJson(json);
  static SuperAnimal $fromMap(Map<String, dynamic> map) => SuperAnimalMapper.fromMap(map);
  static const ModelClassMeta $meta = SuperAnimalSuperModelGeneratedFields.$meta;
}
