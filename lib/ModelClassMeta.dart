part of './super_model.dart';

class ModelClassMeta {
  final Type type;
  final Type? idType;
  final String? idName;
  final Map<String, PropertyMeta> properties;
  const ModelClassMeta(
      this.type,
      this.idName,
      this.idType,
      this.properties,
  );
}
