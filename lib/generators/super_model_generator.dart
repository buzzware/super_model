import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../annotations/super_model.dart';
import '../super_model.dart';
import 'generator_utils.dart';

class SuperModelGenerator extends GeneratorForAnnotation<SuperModel> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
          'The @SuperModel annotation can only be applied to classes.',
          element: element);
    }

    final classElement = element;
    final className = classElement.name;
    final fields = classElement.fields.where((f) => !f.isStatic && !f.name.startsWith('_')).toList();

    final buffer = StringBuffer();

    // Add a part directive to include the generated code
    buffer.writeln('// **************************************************************************');
    buffer.writeln('// SuperModelGenerator');
    buffer.writeln('// **************************************************************************');

    // Create a mixin for instance methods that includes both Meta and MappableMixin functionality
    buffer.writeln('mixin ${className}Meta on SuperModelBase implements ISuperModel {');

    // Generate field constants directly in the mixin
    for (final field in fields) {
      buffer.writeln('  static const String \$${field.name} = "${field.name}";');
    }

    // Static fromJson/fromMap methods
    buffer.writeln('  static const fromJson = ${className}Mapper.fromJson;');
    buffer.writeln('  static const fromMap = ${className}Mapper.fromMap;');
    buffer.writeln('  static const \$fromJson = ${className}Mapper.fromJson;');
    buffer.writeln('  static const \$fromMap = ${className}Mapper.fromMap;');

    // Get the ID field information
    FieldElement? idField;
    for (var field in classElement.fields) {
      if (field.metadata.any((meta) => meta.element?.name == 'SuperModelId')) {
        idField = field;
        break;
      }
    }
    idField ??= fields.isNotEmpty ? fields.first : null;

    final idName = idField?.name ?? 'id';
    final idType = idField != null ? _typeToString(idField.type) : 'int';

    // Generate meta information
    buffer.writeln('  static SuperModelInfo \$info = SuperModelInfo($className, null, "$idName", $idType, {');
    for (final field in fields) {
      final typeString = _typeToString(field.type);
      final isNullable = field.type.toString().endsWith('?');
      buffer.writeln('    \$${field.name}: PropertyMeta(\$${field.name}, $typeString, $isNullable, \'$typeString\', \'${isNullable ? '$typeString?' : typeString}\', (o) => (o as $className).${field.name}),');
    }
    buffer.writeln('  });');

    // Override operator[] to use PropertyMeta.getValue
    buffer.writeln('  @override');
    buffer.writeln('  dynamic operator[](String key) {');
    buffer.writeln('    final property = \$classInfo.fields[key];');
    buffer.writeln('    return property?.getValue(this);');
    buffer.writeln('  }');

    // ClassMeta getter
    buffer.writeln('  @override');
    buffer.writeln('  SuperModelInfo get \$classInfo => \$info;');

    // Add mappable functionality
    buffer.writeln('  @override');
    buffer.writeln('  M \$copyWithMap<M>(Map<String, dynamic> map) {');
    buffer.writeln('    final mergedMap = {...(this as $className).toMap(), ...map};');
    buffer.writeln('    return fromMap(mergedMap) as M;');
    buffer.writeln('  }');

    buffer.writeln('  @override');
    buffer.writeln('  T? \$get<T>(String key, [T? defaultValue]) {');
    buffer.writeln('    final property = \$classInfo.fields[key];');
    buffer.writeln('    if (property == null) return defaultValue;');
    buffer.writeln('    return property.getValue(this) as T?;');
    buffer.writeln('  }');

    buffer.writeln('  @override');
    buffer.writeln('  Map<String, dynamic> \$toMap() {');
    buffer.writeln('    if (this is $className) {');
    buffer.writeln('      return (this as $className).toMap();');
    buffer.writeln('    }');
    buffer.writeln('    throw UnimplementedError("toMap() not implemented in \${this.runtimeType}");');
    buffer.writeln('  }');

    buffer.writeln('  @override');
    buffer.writeln('  String \$toJson() {');
    buffer.writeln('    if (this is $className) {');
    buffer.writeln('      return (this as $className).toJson();');
    buffer.writeln('    }');
    buffer.writeln('    throw UnimplementedError("toJson() not implemented in \${this.runtimeType}");');
    buffer.writeln('  }');

    // Generate $copyWith method
    generateCopyWithForClass(buffer, classElement);

    buffer.writeln('}');

    return buffer.toString();
  }

  // Use utility method from generator_utils.dart instead
  String _typeToString(DartType type) {
    return dartTypeToString(type);
  }
}

