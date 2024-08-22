import 'dart:ffi';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqlite3/open.dart';

import 'package:feedback_ideas_app_server/server.dart';

/// This is the starting point for your Serverpod server. Typically, there is
/// no need to modify this file.
void main(List<String> args) {
  open.overrideFor(OperatingSystem.linux, _openOnLinux);
  open.overrideFor(OperatingSystem.windows, _openOnWindows);
  run(args);
}

DynamicLibrary _openOnLinux() {
  final scriptDir = File(Platform.script.toFilePath()).parent;
  final libraryNextToScript = File(join(scriptDir.path, 'sqlite3', 'linux', 'sqlite3.so'));
  return DynamicLibrary.open(libraryNextToScript.path);
}

DynamicLibrary _openOnWindows() {
  final scriptDir = File(Platform.script.toFilePath()).parent;
  final libraryNextToScript = File(join(scriptDir.path, 'sqlite3', 'windows', 'sqlite3.dll'));
  return DynamicLibrary.open(libraryNextToScript.path);
}
