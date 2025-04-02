part of './super_model.dart';

// used by ModelClassMeta
class PropertyMeta {
  final String name;
  final Type type;
  final bool nullable;
  final String baseTypeString;
  final String typeString;
  final dynamic Function(SuperModelBase) getter;

  const PropertyMeta(
      this.name,
      this.type,
      this.nullable,
      this.baseTypeString,
      this.typeString,
      this.getter
  );
  
  dynamic getValue(SuperModelBase object) {
    return getter(object);
  }
}
