import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';

// ignore: must_be_immutable
class CustomInputWidget extends StatefulWidget {
  CustomInputWidget({
    required this.label,
    required this.hint,
    Key? key,
    this.showValidationState = false,
    this.isValid = false,
    this.validator,
    this.maxline,
    this.onChanged,
    this.onComplete,
    this.keyboardType,
    this.maxLength,
    this.prefixIconPath,
    this.suffixIconPath,
    this.suffix,
    this.textInputAction = TextInputAction.done,
    this.validationIcon,
    this.invalidIcon,
    this.setaliment,
    this.fillcolors,
    this.headertextcolor,
    this.radius,
    this.isReadOnly = false,
    required this.Header,
    this.controller, // Optional controller
  }) : super(key: key);

  final String label;
  final String hint;
  final int? maxline;
  final bool showValidationState;
  final bool isValid;
  final Widget? validationIcon;
  final Widget? invalidIcon;
  final String? Function(String?, TextEditingController)? validator;
  final void Function(String, TextEditingController)? onChanged;
  final void Function(String)? onComplete;
  final TextInputType? keyboardType;
  final int? maxLength;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final Widget? suffix;
  final String Header;
  final Color? fillcolors;
  final double? radius;
  final bool isReadOnly;
  final Color? headertextcolor;
  final TextAlignVertical? setaliment;
  final TextInputAction textInputAction;
  final TextEditingController? controller; // Make controller optional

  @override
  State<CustomInputWidget> createState() => _CustomInputWidgetState();
}

class _CustomInputWidgetState extends State<CustomInputWidget> {
  final ValueNotifier<bool> _isObsecure = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    // Determine if a controller is passed; if not, create one internally
    final controller = widget.controller ?? TextEditingController();

    final bool forPassword = widget.Header.toLowerCase().contains('password');

    return SizedBox(
      width: 390.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.Header.isNotEmpty) ...[
            Text(widget.Header,
                style: AppTextStyle.body(
                  fontWeight: FontWeight.w600,
                  color: widget.headertextcolor ?? const Color(0xff121314),
                )),
            7.verticalSpace,
          ],
          ValueListenableBuilder(
            valueListenable: _isObsecure,
            builder: (_, isObsecure, c) {
              return Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff2238500f),
                      offset: const Offset(0, 1),
                      blurRadius: 10.r,
                    ),
                  ],
                ),
                child: TextFormField(
                  // obscuringCharacter: "*",
                  textCapitalization: TextCapitalization.words,
                  readOnly: widget.isReadOnly,
                  clipBehavior: Clip.none,
                  textAlignVertical: widget.setaliment,
                  maxLines: isObsecure ? 1 : widget.maxline ?? 1,
                  controller: controller,
                  obscureText: isObsecure,
                  style: TextStyle(
                    color: const Color(0xff121314),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12),
                    hintText: widget.hint,
                    hintStyle: const TextStyle(color: Color(0xff121314)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff12131405)),
                      borderRadius:
                          BorderRadius.circular(widget.radius ?? 28.r),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff12131405)),
                      borderRadius:
                          BorderRadius.circular(widget.radius ?? 28.r),
                    ),
                    fillColor: widget.fillcolors ?? const Color(0xffFFFFFF),
                    filled: true,
                    prefixIcon: widget.prefixIconPath != null
                        ? Padding(
                            padding: EdgeInsets.all(13.w),
                            child: SvgPicture.asset(widget.prefixIconPath!),
                          )
                        : null,
                    suffixIcon: widget.suffixIconPath != null
                        ? Padding(
                            padding: EdgeInsets.all(13.w),
                            child: SvgPicture.asset(widget.suffixIconPath!),
                          )
                        : (forPassword
                            ? InkWell(
                                onTap: () =>
                                    _isObsecure.value = !_isObsecure.value,
                                child: Icon(
                                  isObsecure
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility,
                                  color: const Color(0xffE0E7F0),
                                ),
                              )
                            : widget.suffix),
                  ),
                  onChanged: (value) {
                    if (widget.onChanged != null) {
                      widget.onChanged!.call(value, controller);
                    }
                  },
                  onFieldSubmitted: (value) {
                    if (widget.onComplete != null) {
                      widget.onComplete!.call(value);
                    }
                  },
                  cursorOpacityAnimates: true,
                  validator: (value) {
                    if (widget.validator != null) {
                      return widget.validator!.call(value, controller);
                    }
                    return null;
                  },
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  keyboardType: widget.keyboardType,
                  maxLength: widget.maxLength,
                  textInputAction: widget.textInputAction,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
