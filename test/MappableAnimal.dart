import 'package:dart_mappable/dart_mappable.dart';
import 'package:super_model/super_model.dart';
part 'MappableAnimal.mapper.dart';

const undefined = Object();

// an animal model using full dart_mappable generation and implementing ISuperModel etc without @SuperModel macro
@MappableClass()
class MappableAnimal extends SuperModelBase with MappableAnimalMappable implements ISuperModel {

  MappableAnimal({
    required this.id,
    required this.name,
    this.species,
    this.age,
  });

  static const String $id = 'id';
  static const String $name = 'name';
  static const String $species = 'species';
  static const String $age = 'age';

  static SuperModelInfo $info = SuperModelInfo(MappableAnimal, null, MappableAnimal.$id,int, {
    $id: PropertyMeta($id, int, false, 'int', 'int', (o) => (o as MappableAnimal).id),
    $name: PropertyMeta($name, String, false, 'String', 'String', (o) => (o as MappableAnimal).name),
    $species: PropertyMeta($species, String, true, 'String', 'String?', (o) => (o as MappableAnimal).species),
    $age: PropertyMeta($age, int, true, 'int', 'int?', (o) => (o as MappableAnimal).age),
  });

  static const fromJson = MappableAnimalMapper.fromJson;
  static const fromMap = MappableAnimalMapper.fromMap;
  static const $fromJson = MappableAnimalMapper.fromJson;
  static const $fromMap =  MappableAnimalMapper.fromMap;

  @SuperModelId()
  final int id;
  final String name;
  final String? species;
  final int? age;

  @override
  SuperModelInfo get $classInfo => $info;

  @override
  M $copyWithMap<M>(Map<String, dynamic> map) {
    Map<String, dynamic> currentMap = toMap();
    Map<String, dynamic> mergedMap = {...currentMap, ...map};
    return MappableAnimalMapper.fromMap(mergedMap) as M;
  }

  @override
  T? $get<T>(String key, [T? defaultValue = null]) {
    final property = $classInfo.fields[key];
    if (property == null) return defaultValue;
    return property.getValue(this) as T?;
  }

  @override
  Map<String, dynamic> $toMap() {
    return this.toMap();
    }

  @override
  String $toJson() {
    return this.toJson();
  }

  // for macro but not required in ISuperModel
  dynamic operator[](String key) {
    final property = $classInfo.fields[key];
    return property?.getValue(this);
  }

  // for macro can't be part of ISuperModel
  MappableAnimal $copyWith({
    int? id,
    String? name,
    String? species,
    int? age
  }) {
    return MappableAnimal(
      id: id ?? this.id,
      name: name ?? this.name,
      species: species ?? this.species,
      age: age ?? this.age
    );
  }
}
