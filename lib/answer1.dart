import 'package:flutter/material.dart';

class answer1 extends StatelessWidget {
  const answer1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // สีพื้นหลังของ AppBar
        title: const Text(
          'โปรไฟล์ผู้ใช้', // ข้อความใน AppBar
        ),
      ),
      body: Center(
        child: Profile()
      ),
    );
  }
}

class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/profile.png'),
          ),
          const SizedBox(height: 10),
          const Text(
            "ชื่อผู้ใช้: Thinaphat Unardngarm",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "อีเมล: unardngarm_t@silpakorn.edu",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.blue),
            title: const Text("การตั้งค่า"),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.blue),
            title: const Text("เปลี่ยนรหัสผ่าน"),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.question_mark_rounded, color: Colors.blue),
            title: const Text("ความเป็นส่วนตัว"),
            onTap: () {

            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("แก้ไขโปรไฟล์"))
              );
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'แก้ไขโปรไฟล์',
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("ออกจากระบบ"))
              );
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ออกจากระบบ',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}