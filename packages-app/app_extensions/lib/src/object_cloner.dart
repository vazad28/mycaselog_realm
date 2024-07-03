extension ObjectCloner on Map<String, dynamic> {
  Map<String, dynamic> clone() {
    final obj = this;
    final tempObj = <String, dynamic>{};

    for (final key in obj.keys) {
      tempObj[key] = this[key];
    }
    return tempObj;
  }
}
