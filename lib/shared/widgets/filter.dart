import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterCard extends StatefulWidget {
  const FilterCard({super.key});

  @override
  State<FilterCard> createState() => _FilterCardState();
}

class _FilterCardState extends State<FilterCard> {
  String? category;
  String? type;
  String? location;

  final List<String> categories = [
    "All Categories",
    "Category A",
    "Category B",
    "Category C",
  ];

  final List<String> types = ["All Types", "Type 1", "Type 2", "Type 3"];

  final List<String> locations = [
    "All Locations",
    "Location 1",
    "Location 2",
    "Location 3",
  ];
  final List<String> words = ["Reset all", "submit"];
  int currentIndex = 0;

  void changeIndex(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330.h,
      padding: EdgeInsets.only(left: 20.w, right: 20.h, top: 12.h),
      decoration: BoxDecoration(
        color: Color(0xff212937),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Column(
        spacing: 12.h,
        children: [
          Container(
            //  height: 210.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            decoration: BoxDecoration(
              color: const Color(0xff263040),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xff4D5F80), width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                Text(
                  "Filter",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xffEFF1F5),
                  ),
                ),

                SizedBox(height: 8.h),

                /// By Category
                Text(
                  "By Category",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffEFF1F5),
                  ),
                ),
                SizedBox(height: 4.h),
                dropField(
                  value: category,
                  items: categories,
                  onChanged: (v) => setState(() => category = v),
                ),

                SizedBox(height: 8.h),

                /// Row: By Type & By Geographic Area
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        spacing: 4.h,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "By Type",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xffEFF1F5),
                            ),
                          ),
                          dropField(
                            value: type,
                            items: types,
                            onChanged: (v) => setState(() => type = v),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 12.w),

                    Expanded(
                      child: Column(
                        spacing: 4.h,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "By Geographic Area",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xffEFF1F5),
                            ),
                          ),
                          dropField(
                            value: location,
                            items: locations,
                            onChanged: (v) => setState(() => location = v),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //SizedBox(height: 24.h),

                /// Buttons
              ],
            ),
          ),
          Row(
            //spacing: 12.w,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(words.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      category = null;
                      type = null;
                      location = null;
                    });
                  },
                  child: SizedBox(
                    width: 170.w,
                    child: GestureDetector(
                      onTap: () {
                        changeIndex(index);
                        // setState(() {
                        //   category = null;
                        //   type = null;
                        //   location = null;
                        // });
                      },
                      child: Container(
                        height: 48.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          gradient: currentIndex == index
                              ? LinearGradient(
                                  colors: [
                                    Color(0xff22C55E),
                                    Color(0xff16A34A),
                                  ],
                                )
                              : LinearGradient(
                                  colors: [
                                    Color(0xff394760),
                                    Color(0xff394760),
                                  ],
                                ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          words[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
          SizedBox(height: 3.h),
        ],
      ),
    );
  }

  /// ---------------- Dropdown styled field ----------------
  Widget dropField({
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: const Color(0xff2F3B50),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xff394760)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(
            items.first,
            style: TextStyle(color: const Color(0xffEFF1F5)),
          ),
          dropdownColor: const Color(0xff2F3B50),
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          isExpanded: true,
          style: TextStyle(color: const Color(0xffEFF1F5), fontSize: 14.sp),
          onChanged: onChanged,
          items: items
              .map(
                (e) => DropdownMenuItem(
                  value: e == items.first ? null : e,
                  child: Text(e),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
