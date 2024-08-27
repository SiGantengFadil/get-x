import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  final bilangan = 0.obs;

  void tambahSatu() {
    if (bilangan.value >= 20) {
      Get.snackbar(
        'Warning',
        'Loba Teing',
        backgroundColor: Colors.amber,
        icon: Icon(Icons.warning),
      );
    } else {
      bilangan.value++;
    }
  }

  void kurangSatu() {
    if (bilangan.value <= 0) {
      Get.snackbar(
        'Warning',
        'Nilai tidak boleh minus',
        backgroundColor: Colors.red,
        icon: Icon(Icons.dangerous),
      );
    } else {
      bilangan.value--;
    }
  }
  void resetBilangan() {
    bilangan.value = 0;
  }
}