class SuperModelIdGenerator extends GeneratorForAnnotation<SuperModelId> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! FieldElement) {
      throw InvalidGenerationSourceError(
          'The @SuperModelId annotation can only be applied to fields.',
          element: element);
    }

    final fieldElement = element;
    final fieldName = fieldElement.name;
    final publicName = fieldName.startsWith('_') ? fieldName.substring(1) : fieldName;
    final typeString = _typeToString(fieldElement.type);
    final className = (fieldElement.enclosingElement as ClassElement).name;

    final buffer = StringBuffer();
    buffer.writeln('// **************************************************************************');
    buffer.writeln('// SuperModelIdGenerator');
    buffer.writeln('// **************************************************************************');

    // Create a class with static constants for id name and type
    buffer.writeln('class ${className}SuperModelIdFields {');
    buffer.writeln('  static const String idName = "${fieldName}";');
    buffer.writeln('  static const Type idType = $typeString;');
    buffer.writeln('}');

    return buffer.toString();
  }

  // Use utility method from generator_utils.dart instead
  String _typeToString(DartType type) {
    return dartTypeToString(type);
  }
}

class MappableSuperModelGenerator extends GeneratorForAnnotation<MappableSuperModel> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
          'The @MappableSuperModel annotation can only be applied to classes.',
          element: element);
    }

    // No need to generate anything here as everything is now in the main Meta mixin
    // Just return an empty string
    return '';
  }
}

// This is extracted as a separate method to be called from SuperModelGenerator
void generateCopyWithForClass(StringBuffer buffer, ClassElement classElement) {
  final className = classElement.name;
  final fields = classElement.fields.where((f) => !f.isStatic && !f.name.startsWith('_')).toList();

  // CopyWith method implementation
  buffer.writeln('  $className \$copyWith({');

  // Get the constructor parameters
  ConstructorElement? constructor;
  try {
    constructor = classElement.constructors.firstWhere(
      (c) => c.isGenerative && !c.name.startsWith('_'),
    );
  } catch (_) {
    constructor = classElement.constructors.isNotEmpty ? classElement.constructors.first : null;
  }

  final paramMap = <String, ParameterElement>{};
  if (constructor != null) {
    for (var param in constructor.parameters) {
      if (!param.name.startsWith('_')) {
        paramMap[param.name] = param;
      }
    }
  }

  // Generate parameter declarations for copyWith
  // All parameters in copyWith are optional since they default to the current value
  for (final field in fields) {
    // Get the type with proper handling of nullability
    final rawType = field.type.toString();
    final isNullable = rawType.endsWith('?');
    final typeString = isNullable ? rawType : '$rawType?';

    buffer.writeln('    $typeString ${field.name},');
  }

  buffer.writeln('  }) {');
  buffer.writeln('    final self = this as $className;');
  buffer.writeln('    return $className(');

  // Only include fields that are present in the constructor parameters
  for (final field in fields) {
    final param = paramMap[field.name];
    if (param != null) {
      buffer.writeln('      ${field.name}: ${field.name} ?? self.${field.name},');
    }
  }
  buffer.writeln('    );');
  buffer.writeln('  }');
}

class BelongsToGenerator extends GeneratorForAnnotation<BelongsTo> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! FieldElement) {
      throw InvalidGenerationSourceError(
          'The @BelongsTo annotation can only be applied to fields.',
          element: element);
    }

    final fieldElement = element;
    final fieldName = fieldElement.name;
    final className = (fieldElement.enclosingElement as ClassElement).name;
    final foreignKey = annotation.read('foreignKey').stringValue;
    final fieldType = _typeToString(fieldElement.type);

    final buffer = StringBuffer();
    buffer.writeln('// **************************************************************************');
    buffer.writeln('// BelongsToGenerator');
    buffer.writeln('// **************************************************************************');

    // Create an extension to hold the relationship metadata
    buffer.writeln('extension ${className}${capitalize(fieldName)}Relationship on $className {');
    buffer.writeln('  static const String foreignKey = "$foreignKey";');
    buffer.writeln('  static const String relatedField = "${fieldName}";');
    buffer.writeln('  static const Type relatedType = $fieldType;');
    buffer.writeln('}');

    return buffer.toString();
  }

  // Helper to capitalize first letter for extension naming
  String capitalize(String s) => s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

  // Use utility method from generator_utils.dart instead
  String _typeToString(DartType type) {
    return dartTypeToString(type);
  }
}
