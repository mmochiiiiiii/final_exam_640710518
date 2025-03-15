import 'package:flutter/material.dart';

class answer2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // สีพื้นหลังของ AppBar
        title: const Text(
          'คำนวณค่าจัดส่ง', // ข้อความใน AppBar
        ),
      ),
      body: const Center(
          child: DeliverFeePage()
      ),
    );
  }
}

class DeliverFeePage extends StatefulWidget {
  const DeliverFeePage({super.key});

  @override
  _DeliverFeePage createState() => _DeliverFeePage();
}

class _DeliverFeePage extends State<DeliverFeePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _weightController = TextEditingController();
  String? _selectedDistance;
  String? _emergence;
  bool _firstIsChecked = false;
  bool _secondIsChecked = false;
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            "น้ำหนักสิ้นค้า (กก.):",
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'น้ำหนักสิ้นค้า (กก.):'),
                  controller: _weightController,
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return 'กรุณาระบุน้ำหนักสินค้า';
                    }
                    return value;
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField(
                  decoration: const InputDecoration(labelText: 'เลือกระยะทาง:'),
                  value: _selectedDistance,
                  items: ['ในเมือง','ต่างจังหวัด','ต่างประเทศ']
                      .map((item) =>
                      DropdownMenuItem(value: item, child: Text(item)))
                    .toList(),
                  onChanged: (distance) {
                    _selectedDistance = distance;
                  },
                  validator: (distance) {
                    distance == null ? 'กรุณาเลือกระยะทาง' : null;
                  },
                ),
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CheckboxListTile(
                      title: const Text('แพ็คกิ้งพิเศษ (+20 บาท)'),
                      value: _firstIsChecked,
                      onChanged: (service){
                        setState(() {
                          if (_secondIsChecked == false){
                            _firstIsChecked = service!;
                            _secondIsChecked = false;
                          }
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('ประกันพัสดุ (+50 บาท)'),
                      value: _secondIsChecked,
                      onChanged: (service){
                        setState(() {
                          if (_firstIsChecked == false){
                            _secondIsChecked = service!;
                            _firstIsChecked = false;
                          }
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    RadioListTile(
                      title: const Text('ปกติ'),
                      value: 'ปกติ',
                      groupValue: _emergence,
                      onChanged: (emergence){
                        setState(() {
                          _emergence = emergence.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('ด่วน'),
                      value: 'ด่วน',
                      groupValue: _emergence,
                      onChanged: (emergence){
                        setState(() {
                          _emergence = emergence.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('ด่วนพิเศษ'),
                      value: 'ด่วนพิเศษ',
                      groupValue: _emergence,
                      onChanged: (emergence){
                        setState(() {
                          _emergence = emergence.toString();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    double? total = 0;
                    if (_selectedDistance == 'ในเมือง'){
                      total *= 10;
                    }else if (_selectedDistance == 'ต่างจังหวัด'){
                      total *= 15;
                    }else if (_selectedDistance == 'ต่างประเทศ'){
                      total *= 50;
                    }
                    if (_firstIsChecked){
                      total += 20;
                    }else if(_secondIsChecked){
                      total += 50;
                    }

                    if (_emergence == 'ด่วนพิเศษ'){
                      total += 50;
                    }else if(_emergence == 'ด่วน'){
                      total +=  30;
                    }else{
                      total += 0;
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("ค่าจัดส่งทั้งหมด: $total"))
                    );

                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'คำนวณราคา',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.blue,
                  child: Text(
                    "ค่าจัดส่งทั้งหมด: $total",
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}