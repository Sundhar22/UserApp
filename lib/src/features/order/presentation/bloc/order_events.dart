// ignore_for_file: public_member_api_docs, sort_constructors_first
sealed class OrderEvents {}

class OrderTypeUpdate extends OrderEvents {
  String typeOfService;

  OrderTypeUpdate({
    this.typeOfService = "Installation",
  });

  OrderTypeUpdate copyWith({
    String? typeOfService,
  }) {
    return OrderTypeUpdate(
      typeOfService: typeOfService ?? this.typeOfService,
    );
  }
}

class OrderDetailsUpdate extends OrderEvents {
  String productOfService;
  int productQuantity;
  String optionalInstructions;

  OrderDetailsUpdate({
    this.productOfService = "",
    this.productQuantity = 0,
    this.optionalInstructions = "",
  });

  OrderDetailsUpdate copyWith({
    String? productOfService,
    int? productQuantity,
    String? optionalInstructions,
  }) {
    return OrderDetailsUpdate(
      productOfService: productOfService ?? this.productOfService,
      productQuantity: productQuantity ?? this.productQuantity,
      optionalInstructions: optionalInstructions ?? this.optionalInstructions,
    );
  }
}

class OrderTimingsUpdate extends OrderEvents {
  String dateOfService;
  String timeOfService;

  OrderTimingsUpdate({
    this.dateOfService = "",
    this.timeOfService = "",
  });

  OrderTimingsUpdate copyWith({
    String? dateOfService,
    String? timeOfService,
  }) {
    return OrderTimingsUpdate(
      dateOfService: dateOfService ?? this.dateOfService,
      timeOfService: timeOfService ?? this.timeOfService,
    );
  }
}

class OrderKeyBoardTapEvent extends OrderEvents {
  bool iskeyBoardActivated;
  OrderKeyBoardTapEvent({this.iskeyBoardActivated = false});

  OrderKeyBoardTapEvent copyWith({
    bool? iskeyBoardActivated,
  }) {
    return OrderKeyBoardTapEvent(
      iskeyBoardActivated: iskeyBoardActivated ?? this.iskeyBoardActivated,
    );
  }
}
