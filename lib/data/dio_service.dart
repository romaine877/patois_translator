import 'package:dio/dio.dart';

import '../domain/models/translation_response.dart';

class DioService {
  Dio dio = Dio(BaseOptions(
    validateStatus: (statusCode) {
      if (statusCode == null) {
        return false;
      }
      if (statusCode == 400) {
        // your http status code
        return true;
      } else {
        return statusCode >= 200 && statusCode < 300;
      }
    },
  ));

  Future<String> getTranslation(String text) async {
    try {
      final Response<dynamic> response = await dio.post(
        'https://api.openai.com/v1/chat/completions',
        data: {
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "role": "system",
              "content": "You translate English to Jamaican Patois."
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
          headers: {
            'Authorization':
                'Bearer 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'
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        return TranslationResponse.fromJson(data)
                .choices?[0]
                .message
                ?.content ??
            '';
      } else {
        print(response.statusCode);
        print('error:: ${response.data}');
        return 'Translation failed';
      }
    } catch (e) {
      ('error:?? $e');
      return 'Translation failed';
    }
  }
}
