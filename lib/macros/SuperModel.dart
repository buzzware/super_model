import 'package:macros/macros.dart';
import '../super_model.dart';

macro class SuperModel implements ClassDeclarationsMacro {
  const SuperModel();

  @override
  Future<void> buildDeclarationsForClass(ClassDeclaration clazz, MemberDeclarationBuilder builder) async {
    // Check if the class already extends SuperModelBase
    // var extendsClause = clazz.superclass  .extendsClause;
    // if (extendsClause == null) {
    //   // If not, make it extend SuperModelBase
    //   builder.addTypeAnnotation(TypeAnnotationCode('extends SuperModelBase'));
    // } else {
    //   // Check if it extends a class that extends SuperModelBase
    //   var superclass = await builder.typeResolver.resolveIdentifier(extendsClause.type.identifier);
    //   if (superclass is ClassDeclaration) {
    //     var isSubclassOfSuperModelBase = await _isSubclassOfSuperModelBase(superclass, builder);
    //     if (!isSubclassOfSuperModelBase) {
    //       throw DiagnosticException(Diagnostic(
    //           DiagnosticMessage(
    //               'Class must extend SuperModelBase or a subclass of SuperModelBase',
    //               target: clazz.asDiagnosticTarget),
    //           Severity.error));
    //     }
    //   }
    // }

    // Generate _properties map
    var fields = await builder.fieldsOf(clazz);
    var simpleFields = fields.where((f) => !f.hasStatic && (f.type is NamedTypeAnnotation)).toList();
    var simpleProperties = List<MacroMemberMeta>.empty(growable: true); // simpleFields.map((f) => MacroPropertyMeta(publicise(f.identifier.name), f.type.runtimeType, f.type.isNullable)).toList();
    for (var f in simpleFields) {
      var fieldMeta = await getMemberMeta(f,builder);
      simpleProperties.add(MacroMemberMeta(publicise(fieldMeta.name),fieldMeta.baseTypeString,fieldMeta.nullable));
    }

    for (var p in simpleProperties) {
      builder.declareInType(DeclarationCode.fromString('static const String \$${p.name} = "${p.name}";'));
    }

    // builder.report(Diagnostic(DiagnosticMessage('Debug info: ${jsonEncode(simpleFields)}'),Severity.info));

    builder.declareInLibrary(DeclarationCode.fromString("import 'package:super_model/super_model.dart';"));

    var parts = List<Object>.empty(growable: true);
    //parts.add('static const Map<String, PropertyMeta> \$properties = {');
    parts.add('static const ModelClassMeta \$meta = const ModelClassMeta(${clazz.identifier.name},_idName,_idType,{');
    for (var p in simpleProperties) {
      parts.add("(\$${p.name}): const PropertyMeta(\$${p.name},${p.baseTypeString},${p.nullable},'${p.baseTypeString}','${p.typeString}'),");
    }
    parts.add('});');
    builder.declareInType(DeclarationCode.fromParts(parts));

    builder.declareInType(DeclarationCode.fromString('''
      // ModelMeta? _meta;
      @override
      ModelClassMeta get \$classMeta => \$meta;
    '''));

    // builder.declareInLibrary(DeclarationCode.fromString("import 'package:cascade/models/PropertyMeta.dart';"));
    // builder.declareInLibrary(DeclarationCode.fromString("import 'package:cascade/models/ModelMeta.dart';"));
    // builder.declareInType(DeclarationCode.fromString('ModelMeta $meta \$${f.identifier.name} = "${f.identifier.name}";'));

    // Generate getters and setters maps
    var gettersMap = simpleProperties.map((p) {
      return '"${p.name}": () => _${p.name}';
    }).join(',');

    builder.declareInType(DeclarationCode.fromString('''
      @override
      Map<String, dynamic Function()> get \$getters => {$gettersMap};

      @override
      dynamic operator[](String key) {
        var getter = \$getters[key];
        if (getter==null)
          return null;
        return getter!();
      }
    '''));

    // declare default constructor
    var code = "${clazz.identifier.name}({\n";
    code += simpleProperties.map<String>((p) {
      if (p.nullable)
        return "${p.typeString} ${p.name}";
      else
        return "required ${p.typeString} ${p.name}";
    }).join(',\n');
    code += "}) :\n";
    code += simpleProperties.map<String>((p) => "_${p.name} = ${p.name}").join(',\n');
    code += "\n;";
    //builder.report(Diagnostic(DiagnosticMessage(code),Severity.info));
    builder.declareInType(DeclarationCode.fromString(code));

    // Generate properties
    for (var p in simpleProperties) {
      //builder.report(Diagnostic(DiagnosticMessage('$name typeString: ${typeString}'),Severity.info));
      builder.declareInType(DeclarationCode.fromString('''
        ${p.typeString} get ${p.name} {
          return _${p.name};
        }
      '''));
    }
  }

}
