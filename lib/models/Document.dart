class Document {

  final String doclink;
  final String name;

  Document(
      {
        this.doclink = "",
        this.name = "",
      });
  static List<Document> docList = [
    Document(
        doclink: "www.google.com",
        name: "CT Scan",
    )
  ];

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
        doclink: json[''],
        name: json['']
    );
  }
}
