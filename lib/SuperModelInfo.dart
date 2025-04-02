part of './super_model.dart';

class SuperModelInfo {
  const SuperModelInfo(
      this.type,
      this.superClassInfo,
      this.idName,
      this.idType,
      this.fields,
      );

  final Type type;
  final SuperModelInfo? superClassInfo;
  final Type? idType;
  final String? idName;
  final Map<String, PropertyMeta> fields;
}
