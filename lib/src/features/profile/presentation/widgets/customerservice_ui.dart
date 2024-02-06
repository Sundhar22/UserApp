// code with bloc
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/features/profile/data/models/models.dart';
import 'package:user_app/src/features/profile/presentation/bloc/customerservice_bloc/customerservice_bloc.dart';
import 'package:user_app/src/features/profile/presentation/bloc/customerservice_bloc/customerservice_event.dart';
import 'package:user_app/src/features/profile/presentation/bloc/customerservice_bloc/customerservice_state.dart';

import '../../../../core/constants/constants.dart';
import 'custom_appbar.dart';

enum MessageType {
  serviceProvider,
  user,
}

class CustomerService extends StatefulWidget {
  const CustomerService({Key? key}) : super(key: key);

  @override
  State<CustomerService> createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerService> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar("Customer Service"),
        bottomSheet: BottomSheet(
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          onClosing: () {},
          builder: (BuildContext context) => _CustomTextField(
            controller: _controller,
          ),
        ),
        body: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.messages.isNotEmpty) {
              return Column(
                children: [
                  SizedBox(
                    height: 550.h,
                    child: _MessageListView(messages: state.messages),
                  ),
                ],
              );
            } else if (state.error != null) {
              return Center(child: Text(state.error!));
            } else {
              return Container(); // Handle other states if needed
            }
          },
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final TextEditingController controller;

  const _CustomTextField({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            width: 280.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            child: Row(
              children: [
                Flexible(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 25.w,
                      maxWidth: 300.w,
                      minHeight: 50.0,
                      maxHeight: 135.0,
                    ),
                    child: Scrollbar(
                      child: TextField(
                        controller: controller,
                        cursorColor: Colors.blue,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                            left: 15.0,
                            bottom: 2.0,
                          ),
                          hintText: "Message",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.image,
                  color: AppColor.textSecondaryColor.withOpacity(0.5),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context
                  .read<ChatBloc>()
                  .add(SendMessageEvent(message: controller.text));
              controller.clear();
            },
            child: Container(
              height: 35.h,
              width: 35.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primaryColor,
              ),
              child: const Center(
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class _MessageListView extends StatelessWidget {
//   final List<Message> messages;

//   const _MessageListView({Key? key, required this.messages}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       reverse: true,
//       itemCount: messages.length,
//       itemBuilder: (context, index) {
//         final message = messages[index];
//         return _MessageContainer(
//           content: message.content,
//           timestamp: message.timestamp,
//           type: message.type,
//         );
//       },
//     );
//   }
// }

class _MessageListView extends StatelessWidget {
  final List<Message> messages;

  const _MessageListView({Key? key, required this.messages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sort messages by timestamp in ascending order
    messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));

    // Separate messages by date
    final Map<DateTime, List<Message>> groupedMessages = {};
    for (final message in messages) {
      final messageDate = DateTime(
        message.timestamp.toDate().year,
        message.timestamp.toDate().month,
        message.timestamp.toDate().day,
      );
      groupedMessages.putIfAbsent(messageDate, () => []);
      groupedMessages[messageDate]!.add(message);
    }

    // Build message list view
    return ListView.builder(
      itemCount: groupedMessages.length,
      itemBuilder: (context, index) {
        final date = groupedMessages.keys.elementAt(index);
        final isToday = DateTime.now().year == date.year &&
            DateTime.now().month == date.month &&
            DateTime.now().day == date.day;
        final isYesterday = DateTime.now()
                    .subtract(const Duration(days: 1))
                    .year ==
                date.year &&
            DateTime.now().subtract(const Duration(days: 1)).month ==
                date.month &&
            DateTime.now().subtract(const Duration(days: 1)).day == date.day;

        return Column(
          children: [
            if (isToday) // Show "Today" label for messages of today
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0.sp),
                padding:
                    EdgeInsets.symmetric(horizontal: 12.0.sp, vertical: 8.0.sp),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(6.0.sp),
                ),
                child: const Text(
                  'Today',
                  style: TextStyle(color: Colors.black, fontSize: 12.0),
                ),
              ),
            if (isYesterday) // Show "Yesterday" label for messages of yesterday
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0.sp),
                padding:
                    EdgeInsets.symmetric(horizontal: 12.0.sp, vertical: 8.0.sp),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(6.0.sp),
                ),
                child: const Text(
                  'Yesterday',
                  style: TextStyle(color: Colors.black, fontSize: 12.0),
                ),
              ),
            ...groupedMessages[date]!
                .map((message) => _MessageContainer(
                      content: message.content,
                      timestamp: message.timestamp,
                      type: message.type,
                    ))
                .toList(),
          ],
        );
      },
    );
  }
}

class _MessageContainer extends StatelessWidget {
  final String content;
  final Timestamp timestamp;
  final MessageType type;

