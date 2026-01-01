void main() {
  calculateCumulativeDiscount(
    name: "Salah Hassan",
    cartTotal: 2500,
    isPremiumMember: true,
    hasDiscountCoupon: true,
    isFirstTimeCustomer: false,
    itemsCount: 7,
  );

  double bestDiscount = calculateBestDiscount(
    membership: true,
    coupon: true,
    season: false,
    cartTotal: 2500,
  );

  print("Best Discount Only: $bestDiscount%");
}

calculateCumulativeDiscount({
  required String name,
  required double cartTotal,
  required bool isPremiumMember,
  required bool hasDiscountCoupon,
  required bool isFirstTimeCustomer,
  required int itemsCount,
}) {
  double discount = 0;

  if (isPremiumMember) {
    discount += 15;
  }

  if (hasDiscountCoupon) {
    discount += 10;
  }

  if (isFirstTimeCustomer) {
    discount += 5;
  }

  if (itemsCount > 5) {
    discount = ((itemsCount - 5) * 2);
  }

  if (cartTotal > 2000) {
    discount += 20;
  } else if (cartTotal > 1000) {
    discount += 10;
  } else if (cartTotal > 500) {
    discount += 5;
  }

  double discountAmount = cartTotal * discount / 100;
  double finalPrice = cartTotal - discountAmount;

  print("name: $name");
  print("Total: $cartTotal");
  print("Discount: $discount%");
  print("Price: $finalPrice");
}

double calculateBestDiscount({
  required bool membership,
  required bool coupon,

  required bool season,
  required double cartTotal,
}) {
  List<double> discounts = [];

  if (membership) {
    discounts.add(25);
  }

  if (coupon) {
    discounts.add(30);
  }

  if (season) {
    discounts.add(20);
  }

  if (cartTotal > 5000) {
    discounts.add(40);
  } else if (cartTotal > 3000) {
    discounts.add(35);
  } else if (cartTotal > 1500) {
    discounts.add(25);
  }

  if (discounts.isEmpty) {
    return 0;
  }

  double maxDiscount = discounts[0];
  for (int i = 1; i < discounts.length; i++) {
    if (discounts[i] > maxDiscount) {
      maxDiscount = discounts[i];
    }
  }

  return maxDiscount;
}
