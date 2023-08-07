import 'package:bimir_lock/features/introductionPage/presentation/views/add_user_detail.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class QuotesCategoryController extends GetxController {
  final List quoteItems = [
    "art",
    "beauty",
    "business",
    "communications",
    "computers",
    "dreams",
    "education",
    "failure",
    "fear",
    "fitness",
    "freedom",
    "friendship",
    "future",
    "happiness",
    "hope",
    "imagination",
    "inspirational",
    "intelligence",
    "knowledge",
    "leadership",
    "life",
    "love",
    "money",
    "morning",
    "success"
  ];
  RxList<String> selectedList = RxList();
  categoryTap(String value) {
    if (selectedList.contains(value)) {
      selectedList.remove(value);
    } else {
      if (selectedList.length < 6) {
        selectedList.add(value);
      } else {
        Fluttertoast.showToast(msg: "You cannot select more than 6 categories");
      }
    }
    update();
  }

  isSelected(String value) {
    if (selectedList.contains(value)) return true;
    return false;
  }

  onGoTap(BuildContext context) {
    // save the category
    context.push(AddUserDetailPage.routeName);
  }
}
