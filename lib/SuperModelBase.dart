part of './super_model.dart';

abstract class SuperModelBase {
  SuperModelInfo get $classInfo => SuperModelInfo(SuperModelBase,null,null,null,{});
  
  dynamic operator[](String key) {
    final property = $classInfo.fields[key];
    return property?.getValue(this);
  }
}
