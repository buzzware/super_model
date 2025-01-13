part of './super_model.dart';

class PropertyMeta {
  final String name;
  final Type type;
  late bool nullable;
  late String baseTypeString;
  late String typeString;
  PropertyMeta(this.name, this.type, bool nullable) {
    var isDynamic = this.type==dynamic;
    this.nullable =  isDynamic ? true : nullable;
    baseTypeString = type.toString();
    typeString = baseTypeString + (this.nullable && !isDynamic ? '?' : '');
  }
}
