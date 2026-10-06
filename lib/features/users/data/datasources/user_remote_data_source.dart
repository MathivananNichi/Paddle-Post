import 'package:dio/dio.dart';
import 'package:paddle_post/core/constants/api_endpoints.dart';
import 'package:paddle_post/features/users/data/models/user_list_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'user_remote_data_source.g.dart';

/// Retrofit remote data source for the users feature.
@RestApi()
abstract class UserRemoteDataSource {
  factory UserRemoteDataSource(Dio dio) = _UserRemoteDataSource;

  @GET(ApiEndpoints.users)
  Future<UserListResponseModel> getUsers(@Query('page') int page);
}
