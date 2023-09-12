import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Firestore Group Code

class FirestoreGroup {
  static String baseUrl =
      'https://us-central1-channellab-11ee7.cloudfunctions.net';
  static Map<String, String> headers = {};
}

/// End Firestore Group Code

class GetCuratedContentCall {
  static Future<ApiCallResponse> call({
    String? uid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetCuratedContent',
      apiUrl:
          'https://us-central1-channellab-11ee7.cloudfunctions.net/getAllCuratedContentV2',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'uid': '${uid}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic allContent(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
  static dynamic vid(dynamic response) => getJsonField(
        response,
        r'''$[*].videos''',
        true,
      );
}

class GetRandomCuratedContentCall {
  static Future<ApiCallResponse> call({
    String? uid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetRandomCuratedContent',
      apiUrl:
          'https://us-central1-channellab-11ee7.cloudfunctions.net/getRandomCuratedContentV2',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'uid': '${uid}',
      },
      params: {
        'uid': uid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  static dynamic allCuratedVideos(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class UpdateChannelVisibilityCall {
  static Future<ApiCallResponse> call({
    String? uid = '',
    String? channelid = '',
  }) {
    final ffApiRequestBody = '''
{
  "uid": "${uid}",
  "channelid": "${channelid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateChannelVisibility',
      apiUrl:
          'https://us-central1-channellab-11ee7.cloudfunctions.net/updateChannelVisibility',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetFilteredCuratedContentCall {
  static Future<ApiCallResponse> call({
    String? uid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetFilteredCuratedContent',
      apiUrl:
          'https://us-central1-channellab-11ee7.cloudfunctions.net/getFilteredCuratedContentV2',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'uid': '${uid}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetVideosByChannelCall {
  static Future<ApiCallResponse> call({
    String? channelId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetVideosByChannel',
      apiUrl:
          'https://us-central1-channellab-11ee7.cloudfunctions.net/getVideosByChannel',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'channelId': channelId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic allVideosFromChannel(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class IsUserSubscribedCall {
  static Future<ApiCallResponse> call({
    String? uid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'IsUserSubscribed',
      apiUrl: 'https://api.revenuecat.com/v1/subscribers/${uid}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer sk_dCcDHhuuOLgJPzcgTwQINvmhJDxVt',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
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
