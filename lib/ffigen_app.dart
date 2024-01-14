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

final class MyStruct extends Struct {
  external Pointer<Char> a;
}

class Test {
  Test() {
    Pointer<MyStruct> _struct = calloc<MyStruct>();
    _bindings.get_string(_struct.cast<Void>());

    final string = _struct.ref.a.cast<Utf8>().toDartString();
    print(string);
  }
  // Pointer<MyStruct> _struct = allocate<MyStruct>();
  // _bindings.get_string(_struct);
}
