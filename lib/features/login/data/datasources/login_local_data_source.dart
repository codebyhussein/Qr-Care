class LoginLocalDataSource {

  LoginLocalDataSource() : loginLocalDataSource = <String, Object?>{};


  final Map<String, Object?> loginLocalDataSource;


  void write<T extends Object?>({required String key, T? value}) {

    loginLocalDataSource[key] = value;

  }


  T? read<T extends Object?>({required String key}) {

    final value = loginLocalDataSource[key];

    if (value is T) return value;

    return null;

  }

}

