import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/resources/theme/color_scheme.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/home/feed/delete_dialog_comment.dart';

class EditDeleteDropdown extends StatelessWidget {
  final void Function()? onEdit;
  final void Function()? onDelete;

  const EditDeleteDropdown({
    Key? key,
    this.onEdit,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppColor.lightScheme.primary,
      icon: Icon(
        Icons.more_horiz,
        size: 30.sp,
        color: Colors.black.withOpacity(0.7),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
        side: BorderSide(color: Color(0xff1213141A), width: 1),
      ),
      onSelected: (value) {
        if (value == 'edit') {
          onEdit?.call();
        } else if (value == 'delete') {
          onDelete?.call();
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'delete',
          child: SizedBox(
              width: 101.w, // Set custom width
              height: 40.h,
              child: Row(
                children: [
                  Icon(Icons.delete,
                      color: Colors.black.withOpacity(0.7), size: 24.sp),
                  SizedBox(width: 25.w),
                  Text('Delete',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColor.lightScheme.onPrimaryContainer)),
                ],
              ).inkWell(onTap: () {
                Navigator.pop(context);
                deleteDialogComment(context);
              })),
        ),
        PopupMenuItem(
          value: 'edit',
          child: SizedBox(
            width: 101.w, // Set custom width
            height: 40.h,
            child: Row(
              children: [
                Icon(Icons.edit,
                    color: Colors.black.withOpacity(0.7), size: 24.sp),
                SizedBox(width: 25.w),
                Text('Edit',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColor.lightScheme.onPrimaryContainer))
                    .inkWell(onTap: () => Navigator.pop(context))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
