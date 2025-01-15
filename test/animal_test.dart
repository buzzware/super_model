// test/mappable_animal_test.dart
import 'package:super_model/macros/SuperModelMappableMapper.dart';
import 'package:super_model/super_model.dart';
import 'package:test/test.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'animal_test.mapper.dart';

//@SuperModelMappableMapper()
@MappableClass()
class MappableAnimal with MappableAnimalMappable implements ISuperModel {
  static const fromJson = MappableAnimalMapper.fromJson;
  static const fromMap = MappableAnimalMapper.fromMap;

  final int id;
  final String name;
  final String? species;
  final int? age;

  const MappableAnimal({
    required this.id,
    required this.name,
    this.species,
    this.age,
  });

  @override
  // TODO: implement classMeta
  ModelClassMeta get $classMeta => throw UnimplementedError();

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
}


void main() {
  group('Animal tests', () {
    test('can serialize to JSON', () {
      final animal = MappableAnimal(id: 1,name: 'Fido', species: 'Dog', age: 3);

      // The `toJson()` method is available because of `with Mappable`.
      final jsonString = animal.toJson();
      expect(jsonString, isA<String>());
      expect(jsonString, contains('"name":"Fido"'));
      expect(jsonString, contains('"species":"Dog"'));
      expect(jsonString, contains('"age":3'));
    });

    test('can deserialize from JSON', () {
      const jsonString = '{"id": 1,"name":"Fido","species":"Dog","age":3}';

      // Use the generated mapper to parse JSON.
      final animal = MappableAnimal.fromJson(jsonString);

      expect(animal.id, equals(1));
      expect(animal.name, equals('Fido'));
      expect(animal.species, equals('Dog'));
      expect(animal.age, equals(3));
    });

    test('can serialize to Map', () {
      final animal = MappableAnimal(id: 2, name: 'Whiskers', species: 'Cat', age: 2);

      // `.toMap()` is also available.
      final map = animal.toMap();
      expect(map, isA<Map<String, dynamic>>());
      expect(map['id'], equals(2));
      expect(map['name'], equals('Whiskers'));
      expect(map['species'], equals('Cat'));
      expect(map['age'], equals(2));
    });

    test('can deserialize from Map', () {
      final map = {
        'id': 3,
        'name': 'Tweety',
        'species': 'Bird',
        'age': 1,
      };

      // Use the generated mapper to parse a Map.
      final animal = MappableAnimal.fromMap(map);

      expect(animal.id, equals(3));
      expect(animal.name, equals('Tweety'));
      expect(animal.species, equals('Bird'));
      expect(animal.age, equals(1));
    });
  });
}
