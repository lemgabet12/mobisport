import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/webfeed.dart';

class RSSdemo extends StatefulWidget {
  RSSdemo() : super();

  final String title = 'RSS Feed Demo';

  @override
  RSSdemoState createState() => RSSdemoState();
}

class RSSdemoState extends State<RSSdemo> {
  static const String FEED_URL = 'https://www.fifa.com/worldcup/rss/news';
  RssFeed _feed;
  String _title;

  static const String loadingFeedMsg = 'Loading Feed..';
  static const String feedLoadingErrordMsg = 'Eroor Loading Feed..';
  static const String feedOpenErrorMsg = 'Eroor Opining Feed..';
  static const String placeholderImg = 'images/apple-pay.png';
  GlobalKey<RefreshIndicatorState> _refreshkey;
  updateTitle(title) {
    setState(() {
      _title = title;
    });
  }

  updateFeed(feed) {
    setState(() {
      _feed = feed;
    });
  }

  Future<void> openFeed(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
      );
      return;
    }
    updateTitle(feedOpenErrorMsg);
  }

  load() async {
    updateTitle(loadingFeedMsg);
    loadFeed().then((result) {
      if (null == result || result.toString().isEmpty) {
        updateTitle(feedLoadingErrordMsg);
        return;
      }
      updateFeed(result);
      updateTitle(_feed.title);
    });
  }

  Future<RssFeed> loadFeed() async {
    try {
      final client = http.Client();
      final response = await http.get(Uri.parse(FEED_URL));
      RssFeed.parse(response.body);
    } catch (e) {}
    return null;
  }

  @override
  void initState() {
    super.initState();
    _refreshkey = GlobalKey<RefreshIndicatorState>();
    updateTitle(widget.title);
    load();
  }

  title(title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  subtitle(subTitle) {
    return Text(
      subTitle,
      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w100),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  thumbnail(imageUrl) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: CachedNetworkImage(
        placeholder: (context, url) => Image.asset(placeholderImg),
        imageUrl: imageUrl,
        height: 50,
        width: 70,
        alignment: Alignment.center,
        fit: BoxFit.fill,
      ),
    );
  }

  rightIcon() {
    return Icon(
      Icons.keyboard_arrow_right,
      color: Colors.grey,
      size: 30.0,
    );
  }

  list() {
    return ListView.builder(
      itemCount: _feed.items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = _feed.items[index];
        return ListTile(
          title: title(item.title),
          subtitle: subtitle(item.pubDate),
          leading: thumbnail(item.enclosure.url),
          trailing: rightIcon(),
          contentPadding: EdgeInsets.all(5),
          onTap: () => openFeed(item.link),
        );
      },
    );
  }

  isFeedEmpty() {
    return null == _feed || null == _feed.items;
  }

  body() {
    return isFeedEmpty()
        ? Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            key: _refreshkey,
            child: list(),
            onRefresh: () => load(),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: body());
  }
}
