import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar_maei/ui/home/reusable_buttons/custom_bottom_sheet.dart';
import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/app_styles.dart';
import '../../../../reusable_buttons/outlined_circler_button.dart';

class ChatInput extends StatefulWidget {
  final Function(String) onSendMessage;

  const ChatInput({
    super.key,
    required this.onSendMessage,
  });

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final TextEditingController _controller = TextEditingController();
  bool _canSend = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _canSend = _controller.text.trim().isNotEmpty;
    });
  }

  void _sendMessage() {
    if (_canSend) {
      widget.onSendMessage(_controller.text.trim());
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      borderRadius: 16.r,
      dragHandleColor: AppColors.noColor,
      backgroundColor: AppColors.white,
      height: 116.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(
                        color: AppColors.stroke,
                        width: 1.w,
                      ),
                    ),
                    child: TextField(
                      controller: _controller,
                      cursorColor: AppColors.stroke,
                      style: AppStyles.bodySmallRegular,
                      decoration: InputDecoration(
                        hintText: 'Enter Your message',
                        hintStyle: AppStyles.textFieldHintTextStyle,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        isDense: true,
                        filled: true,
                        fillColor: AppColors.white,
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                            width: 1.w,
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: Icon(
                            Icons.emoji_emotions_outlined,
                            color: AppColors.black,
                            size: 24.sp,
                          ),
                        ),
                      ),
                      maxLines: null,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                ),

                SizedBox(width: 8.w),

                // send button
                OutlinedCircularButton(
                  borderColor: AppColors.noColor,
                  backgroundColor: AppColors.noColor,
                  isCentered: true,
                  width: 24.w,
                  height: 24.h,
                  onTap: _sendMessage,
                  child: Icon(
                    Icons.send_outlined,
                    color: Colors.black,
                    size: 24.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}