// Annotation to replace the SuperModel macro
class SuperModel {
  const SuperModel();
}

// Annotation to replace the SuperModelId macro
class SuperModelId {
  const SuperModelId();
}

// Annotation to replace the MappableSuperModel macro
class MappableSuperModel {
  const MappableSuperModel();
}

// Annotation to replace the BelongsTo macro
class BelongsTo {
  final String foreignKey;
  const BelongsTo({this.foreignKey = ''});
}
