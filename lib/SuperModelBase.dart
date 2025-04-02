part of './super_model.dart';

abstract class SuperModelBase {
  ModelClassMeta get $classMeta => ModelClassMeta(SuperModelBase,null,null,null,{});
  
  dynamic operator[](String key) {
    final property = $classMeta.fields[key];
    return property?.getValue(this);
  }
}
