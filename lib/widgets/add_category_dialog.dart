//flutter package
import 'package:flutter/material.dart';

//global vars
import 'package:budget_tracker/global_vars.dart';

//external libraries
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:uuid/uuid.dart';

class AddCategoryDialog extends StatefulWidget {
  final CategoryTypes category;
  final void Function(Map<String, dynamic>) addItem;

  const AddCategoryDialog({
    super.key,
    required this.category,
    required this.addItem,
  });

  @override
  State<AddCategoryDialog> createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final uuid = const Uuid();
  IconData? icon;

  void onSubmit() {
    final title = titleController.text;
    final amount = amountController.text;
    IconData selectedIcon;
    if (icon == null) {
      selectedIcon = Icons.check;
    } else {
      selectedIcon = icon!;
    }

    if (title == '' || amount == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in the values!'),
        ),
      );
    } else {
      final id = uuid.v1();
      //add to the list
      Map<String, dynamic> data = {
        "id": id,
        "type": widget.category,
        "title": title,
        "icons": selectedIcon,
        "allocated_amount": int.parse(amount),
        "transactions": []
      };

      widget.addItem(data);

      Navigator.of(context).pop();
    }
  }

  pickIcon() async {
    icon = await FlutterIconPicker.showIconPicker(context);
    setState(() {});
  }

  @override
  void dispose() {
    // dispose the controllers
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AlertDialog(
      title: Text(
        "Add a new monthly ${widget.category.name}",
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      content: SizedBox(
        height: size.height * 0.15,
        child: Column(
          children: [
            TextField(
              controller: titleController,
              style: const TextStyle(
                fontSize: 16,
              ),
              decoration: const InputDecoration(
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
                Expanded(
                  child: TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Amount',
                      prefixIcon: Icon(LineIcons.indianRupeeSign),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Theme.of(context).colorScheme.primary,
            ),
          ),
          onPressed: onSubmit,
          child: const Text(
            'Submit',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
