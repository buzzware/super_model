# SuperModel

A Dart package containing base class, annotations and utilities for data models with reflection and relationships

It is based on https://github.com/buzzware/cascade/blob/master/Buzzware.Cascade/SuperModel.cs

# Usage

```Dart
import 'package:dart_mappable/dart_mappable.dart';
import 'package:super_model/super_model.dart';
part 'SuperAnimal.mapper.dart';
part 'SuperAnimal.g.dart';

// an animal model using full dart_mappable generation and implementing ISuperModel using @MappableSuperModel() macro
@SuperModel()
@MappableSuperModel()
@MappableClass()
class SuperAnimal extends SuperModelBase with SuperAnimalMappable, SuperAnimalMeta {

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
}
```

```Dart
test('meta constants', () {
  final animal = SuperAnimal(
      id: 3,
      name: "Fred"
  );
  expect(animal.name,equals("Fred"));

  expect(animal.$get(SuperAnimalMeta.$name),equals("Fred"));
  expect(animal.$get<String>(SuperAnimalMeta.$name),equals("Fred"));
  expect(animal[SuperAnimalMeta.$name],equals("Fred"));

  expect(animal.$get<int>(SuperAnimalMeta.$info.idName!),equals(3));
  expect(animal.$get<num>(SuperAnimalMeta.$info.idName!),equals(3));
  expect(animal[SuperAnimalMeta.$id],equals(3));

  expect(animal.$classInfo.fields.keys.toList(),equals(['id','name','species','age']));
  expect(animal[animal.$classInfo.idName!],equals(3));
  expect(animal.$classInfo.idType,equals(int));

  expect(SuperAnimalMeta.$id, equals('id'));
  expect(SuperAnimalMeta.$name, equals('name'));
  expect(SuperAnimalMeta.$info.fields[SuperAnimalMeta.$id]!.nullable,isFalse);
  expect(SuperAnimalMeta.$info.fields[SuperAnimalMeta.$id]!.type,equals(int));

  expect(SuperAnimalMeta.$info.idName,equals('id'));
  expect(SuperAnimalMeta.$info.idType,equals(int));

  expect(SuperAnimalMeta.$info.fields[SuperAnimalMeta.$name]!.nullable,isFalse);
  expect(SuperAnimalMeta.$info.fields[SuperAnimalMeta.$name]!.type,equals(String));
});
```
