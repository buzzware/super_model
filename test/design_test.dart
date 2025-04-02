import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:super_model/super_model.dart';
import 'package:test/test.dart';
part 'design_test.mapper.dart';

mixin CarMeta {
  static const String $id = 'id';
  static const String $name = 'name';
  static const String $year = 'year';
  static const String $colour = 'colour';
  static const String $manufacturer_id = 'manufacturer_id';

  static ModelClassMeta $meta = const ModelClassMeta(Car, null, "id", int, {
    $id: const PropertyMeta($id, int, false, 'int', 'int'),
    $name: const PropertyMeta($name, String, false, 'String', 'String'),
    $year: const PropertyMeta($year, int, false, 'int', 'int'),
    $colour: const PropertyMeta($colour, String, true, 'String', 'String?'),
  });

  static Map<String, dynamic Function(SuperModelBase)> _$getters = {
    $id: (o) => (o as Car).id,
    $name: (o) => (o as Car).name,
    $year: (o) => (o as Car).year,
    $colour: (o) => (o as Car).colour
  };

  static const $fromMap = CarMapper.fromMap;
  static const $fromJson = CarMapper.fromJson;

  // if we don't have Dart Mappable
  // static fromMap(Map map) {
  //   return Car(
  //       id: map[CarMeta.$id] as int,
  //       name: map[CarMeta.$name] as String,
  //       year: map[CarMeta.$year] as int,
  //       colour: map[CarMeta.$colour] as String?,
  //       manufacturer_id: map[CarMeta.$manufacturer_id] as int?
  //   );
  // }
  // static fromJson(String json) {
  //   return fromMap(jsonDecode(json));
  // }

  //@override
  Map<String, dynamic Function(SuperModelBase)> get $getters => CarMeta._$getters;

  //@override
  ModelClassMeta get $classMeta => CarMeta.$meta;

  Car $copyWith({
    int? id,
    String? name,
    int? year,
    String? colour,
  }) {
    final self = this as Car;
    return Car(
      id: id ?? self.id,
      name: name ?? self.name,
      year: year ?? self.year,
      colour: colour ?? self.colour
    );
  }

  //@override
  M $copyWithMap<M>(Map<String, dynamic> map) {
    final mergedMap = {...(this as Car).toMap(), ...map};
    return CarMeta.$fromMap(mergedMap) as M;
  }

  //@override
  T? $get<T>(String key, [T? defaultValue]) {
    final getter = $getters[key];
    if (getter == null) return defaultValue;
    return getter(this as Car) as T?;
  }

  //@override
  dynamic operator [](String key) {
    var getter = $getters[key];
    if (getter == null) return null;
    return getter(this as Car);
  }

  //@override
  Map<String, dynamic> $toMap() {
    return (this as Car).toMap();
  }

  //@override
  String $toJson() {
    return (this as Car).toJson(); //jsonEncode((this as Car).toMap());
  }
}


@MappableClass()
class Car extends SuperModelBase with CarMappable,CarMeta implements ISuperModel {

  Car({
    required int id,
    required String name,
    required int year,
    String? colour,
    int? manufacturer_id
  }) :
    this.id = id,
    this.name = name,
    this.year = year,
    this.colour = colour,
    this.manufacturer_id = manufacturer_id;

  final int id;
  final String name;
  final int year;
  final String? colour;
  //@belongsTo()
  final int? manufacturer_id;

  // // will use dart_mappable instead later
  // toMap() {
  //   return {
  //     [CarMeta.$id]: this.id,
  //     [CarMeta.$name]: this.name,
  //     [CarMeta.$year]: this.year,
  //     [CarMeta.$colour]: this.colour,
  //     [CarMeta.$manufacturer_id]: this.manufacturer_id
  //   };
  // }
  //
  // // will use dart_mappable instead later
  // String toJson() {
  //   return jsonEncode(toMap());
  // }
}






void main() {
  group('SuperModel methods', () {
    test('toJSON', () {
      final car = Car(id: 1,name: 'Corolla', year: 1973);
      final jsonString = car.$toJson();
      expect(jsonString, isA<String>());
      expect(jsonString, contains('"name":"Corolla"'));
      expect(jsonString, contains('"year":1973'));
    });

    test('fromJson', () {
      const jsonString = '{"id": 1,"name":"Corolla","year":1973}';
      final car = CarMeta.$fromJson(jsonString);
      expect(car.id, equals(1));
      expect(car.name, equals('Corolla'));
      expect(car.year, equals(1973));
    });

    test('toMap', () {
      final car = Car(id: 2, name: 'Subaru', year: 1987);
      final map = car.$toMap();
      expect(map, isA<Map<String, dynamic>>());
      expect(map['id'], equals(2));
      expect(map['name'], equals('Subaru'));
      expect(map['year'], equals(1987));
    });

    test('fromMap', () {
      final map = {
        'id': 3,
        'name': 'Tweety',
        'year': 1900,
      };
      final car = CarMeta.$fromMap(map);
      expect(car.id, equals(3));
      expect(car.name, equals('Tweety'));
      expect(car.year, equals(1900));
    });

    test('meta constants', () {
      final car = Car(
          id: 3,
          name: "Fred",
          year: 1980
      );
      expect(car.name,equals("Fred"));

      expect(car.$get(CarMeta.$name),equals("Fred"));
      expect(car.$get<String>(CarMeta.$name),equals("Fred"));
      expect(car[CarMeta.$name],equals("Fred"));

      expect(car.$get<int>(CarMeta.$meta.idName!),equals(3));
      expect(car.$get<num>(CarMeta.$meta.idName!),equals(3));
      expect(car[CarMeta.$id],equals(3));

      expect(car.$classMeta.fields.keys.toList(),equals(['id','name','year','colour']));
      expect(car[car.$classMeta.idName!],equals(3));
      expect(car.$classMeta.idType,equals(int));

      expect(CarMeta.$id, equals('id'));
      expect(CarMeta.$name, equals('name'));
      expect(CarMeta.$meta.fields[CarMeta.$id]!.nullable,isFalse);
      expect(CarMeta.$meta.fields[CarMeta.$id]!.type,equals(int));

      expect(CarMeta.$meta.idName,equals('id'));
      expect(CarMeta.$meta.idType,equals(int));

      expect(CarMeta.$meta.fields[CarMeta.$name]!.nullable,isFalse);
      expect(CarMeta.$meta.fields[CarMeta.$name]!.type,equals(String));
    });

    test('copyWith', () {
      final car = Car(
          id: 3,
          name: "Fred",
          year: 1953,
          colour: 'green'
      );
      var copy = car.$copyWith(year: 1982, colour: null);
      expect(copy.id,equals(3));
      expect(copy.year,equals(1982));
      expect(copy.colour,equals('green'));  // $copyWith can't set to null
    });

    test('copyWithMap', () {
      final car = Car(
        id: 3,
        name: "Fred",
        year: 1973
      );
      var copy = car.$copyWithMap<Car>({'year': 1950,'colour': null});
      expect(copy.id,equals(3));
      expect(copy.year,equals(1950));
    });
  });
}
