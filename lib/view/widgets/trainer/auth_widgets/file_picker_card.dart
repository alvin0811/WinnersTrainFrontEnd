import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';

class FilePickerCard extends StatefulWidget {
  final String Header;

  const FilePickerCard({super.key, required this.Header});

  @override
  _FilePickerCardState createState() => _FilePickerCardState();
}

class _FilePickerCardState extends State<FilePickerCard> {
  File? selectedFile;
  String fileType = '';

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result == null) {
      print("No file selected");
      return;
    }

    PlatformFile file = result.files.first;
    print("File selected: ${file.name} with path: ${file.path}");
    setState(() {
      selectedFile = File(file.path!);
      fileType = file.extension ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.Header.isNotEmpty) ...[
          Text(
            widget.Header,
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xff121314),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 7.h),
        ],
        SizedBox(
          width: 390.w,
          child: DottedBorder(
            strokeWidth: 1.5,
            dashPattern: [6, 8],
            borderType: BorderType.RRect,
            color: const Color(0xFFD0D8E3),
            radius: const Radius.circular(15.0),
            child: SizedBox(
              width: 390.w,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _pickFile,
                        child: SvgPicture.asset("assets/svg/upload.svg"),
                      ),
                      SizedBox(height: 10.h),
                      Text("Click to upload",
                          style: AppTextStyle.button(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff4C5157),
                          )),
                      SizedBox(height: 10.h),
                      if (selectedFile != null) ...[
                        fileType == 'pdf'
                            ? const Icon(
                                Icons.picture_as_pdf,
                                size: 80,
                                color: Colors.red,
                              )
                            : (fileType == 'jpg' ||
                                    fileType == 'jpeg' ||
                                    fileType == 'png')
                                ? Image.file(
                                    selectedFile!,
                                    // height: 200.h,
                                    // width: 390.w,
                                    fit: BoxFit.contain,
                                  )
                                : const SizedBox.shrink(),
                        SizedBox(height: 10.h),
                        Text(
                          "Selected File: ${selectedFile!.path.split('/').last}",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[700],
                          ),
                        ),
                      ] else ...[
                        Text(
                          "Upload JPEG, PNG, PDF",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xff4C5157),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
