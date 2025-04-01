import 'package:dart_mappable/dart_mappable.dart';
import 'package:super_model/super_model.dart';
part 'MappableAnimal.mapper.dart';
part 'MappableAnimal.g.dart';

const undefined = Object();

// an animal model using full dart_mappable generation with annotations for code generation
@SuperModel()
@MappableSuperModel()
@MappableClass()
class MappableAnimal extends SuperModelBase with MappableAnimalMappable, MappableAnimalSuperModelMixin, MappableAnimalMappableMixin {

  const MappableAnimal({
    required this.id,
    required this.name,
    this.species,
    this.age,
  });

  static const String $id = 'id';
  static const String $name = 'name';
  static const String $species = 'species';
  static const String $age = 'age';

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
  
  // Implement toMap and toJson methods needed by the mappable mixin
  Map<String, dynamic> toMap() => MappableAnimalMapper.toMap(this);
  String toJson() => MappableAnimalMapper.toJson(this);
}
