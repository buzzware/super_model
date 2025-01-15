part of '../super_model.dart';

String publicise(String name) {
  return name.startsWith('_') ? name.substring(1) : name;
}

String privatise(String name) {
  return name.startsWith('_') ? name : '_'+name;
}

Future<MacroMemberMeta> getMemberMeta(FieldDeclaration f, MemberDeclarationBuilder builder) async {
  var typeCode = f.type.code;
  var nullable = typeCode is NullableTypeAnnotationCode;
  if (nullable)
    typeCode = typeCode.underlyingType;
  String typeString;
  if (typeCode is NamedTypeAnnotationCode) {
    final typeDecl = await builder.typeDeclarationOf(typeCode.name);
    typeString = typeDecl.identifier.name;
  } else {
    // Handle other types of TypeAnnotationCode as needed
    typeString = 'dynamic';
  }
  //builder.report(Diagnostic(DiagnosticMessage('Debug info: getMemberMeta typeString ${typeString}'),Severity.info));
  return MacroMemberMeta(f.identifier.name,typeString,nullable);
}

// get string representing type for code
Future<String> getTypeString(FieldDeclaration f, MemberDeclarationBuilder builder) async {
  var typeCode = f.type.code;
  var nullable = typeCode is NullableTypeAnnotationCode;
  if (nullable)
    typeCode = typeCode.underlyingType;
  String typeString;
  if (typeCode is NamedTypeAnnotationCode) {
    final typeDecl = await builder.typeDeclarationOf(typeCode.name);
    typeString = typeDecl.identifier.name;
  } else {
    // Handle other types of TypeAnnotationCode as needed
    typeString = 'dynamic';
  }
  return typeString;
}

Future<String> getPlainTypeString(FieldDeclaration f, MemberDeclarationBuilder builder) async {
  NamedTypeAnnotationCode? namedType;
  bool nullable;
  if (f.type.code is NullableTypeAnnotationCode) {
    namedType = (f.type.code as NullableTypeAnnotationCode)?.underlyingType as NamedTypeAnnotationCode;
    nullable = true;
  } else {
    namedType = f.type.code as NamedTypeAnnotationCode;
    nullable = false;
  }
  String typeString;
  if (namedType!=null) {
    final typeDecl = await builder.typeDeclarationOf(namedType.name);
    typeString = typeDecl.identifier.name;
    if (nullable)
      typeString += '?';
  } else {
    // Handle other types of TypeAnnotationCode as needed
    typeString = 'dynamic';
  }
  return typeString;
}
