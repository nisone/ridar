extension Strings on String {
  String placeholders(Map<String, dynamic> values,
      {Map<String, dynamic>? defaults}) {
    String result = this;
    values.forEach((key, value) {
      result = result.replaceAll('{$key}', value.toString());
    });

    // Apply defaults for any remaining placeholders
    if (defaults != null) {
      defaults.forEach((key, value) {
        if (result.contains('{$key}')) {
          result = result.replaceAll('{$key}', value.toString());
        }
      });
    }

    return result;
  }
}
