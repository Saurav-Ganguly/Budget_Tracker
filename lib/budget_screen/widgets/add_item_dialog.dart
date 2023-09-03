import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:line_icons/line_icons.dart';

class AddItemDialog extends StatefulWidget {
  const AddItemDialog({super.key});

  @override
  State<AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  IconData? icon;

  pickIcon() async {
    icon = await FlutterIconPicker.showIconPicker(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.15,
      child: Column(
        children: [
          const TextField(
            style: TextStyle(
              fontSize: 14,
            ),
            decoration: InputDecoration(
              hintText: 'Title',
              prefixIcon: Icon(Icons.title),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: pickIcon,
                child: Container(
                    child: icon == null
                        ? const Row(
                            children: [
                              Text(
                                'Choose an Icon',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          )
                        : Row(
                            children: [
                              const Text(
                                'Chosen Icon : ',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Icon(
                                icon,
                                size: 40,
                              ),
                            ],
                          )),
              ),
              const Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Amount',
                    prefixIcon: Icon(LineIcons.indianRupeeSign),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
