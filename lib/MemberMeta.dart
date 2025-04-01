part of './super_model.dart';

// Used during generation to store member metadata
class MemberMeta {
  final String name;
  final String baseTypeString;
  late bool nullable;
  late String typeString;

  MemberMeta(this.name, this.baseTypeString, bool nullable) {
    var isDynamic = this.baseTypeString=='dynamic';
    this.nullable =  isDynamic ? true : nullable;
    typeString = baseTypeString + (this.nullable && !isDynamic ? '?' : '');
  }
}
