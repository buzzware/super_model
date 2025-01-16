import 'package:macros/macros.dart';
import '../super_model.dart';

macro class BelongsTo implements ClassDeclarationsMacro { // The name of the property.

  const BelongsTo(this.typeName, this.name);
  final String typeName; // The type of the property to generate.
  final String name;

  @override
  void buildDeclarationsForClass(ClassDeclaration clazz, MemberDeclarationBuilder builder) {
    // Convert the type and name to strings.
    //final typeCode = typeName.toString();
    final fieldName = name;
    final backingFieldName = '_$fieldName';

    // Generate the backing field, getter, and setter.
    builder.declareInType(DeclarationCode.fromString('''
      late $typeName $backingFieldName;
      $typeName get $fieldName => $backingFieldName;
      set $fieldName($typeName value) {
        $backingFieldName = value;
      }
    '''));
  }
}
