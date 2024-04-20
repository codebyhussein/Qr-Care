class RegisterLocalDataSource {
  RegisterLocalDataSource() : registerLocalDataSource = <String, Object?>{};

  final Map<String, Object?> registerLocalDataSource;

  void write<T extends Object?>({required String key, T? value}) {
    registerLocalDataSource[key] = value;
  }

  T? read<T extends Object?>({required String key}) {
    final value = registerLocalDataSource[key];

    if (value is T) return value;

    return null;
  }
}
