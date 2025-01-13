import 'package:super_model/super_model.dart';
import 'package:test/test.dart';

void main() {
  group('MacroPropertyMeta', () {
    test('String', () {
      var meta = MacroMemberMeta('name','String',false);
      expect(meta.name,equals('name'));
      expect(meta.nullable,equals(false));
      expect(meta.baseTypeString,equals('String'));
      expect(meta.typeString,equals('String'));
    });
    test('String?', () {
      var meta = MacroMemberMeta('name','String',true);
      expect(meta.name,equals('name'));
      expect(meta.nullable,equals(true));
      expect(meta.baseTypeString,equals('String'));
      expect(meta.typeString,equals('String?'));
    });
    test('int', () {
      var meta = MacroMemberMeta('age','int',false);
      expect(meta.name,equals('age'));
      expect(meta.nullable,equals(false));
      expect(meta.baseTypeString,equals('int'));
      expect(meta.typeString,equals('int'));
    });
    test('int?', () {
      var meta = MacroMemberMeta('age','int',true);
      expect(meta.name,equals('age'));
      expect(meta.nullable,equals(true));
      expect(meta.baseTypeString,equals('int'));
      expect(meta.typeString,equals('int?'));
    });
    test('dynamic', () {
      var meta = MacroMemberMeta('something','dynamic',false);
      expect(meta.name,equals('something'));
      expect(meta.nullable,equals(true));
      expect(meta.baseTypeString,equals('dynamic'));
      expect(meta.typeString,equals('dynamic'));
    });
    test('DateTime', () {
      var meta = MacroMemberMeta('datetime','DateTime',false);
      expect(meta.name,equals('datetime'));
      expect(meta.nullable,equals(false));
      expect(meta.baseTypeString,equals('DateTime'));
      expect(meta.typeString,equals('DateTime'));
    });
    test('DateTime?', () {
      var meta = MacroMemberMeta('datetime','DateTime',true);
      expect(meta.name,equals('datetime'));
      expect(meta.nullable,equals(true));
      expect(meta.baseTypeString,equals('DateTime'));
      expect(meta.typeString,equals('DateTime?'));
    });
  });
}
