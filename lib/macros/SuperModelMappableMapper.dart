import 'package:macros/macros.dart';

import '../super_model.dart';
import 'macro_utils.dart';

void log(MemberDeclarationBuilder builder,String msg) {
  builder.report(Diagnostic(DiagnosticMessage(msg),Severity.info));
}

macro class SuperModelMappableMapper implements ClassDeclarationsMacro {
  const SuperModelMappableMapper();

  @override
  Future<void> buildDeclarationsForClass(ClassDeclaration clazz, MemberDeclarationBuilder builder) async {
    final className = clazz.identifier.name;
    log(builder,className);
    var allFields = await builder.fieldsOf(clazz);
    // var allFieldNames = allFields
    //     .where((field) => !field.hasStatic)
    //     .map((field) => field.identifier.name)
    //     .toList();
    log(builder,"after allFields");
    var selectFields = allFields.where((f) => !f.hasStatic && (f.type is NamedTypeAnnotation)).toList();
    var selectFieldNames = selectFields.map((field) => field.identifier.name).toList();
    log(builder,"selectFieldNames: ${selectFieldNames.join(',')}");
    var fieldMetas = Map<String,MacroMemberMeta>();//List<MacroMemberMeta>.empty(growable: true); // simpleFields.map((f) => MacroPropertyMeta(publicise(f.identifier.name), f.type.runtimeType, f.type.isNullable)).toList();
    for (var f in selectFields) {
      var fieldMeta = await getMemberMeta(f,builder);
      fieldMetas[f.identifier.name] = MacroMemberMeta(fieldMeta.name,fieldMeta.baseTypeString,fieldMeta.nullable);
    }
    log(builder,"fieldMetas: ${fieldMetas.keys.join(',')}");

    // final allFields = await builder.fieldsOf(clazz);
    // final fields = allFields
    //     .where((field) => !field.hasStatic)
    //     .map((field) => field.identifier.name)
    //     .toList();

    builder.declareInLibrary(DeclarationCode.fromString("import 'package:dart_mappable/dart_mappable.dart';"));

    final mapperCode = '''
    class ${className}Mapper extends ClassMapperBase<$className> {
      ${className}Mapper._();

      static ${className}Mapper? _instance;
      static ${className}Mapper ensureInitialized() {
        if (_instance == null) {
          MapperContainer.globals.use(_instance = ${className}Mapper._());
        }
        return _instance!;
      }

      @override
      final String id = '$className';

      ${selectFieldNames.map((field) {
        // final fieldType = allFields
        //     .firstWhere((f) => f.identifier.name == field)
        //     .type.code;
        final fieldType = fieldMetas[field]!.baseTypeString;
        return '''
          static $fieldType _\$$field($className v) => v.$field;
          static const Field<$className, $fieldType> _f\$$field =
              Field('$field', _\$$field);
          ''';
      }).join('\n')}

      @override
      final MappableFields<$className> fields = const {
        ${selectFieldNames.map((field) => '#$field: _f\$$field').join(',\n')}
      };

      static $className _instantiate(DecodingData data) {
        return $className(
          ${selectFieldNames.map((field) => '$field: data.dec(_f\$$field)').join(',\n')}
        );
      }

      @override
      final Function instantiate = _instantiate;

      static $className fromMap(Map<String, dynamic> map) {
        return ensureInitialized().decodeMap<$className>(map);
      }

      static $className fromJson(String json) {
        return ensureInitialized().decodeJson<$className>(json);
      }
    }

    mixin ${className}Mappable {
      String toJson() {
        return ${className}Mapper.ensureInitialized()
            .encodeJson<$className>(this as $className);
      }

      Map<String, dynamic> toMap() {
        return ${className}Mapper.ensureInitialized()
            .encodeMap<$className>(this as $className);
      }

      ${className}CopyWith<$className, $className, $className> get copyWith =>
          _${className}CopyWithImpl(this as $className, \$identity, \$identity);

      @override
      String toString() {
        return ${className}Mapper.ensureInitialized()
            .stringifyValue(this as $className);
      }

      @override
      bool operator ==(Object other) {
        return ${className}Mapper.ensureInitialized()
            .equalsValue(this as $className, other);
      }

      @override
      int get hashCode {
        return ${className}Mapper.ensureInitialized()
            .hashValue(this as $className);
      }
    }

    extension ${className}ValueCopy<\$R, \$Out>
        on ObjectCopyWith<\$R, $className, \$Out> {
      ${className}CopyWith<\$R, $className, \$Out> get \$as$className =>
          \$base.as((v, t, t2) => _${className}CopyWithImpl(v, t, t2));
    }

    abstract class ${className}CopyWith<\$R, \$In extends $className, \$Out>
        implements ClassCopyWith<\$R, \$In, \$Out> {
      \$R call({${selectFieldNames.map((field) {
      final fieldType = fieldMetas[field]!.baseTypeString;
      return '$fieldType? $field';
    }).join(', ')}});
      ${className}CopyWith<\$R2, \$In, \$Out2> \$chain<\$R2, \$Out2>(
          Then<\$Out2, \$R2> t);
    }

    class _${className}CopyWithImpl<\$R, \$Out>
        extends ClassCopyWithBase<\$R, $className, \$Out>
        implements ${className}CopyWith<\$R, $className, \$Out> {
      _${className}CopyWithImpl(super.value, super.then, super.then2);

      @override
      late final ClassMapperBase<$className> \$mapper =
          ${className}Mapper.ensureInitialized();
      @override
      \$R call({${selectFieldNames.map((field) {
      final fieldType = fieldMetas[field]!.baseTypeString;
      return '$fieldType? $field';
    }).join(', ')}}) =>
          \$apply(FieldCopyWithData({
            ${selectFieldNames.map((field) => 'if ($field != null) #$field: $field').join(',\n')}
          }));

      @override
      $className \$make(CopyWithData data) => $className(
          ${selectFieldNames.map((field) =>
    '$field: data.get(#$field, or: \$value.$field)').join(', ')});

      @override
      ${className}CopyWith<\$R2, $className, \$Out2> \$chain<\$R2, \$Out2>(
              Then<\$Out2, \$R2> t) =>
          _${className}CopyWithImpl(\$value, \$cast, t);
    }
    ''';
    log(builder,mapperCode);
    builder.declareInLibrary(DeclarationCode.fromString(mapperCode));
    log(builder,"end");
  }
}
