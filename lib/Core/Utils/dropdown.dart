import 'package:daaem_reports/Core/Constant/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomDropdownButton extends StatefulWidget {
  final String hint;

  final List<String> items;
  final String? dropvalue;
  final ValueChanged<String?>? onChanged;
  Color? backgroundColor;
  Color? color;
  double? size;
  final double iconsizes;
  FontWeight? fontWeight;
  final double? width;
  final double? height;

  CustomDropdownButton({
    Key? key,
    required this.hint,
    this.color,
    required this.items,
    required this.onChanged,
    this.dropvalue,
    required this.iconsizes,
    this.backgroundColor = white,
    this.size = 16,
    this.width,
    this.fontWeight = FontWeight.w600,
    this.height,
  }) : super(key: key);

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.backgroundColor,
      ),
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            menuMaxHeight: 200,
            value: widget.dropvalue,
            focusColor: widget.backgroundColor,
            dropdownColor: white,
            iconEnabledColor: widget.color,
            iconDisabledColor: widget.color,
            isExpanded: true,
            isDense: true,
            borderRadius: BorderRadius.circular(10.r),
            style: TextStyle(
                color: black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat'),
            iconSize: widget.iconsizes,
            hint: Text(
              widget.hint,
              style: TextStyle(
                  color: widget.color,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Montserrat'),
            ),
            onChanged: widget.onChanged,
            items: widget.items
                .toSet()
                .toList()
                .map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
