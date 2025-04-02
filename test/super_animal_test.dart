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
        final animal = SuperAnimalMapper.fromJson(jsonString);
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
        final animal = SuperAnimalMapper.fromMap(map);
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
        final animal = SuperAnimalMeta.$fromJson(jsonString);
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
        final animal = SuperAnimalMeta.$fromMap(map);
        expect(animal.id, equals(3));
        expect(animal.name, equals('Tweety'));
        expect(animal.species, equals('Bird'));
        expect(animal.age, equals(1));
      });

      test('meta constants', () {
        final animal = SuperAnimal(
            id: 3,
            name: "Fred"
        );
        expect(animal.name,equals("Fred"));

        expect(animal.$get(SuperAnimalMeta.$name),equals("Fred"));
        expect(animal.$get<String>(SuperAnimalMeta.$name),equals("Fred"));
        expect(animal[SuperAnimalMeta.$name],equals("Fred"));

        expect(animal.$get<int>(SuperAnimal.$info.idName!),equals(3));
        expect(animal.$get<num>(SuperAnimal.$info.idName!),equals(3));
        expect(animal[SuperAnimalMeta.$id],equals(3));

        expect(animal.$classInfo.fields.keys.toList(),equals(['id','name','species','age']));
        expect(animal[animal.$classInfo.idName!],equals(3));
        expect(animal.$classInfo.idType,equals(int));

        expect(SuperAnimalMeta.$id, equals('id'));
        expect(SuperAnimalMeta.$name, equals('name'));
        expect(SuperAnimal.$info.fields[SuperAnimalMeta.$id]!.nullable,isFalse);
        expect(SuperAnimal.$info.fields[SuperAnimalMeta.$id]!.type,equals(int));

        expect(SuperAnimal.$info.idName,equals('id'));
        expect(SuperAnimal.$info.idType,equals(int));

        expect(SuperAnimal.$info.fields[SuperAnimalMeta.$name]!.nullable,isFalse);
        expect(SuperAnimal.$info.fields[SuperAnimalMeta.$name]!.type,equals(String));
      });

      test('copyWith', () {
        final animal = SuperAnimal(
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
        final animal = SuperAnimal(
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
    group('ISuperModel', () {
      test('simple',() {
        final animal = SuperAnimal(
            id: 3,
            name: "Fred",
            species: "dog"
        );
        final ISuperModel model = animal;
        expect(model.$classInfo.fields.keys, equals(['id', 'name', 'species', 'age']));
        final model2 = model.$copyWithMap<ISuperModel>({'name': 'John'});
        expect(model2.$get('name'),equals('John'));
        expect(model2.$toJson(),equals('{"id":3,"name":"John","species":"dog","age":null}'));
        final model3 = SuperAnimalMeta.$fromJson(model2.$toJson());
        expect(model3.$get('name'),equals('John'));
      });
    });
  });
}
