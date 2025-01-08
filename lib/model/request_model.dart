class CommonRequest {
  final String prompt;

  const CommonRequest({required this.prompt});

  CommonRequest copyWith({required String prompt}) {
    return CommonRequest(prompt: prompt);
  }

  factory CommonRequest.fromJson(Map<String, dynamic> json) {
    return CommonRequest(
      prompt: json['prompt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'prompt': prompt,
    };
  }
}
