
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/counter_controller.dart';

class
 CounterView extends GetView<CounterController> {
  const CounterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bilangan Ke:'),
            Obx(
              () => Text(controller.bilangan.toString()),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.kurangSatu();
                  },
                  child: Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.resetBilangan();
                  },
                  child: Icon(Icons.restore_outlined),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.tambahSatu();
                  },
                  child: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
