class ISerializeable {
  static final _constructors = {
  };

  static dynamic create(Type type, Map<String, dynamic> json) {
    return _constructors[type]!(json);
  }

  static dynamic createList(Type type, Map<String, List<dynamic>> json) {
    return _constructors[type]!(json);
  }

}
