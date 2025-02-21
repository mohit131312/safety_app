import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:google_fonts/google_fonts.dart';

class AppSearchDropdown extends StatelessWidget {
  final List<String> items;
  final String? selectedItem;
  final String hintText;
  final ValueChanged<String?> onChanged;
  final bool enabled;

  const AppSearchDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.selectedItem,
    this.hintText = 'Select an option',
    this.enabled = true, // Default to enabled if not specified
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !enabled,
      child: DropdownSearch<String>(
        popupProps: PopupProps.menu(
          menuProps: MenuProps(
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          showSearchBox: true,
          itemBuilder: (context, item, isSelected) {
            return Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                item,
                style: GoogleFonts.inter(
                  fontSize: AppTextSize.textSizeSmall,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryText,
                ),
              ),
            );
          },
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search...',
              hintStyle: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.searchfeild,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: AppColors.searchfeildcolor, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: AppColors.searchfeildcolor, width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: const Color.fromARGB(255, 126, 16, 9),
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: const Color.fromARGB(255, 126, 16, 9),
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        items: items,
        selectedItem: selectedItem,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.inter(
              fontSize: AppTextSize.textSizeSmall,
              fontWeight: FontWeight.w400,
              color: AppColors.searchfeild,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: AppColors.searchfeildcolor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: AppColors.searchfeildcolor, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: const Color.fromARGB(255, 126, 16, 9),
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: const Color.fromARGB(255, 126, 16, 9),
                width: 1,
              ),
            ),
          ),
        ),
        dropdownButtonProps: DropdownButtonProps(
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.searchfeild,
            size: 27,
          ),
        ),
        onChanged: enabled ? onChanged : null,
      ),
    );
  }
}
