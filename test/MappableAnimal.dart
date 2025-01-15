import 'package:dart_mappable/dart_mappable.dart';
import 'package:super_model/macros/SuperModelId.dart';
import 'package:super_model/super_model.dart';
part 'MappableAnimal.mapper.dart';

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
    'id': const PropertyMeta('id', int, false, 'int', 'int'),
    'name': const PropertyMeta('name', String, false, 'String', 'String'),
    'species': const PropertyMeta('species', String, true, 'String', 'String?'),
    'age': const PropertyMeta('age', int, true, 'int', 'int?'),
  });

  static const fromJson = MappableAnimalMapper.fromJson;
  static const fromMap = MappableAnimalMapper.fromMap;
  static const $fromJson = MappableAnimalMapper.fromJson;
  static const $fromMap = MappableAnimalMapper.fromMap;

  @SuperModelId()
  final int id;
  final String name;
  final String? species;
  final int? age;

  @override
  ModelClassMeta get $classMeta => $meta;

  @override
  M $copyWithMap<M>(Map<String, dynamic> map) {
    Map<String, Object?> currentMap = toMap();
    Map<String, Object?> mergedMap = {...currentMap, ...map};
    return (MapperContainer.globals.get(M.runtimeType) as InterfaceMapperBase).decodeMap<M>(mergedMap);
  }

  @override
  T $get<T>(String key) {
    return toMap()[key] as T;
  }

  @override
  Map<String, dynamic> $toMap() {
    return this.toMap();
  }

  @override
  String $toJson() {
    return this.toJson();
  }
}
