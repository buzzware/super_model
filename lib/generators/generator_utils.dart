import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import '../super_model.dart';

/// Makes a private field name public by removing leading underscore
String publicise(String name) {
  if (name.startsWith('_')) return name.substring(1);
  return name;
}

/// Makes a field name private by adding leading underscore if not present
String privatise(String name) {
  if (name.startsWith('_')) return name;
  return '_$name';
}

/// Get field metadata from an analyzer FieldElement
MemberMeta getFieldMeta(FieldElement field) {
  final name = field.name;
  final type = field.type;
  final isNullable = type.toString().endsWith('?');
  
  String baseTypeString;
  if (type is InterfaceType) {
    baseTypeString = type.element.name;
  } else {
    baseTypeString = 'dynamic';
  }
  
  return MemberMeta(
    publicise(name),
    baseTypeString,
    isNullable,
  );
}

/// Get type name as string from a DartType
String dartTypeToString(DartType type) {
  if (type is InterfaceType) {
    return type.element.name;
  }
  return 'dynamic';
}
