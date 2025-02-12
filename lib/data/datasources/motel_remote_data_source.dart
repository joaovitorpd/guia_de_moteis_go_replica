import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:guia_de_moteis_go_replica/core/errors/exceptions.dart';
import 'package:guia_de_moteis_go_replica/core/utils/typedef.dart';

class MotelRemoteDataSource {
  final Dio _dio;
  MotelRemoteDataSource(this._dio);

  Future<DataMap> getMoteis() async {
    try {
      final response =
          await _dio.get('https://api.npoint.io/e728bb91e0cd56cc0711');
      return response.data as DataMap;
    } on DioException catch (e) {
      throw ApiException(
        message: e.message,
        statusCode: e.response?.statusCode ?? 500,
      );
    }
  }
}
