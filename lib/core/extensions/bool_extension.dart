extension BoolExt on bool {
  String get fromStringValue {
    return switch (this) {
      true => 'true',
      false => 'false',
    };
  }
}
