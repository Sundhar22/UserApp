class OrderState {
  String requestType;
  int productQuantity;
  String serviceDate;
  String serviceTime;

  //
  OrderState({
    this.requestType = "Installation",
    this.productQuantity = 0,
    this.serviceDate = "",
    this.serviceTime = "",
  });

  OrderState copyWith({
    String? requestType,
    int? productQuantity,
    String? serviceDate,
    String? serviceTime,
  }) {
    return OrderState(
      requestType: requestType ?? this.requestType,
      productQuantity: productQuantity ?? this.productQuantity,
      serviceDate: serviceDate ?? this.serviceDate,
      serviceTime: serviceTime ?? this.serviceTime,
    );
  }
}
