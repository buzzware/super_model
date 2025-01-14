// test/mappable_animal_test.dart
import 'package:super_model/macros/SuperModelMappableMapper.dart';
import 'package:test/test.dart';
import 'package:dart_mappable/dart_mappable.dart';

extension AnimalValueCopy<$R, $Out> on ObjectCopyWith<$R, Animal, $Out> {
  AnimalCopyWith<$R, Animal, $Out> get $asAnimal =>
      $base.as((v, t, t2) => _AnimalCopyWithImpl(v, t, t2));
}

abstract class AnimalCopyWith<$R, $In extends Animal, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? species, int? age});
  AnimalCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AnimalCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Animal, $Out>
    implements AnimalCopyWith<$R, Animal, $Out> {
  _AnimalCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Animal> $mapper = AnimalMapper.ensureInitialized();
  @override
  $R call({String? name, String? species, int? age}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (species != null) #species: species,
        if (age != null) #age: age
      }));
  @override
  Animal $make(CopyWithData data) => Animal(
      name: data.get(#name, or: $value.name),
      species: data.get(#species, or: $value.species),
      age: data.get(#age, or: $value.age));

  @override
  AnimalCopyWith<$R2, Animal, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AnimalCopyWithImpl($value, $cast, t);
}

@SuperModelMappableMapper()
@MappableClass()
class Animal with AnimalMappable {
  static const fromJson = AnimalMapper.fromJson;
  static const fromMap = AnimalMapper.fromMap;

  final String name;
  final String species;
  final int age;

  const Animal({
    required this.name,
    required this.species,
    required this.age,
  });
}


void main() {
  group('Animal tests', () {
    test('can serialize to JSON', () {
      final animal = Animal(name: 'Fido', species: 'Dog', age: 3);

      // The `toJson()` method is available because of `with Mappable`.
      final jsonString = animal.toJson();
      expect(jsonString, isA<String>());
      expect(jsonString, contains('"name":"Fido"'));
      expect(jsonString, contains('"species":"Dog"'));
      expect(jsonString, contains('"age":3'));
    });

    test('can deserialize from JSON', () {
      const jsonString = '{"name":"Fido","species":"Dog","age":3}';

      // Use the generated mapper to parse JSON.
      final animal = Animal.fromJson(jsonString);

      expect(animal.name, equals('Fido'));
      expect(animal.species, equals('Dog'));
      expect(animal.age, equals(3));
    });

    test('can serialize to Map', () {
      final animal = Animal(name: 'Whiskers', species: 'Cat', age: 2);

      // `.toMap()` is also available.
      final map = animal.toMap();
      expect(map, isA<Map<String, dynamic>>());
      expect(map['name'], equals('Whiskers'));
      expect(map['species'], equals('Cat'));
      expect(map['age'], equals(2));
    });

    test('can deserialize from Map', () {
      final map = {
        'name': 'Tweety',
        'species': 'Bird',
        'age': 1,
      };

      // Use the generated mapper to parse a Map.
      final animal = Animal.fromMap(map);

      expect(animal.name, equals('Tweety'));
      expect(animal.species, equals('Bird'));
      expect(animal.age, equals(1));
    });
  });
}
