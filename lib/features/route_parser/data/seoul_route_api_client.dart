import 'dart:convert';
import 'dart:io';

import '../../../core/config/app_env.dart';
import '../domain/route_api_response_dto.dart';

class SeoulRouteApiClient {
  SeoulRouteApiClient({
    HttpClient? httpClient,
    String baseUrl = AppEnv.seoulRouteApiBaseUrl,
    String apiKey = AppEnv.seoulRouteApiKey,
  }) : _httpClient = httpClient ?? HttpClient(),
       _baseUrl = baseUrl,
       _apiKey = apiKey;

  final HttpClient _httpClient;
  final String _baseUrl;
  final String _apiKey;

  Future<RouteApiResponseDto> fetchShortestPath({
    required String departureStation,
    required String arrivalStation,
    required DateTime requestDateTime,
  }) async {
    final Uri uri = _buildUri(
      departureStation: departureStation,
      arrivalStation: arrivalStation,
      requestDateTime: requestDateTime,
    );

    final HttpClientRequest request = await _httpClient.getUrl(uri);
    final HttpClientResponse response = await request.close();
    final String responseBody = await utf8.decoder.bind(response).join();

    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(
        'Seoul route API request failed with status ${response.statusCode}',
        uri: uri,
      );
    }

    final Object? decoded = jsonDecode(responseBody);
    if (decoded is! Map<String, Object?>) {
      throw const FormatException('Route API response root must be an object.');
    }

    return RouteApiResponseDto.fromJson(decoded);
  }

  Uri _buildUri({
    required String departureStation,
    required String arrivalStation,
    required DateTime requestDateTime,
  }) {
    if (_apiKey.trim().isEmpty) {
      throw StateError(
        'SEOUL_ROUTE_API_KEY is not configured. Run Flutter with '
        '--dart-define-from-file=.env.local or provide --dart-define manually.',
      );
    }

    final List<String> encodedSegments = <String>[
      _apiKey,
      'json',
      'getShtrmPath',
      '1',
      '1',
      Uri.encodeComponent(departureStation),
      Uri.encodeComponent(arrivalStation),
      Uri.encodeComponent(_formatDateTime(requestDateTime)),
    ];

    return Uri.parse('$_baseUrl/${encodedSegments.join('/')}');
  }

  String _formatDateTime(DateTime dateTime) {
    final String year = dateTime.year.toString().padLeft(4, '0');
    final String month = dateTime.month.toString().padLeft(2, '0');
    final String day = dateTime.day.toString().padLeft(2, '0');
    final String hour = dateTime.hour.toString().padLeft(2, '0');
    final String minute = dateTime.minute.toString().padLeft(2, '0');
    final String second = dateTime.second.toString().padLeft(2, '0');
    return '$year-$month-$day $hour:$minute:$second';
  }
}
