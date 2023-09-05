//flutter package
import 'package:flutter/material.dart';

//external libraries
import 'package:line_icons/line_icons.dart';

class IncomeDialog extends StatefulWidget {
  final bool addFlag;
  final void Function(int) setIncome;

  const IncomeDialog({
    super.key,
    required this.addFlag,
    required this.setIncome,
  });

  @override
  State<IncomeDialog> createState() => _IncomeDialogState();
}

class _IncomeDialogState extends State<IncomeDialog> {
  int income = 0;
  final TextEditingController amountController = TextEditingController();

  void onSubmit() {
    final amount = amountController.text;

    if (amount == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in the values!'),
        ),
      );
    } else {
      widget.setIncome(int.parse(amount));
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    // dispose the controllers
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AlertDialog(
      title: Text(
        "${widget.addFlag ? 'Add to' : 'Set'} Monthly Income",
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      content: SizedBox(
        height: size.height * 0.10,
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
