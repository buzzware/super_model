part of './super_model.dart';

class ModelClassMeta {
  const ModelClassMeta(
      this.type,
      this.superClassMeta,
      this.idName,
      this.idType,
      this.fields,
      );

  final Type type;
  final ModelClassMeta? superClassMeta;
  final Type? idType;
  final String? idName;
  final Map<String, PropertyMeta> fields;
}
