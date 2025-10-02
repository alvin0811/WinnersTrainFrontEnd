import 'package:flutter_svg/svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_border_radius.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final double? width;
  final double? height;
  final double? headerFontSize;
  final bool? icon;
  final String? keyValue;
  final String? hintText;
  final double? hintTextSize;
  final String? initialValue;
  final String? headerText;
  final double? inputTextSize;
  final FontWeight? fontWeight;
  final Widget? suffixIcon;
  final String? Function(String?)? validate;
  final Function(String)? onChange;
  final Function(String)? onFieldSubmitted;
  final bool border;
  final bool shadow;
  final bool authShadow;
  final bool devider;
  final TextInputType? keyboardType;
  final int? maxLines;
  final Color? color;
  final Color? bgcolor;
  final List<TextInputFormatter>? inputFormatters;
  final bool readonly;
  final Function()? ontap;
  final BorderRadius? radius;
  final TextInputType? fieldInputType;
  final InputBorder? enabledBorder;
  final InputBorder? focusBorder;
  final InputBorder? errorBorder;
  final Color? iconColor;
  final Color? hintColor;
  final bool showValidationState;
  final bool isValid;
  final Widget? validationIcon;
  final Widget? invalidIcon;
  final String? Function(String?, TextEditingController)? validator;
  final void Function(String, TextEditingController)? onChanged;
  final void Function(String)? onComplete;
  final Color? enabledborderColor;
  final Color? focusedborderColor;
  final Color? headerTextColor;
  final double? customPadding;
  final int? minlines;
  final int? maxlines;
  final int? maxlength;
  final Color? suffixIconColor;
  final bool obsecureText;
  final String? suffixIconPath;
  final List<BoxShadow>? boxshadow;
  final TextAlignVertical? setaliment;
  final TextInputAction textInputAction;
  CustomTextfield(
      {Key? key,
      this.controller,
      this.suffixIconPath,
      this.onChanged,
      this.onComplete,
      this.obsecureText = false,
      this.showValidationState = false,
      this.isValid = false,
      this.maxlines,
      this.boxshadow,
      this.validator,
      this.textInputAction = TextInputAction.done,
      this.validationIcon,
      this.invalidIcon,
      this.enabledborderColor,
      this.focusedborderColor,
      this.suffixIconColor,
      this.setaliment,
      this.prefixIcon,
      this.icon = true,
      this.width,
      this.height,
      this.keyValue = "1",
      this.hintText,
      this.hintTextSize,
      this.initialValue,
      this.headerText,
      this.inputTextSize,
      this.fontWeight,
      this.suffixIcon,
      this.validate,
      this.onChange,
      this.onFieldSubmitted,
      this.border = true,
      this.shadow = false,
      this.authShadow = false,
      this.devider = true,
      this.keyboardType,
      this.maxLines,
      this.color,
      this.inputFormatters,
      this.readonly = false,
      this.ontap,
      this.radius,
      this.fieldInputType,
      this.enabledBorder,
      this.focusBorder,
      this.errorBorder,
      this.iconColor,
      this.bgcolor,
      this.hintColor,
      this.headerTextColor,
      this.customPadding,
      this.maxlength,
      this.minlines, this.headerFontSize})
      : super(key: key);
  final ValueNotifier<bool> _isObsecure = ValueNotifier(false);
  final formFieldKey = GlobalKey<FormFieldState<dynamic>>();

  @override
  Widget build(BuildContext context) {
    final bool forPassword =
        (headerText ?? "").toLowerCase().contains('password');
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (headerText != null)
        Padding(
          padding: EdgeInsets.only(left: customPadding ?? 0, bottom: 10.h),
          child: Text(
            headerText!,
            style: context.bodySmall.copyWith(
              fontSize: headerFontSize,
                color: headerTextColor ?? context.onPrimary,
                fontWeight: fontWeight ?? FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
      // if (headerText != null) 10.verticalSpace,
      ValueListenableBuilder(
          valueListenable: _isObsecure,
          builder: (_, isObsecure, c) {
            return Container(
              height: height ?? 52.h,
              width: width ?? double.infinity,
              decoration: BoxDecoration(
                  boxShadow: boxshadow ?? CustomShadows.defaultShadow),
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                maxLines: isObsecure ? 1 : maxLines ?? 1,
                onChanged: (value) {
                  // controller?.text = value;
                  if (onChanged != null) {
                    onChanged!.call(value, controller!);
                  }
                },
                onFieldSubmitted: (value) {
                  if (onComplete != null) {
                    onComplete!.call(value);
                  }
                },
                cursorOpacityAnimates: true,
                validator: (value) {
                  if (validator != null) {
                    return validator!.call(value, controller!);
                  }
                  return null;
                },
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                key: formFieldKey,
                minLines: minlines,
                maxLength: maxlength,
                clipBehavior: Clip.none,
                textInputAction: textInputAction,
                textAlignVertical: setaliment,
                autofocus: false,
                onTap: ontap,
                readOnly: readonly,
                keyboardType: keyboardType ?? TextInputType.text,
                inputFormatters: inputFormatters,
                style: TextStyle(
                    fontSize: inputTextSize ?? 14.sp,
                    fontWeight: fontWeight ?? FontWeight.w400,
                    color: color ?? context.onPrimary),
                cursorColor: Colors.black,
                obscureText: isObsecure,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  enabledBorder: enabledBorder ??
                      OutlineInputBorder(
                          borderRadius: radius ?? CustomBorderRadius.large,
                          borderSide: BorderSide(
                              color: enabledborderColor ?? Color(0xff12131405),
                              width: 1.0)),
                  focusedBorder: focusBorder ??
                      OutlineInputBorder(
                          borderRadius: radius ?? CustomBorderRadius.large,
                          borderSide: BorderSide(
                              color: focusedborderColor ?? Color(0xff12131405),
                              width: 1.0)),
                  errorBorder: errorBorder,
                  hintText: hintText,
                  fillColor: Color(0xffFFFFFF),
                  filled: true,
                  prefixIcon: prefixIcon != null
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 13.w),
                          child: prefixIcon,
                        )
                      : null,
                  suffixIcon: suffixIconPath != null
                      ? Padding(
                          padding: EdgeInsets.all(13.w),
                          child: SvgPicture.asset(suffixIconPath!),
                        )
                      : (forPassword
                          ? InkWell(
                              onTap: () =>
                                  _isObsecure.value = !_isObsecure.value,
                              child: Icon(
                                isObsecure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Color(0xffE0E7F0),
                              ),
                            )
                          : suffixIcon),
                  suffixIconColor: suffixIconColor,
                  hintStyle: TextStyle(
                      fontSize: hintTextSize ?? 14.sp,
                      color: hintColor ?? Color(0xff121314)),
                  border: InputBorder.none,
                ),
              ),
            );
          })
    ]);
  }
}
