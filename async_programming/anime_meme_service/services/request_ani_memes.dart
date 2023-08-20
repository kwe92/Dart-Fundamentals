// ignore_for_file: unused_catch_stack, unused_field

import 'dart:convert';
import '../../../utility/spacedPrint.dart';
import '../models/ani_memes_model.dart';
import 'ani_memes_service.dart';

Future<void> main() async {
  final AniMemeService memeService = AniMemeService();
  final response = await memeService.getMeme();
  final aniMeme = AniMemesModel.fromJSON(jsonDecode(response.body));

  spacedPrint(
    'title: ${aniMeme.title} | image url: ${aniMeme.imgUrl}',
    prefix_space: true,
  );
}
