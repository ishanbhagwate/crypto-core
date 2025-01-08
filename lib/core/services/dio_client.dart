// import 'package:crypto_core/core/services/token_storage.dart';
// import 'package:dio/dio.dart';

// class DioClient {
//   final Dio _dio = Dio();
//   final TokenStorage _tokenStorage = TokenStorage();

//   DioClient() {
//     _dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (options, handler) async {
//         final accessToken = await _tokenStorage.getAccessToken();
//         if (accessToken != null) {
//           options.headers['Authorization'] = 'Bearer $accessToken';
//         }

//         return handler.next(options);
//       },
//       onError: (error, handler) async {
//         if(error.response?.statusCode == 401){
//           // final success = q
//         }
//       },
//     ));
//   }
// }
