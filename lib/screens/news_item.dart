import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/NewsResponse.dart';
import 'package:news/screens/news_details.dart';

class NewsItem extends StatelessWidget {
  Articles article;

  NewsItem({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
  Navigator.of(context).pushNamed(NewsDetails.routeName,arguments:article );
    },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade300, borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? "",
                height: 250,
                fit: BoxFit.fill,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.source?.name ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    article.title ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    article.description ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}