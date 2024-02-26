
class Service {
  final String name;
  final List<SubService> subServices;

  Service({
    required this.name,
    required this.subServices,
  });
}

class SubService {
  final String name;
  final List<Item> items;

  SubService({
    required this.name,
    required this.items,
  });
}

class Item {
  final String name;

  Item({
    required this.name,
  });
}
