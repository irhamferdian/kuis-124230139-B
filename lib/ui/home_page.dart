import 'package:flutter/material.dart';
import 'package:template_quiz_mobile_si_b/ui/login_page.dart';
import 'package:template_quiz_mobile_si_b/data/game_data.dart';
import 'package:template_quiz_mobile_si_b/ui/detail_page.dart';


class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushAndRemoveUntil(
              context, 
              MaterialPageRoute(builder: (context) {
                return LoginPage();
              }),
              (route) => false );
          },
          icon : Icon(Icons.login_outlined))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text("Selamat Datang, $username"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16
                    ),
                    itemBuilder: (context, index){
                    return _gameStore(context, index);
                    },
                    itemCount: gameList.length,
                ),
                )
              )
          ],
        ),
      ),
    );
  }
  Widget _gameStore(context, int index){
    return InkWell(
      onTap: (){

      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.cyan,
          border: Border.all(width: 2)
        ),
        child: Column(
          children: [
            Image.asset(
              gameList[index].gameImg[0],
              errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.broken_image, size: 60),),
            Text(gameList[index].gameName),
            Text("Publisher:${gameList[index].gamePublisher}"),
            Text("Release:${gameList[index].gamePublishDate}"),
            Text("Deskripsi:${gameList[index].gameDesc}"),
            Text("💓:${gameList[index].totalLike}"),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      game: gameList[index],
                    ),
                  ),
                );
              },
              child: const Text("Lihat Detail"),
            ),
          ],
        ),
      ),
    );
  }
}