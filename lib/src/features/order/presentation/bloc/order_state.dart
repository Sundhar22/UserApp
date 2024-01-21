// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderState {
  String requestType;
  int productQuantity;
  String serviceDate;
  String serviceTime;
  bool iskeyBoardActivated;
  String optionalInstruction;

  //
  OrderState({
    this.requestType = "Installation",
    this.productQuantity = 0,
    this.serviceDate = "",
    this.serviceTime = "",
    this.iskeyBoardActivated = false,
    this.optionalInstruction = "",
  });

  OrderState copyWith({
    String? requestType,
    int? productQuantity,
    String? serviceDate,
    String? serviceTime,
    bool? iskeyBoardActivated,
    String? optionalInstruction,
  }) {
    return OrderState(
      requestType: requestType ?? this.requestType,
      productQuantity: productQuantity ?? this.productQuantity,
      serviceDate: serviceDate ?? this.serviceDate,
      serviceTime: serviceTime ?? this.serviceTime,
      iskeyBoardActivated: iskeyBoardActivated ?? this.iskeyBoardActivated,
      optionalInstruction: optionalInstruction ?? this.optionalInstruction,
    );
  }
}
