import 'package:clean_architecture_project/features/daily_news/domain/entities/article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({ required this.article, super.key});
  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 14, end: 14, bottom: 14),
      height: MediaQuery.of(context).size.width / 2.2,
      child: Row(children: [_buildImage(context), _buildTitleAndDescription()]),
    );
  }

  Widget _buildImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: article.urlToImage?? '',
      imageBuilder:
          (context, imageProvider) => Padding(
            padding: const EdgeInsetsDirectional.only(end: 14),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.08),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
      progressIndicatorBuilder:
          (context, url, downloadProgress) => Padding(
            padding: const EdgeInsetsDirectional.only(end: 14),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.08),
                ),
                child: const CupertinoActivityIndicator(),
              ),
            ),
          ),
      errorWidget:
          (context, url, error) => Padding(
            padding: const EdgeInsetsDirectional.only(end: 14),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.08),
                ),
                child: const Icon(Icons.error),
              ),
            ),
          ),
    );
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontFamily: 'Butler',
                fontWeight: FontWeight.w900,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(article.description ?? '', maxLines: 2),
              ),
            ),
            Row(
              children: [
                Icon(Icons.timelapse_outlined, size: 16),
                SizedBox(width: 5),
                Text(  article.publishedAt ?? 'Unknown date',
                    style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
