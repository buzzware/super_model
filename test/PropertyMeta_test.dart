import 'package:super_model/super_model.dart';
import 'package:test/test.dart';

void main() {
  group('PropertyMeta', () {
    test('String', () {
      var meta = PropertyMeta('name',String,false);
      expect(meta.name,equals('name'));
      expect(meta.type,equals(String));
      expect(meta.nullable,equals(false));
      expect(meta.baseTypeString,equals('String'));
      expect(meta.typeString,equals('String'));
    });
    test('String?', () {
      var meta = PropertyMeta('name',String,true);
      expect(meta.name,equals('name'));
      expect(meta.type,equals(String));
      expect(meta.nullable,equals(true));
      expect(meta.baseTypeString,equals('String'));
      expect(meta.typeString,equals('String?'));
    });
    test('int', () {
      var meta = PropertyMeta('age',int,false);
      expect(meta.name,equals('age'));
      expect(meta.type,equals(int));
      expect(meta.nullable,equals(false));
      expect(meta.baseTypeString,equals('int'));
      expect(meta.typeString,equals('int'));
    });
    test('int?', () {
      var meta = PropertyMeta('age',int,true);
      expect(meta.name,equals('age'));
      expect(meta.type,equals(int));
      expect(meta.nullable,equals(true));
      expect(meta.baseTypeString,equals('int'));
      expect(meta.typeString,equals('int?'));
    });
    test('dynamic', () {
      var meta = PropertyMeta('something',dynamic,false);
      expect(meta.name,equals('something'));
      expect(meta.type,equals(dynamic));
      expect(meta.nullable,equals(true));
      expect(meta.baseTypeString,equals('dynamic'));
      expect(meta.typeString,equals('dynamic'));
    });
    test('DateTime', () {
      var meta = PropertyMeta('datetime',DateTime,false);
      expect(meta.name,equals('datetime'));
      expect(meta.type,equals(DateTime));
      expect(meta.nullable,equals(false));
      expect(meta.baseTypeString,equals('DateTime'));
      expect(meta.typeString,equals('DateTime'));
    });
    test('DateTime?', () {
      var meta = PropertyMeta('datetime',DateTime,true);
      expect(meta.name,equals('datetime'));
      expect(meta.type,equals(DateTime));
      expect(meta.nullable,equals(true));
      expect(meta.baseTypeString,equals('DateTime'));
      expect(meta.typeString,equals('DateTime?'));
    });
  });
}
