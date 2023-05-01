import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  final Widget child;
  const BottomSheetWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: child,
        ),
      ),
    );
  }
}

class FullBottomSheetWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const FullBottomSheetWidget({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        padding: const EdgeInsets.all(15),
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 30),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
