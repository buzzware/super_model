import 'package:macros/macros.dart';
import '../super_model.dart';

void log(MemberDeclarationBuilder builder,String msg) {
  //builder.report(Diagnostic(DiagnosticMessage(msg),Severity.info));
}

macro class MappableSuperModel implements ClassDeclarationsMacro {
  const MappableSuperModel();

  @override
  Future<void> buildDeclarationsForClass(ClassDeclaration clazz, MemberDeclarationBuilder builder) async {

    final className = clazz.identifier.name;
    final mapperClassName = "${className}Mapper";
    var allFields = await builder.fieldsOf(clazz);

    // Filter fields to exclude static ones and ensure NamedTypeAnnotation
    var selectFields = allFields.where((f) => !f.hasStatic && (f.type is NamedTypeAnnotation)).toList();
    var selectFieldNames = selectFields.map((field) => field.identifier.name).toList();

    // Gather metadata about fields
    var fieldMetas = <String, MacroMemberMeta>{};
    for (var f in selectFields) {
      var fieldMeta = await getMemberMeta(f, builder);
      fieldMetas[f.identifier.name] = MacroMemberMeta(
        fieldMeta.name,
        fieldMeta.baseTypeString,
        fieldMeta.nullable,
      );
    }

    builder.declareInLibrary(DeclarationCode.fromString("import 'package:super_model/super_model.dart';"));

    // Generate the constructor
    // var constructorParams = selectFieldNames.map((field) {
    //   var isRequired = !(fieldMetas[field]?.nullable ?? true);
    //   return '${isRequired ? 'required ' : ''}this.${field},';
    // }).join(' ');
    // builder.declareInType(DeclarationCode.fromString('''
    //   const $className({
    //     $constructorParams
    //   });
    // '''));

    // Generate field constants and meta information
    for (var field in selectFieldNames) {
      builder.declareInType(DeclarationCode.fromString('static const String \$${field} = \'$field\';'));
    }

    builder.declareInType(DeclarationCode.fromString('''
      static const ModelClassMeta \$meta = ModelClassMeta(
        $className,
        _idName,
        _idType,
        {
          ${selectFieldNames.map((field) {
      var meta = fieldMetas[field]!;
      return '\$${field}: PropertyMeta(\$${field}, ${meta.baseTypeString}, ${meta.nullable}, \'${meta.baseTypeString}\', \'${meta.baseTypeString}${meta.nullable ? '?' : ''}\')';
    }).join(',\n')}
        }
      );
    '''));

    builder.declareInType(DeclarationCode.fromString('''
      static const fromJson = $mapperClassName.fromJson;
      static const fromMap = $mapperClassName.fromMap;
      static const \$fromJson = $mapperClassName.fromJson;
      static const \$fromMap =  $mapperClassName.fromMap;    
    '''));

    builder.declareInType(DeclarationCode.fromString('''
      static Map<String, dynamic Function($className)> _\$getters = {
        ${selectFieldNames.map((field) => '\$${field}: ($className o) => o.$field').join(',')}
      };
    '''));

    // Implement methods for ISuperModel
    builder.declareInType(DeclarationCode.fromString('''
      @override
      ModelClassMeta get \$classMeta => \$meta;

      @override
      M \$copyWithMap<M>(Map<String, dynamic> map) {
        final mergedMap = {...toMap(), ...map};
        return $mapperClassName.fromMap(mergedMap) as M;
      }

      @override
      T? \$get<T>(String key, [T? defaultValue]) {
        final getter = _\$getters[key];
        if (getter == null) return defaultValue;
        return getter(this) as T?;
      }

      @override
      Map<String, dynamic> \$toMap() {
        return this.toMap();
      }

      @override
      String \$toJson() => this.toJson();

      dynamic operator [](String key) {
        final getter = _\$getters[key];
        return getter == null ? null : getter(this);
      }

      $className \$copyWith({
        ${selectFieldNames.map((field) {
      final fieldType = fieldMetas[field]!.baseTypeString;
      return '$fieldType? $field,';
    }).join(' ')}
      }) {
        return $className(
          ${selectFieldNames.map((field) => '$field: $field ?? this.$field').join(', ')}
        );
      }
    '''));


    log(builder,"end");
  }
}
