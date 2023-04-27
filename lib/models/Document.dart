class Document {
  final String doclink;
  final String name;

  Document({
    this.doclink = "",
    this.name = "",
  });
  static List<Document> docList = [];

  factory Document.fromJson(Map<dynamic, dynamic> json) {
    return Document(doclink: json['link'], name: json['about']);
  }
}
