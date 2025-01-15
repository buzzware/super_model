import 'package:macros/macros.dart';
import '../super_model.dart';

macro class SuperModelId implements FieldDeclarationsMacro {
  const SuperModelId();

  // @override
  // Future<void> buildDeclarationsForClass(ClassDeclaration clazz, MemberDeclarationBuilder builder) async {
  // }

  @override
  Future<void> buildDeclarationsForField(FieldDeclaration f, MemberDeclarationBuilder builder) async {
    // var cascadeIdField = fields.firstWhere(
    //         (field) => field.metadata.any((m) => m is IdentifierMetadataAnnotation && m.identifier.name == 'CascadeId'),
    //     orElse: () => throw DiagnosticException(Diagnostic(
    //         DiagnosticMessage(
    //             'No field with @CascadeId annotation found',
    //             target: clazz.asDiagnosticTarget),
    //         Severity.error))
    // );

    var publicName = publicise(f.identifier.name);

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

    builder.declareInType(DeclarationCode.fromString('''
      static const String _idName = \$${publicName};
      static const Type _idType = ${typeString};
    '''));
  }
}
