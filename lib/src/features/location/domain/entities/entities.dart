
import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable{
  final String status;

  const LocationEntity({required this.status});
  
  @override
  List<Object?> get props => [status];
}
