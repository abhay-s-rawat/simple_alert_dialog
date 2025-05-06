import 'package:flutter/material.dart';
import 'package:simple_alert_dialog/simple_alert_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Alert Dialog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Simple Alert Dialog'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: const Text('Show Error alert'),
              onPressed: () async {
                SimpleAlertDialog.show(
                  context,
                  assetImagepath: AnimatedImage.error,
                  buttonsColor: Colors.red,
                  title: AlertTitleText('Are you sure ?'),
                  confirmationText: "delete",
                  content: AlertContentText(
                    'Do you really want to delete your account ? You will not be able to undo this action.',
                  ),
                  onConfirmButtonPressed: (ctx) {
                    Navigator.pop(ctx);
                  },
                );
              },
            ),
            TextButton(
              child: const Text('Show Confirm alert'),
              onPressed: () async {
                SimpleAlertDialog.show(
                  context,
                  assetImagepath: AnimatedImage.confirm,
                  buttonsColor: Colors.teal,
                  confirmationText: "proceed",
                  title: AlertTitleText('Are you sure ?'),
                  content: AlertContentText(
                    'Do you really want to delete your account ? You will not be able to undo this action.',
                  ),
                  onConfirmButtonPressed: (ctx) {
                    Navigator.pop(ctx);
                  },
                );
              },
            ),
            TextButton(
              child: const Text('Show Info alert'),
              onPressed: () async {
                SimpleAlertDialog.show(
                  context,
                  assetImagepath: AnimatedImage.info,
                  buttonsColor: Colors.yellow,
                  title: AlertTitleText('Are you sure ?'),
                  content: AlertContentText(
                    'Do you really want to delete your account ? You will not be able to undo this action.',
                  ),
                  onConfirmButtonPressed: (ctx) {
                    Navigator.pop(ctx);
                  },
                );
              },
            ),
            TextButton(
              child: const Text('Show Loading alert'),
              onPressed: () async {
                SimpleAlertDialog.show(
                  context,
                  assetImagepath: AnimatedImage.loading,
                  buttonsColor: Colors.blue,
                  title: AlertTitleText('Are you sure ?'),
                  content: AlertContentText(
                    'Do you really want to delete your account ? You will not be able to undo this action.',
                  ),
                  onConfirmButtonPressed: (ctx) {
                    Navigator.pop(ctx);
                  },
                );
              },
            ),
            TextButton(
              child: const Text('Show Success alert'),
              onPressed: () async {
                SimpleAlertDialog.show(
                  context,
                  assetImagepath: AnimatedImage.success,
                  buttonsColor: Colors.green,
                  title: AlertTitleText('Are you sure ?'),
                  content: AlertContentText(
                    'Do you really want to delete your account ? You will not be able to undo this action.',
                  ),
                  onConfirmButtonPressed: (ctx) {
                    Navigator.pop(ctx);
                  },
                );
              },
            ),
            TextButton(
              child: const Text('Show Warning alert'),
              onPressed: () async {
                SimpleAlertDialog.show(
                  context,
                  assetImagepath: AnimatedImage.warning,
                  buttonsColor: Colors.red,
                  title: AlertTitleText('Are you sure ?'),
                  content: AlertContentText(
                    'Do you really want to delete your account ? You will not be able to undo this action.',
                  ),
                  onConfirmButtonPressed: (ctx) {
                    Navigator.pop(ctx);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
