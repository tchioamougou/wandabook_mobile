import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wandabook/app/ui/layouts/main/main_layout.dart';
import 'package:wandabook/app/ui/utils/constants.dart';

class CustomCategorySelect extends StatelessWidget {
  final Widget label;
  final List<String> options;
  final String? selectedCat;
  final ValueChanged<String> onChanged;
  const CustomCategorySelect({Key? key,
    required this.label,
    required this.options,
    this.selectedCat,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            if(options.isNotEmpty){
              showModalBottomSheet(
                context: context,
                builder: (context) => Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10,
                                width: 40,
                                child: Divider(
                                  height: 100,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text("Categories".tr, style: const TextStyle(fontWeight: FontWeight.bold),),
                      Column(
                        children: options.map((el) {
                          return ListTile(
                            title: Text(el??""), // Assuming options have a String representation
                            leading: (selectedCat != null &&
                                selectedCat! == el)
                                ?  Icon(
                              Icons.check_circle,
                              size: 30,
                              color: Constants.defaultRed,
                            )
                                : const Icon(Icons.credit_card_sharp),
                            onTap: () {
                              onChanged(el);
                              Navigator.pop(context);
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
          child: label,
        )
      ],
    );
  }
}