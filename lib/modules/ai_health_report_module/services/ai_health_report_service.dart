import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/utils/wrappers/wrapper.dart';

class AnalysisInitiationResult {
  final String? reportId;
  final AiHealthReportResponse? cachedData;

  AnalysisInitiationResult({
    this.reportId,
    this.cachedData,
  });

  bool get isCached => cachedData != null;
  bool get needsPolling => reportId != null;
}

class AiHealthReportService {
  static Future<AnalysisInitiationResult> initiateAnalysis({
    required String orderId,
    required String patientId,
    bool forceRefresh = false,
  }) async {
    final url = '${AppConstants.baseUrl}/api/ai/analyze-health-report';

    try {
      final requestBody = <String, dynamic>{
        'orderId': orderId,
        'patientId': patientId,
      };
      
      if (forceRefresh) {
        requestBody['forceRefresh'] = true;
      }

      final response = await Wrapper.post(
        url,
        json.encode(requestBody),
      );

      final decoded = json.decode(response);
      
      if (decoded['error'] != null) {
        throw Exception(decoded['error']);
      }

      final body = decoded['body'];
      
      if (body is! Map) {
        throw Exception('Invalid response format: body is not an object');
      }

      final bodyMap = body as Map<String, dynamic>;

      // Check if response contains cached data (has executiveSummary)
      if (bodyMap.containsKey('executiveSummary')) {
        // This is cached data, return it directly
        final cachedData = AiHealthReportResponse.fromJson(bodyMap);
        return AnalysisInitiationResult(cachedData: cachedData);
      }
      
      // Check if response contains reportId for polling
      if (bodyMap.containsKey('reportId')) {
        return AnalysisInitiationResult(reportId: bodyMap['reportId'].toString());
      }
      
      throw Exception('Analysis initiation failed: Response contains neither cached data nor reportId');
    } catch (e) {
      rethrow;
    }
  }

  static Future<AnalysisStatusResponse> getAnalysisStatus(String analysisReportId) async {
    final url = '${AppConstants.baseUrl}/api/ai/analysis-status/$analysisReportId';

    try {
      final response = await Wrapper.get(url);
      final decoded = json.decode(response);
      
      if (decoded['error'] != null) {
        throw Exception(decoded['error']);
      }

      return AnalysisStatusResponse.fromJson(decoded['body']);
    } catch (e) {
      rethrow;
    }
  }
}

class AnalysisStatusResponse {
  final String status; // 'pending', 'processing', 'completed', 'failed'
  final int progress; // 0-100
  final String message;
  final AiHealthReportResponse? data;
  final String? error;

  AnalysisStatusResponse({
    required this.status,
    required this.progress,
    required this.message,
    this.data,
    this.error,
  });

  factory AnalysisStatusResponse.fromJson(Map<String, dynamic> json) {
    AiHealthReportResponse? analysisData;
    
    if (json['status'] == 'completed' && json.containsKey('data')) {
      try {
        final dataValue = json['data'];
        if (dataValue is Map<String, dynamic>) {
          analysisData = AiHealthReportResponse.fromJson(dataValue);
        }
      } catch (e) {
        debugPrint('Error parsing analysis data: $e');
      }
    }
    
    return AnalysisStatusResponse(
      status: json['status']?.toString() ?? 'pending',
      progress: (json['progress'] as num?)?.toInt() ?? 0,
      message: json['message']?.toString() ?? '',
      data: analysisData,
      error: json['error']?.toString(),
    );
  }
}

class Recommendation {
  final String testName;
  final String explanation;

  Recommendation({
    required this.testName,
    required this.explanation,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      testName: json['testName']?.toString() ?? '',
      explanation: json['explanation']?.toString() ?? '',
    );
  }
}

class AiHealthReportResponse {
  final String executiveSummary;
  final List<ConcerningParameter> concerningParameters;
  final List<Recommendation> recommendations;
  final bool? cached;

  AiHealthReportResponse({
    required this.executiveSummary,
    required this.concerningParameters,
    required this.recommendations,
    this.cached,
  });

  factory AiHealthReportResponse.fromJson(Map<String, dynamic> json) {
    // Safely parse concerningParameters (handles both List and JSON string)
    List<ConcerningParameter> concerningParams = [];
    if (json.containsKey('concerningParameters')) {
      final paramsValue = json['concerningParameters'];
      
      // If it's a JSON string, parse it first
      dynamic parsedParams = paramsValue;
      if (paramsValue is String && paramsValue.isNotEmpty) {
        try {
          parsedParams = jsonDecode(paramsValue);
        } catch (e) {
          // If parsing fails, keep as is
        }
      }
      
      if (parsedParams is List) {
        concerningParams = parsedParams
            .map((item) {
              try {
                if (item is Map<String, dynamic>) {
                  return ConcerningParameter.fromJson(item);
                }
                return null;
              } catch (e) {
                return null;
              }
            })
            .whereType<ConcerningParameter>()
            .toList();
      }
    }

    // Safely parse recommendations (handles both List and JSON string)
    List<Recommendation> recommendationsList = [];
    if (json.containsKey('recommendations')) {
      final recsValue = json['recommendations'];
      
      // If it's a JSON string, parse it first
      dynamic parsedRecs = recsValue;
      if (recsValue is String && recsValue.isNotEmpty) {
        try {
          parsedRecs = jsonDecode(recsValue);
        } catch (e) {
          debugPrint('Error decoding recommendations JSON string: $e');
        }
      }
      
      if (parsedRecs is List) {
        recommendationsList = parsedRecs
            .map((item) {
              try {
                if (item is Map<String, dynamic>) {
                  return Recommendation.fromJson(item);
                } else if (item is String) {
                  // Backward compatibility: if it's just a string, use it as testName
                  return Recommendation(testName: item, explanation: '');
                }
                return null;
              } catch (e) {
                debugPrint('Error parsing individual recommendation: $e');
                return null;
              }
            })
            .whereType<Recommendation>()
            .toList();
      } else if (parsedRecs is String) {
        // Backward compatibility: single string
        recommendationsList = [Recommendation(testName: parsedRecs, explanation: '')];
      }
    }

    return AiHealthReportResponse(
      executiveSummary: json['executiveSummary']?.toString() ?? '',
      concerningParameters: concerningParams,
      recommendations: recommendationsList,
      cached: json['cached'] as bool?,
    );
  }
}

class ConcerningParameter {
  final String testName;
  final String category;
  final String resultValue;
  final String normalRange;
  final String status;
  final String understanding;
  final String recommendation;
  final String urgency;

  ConcerningParameter({
    required this.testName,
    required this.category,
    required this.resultValue,
    required this.normalRange,
    required this.status,
    required this.understanding,
    required this.recommendation,
    required this.urgency,
  });

  factory ConcerningParameter.fromJson(Map<String, dynamic> json) {
    return ConcerningParameter(
      testName: json['testName'] ?? '',
      category: json['category'] ?? '',
      resultValue: json['resultValue'] ?? '',
      normalRange: json['normalRange'] ?? '',
      status: json['status'] ?? '',
      understanding: json['understanding'] ?? '',
      recommendation: json['recommendation'] ?? '',
      urgency: json['urgency'] ?? 'Low',
    );
  }
}

