Future<String> loadAssetString(String path) {
  throw UnsupportedError(
    'Asset loading is not available in this runtime. Provide an asset loader '
    'or use importFromJsonString() with raw file contents.',
  );
}
