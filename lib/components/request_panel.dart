import 'package:flutter/material.dart';

class RequestPanel extends StatelessWidget {
  final VoidCallback onRequestNow;
  final VoidCallback onSchedule;

  const RequestPanel({
    super.key,
    required this.onRequestNow,
    required this.onSchedule,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Estimated Arrival: 30 mins"),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      // When clicked, we call the parent's function
                      onPressed: onRequestNow,
                      child: const Text(
                        "Request Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.calendar_month),
                    // When clicked, we call the parent's function
                    onPressed: onSchedule,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
