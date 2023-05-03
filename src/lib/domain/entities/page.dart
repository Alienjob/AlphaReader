import 'dart:convert';

class Page {
  final String title;
  final String body;

  Page({required this.title, required this.body});

  String toJSON() {
    return jsonEncode({'title': title, 'body': body});
  }

  factory Page.fromJSON(String source) {
    var data = jsonDecode(source);
    return Page(title: data['title'], body: data['body']);
  }
}
