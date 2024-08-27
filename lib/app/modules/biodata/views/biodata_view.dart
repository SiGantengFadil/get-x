import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/biodata_controller.dart';

class BiodataView extends GetView<BiodataController> {
  const BiodataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BiodataController controller = Get.put(BiodataController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Biodata'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Silakan Isi Biodata di bawah ini.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 25, 197, 177),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: controller.setNama,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Jenis Kelamin',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 102, 233, 218),
                ),
              ),
              Row(
                children: [
                  Obx(() => Expanded(
                        child: ListTile(
                          title: const Text('Laki-laki'),
                          leading: Radio<String>(
                            value: 'Laki-laki',
                            groupValue: controller.jenisKelamin.value,
                            onChanged: controller.setJenisKelamin,
                            activeColor: Colors.teal,
                          ),
                        ),
                      )),
                  Obx(() => Expanded(
                        child: ListTile(
                          title: const Text('Perempuan'),
                          leading: Radio<String>(
                            value: 'Perempuan',
                            groupValue: controller.jenisKelamin.value,
                            onChanged: controller.setJenisKelamin,
                            activeColor: Color.fromARGB(255, 13, 61, 56),
                          ),
                        ),
                      )),
                ],
              ),
              const SizedBox(height: 16),
              Obx(() => DropdownButtonFormField<String>(
                    value: controller.agama.value.isEmpty
                         ?null
                         :controller.agama.value,
                    items: <String>['Islam', 'Kristen', 'Hindu', 'Budha']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: controller.setAgama,
                    decoration: InputDecoration(
                      labelText: 'Pilih Agama',
                      prefixIcon: const Icon(Icons.accessibility),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  )),
              const SizedBox(height: 16),
              Obx(() => TextField(
                    decoration: InputDecoration(
                      labelText: 'Tanggal Lahir',
                      hintText: 'Pilih Tanggal Lahir',
                      prefixIcon: const Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: controller.tanggalLahir.value,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        controller.setTanggalLahir(pickedDate);
                      }
                    },
                    controller: TextEditingController(
                        text: controller.tanggalLahir.value
                            .toString()
                            .split(' ')[0]),
                  )),
              const SizedBox(height: 16),
              TextField(
                onChanged: controller.setAlamat,
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  prefixIcon: const Icon(Icons.home),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: controller.submitForm,
                  icon: const Icon(Icons.send),
                  label: const Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.teal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
