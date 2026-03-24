class AppEnv {
  const AppEnv._();

  static const String seoulRouteApiBaseUrl = String.fromEnvironment(
    'SEOUL_ROUTE_API_BASE_URL',
    defaultValue: 'http://openapi.seoul.go.kr:8088',
  );

  static const String seoulRouteApiKey = String.fromEnvironment(
    'SEOUL_ROUTE_API_KEY',
    defaultValue: '',
  );
}
