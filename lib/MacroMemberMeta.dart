part of './super_model.dart';

// used during macro execution, before compilation, so runtime Types are not available
class MacroMemberMeta {
  final String name;
  final String baseTypeString;
  late bool nullable;
  late String typeString;

  MacroMemberMeta(this.name, this.baseTypeString, bool nullable) {
    var isDynamic = this.baseTypeString=='dynamic';
    this.nullable =  isDynamic ? true : nullable;
    typeString = baseTypeString + (this.nullable && !isDynamic ? '?' : '');
  }
}
