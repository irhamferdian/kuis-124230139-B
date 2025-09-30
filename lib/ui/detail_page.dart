import 'package:flutter/material.dart';
import 'package:template_quiz_mobile_si_b/models/game_model.dart';

class DetailPage extends StatefulWidget {
  final GameModel game;
  const DetailPage({super.key, required this.game});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final game = widget.game;
    return Scaffold(
      appBar: AppBar(
        title: Text(game.gameName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              game.gameImg[0],
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 60),
            ),
            SizedBox(height: 16),
            Text("Publisher: ${game.gamePublisher}"),
            Text("Release: ${game.gamePublishDate}"),
            Text("Deskripsi: ${game.gameDesc}"),
            Text("💓: ${game.totalLike}"),
          ],
        ),
      ),
    );
  }
}
