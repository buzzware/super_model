part of './super_model.dart';

abstract class ISuperModel {
  ModelClassMeta get $classMeta;
  T $get<T>(String key);
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

