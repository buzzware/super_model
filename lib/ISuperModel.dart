part of './super_model.dart';

abstract class ISuperModel {
  SuperModelInfo get $classInfo;
  T? $get<T>(String key, [T? defaultValue = null]);
  M $copyWithMap<M>(Map<String, dynamic> map);
  Map<String, dynamic> $toMap();
  String $toJson();
}


//  Animal copyWith({
//    int? id,
//    String? name,
//    String? species,
//    int? age
//  }) {
//    return Animal();
//  }

