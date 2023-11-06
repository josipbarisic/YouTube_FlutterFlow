import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SearchCall {
  static Future<ApiCallResponse> call({
    String? searchQuery = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Search',
      apiUrl: 'https://youtube-data8.p.rapidapi.com/search/',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': 'cf58e3ec16mshb980bea50ee512ep167457jsn674769439f27',
        'X-RapidAPI-Host': 'youtube-data8.p.rapidapi.com',
      },
      params: {
        'q': searchQuery,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic video(dynamic response) => getJsonField(
        response,
        r'''$.contents.*.video''',
        true,
      );
}

class FetchRelatedContentCall {
  static Future<ApiCallResponse> call({
    String? videoId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Related Content',
      apiUrl: 'https://youtube-data8.p.rapidapi.com/video/related-contents/',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': 'cf58e3ec16mshb980bea50ee512ep167457jsn674769439f27',
        'X-RapidAPI-Host': 'youtube-data8.p.rapidapi.com',
      },
      params: {
        'id': videoId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic videos(dynamic response) => getJsonField(
        response,
        r'''$.contents.*.video''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
