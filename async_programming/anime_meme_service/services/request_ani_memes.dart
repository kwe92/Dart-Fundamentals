// ignore_for_file: unused_catch_stack, unused_field

import '../../../utility/spacedPrint.dart';
import 'ani_memes_service.dart';

Future<void> main() async {
  final AniMemeService memeService = AniMemeService();
  final aniMeme = await memeService.getMeme();

  spacedPrint(
    'title: ${aniMeme.title} | image url: ${aniMeme.imgUrl}',
    prefix_space: true,
  );
}
