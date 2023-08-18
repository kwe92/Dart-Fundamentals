// ignore_for_file: unused_catch_stack, unused_field

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../utility/spacedPrint.dart';
import '../models/ani_memes_model.dart';

// TODO: refactor to use HttpService and ApiService classes

class _FetchError implements Exception {
  const _FetchError(this._message);
  final _message;

  @override
  String toString() => _message;
}

class MemeService {
  // the base url to be parsed
  static final _baseUrl = 'https://vast-puce-mite-fez.cyclic.app/animeme';

  // Uri: Uniform Resource Identifier

  //   - an API that identifies online resources
  //   - you can explicitly define scheme, host, path, fragment

// Uri.parse

//   - A named constructor that makes parsing URL's easier for developers
//   - handles the parsing (encoding and decoding)
//     of special characters of a URL (Uniform Resource Locator)
//   - preferred over explicitly defining scheme, host, path, fragment

// Constructing Uri's with Complex queries

  final Uri _url = Uri.parse(_baseUrl);

  Future<AniMemesModel> getMeme() async {
    final http.Response response = await http.get(_url);

    if (response.statusCode != 200) {
      throw _FetchError(
        '\nStatus Code:\n\n${response.statusCode}\n\nThere was a problem fetching your data.',
      );
    }
    final Map<String, dynamic> responseBody = jsonDecode(
      response.body,
    );

    final aniMeme = AniMemesModel.fromJSON(responseBody);

    return aniMeme;
  }

// TODO: make repeated calls work if the first fails

  // Future<AniMeme> getMeme() async {
  //   Map<String, dynamic> responseBody = {};
  //   int tries = 0;
  //   while (tries <= 5) {
  //     try {
  //       final http.Response response = await http.get(_url);

  //       if (response.statusCode != 200 && tries <= 5) {
  //         tries++;

  //         spacedPrint(
  //           'failed to connect: attempt #: $tries',
  //           prefix_space: true,
  //         );

  //         _delay(tries);
  //       } else if (response.statusCode != 200 && tries > 5) {
  //         throw _FetchError(
  //           '\nStatus Code:\n\n${response.statusCode}\n\nThere was a problem fetching your data.',
  //         );
  //       }
  //       responseBody = jsonDecode(
  //         response.body,
  //       );
  //     } catch (error, stackTrace) {
  //       spacedPrint(
  //         'Attempts:\n\n$tries\n\n Error: $error',
  //         prefix_space: true,
  //       );
  //     }
  //   }
  //   final aniMeme = AniMeme.fromJSON(responseBody);

  //   return aniMeme;
  // }
}

// TODO: Add to utils`
Future<void> _delay(int tries) async {
  Future.delayed(
    Duration(seconds: tries),
  );
}

Future<void> main() async {
  final MemeService memeService = MemeService();
  final aniMeme = await memeService.getMeme();

  spacedPrint(
    'title: ${aniMeme.title} | image url: ${aniMeme.imgUrl}',
    prefix_space: true,
  );
}
