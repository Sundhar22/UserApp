import 'package:image_picker/image_picker.dart';

sealed class OrderEvents {}

class OrderTypeUpdate extends OrderEvents {
  String typeOfService;
  List<bool> isInstalled;
  List<int> productCount;

  OrderTypeUpdate({
    this.typeOfService = "Installation",
    this.isInstalled = const [],
    this.productCount = const [],
  });

  OrderTypeUpdate copyWith({
    String? typeOfService,
    List<bool>? isInstalled,
    List<int>? productCount,
  }) {
    return OrderTypeUpdate(
      typeOfService: typeOfService ?? this.typeOfService,
      isInstalled: isInstalled ?? this.isInstalled,
      productCount: productCount ?? this.productCount,
    );
  }
}

// Order Time
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

class OrderPickImageEvent extends OrderEvents {
  List<XFile> imageLinks;

  // Use const to make the default value a constant
  OrderPickImageEvent({
    this.imageLinks = const [],
  });

  OrderPickImageEvent copyWith({
    List<XFile>? imageLinks,
  }) {
    return OrderPickImageEvent(
      imageLinks: imageLinks ?? this.imageLinks,
    );
  }
}

class OrderDropDownEvent extends OrderEvents {
  String orderIssue;

  OrderDropDownEvent({
    this.orderIssue = "",
  });

  OrderDropDownEvent copyWith({
    String? orderIssue,
  }) {
    return OrderDropDownEvent(
      orderIssue: orderIssue ?? this.orderIssue,
    );
  }
}

// Order Details Update
class OrderDetailsUpdate extends OrderEvents {
  List<int> countTracker;
  String optionalInstructions;

  OrderDetailsUpdate({
    this.countTracker = const [],
    this.optionalInstructions = "",
  });

  OrderDetailsUpdate copyWith({
    List<String>? productOfService,
    List<int>? countProductList,
    String? optionalInstructions,
    List<int>? countTracker,
    List<bool>? selectedProductList,
  }) {
    return OrderDetailsUpdate(
      optionalInstructions: optionalInstructions ?? this.optionalInstructions,
      countTracker: countTracker ?? this.countTracker,
    );
  }
}
