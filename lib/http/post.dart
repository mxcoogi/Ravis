class Post {
  final String title;
  final String name;
  final String authorEmail;
  final String date;
  final int star;

  Post({
    required this.title,
    required this.name,
    required this.authorEmail,
    required this.date,
    required this.star,
  });

  // JSON 데이터를 모델 객체로 변환하는 factory constructor
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      name: json['name'],
      authorEmail: json['author_email'],
      date: json['date'],
      star: json['star'],
    );
  }
}
