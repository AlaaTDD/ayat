class Chapter {
  int id;
  int versesCount;


  Chapter({
    required this.id,
    required this.versesCount,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      id: json['id'],
      versesCount: json['verses_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'verses_count': versesCount,
    };
  }
}


