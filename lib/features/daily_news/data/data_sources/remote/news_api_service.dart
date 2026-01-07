import 'package:retrofit/http.dart';

import '../../../../../core/constants/constants.dart';

part 'News_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;



