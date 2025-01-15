import 'package:dart_mappable/dart_mappable.dart';
import 'package:super_model/super_model.dart';
part 'MappableAnimal.mapper.dart';

const undefined = Object();

// an animal model using full dart_mappable generation and implementing ISuperModel etc without @SuperModel macro
@MappableClass()
class MappableAnimal with MappableAnimalMappable implements ISuperModel {

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

  static const ModelClassMeta $meta = const ModelClassMeta(MappableAnimal,_idName,_idType, {
    $id: const PropertyMeta($id, int, false, 'int', 'int'),
    $name: const PropertyMeta($name, String, false, 'String', 'String'),
    $species: const PropertyMeta($species, String, true, 'String', 'String?'),
    $age: const PropertyMeta($age, int, true, 'int', 'int?'),
  });

  static const fromJson = MappableAnimalMapper.fromJson;
  static const fromMap = MappableAnimalMapper.fromMap;
  static const $fromJson = MappableAnimalMapper.fromJson;
  static const $fromMap =  MappableAnimalMapper.fromMap;

  static Map<String, dynamic Function(MappableAnimal)> _$getters = {
    $id: (MappableAnimal o) => o.id,
    $name: (MappableAnimal o) => o.name,
    $species: (MappableAnimal o) => o.species,
    $age: (MappableAnimal o) => o.age
  };

  @SuperModelId()
  final int id;
  final String name;
  final String? species;
  final int? age;

  @override
  ModelClassMeta get $classMeta => $meta;

  @override
  M $copyWithMap<M>(Map<String, dynamic> map) {
    Map<String, dynamic> currentMap = toMap();
    Map<String, dynamic> mergedMap = {...currentMap, ...map};
    return MappableAnimalMapper.fromMap(mergedMap) as M;
  }

  @override
  T? $get<T>(String key, [T? defaultValue = null]) {
    var getter = _$getters[key];
    if (getter==null) {
      return defaultValue;
    }
    return getter(this) as T?;
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
    var getter = _$getters[key];
    if (getter==null)
      return null;
    return getter!(this);
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
