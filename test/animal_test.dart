// test/mappable_animal_test.dart
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
      test('toJSON', () {
        final animal = MappableAnimal(id: 1,name: 'Fido', species: 'Dog', age: 3);
        final jsonString = animal.$toJson();
        expect(jsonString, isA<String>());
        expect(jsonString, contains('"name":"Fido"'));
        expect(jsonString, contains('"species":"Dog"'));
        expect(jsonString, contains('"age":3'));
      });

      test('fromJson', () {
        const jsonString = '{"id": 1,"name":"Fido","species":"Dog","age":3}';
        final animal = MappableAnimal.$fromJson(jsonString);
        expect(animal.id, equals(1));
        expect(animal.name, equals('Fido'));
        expect(animal.species, equals('Dog'));
        expect(animal.age, equals(3));
      });

      test('toMap', () {
        final animal = MappableAnimal(id: 2, name: 'Whiskers', species: 'Cat', age: 2);
        final map = animal.$toMap();
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
        final animal = MappableAnimal.$fromMap(map);
        expect(animal.id, equals(3));
        expect(animal.name, equals('Tweety'));
        expect(animal.species, equals('Bird'));
        expect(animal.age, equals(1));
      });

      test('meta constants', () {
        final animal = const MappableAnimal(
            id: 3,
            name: "Fred"
        );
        expect(animal.name,equals("Fred"));

        expect(animal.$get(MappableAnimal.$name),equals("Fred"));
        expect(animal.$get<String>(MappableAnimal.$name),equals("Fred"));
        expect(animal[MappableAnimal.$name],equals("Fred"));

        expect(animal.$get<int>(MappableAnimal.$meta.idName!),equals(3));
        expect(animal.$get<num>(MappableAnimal.$meta.idName!),equals(3));
        expect(animal[MappableAnimal.$id],equals(3));

        expect(animal.$classMeta.fields.keys.toList(),equals(['id','name','species','age']));
        expect(animal[animal.$classMeta.idName!],equals(3));
        expect(animal.$classMeta.idType,equals(int));

        expect(MappableAnimal.$id, equals('id'));
        expect(MappableAnimal.$name, equals('name'));
        expect(MappableAnimal.$meta.fields[MappableAnimal.$id]!.nullable,isFalse);
        expect(MappableAnimal.$meta.fields[MappableAnimal.$id]!.type,equals(int));

        expect(MappableAnimal.$meta.idName,equals('id'));
        expect(MappableAnimal.$meta.idType,equals(int));

        expect(MappableAnimal.$meta.fields[MappableAnimal.$name]!.nullable,isFalse);
        expect(MappableAnimal.$meta.fields[MappableAnimal.$name]!.type,equals(String));
      });

      test('copyWith', () {
        final animal = const MappableAnimal(
          id: 3,
          name: "Fred",
          species: "dog"
        );
        var copy = animal.$copyWith(age: 5, species: null);
        expect(copy.id,equals(3));
        expect(copy.age,equals(5));
        expect(animal.species,equals('dog'));
        expect(copy.species,equals('dog'));  // $copyWith can't set to null
      });

      test('copyWithMap', () {
        final animal = const MappableAnimal(
          id: 3,
          name: "Fred",
          species: "dog"
        );
        var copy = animal.$copyWithMap<MappableAnimal>({'age': 5, 'species': null});
        expect(copy.id,equals(3));
        expect(copy.age,equals(5));
        expect(animal.species,equals('dog'));
        expect(copy.species,equals(null));  // $copyWithMap can set to null
      });
    });
  });
}
