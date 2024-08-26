class RouteQueryParameters {
  static String toQueryString(Map<String, dynamic> parameters) {
    return parameters.entries.map((MapEntry<String, dynamic> e) => '${e.key}=${e.value}').join('&');
  }
}
