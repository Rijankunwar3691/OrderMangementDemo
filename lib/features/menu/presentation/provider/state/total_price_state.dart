class TotalPriceState {
  final int totalPrice;
  final double totalBill;

  TotalPriceState({required this.totalPrice, required this.totalBill});

  TotalPriceState copyWith(int? totalPrice, double? totalBill) {
    return TotalPriceState(
        totalPrice: totalPrice ?? this.totalPrice,
        totalBill: totalBill ?? this.totalBill);
  }
}
