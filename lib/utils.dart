import 'dart:convert';
import 'super_model.dart';

String privatise(String name) {
  return name.startsWith('_') ? name : '_'+name;
}


/// Makes a private field name public by removing leading underscore
String publicise(String name) {
  if (name.startsWith('_')) return name.substring(1);
  return name;
}

/// Get type name as string from a Type object
String getTypeString(Type type) {
  return type.toString();
}

/// Helper to convert a model to JSON
String modelToJson(ISuperModel model) {
  return jsonEncode(model.$toMap());
}

/// Helper to create a model from a JSON string
T modelFromJson<T extends ISuperModel>(String json, T Function(Map<String, dynamic>) fromMapFn) {
  return fromMapFn(jsonDecode(json) as Map<String, dynamic>);
}

