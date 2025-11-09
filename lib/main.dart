import 'package:flutter/material.dart';
import 'services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("VidWiz AI")),
        body: const Center(child: BackendStatus()),
      ),
    );
  }
}

class BackendStatus extends StatefulWidget {
  const BackendStatus({super.key});

  @override
  State<BackendStatus> createState() => _BackendStatusState();
}

class _BackendStatusState extends State<BackendStatus> {
  String status = "Checking backend...";

  @override
  void initState() {
    super.initState();
    ApiService.checkStatus().then((value) {
      setState(() {
        status = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      status,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
