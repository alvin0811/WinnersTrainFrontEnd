import 'dart:developer';
extension DynamicExtensions on dynamic {
  void print() => log(toString());
}