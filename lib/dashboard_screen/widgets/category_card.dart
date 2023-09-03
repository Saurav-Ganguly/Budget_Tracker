import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final int allocatedAmt;
  final Color color;
  const CategoryCard({
    super.key,
    required this.title,
    required this.allocatedAmt,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          iconColor: color,
          leading: CircularPercentIndicator(
            radius: 25.0,
            percent: 0.5,
            center: const Icon(Icons.home),
            progressColor: color,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          subtitle: Text(
            '- 8500',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          tileColor: Colors.white,
          trailing: SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  color: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          'Allocated :',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          allocatedAmt.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
