part of './super_model.dart';

abstract class SuperModelBase {
  ModelClassMeta get $classMeta => ModelClassMeta(SuperModelBase,null,null,{});

  Map<String, dynamic Function()> get $getters => Map<String, dynamic Function()>.unmodifiable({});

  //const SuperModelBase();

  T getProperty<T>(String propertyName) {
    var getter = $getters[propertyName];
    if (getter==null)
      throw new ArgumentError("property $propertyName doesn't exist");
    return getter() as T;
  }
}
