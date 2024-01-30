// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderState {
  String requestType;
  int productQuantity;
  String serviceDate;
  String serviceTime;
  bool iskeyBoardActivated;
  String optionalInstruction;
  double billAmount;

  //
  OrderState({
    this.requestType = "Install",
    this.productQuantity = 0,
    this.serviceDate = "Pick a Date",
    this.serviceTime = "Pick a Time",
    this.iskeyBoardActivated = false,
    this.optionalInstruction = "",
    this.billAmount = 0.0,
  });

  OrderState copyWith({
    String? requestType,
    int? productQuantity,
    String? serviceDate,
    String? serviceTime,
    bool? iskeyBoardActivated,
    String? optionalInstruction,
    double? billAmount,
  }) {
    return OrderState(
      requestType: requestType ?? this.requestType,
      productQuantity: productQuantity ?? this.productQuantity,
      serviceDate: serviceDate ?? this.serviceDate,
      serviceTime: serviceTime ?? this.serviceTime,
      iskeyBoardActivated: iskeyBoardActivated ?? this.iskeyBoardActivated,
      optionalInstruction: optionalInstruction ?? this.optionalInstruction,
      billAmount: billAmount ?? this.billAmount,
    );
  }
}
