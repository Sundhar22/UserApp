// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:image_picker/image_picker.dart';

class OrderState {
  String requestType;
  String serviceDate;
  String serviceTime;
  bool iskeyBoardActivated;
  String optionalInstruction;
  List<XFile> imageLinks;
  String serviceIssue;
  Map<String, int> productMap;
  List<int> productCountTracker;

  // Image Picker
  final ImagePicker imagePicker = ImagePicker();

  OrderState({
    this.requestType = "Install",
    this.serviceDate = "Pick a Date",
    this.serviceTime = "Pick a Time",
    this.iskeyBoardActivated = false,
    this.optionalInstruction = "",
    this.imageLinks = const [],
    this.serviceIssue = "",
    this.productCountTracker = const [],
    this.productMap = const {},
  });

  //

  OrderState copyWith({
    String? requestType,
    String? serviceDate,
    String? serviceTime,
    bool? iskeyBoardActivated,
    String? optionalInstruction,
    List<XFile>? imageLinks,
    String? serviceIssue,
    Map<String, int>? productMap,
    List<int>? productCountTracker,
    List<bool>? selectedProductsTracker,
  }) {
    return OrderState(
      requestType: requestType ?? this.requestType,
      serviceDate: serviceDate ?? this.serviceDate,
      serviceTime: serviceTime ?? this.serviceTime,
      iskeyBoardActivated: iskeyBoardActivated ?? this.iskeyBoardActivated,
      optionalInstruction: optionalInstruction ?? this.optionalInstruction,
      imageLinks: imageLinks ?? this.imageLinks,
      serviceIssue: serviceIssue ?? this.serviceIssue,
      productMap: productMap ?? this.productMap,
      productCountTracker: productCountTracker ?? this.productCountTracker,
    );
  }
}
