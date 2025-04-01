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
    
    // Create an extension to hold the static members
    buffer.writeln('extension ${className}SuperModelGeneratedFields on $className {');
    
    // Generate field constants
    for (final field in fields) {
      buffer.writeln('  static const String \$${field.name} = "${field.name}";');
    }

    // Generate meta information
    buffer.writeln('  static const ModelClassMeta \$meta = ModelClassMeta($className, ${className}SuperModelIdFields.idName, ${className}SuperModelIdFields.idType, {');
    for (final field in fields) {
      final typeString = _typeToString(field.type);
      final isNullable = field.type.toString().endsWith('?');
      buffer.writeln('    \$${field.name}: const PropertyMeta(\$${field.name}, $typeString, $isNullable, \'$typeString\', \'${isNullable ? '$typeString?' : typeString}\'),');
    }
    buffer.writeln('  });');
    buffer.writeln('}');
    
    // Create a mixin for instance methods
    buffer.writeln('mixin ${className}SuperModelMixin on SuperModelBase {');
    
    // Getters implementation
    final gettersMap = fields.map((f) => '"${f.name}": () => (this as $className).${f.name}').join(',');
    buffer.writeln('  @override');
    buffer.writeln('  Map<String, dynamic Function()> get \$getters => {$gettersMap};');

    buffer.writeln('  @override');
    buffer.writeln('  dynamic operator[](String key) {');
    buffer.writeln('    var getter = \$getters[key];');
    buffer.writeln('    if (getter == null) return null;');
    buffer.writeln('    return getter();');
    buffer.writeln('  }');

    // ClassMeta getter
    buffer.writeln('  @override');
    buffer.writeln('  ModelClassMeta get \$classMeta => ${className}SuperModelGeneratedFields.\$meta;');
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

    final classElement = element;
    final className = classElement.name;
    final mapperClassName = "${className}Mapper";
    final fields = classElement.fields.where((f) => !f.isStatic && !f.name.startsWith('_')).toList();
    
    final buffer = StringBuffer();
    
    buffer.writeln('// **************************************************************************');
    buffer.writeln('// MappableSuperModelGenerator');
    buffer.writeln('// **************************************************************************');
    
    // Create an extension for static members
    buffer.writeln('extension ${className}MappableFields on $className {');

    // Generate field constants if not already done by SuperModel
    for (final field in fields) {
      buffer.writeln('  static const String \$${field.name} = \'${field.name}\';');
    }

    // Static fromJson/fromMap methods
    buffer.writeln('  static const fromJson = $mapperClassName.fromJson;');
    buffer.writeln('  static const fromMap = $mapperClassName.fromMap;');
    buffer.writeln('  static const \$fromJson = $mapperClassName.fromJson;');
    buffer.writeln('  static const \$fromMap = $mapperClassName.fromMap;');

    // Generate getters map
    buffer.writeln('  static Map<String, dynamic Function($className)> _\$getters = {');
    for (final field in fields) {
      buffer.writeln('    \$${field.name}: ($className o) => o.${field.name},');
    }
    buffer.writeln('  };');
    buffer.writeln('}');
    
    // Create a mixin for instance methods
    buffer.writeln('mixin ${className}MappableMixin on SuperModelBase implements ISuperModel {');

    // Override ISuperModel methods
    buffer.writeln('  @override');
    buffer.writeln('  ModelClassMeta get \$classMeta => ${className}SuperModelGeneratedFields.\$meta;');
    
    buffer.writeln('  @override');
    buffer.writeln('  M \$copyWithMap<M>(Map<String, dynamic> map) {');
    buffer.writeln('    final mergedMap = {...toMap(), ...map};');
    buffer.writeln('    return ${className}MappableFields.fromMap(mergedMap) as M;');
    buffer.writeln('  }');
    
    buffer.writeln('  @override');
    buffer.writeln('  T? \$get<T>(String key, [T? defaultValue]) {');
    buffer.writeln('    final getter = ${className}MappableFields._\$getters[key];');
    buffer.writeln('    if (getter == null) return defaultValue;');
    buffer.writeln('    return getter(this as $className) as T?;');
    buffer.writeln('  }');
    
    buffer.writeln('  @override');
    buffer.writeln('  Map<String, dynamic> \$toMap() {');
    buffer.writeln('    return (this as $className).toMap();');
    buffer.writeln('  }');
    
    buffer.writeln('  @override');
    buffer.writeln('  String \$toJson() => (this as $className).toJson();');
    
    buffer.writeln('  dynamic operator [](String key) {');
    buffer.writeln('    final getter = ${className}MappableFields._\$getters[key];');
    buffer.writeln('    return getter == null ? null : getter(this as $className);');
    buffer.writeln('  }');
    
    // CopyWith method
    buffer.writeln('  $className \$copyWith({');
    for (final field in fields) {
      final typeString = _typeToString(field.type);
      final isNullable = field.type.toString().endsWith('?');
      buffer.writeln('    ${isNullable ? typeString : typeString + '?'} ${field.name},');
    }
    buffer.writeln('  }) {');
    buffer.writeln('    final self = this as $className;');
    buffer.writeln('    return $className(');
    for (final field in fields) {
      buffer.writeln('      ${field.name}: ${field.name} ?? self.${field.name},');
    }
    buffer.writeln('    );');
    buffer.writeln('  }');
    buffer.writeln('}');

    return buffer.toString();
  }

  // Use utility method from generator_utils.dart instead
  String _typeToString(DartType type) {
    return dartTypeToString(type);
  }
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
