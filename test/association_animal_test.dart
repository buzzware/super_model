import 'package:super_model/super_model.dart';
import 'package:test/test.dart';
import 'package:dart_mappable/dart_mappable.dart';

import 'AssociationAnimal.dart';

void main() {
  group('AssociationAnimal', () {
    group('associations', () {
      test('accessible', () {
        final animal = AssociationAnimal(id: 2, name: 'Whiskers', species: 'Cat', age: 2);
        animal.owner = Person(id: 1, name: 'Fred');
        expect(animal.owner.id,equals(1));
      });
    });
  });
}
