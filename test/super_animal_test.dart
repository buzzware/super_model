import 'package:super_model/super_model.dart';
import 'package:test/test.dart';
import 'package:dart_mappable/dart_mappable.dart';

import 'SuperAnimal.dart';

void main() {
  group('SuperAnimal', () {
    group('dart_mappable methods', () {
      test('toJSON', () {
        final animal = SuperAnimal(id: 1,name: 'Fido', species: 'Dog', age: 3);
        final jsonString = animal.toJson();
        expect(jsonString, isA<String>());
        expect(jsonString, contains('"name":"Fido"'));
        expect(jsonString, contains('"species":"Dog"'));
        expect(jsonString, contains('"age":3'));
      });

      test('fromJson', () {
        const jsonString = '{"id": 1,"name":"Fido","species":"Dog","age":3}';
        final animal = SuperAnimal.fromJson(jsonString);
        expect(animal.id, equals(1));
        expect(animal.name, equals('Fido'));
        expect(animal.species, equals('Dog'));
        expect(animal.age, equals(3));
      });

      test('toMap', () {
        final animal = SuperAnimal(id: 2, name: 'Whiskers', species: 'Cat', age: 2);
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
        final animal = SuperAnimal.fromMap(map);
        expect(animal.id, equals(3));
        expect(animal.name, equals('Tweety'));
        expect(animal.species, equals('Bird'));
        expect(animal.age, equals(1));
      });
    });
    group('SuperModel methods', () {
      test('toJSON', () {
        final animal = SuperAnimal(id: 1,name: 'Fido', species: 'Dog', age: 3);
        final jsonString = animal.$toJson();
        expect(jsonString, isA<String>());
        expect(jsonString, contains('"name":"Fido"'));
        expect(jsonString, contains('"species":"Dog"'));
        expect(jsonString, contains('"age":3'));
      });

      test('fromJson', () {
        const jsonString = '{"id": 1,"name":"Fido","species":"Dog","age":3}';
        final animal = SuperAnimal.$fromJson(jsonString);
        expect(animal.id, equals(1));
        expect(animal.name, equals('Fido'));
        expect(animal.species, equals('Dog'));
        expect(animal.age, equals(3));
      });

      test('toMap', () {
        final animal = SuperAnimal(id: 2, name: 'Whiskers', species: 'Cat', age: 2);
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
        final animal = SuperAnimal.$fromMap(map);
        expect(animal.id, equals(3));
        expect(animal.name, equals('Tweety'));
        expect(animal.species, equals('Bird'));
        expect(animal.age, equals(1));
      });

      test('meta constants', () {
        final animal = const SuperAnimal(
            id: 3,
            name: "Fred"
        );
        expect(animal.name,equals("Fred"));

        expect(animal.$get(SuperAnimal.$name),equals("Fred"));
        expect(animal.$get<String>(SuperAnimal.$name),equals("Fred"));
        expect(animal[SuperAnimal.$name],equals("Fred"));

        expect(animal.$get<int>(SuperAnimal.$meta.idName!),equals(3));
        expect(animal.$get<num>(SuperAnimal.$meta.idName!),equals(3));
        expect(animal[SuperAnimal.$id],equals(3));

        expect(animal.$classMeta.fields.keys.toList(),equals(['id','name','species','age']));
        expect(animal[animal.$classMeta.idName!],equals(3));
        expect(animal.$classMeta.idType,equals(int));

        expect(SuperAnimal.$id, equals('id'));
        expect(SuperAnimal.$name, equals('name'));
        expect(SuperAnimal.$meta.fields[SuperAnimal.$id]!.nullable,isFalse);
        expect(SuperAnimal.$meta.fields[SuperAnimal.$id]!.type,equals(int));

        expect(SuperAnimal.$meta.idName,equals('id'));
        expect(SuperAnimal.$meta.idType,equals(int));

        expect(SuperAnimal.$meta.fields[SuperAnimal.$name]!.nullable,isFalse);
        expect(SuperAnimal.$meta.fields[SuperAnimal.$name]!.type,equals(String));
      });

      test('copyWith', () {
        final animal = const SuperAnimal(
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
        final animal = const SuperAnimal(
          id: 3,
          name: "Fred",
          species: "dog"
        );
        var copy = animal.$copyWithMap<SuperAnimal>({'age': 5, 'species': null});
        expect(copy.id,equals(3));
        expect(copy.age,equals(5));
        expect(animal.species,equals('dog'));
        expect(copy.species,equals(null));  // $copyWithMap can set to null
      });
    });
  });
}
