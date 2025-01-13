import 'package:dart_mappable/dart_mappable.dart';
part 'animal.mapper.dart';

@MappableClass()
class Animal with Mappable {
  final String name;
  final String species;
  final int age;

  Animal({
    required this.name,
    required this.species,
    required this.age,
  });
}