  const _MessageContainer({
    Key? key,
    required this.content,
    required this.timestamp,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isServiceProvider = type == MessageType.serviceProvider;
    final dateTime = timestamp.toDate();

    // Format the time with AM/PM
    final formattedTime = DateFormat.jm().format(dateTime);

    return Container(
      width: 270.w,
      alignment:
          isServiceProvider ? Alignment.centerLeft : Alignment.centerRight,
      margin: EdgeInsets.all(10.r),
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: isServiceProvider
              ? const Radius.circular(0)
              : Radius.circular(10.r),
          topRight: isServiceProvider
              ? Radius.circular(10.r)
              : const Radius.circular(0),
          bottomLeft: Radius.circular(10.r),
          bottomRight: Radius.circular(10.r),
        ),
        color: isServiceProvider
            ? AppColor.textSecondaryColor.withOpacity(0.1)
            : AppColor.primaryColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              width: content.length < 10 ? 100.w : 150.w,
              child: Text(
                content,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  color: isServiceProvider
                      ? AppColor.textPrimaryColor
                      : Colors.white,
                ),
              ),
            ),
          ),
          Text(
            formattedTime,
            style: TextStyle(
              fontSize: 12.sp,
              color: isServiceProvider
                  ? AppColor.textSecondaryColor
                  : Colors.white.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}



// normal function code


// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';

// import '../../../../core/constants/constants.dart';
// import 'custom_appbar.dart';

// enum MessageType {
//   serviceProvider,
//   user,
// }

// class CustomerService extends StatefulWidget {
//   const CustomerService({super.key});

//   @override
//   State<CustomerService> createState() => _CustomerServiceState();
// }

// class _CustomerServiceState extends State<CustomerService> {
//   final TextEditingController _controller = TextEditingController();

//   void _sendMessage() {
//     if (_controller.text.isNotEmpty) {
//       FirebaseFirestore.instance.collection('messages').add({
//         'content': _controller.text,
//         'time': DateTime.now(),
//         'type': MessageType.user.toString(),
//       });
//       _controller.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: customAppBar("Customer Service"),
//       bottomSheet: BottomSheet(
//         backgroundColor: Colors.white,
//         shadowColor: Colors.white,
//         onClosing: () {},
//         builder: (BuildContext context) => _customTextField(),
//       ),
//       body: SizedBox(
//         height: 540.h,
//         child: StreamBuilder(
//           stream: FirebaseFirestore.instance
//               .collection('messages')
//               .orderBy('time', descending: true)
//               .snapshots(),
//           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
//             return ListView.builder(
//               reverse: true,
//               itemCount: documents.length,
//               itemBuilder: (context, int index) {
//                 final message = documents[index].data() as Map<String, dynamic>;
//                 return _messageContainer(
//                   message['content'],
//                   message['time'],
//                   message['type'] == MessageType.serviceProvider.toString()
//                       ? MessageType.serviceProvider
//                       : MessageType.user,
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _customTextField() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 10.w),
//             width: 280.w,
//             height: 50.h,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//               border: Border.all(
//                 color: Colors.black.withOpacity(0.5),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Flexible(
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(
//                       minWidth: 25.w,
//                       maxWidth: 300.w,
//                       minHeight: 50.0,
//                       maxHeight: 135.0,
//                     ),
//                     child: Scrollbar(
//                       child: TextField(
//                         controller: _controller,
//                         cursorColor: Colors.blue,
//                         keyboardType: TextInputType.multiline,
//                         maxLines: null,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           contentPadding: EdgeInsets.only(
//                             left: 15.0,
//                             bottom: 2.0,
//                           ),
//                           hintText: "Message",
//                           hintStyle: TextStyle(
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Icon(
//                   Icons.image,
//                   color: AppColor.textSecondaryColor.withOpacity(0.5),
//                 )
//               ],
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               _sendMessage();
//             },
//             child: Container(
//               height: 35.h,
//               width: 35.h,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: AppColor.primaryColor,
//               ),
//               child: const Center(
//                 child: Icon(
//                   Icons.send,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _messageContainer(
//     String content,
//     Timestamp timestamp,
//     MessageType type,
//   ) {
//     final bool isServiceProvider = type == MessageType.serviceProvider;
//     final DateTime dateTime = timestamp.toDate();

//     final formattedTime = DateFormat.jm().format(dateTime);

//     return SizedBox(
//       width: 270.w,
//       child: Container(
//         alignment:
//             isServiceProvider ? Alignment.centerLeft : Alignment.centerRight,
//         margin: EdgeInsets.all(10.r),
//         padding: EdgeInsets.all(10.r),
//         // width: 270.w,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: isServiceProvider
//                 ? const Radius.circular(0)
//                 : Radius.circular(10.r),
//             topRight: isServiceProvider
//                 ? Radius.circular(10.r)
//                 : const Radius.circular(0),
//             bottomLeft: Radius.circular(10.r),
//             bottomRight: Radius.circular(10.r),
//           ),
//           color: isServiceProvider
//               ? AppColor.textSecondaryColor.withOpacity(0.1)
//               : AppColor.primaryColor,
//         ),
//         child: Row(
//           children: [
//             SizedBox(
//               width: content.length < 10 ? 100.w : 150.w,
//               // width: 180.w,
//               child: Text(
//                 content,
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.normal,
//                   color: isServiceProvider
//                       ? AppColor.textPrimaryColor
//                       : Colors.white,
//                 ),
//               ),
//             ),
//             // SizedBox(
//             //  width: 20.w,
//             // ),
//             Text(
//               formattedTime,
//               style: TextStyle(
//                 fontSize: 12.sp,
//                 color: isServiceProvider
//                     ? AppColor.textSecondaryColor
//                     : Colors.white.withOpacity(0.5),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
