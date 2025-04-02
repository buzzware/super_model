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
  const BelongsTo(Type this.type, this.property);

  final Type type;
  final String? property;
}
