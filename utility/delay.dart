Future<void> delay(int tries) async {
  Future.delayed(
    Duration(seconds: tries),
  );
}
