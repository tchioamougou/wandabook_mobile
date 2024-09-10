
class SubscriptionPlanModel {
  final String planId;
  final String description;
  final double price;
  final int maxBooks;
  final int allowedBooks;
  final String currency;

  SubscriptionPlanModel({
    required this.planId,
    required this.description,
    required this.price,
    required this.maxBooks,
    required this.allowedBooks,
    required this.currency,
  });

  factory SubscriptionPlanModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlanModel(
      planId: json['planId'] as String,
      description: json['description'] as String,
      price: json['price'] as double,
      maxBooks: json['maxBooks'] as int,
      allowedBooks: json['allowedBooks'] as int,
      currency: json['currency'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'planId': planId,
      'description': description,
      'price': price,
      'maxBooks': maxBooks,
      'allowedBooks': allowedBooks,
      'currency': currency,
    };
  }
}