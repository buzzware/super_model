// test/mappable_animal_test.dart
import 'package:super_model/macros/SuperModelMappableMapper.dart';
import 'package:super_model/super_model.dart';
import 'package:test/test.dart';
import 'package:dart_mappable/dart_mappable.dart';

import 'MappableAnimal.dart';




void main() {
  group('MappableAnimal', () {
    group('dart_mappable methods', () {
      test('toJSON', () {
        final animal = MappableAnimal(id: 1,name: 'Fido', species: 'Dog', age: 3);
        final jsonString = animal.toJson();
        expect(jsonString, isA<String>());
        expect(jsonString, contains('"name":"Fido"'));
        expect(jsonString, contains('"species":"Dog"'));
        expect(jsonString, contains('"age":3'));
      });

      test('fromJson', () {
        const jsonString = '{"id": 1,"name":"Fido","species":"Dog","age":3}';
        final animal = MappableAnimal.fromJson(jsonString);
        expect(animal.id, equals(1));
        expect(animal.name, equals('Fido'));
        expect(animal.species, equals('Dog'));
        expect(animal.age, equals(3));
      });

      test('toMap', () {
        final animal = MappableAnimal(id: 2, name: 'Whiskers', species: 'Cat', age: 2);
        final map = animal.toMap();
        expect(map, isA<Map<String, dynamic>>());
        expect(map['id'], equals(2));
        expect(map['name'], equals('Whiskers'));
        expect(map['species'], equals('Cat'));
        expect(map['age'], equals(2));
      });

      test('fromMap', () {
        final map = {
          'id': 3,
          'name': 'Tweety',
          'species': 'Bird',
          'age': 1,
        };
        final animal = MappableAnimal.fromMap(map);
        expect(animal.id, equals(3));
        expect(animal.name, equals('Tweety'));
        expect(animal.species, equals('Bird'));
        expect(animal.age, equals(1));
      });
    });
    group('SuperModel methods', () {
      test('\$toJSON', () {
        final animal = MappableAnimal(id: 1,name: 'Fido', species: 'Dog', age: 3);
        final jsonString = animal.$toJson();
        expect(jsonString, isA<String>());
        expect(jsonString, contains('"name":"Fido"'));
        expect(jsonString, contains('"species":"Dog"'));
        expect(jsonString, contains('"age":3'));
      });

      test('\$fromJson', () {
        const jsonString = '{"id": 1,"name":"Fido","species":"Dog","age":3}';
        final animal = MappableAnimal.$fromJson(jsonString);
        expect(animal.id, equals(1));
        expect(animal.name, equals('Fido'));
        expect(animal.species, equals('Dog'));
        expect(animal.age, equals(3));
      });

      test('\$toMap', () {
        final animal = MappableAnimal(id: 2, name: 'Whiskers', species: 'Cat', age: 2);
        final map = animal.$toMap();
        expect(map, isA<Map<String, dynamic>>());
        expect(map['id'], equals(2));
        expect(map['name'], equals('Whiskers'));
        expect(map['species'], equals('Cat'));
        expect(map['age'], equals(2));
      });

      test('\$fromMap', () {
        final map = {
          'id': 3,
          'name': 'Tweety',
          'species': 'Bird',
          'age': 1,
        };
        final animal = MappableAnimal.$fromMap(map);
        expect(animal.id, equals(3));
        expect(animal.name, equals('Tweety'));
        expect(animal.species, equals('Bird'));
        expect(animal.age, equals(1));
      });
    });
  });
}
