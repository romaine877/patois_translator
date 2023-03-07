import 'package:dio/dio.dart';

class DioService {
  final dio = Dio();

  Future<void> getTranslation(String text) async {
try {
 final response = await dio.get(
  'https://api.openai.com/v1',
  queryParameters: {
  "model": "gpt-3.5-turbo",
  "messages": [
    {
      "role": "system",
        "content": "You translate between Jamaican Patois and English"
    },
    {"role": "user", "content": text}
  ],
  "temperature": 1,
  "top_p": 1,
  "n": 1,
  "stream": false,
  "stop": "elit proident sint",
  "presence_penalty": 0,
  "frequency_penalty": 0,
  "user": "user-1234"
},
  options: Options(
    headers: {'Authorization': 'Bearer token'},
  ),
);

  }catch(e){
    print(e);
  }
  
}
}

