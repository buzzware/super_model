import 'package:super_model/super_model.dart';
import 'package:test/test.dart';

@SuperModel()
class Thing extends SuperModelBase {
  @SuperModelId()
  int _id = 0;

  String? _name;
  String? _colour;

  // Thing({
  //   required int id,
  //   String? name,
  //   required String? colour
  // }) :
  //   _id = id,
  //   _name = name,
  //   _colour = colour
  //   ;
}

class Thing2 {
  final String _name;
  final int? _age;
  final String? _address;
  final String? _email;

  String get name => _name;
  int? get age => _age;
  String? get address => _address;
  String? get email => _email;

  const Thing2({
    required String name,
    int? age,
    String? address,
    String? email,
  }) :
        _name = name,
        _age = age,
        _address = address,
        _email = email
  ;

  Thing2.withMap(Map<String,dynamic> map) :
    _name = map['name'],
    _age = map['age'],
    _address = map['address'],
    _email = map['email']
    ;

  Thing2 copyWith({
    String? name,
    int? age,
    String? address,
    String? email
  }) {
    return Thing2(
      name: name ?? this.name,
      age: age ?? this.age,
      address: address ?? this.address,
      email: email ?? this.email
    );
  }

  Thing2 copyWithMap(Map<String,dynamic> map) {
    return Thing2(
        name: map['name'] ?? name,
        age: map['age'] ?? age,
        address: map['address'] ?? address,
        email: map['email'] ?? email
    );
  }
}


void main() {

  // group('Thing2', ()
  // {
  //   test('default constructor', () {
  //     var thing = const Thing2(name: 'John');
  //     expect(thing.name, equals('John'));
  //   });
  //   test('withMap constructor', () {
  //     var thing = Thing2.withMap({'name': 'John'});
  //     expect(thing.name, equals('John'));
  //   });
  //   test('copyWith', () {
  //     var thing = Thing2.withMap({'name': 'John'});
  //     var thing2 = thing.copyWith(age: 75);
  //     expect(thing2.name, equals('John'));
  //     expect(thing2.age, equals(75));
  //   });
  //   test('copyWithMap', () {
  //     var thing = Thing2.withMap({'name': 'John'});
  //     var thing2 = thing.copyWithMap({'age': 75});
  //     expect(thing2.name, equals('John'));
  //     expect(thing2.age, equals(75));
  //   });
  // });

  group('SuperModel', () {

    test('default constructor', () {
        Thing thing = Thing(id: 3, colour: 'red', name: "Fred");
        expect(thing.id,equals(3));
        expect(thing.colour,equals('red'));
    });

    test('default constructor', () {
        Thing thing = Thing(id: 3, colour: 'red', name: "Fred");
        expect(thing.id,equals(3));
        expect(thing.colour,equals('red'));
    });

    test('constants and read', () {
      Thing thing = Thing(
        id: 3,
        name: "Fred"
      );
      expect(thing, isNotNull);
      expect(thing.name,equals("Fred"));
      expect(thing[Thing.$name],equals("Fred"));

      expect(Thing.$id, equals('id'));
      expect(Thing.$name, equals('name'));
      expect(Thing.$meta.properties[Thing.$id]!.nullable,isFalse);
      expect(thing.$classMeta.properties[Thing.$id]!.type,equals(int));

      expect(Thing.$meta.idName,equals('id'));
      expect(Thing.$meta.idType,equals(int));

      expect(Thing.$meta.properties[Thing.$name]!.nullable,isTrue);
      expect(Thing.$meta.properties[Thing.$name]!.type,equals(String));

    });


  });
}
