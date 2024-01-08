import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../detail_view.dart';

class NewsContainer extends StatelessWidget {
  final String imgUrl;
  final String newsHead;
  final String newsDes;
  final String newsUrl;
  final String newsCnt;

  NewsContainer({
    Key? key,
    required this.imgUrl,
    required this.newsDes,
    required this.newsCnt,
    required this.newsHead,
    required this.newsUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 5.0,
        margin: const EdgeInsets.all(35.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
                child: FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  placeholder: "assets/img/placeholder.jfif",
                  image: imgUrl,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsHead.length > 90
                          ? "${newsHead.substring(0, 90)}..."
                          : newsHead,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      newsDes,
                      style: TextStyle(fontSize: 15, color: Colors.black38),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      newsCnt != "--"
                          ? newsCnt.length > 250
                          ? newsCnt.substring(0, 250)
                          : "${newsCnt.toString().substring(0, newsCnt.length - 15)}..."
                          : newsCnt,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailViewScreen(newsUrl: newsUrl),
                              ),
                            );
                          },
                          child: Text("Read More"),
                        ),
                      ],
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () async {
                          await launchUrl(Uri.parse("https://newsapi.org/"));
                        },
                        child: Text(
                          "News Provided By NewsAPI.org",
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
