part of './super_model.dart';

// before compilation
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
