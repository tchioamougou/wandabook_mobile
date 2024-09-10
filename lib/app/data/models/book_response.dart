class BookResponse<T> {
  final T? data;
  final String? message;
  final int? statusCode;
  final String? code;

  BookResponse({
    required this.data,
    this.message,
    this.statusCode,
    this.code,
  });

  factory BookResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return BookResponse(
      data: json['result']['body'] != null ? fromJsonT(json['result']['body']) : null,
      message: json['result']['message'],
      statusCode: json['result']['statusCode'],
      code: json['result']['code']?.toString(),
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      'result': {
        'body': data != null ? toJsonT(data!) : null,
        'message': message,
        'statusCode': statusCode,
        'code': code,
      },
    };
  }
}
