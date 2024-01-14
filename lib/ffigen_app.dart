import 'dart:ffi';
import 'dart:io' show Platform;
import 'package:ffi/ffi.dart';

import 'test_bindings_generated.dart';

const String _libName = 'ffigen_app';

final DynamicLibrary _dylib = () {
  if (Platform.isMacOS || Platform.isIOS) {
    return DynamicLibrary.open('$_libName.framework/$_libName');
  }
  if (Platform.isAndroid || Platform.isLinux) {
    return DynamicLibrary.open('lib$_libName.so');
  }
  if (Platform.isWindows) {
    return DynamicLibrary.open('$_libName.dll');
  }
  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}();

final testCharPointer _bindings = testCharPointer(_dylib);

class Test {
  String get string => _bindings.get_string().cast<Utf8>().toDartString();
}
