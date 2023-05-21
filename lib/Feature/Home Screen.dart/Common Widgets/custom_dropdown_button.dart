import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

// ignore: must_be_immutable
class CustomDropdown extends StatefulWidget {
  final String? hint;
  final String? value;
  final bool isExpanded;
  final bool isDense;
  final List<DropdownMenuItem<String>> items;
  final ValueChanged<String?>? onChanged;
  DropdownSearchData<String>? customsearch;

  CustomDropdown({
    super.key,
    this.customsearch,
    this.hint,
    this.value,
    this.isExpanded = true,
    this.isDense = true,
    required this.items,
    this.onChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 58.h,
      padding: EdgeInsets.only(
        left: 15.w,
        top: 10.h,
        bottom: 10.h,
        right: 15.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 1.w,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          hint: Text(
            widget.hint ?? '',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          // dropdownSearchData: widget.customsearch ?? const DropdownSearchData(),
          dropdownSearchData: DropdownSearchData(
            searchController: controller,
            searchInnerWidgetHeight: 70.h,
            searchInnerWidget: Container(
              height: 50.h,
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 4,
                right: 8,
                left: 8,
              ),
              child: TextFormField(
                expands: true,
                maxLines: null,
                textCapitalization: TextCapitalization.sentences,
                controller: controller,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  hintText: 'Search for an item...',
                  hintStyle: const TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            searchMatchFn: (item, searchValue) {
              log("here is ${item.value.toString()}");
              return (item.value.toString().contains(searchValue));
            },
          ),

          value: selectedValue,
          isExpanded: widget.isExpanded,
          isDense: widget.isDense,
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
              widget.onChanged?.call(newValue);
            });
          },
          items: widget.items,
        ),
      ),
    );
  }
}
