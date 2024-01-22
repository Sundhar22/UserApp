import 'package:user_app/src/features/booking/data/models/models.dart';

final List<BookingModel> bookings = [
  BookingModel(
    id: '1',
    serviceName: 'Cleaning',
    bookingType: 'Scheduled',
    date: '2022-01-25',
    time: '10:00 AM',
    price: '100',
    imgUrl: "",
  ),
  BookingModel(
    id: '2',
    serviceName: 'Repairs',
    bookingType: 'Accepted',
    date: '2022-02-01',
    time: '02:30 PM',
    price: '150',
    imgUrl: "",
  ),
  BookingModel(
    id: '3',
    serviceName: 'Washing',
    bookingType: 'Cancelled',
    date: '2022-02-02',
    time: '02:40 PM',
    price: '200',
    imgUrl: "",
  ),
  BookingModel(
    id: '4',
    serviceName: 'Painting',
    bookingType: 'Cancelled',
    date: '2022-02-03',
    time: '02:40 PM',
    price: '300',
    imgUrl: "",
  ),
  BookingModel(
    id: '5',
    serviceName: 'Cleaning',
    bookingType: 'Accepted',
    date: '2022-02-02',
    time: '02:40 PM',
    price: '200',
    imgUrl: "",
  ),
];
