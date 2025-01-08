class CommonResponse {
  final String content;

  const CommonResponse({
    required this.content,
  });

  CommonResponse copyWith({
    String? content,
  }) {
    return CommonResponse(
      content: content ?? this.content,
    );
  }

  factory CommonResponse.fromJson(Map<String, dynamic> json) {
    return CommonResponse(
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
    };
  }
}
