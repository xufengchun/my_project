import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_project/contants/index.dart';

class DioRequest {
  final _dio = Dio();
  // 构造方法
  DioRequest() {
    // 配置 Dio 实例
    _dio.options.baseUrl = GlobalConstants.BASE_URL;
    _dio.options.connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    _dio.options.receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    _dio.options.sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    _addInterceptors();
  }
  void _addInterceptors() {
    // 添加拦截器
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // 在发送请求之前做些什么
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (response.statusCode == 200 && response.statusCode! < 300) {
            // 在收到响应之前做些什么
            return handler.next(response);
          } else {
            // 处理其他状态码
            return handler.reject(
              DioException(requestOptions: response.requestOptions),
            );
          }
        },
        onError: (e, handler) {
          // 在发生错误之前做些什么
          return handler.reject(e);
        },
      ),
    );
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? queryParameters}) {
    return _handleResponse(_dio.get(url, queryParameters: queryParameters));
  }

  Future<dynamic> _handleResponse(Future<Response> task) async {
    try {
      Response response = await task;
      final data = response.data as Map<String, dynamic>;
      if (data['code'] == GlobalConstants.SUCCESS_CODE) {
        return data['result'];
      } else {
        return DioException(requestOptions: response.requestOptions);
      }
    } on DioException catch (e) {
      return e;
    }
  }
}

//单例模式
final dioRequest = DioRequest();
