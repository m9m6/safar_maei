import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/app_styles.dart';
import 'chat_input.dart';
import 'message_bubble.dart';

class ChatTab extends StatefulWidget {
  static String routeName = 'ChatTab';

  const ChatTab({super.key});

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  final List<Message> _messages = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _initializeChat();
  }

  void _initializeChat() {
    // Add initial messages to match the screenshot
    final now = DateTime.now();
    _messages.addAll([
      Message(
        id: '1',
        text: 'Good Evening!',
        isUser: false,
        timestamp: now.subtract(const Duration(hours: 2)),
      ),
      Message(
        id: '2',
        text: 'Welcome to Car2go Customer Service',
        isUser: false,
        timestamp: now.subtract(const Duration(hours: 2)),
      ),
      Message(
        id: '3',
        text: 'Welcome to Car2go Customer Service',
        isUser: true,
        timestamp: now.subtract(const Duration(hours: 2)),
      ),
      Message(
        id: '4',
        text: 'Welcome to Car2go Customer Service',
        isUser: false,
        timestamp: now.subtract(const Duration(hours: 2)),
      ),
      Message(
        id: '5',
        text: 'Welcome to Car2go Customer Service',
        isUser: true,
        timestamp: now.subtract(const Duration(minutes: 1)),
      ),
    ]);
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    final message = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      isUser: true,
      timestamp: DateTime.now(),
    );

    setState(() {
      _messages.add(message);
    });

    _scrollToBottom();

    // Simulate response after a short time
    Future.delayed(const Duration(seconds: 1), () {
      _simulateResponse();
    });
  }

  void _simulateResponse() {
    final responses = [
      'Thank you for your message!',
      'How can I help you today?',
      'I understand your concern.',
      'Let me check that for you.',
      'Is there anything else I can help you with?',
    ];

    final response = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: responses[DateTime.now().millisecond % responses.length],
      isUser: false,
      timestamp: DateTime.now(),
    );

    setState(() {
      _messages.add(response);
    });

    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,

      // AppBar Section
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 87.h,

        leading: Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24.sp,
            ),
          ),
        ),

        title: Text(
          'Chat',
          style: AppStyles.welcomeButtonText2.copyWith(fontSize: 18.sp),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          // Messages List
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(message: _messages[index]);
              },
            ),
          ),

          ChatInput(onSendMessage: _sendMessage),
        ],
      ),
    );
  }
}

class Message {
  final String id;
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final String? avatarUrl;

  Message({
    required this.id,
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.avatarUrl,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      text: json['text'],
      isUser: json['isUser'],
      timestamp: DateTime.parse(json['timestamp']),
      avatarUrl: json['avatarUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'isUser': isUser,
      'timestamp': timestamp.toIso8601String(),
      'avatarUrl': avatarUrl,
    };
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../../utils/app_colors.dart';
// import '../../../../../utils/app_styles.dart';
//
// class ChatTab extends StatelessWidget {
//   static String routeName = 'ChatTab';
//
//   const ChatTab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: AppColors.background,
//         resizeToAvoidBottomInset: true,
//
//         // AppBar Section
//         appBar: AppBar(
//           backgroundColor: AppColors.background,
//           elevation: 0,
//           scrolledUnderElevation: 0,
//           automaticallyImplyLeading: false,
//           toolbarHeight: 87.h,
//
//           // Back Button
//           leading: Padding(
//             padding: EdgeInsets.only(left: 30.w),
//             child: InkWell(
//               onTap: () => Navigator.pop(context),
//               child: Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//                 size: 24.sp,
//                 weight: 10,
//               ),
//             ),
//           ),
//
//           // AppBar Title
//           title: Text(
//             'Chat',
//             style: AppStyles.welcomeButtonText2.copyWith(fontSize: 18.sp),
//           ),
//           centerTitle: true,
//         ),
//         body: Padding(
//           padding: EdgeInsets.symmetric(vertical: 20.w),
//           child: Column(
//             children: [],
//           ),
//         ));
//   }
// }
