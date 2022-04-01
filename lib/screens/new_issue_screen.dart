import 'package:flutter/material.dart';
import 'package:flutter_bug_tracker/widgets/custom_text_form_field.dart';
import 'package:intl/intl.dart';

class NewIssueScreen extends StatefulWidget {
  const NewIssueScreen({Key? key}) : super(key: key);

  @override
  State<NewIssueScreen> createState() => _NewIssueScreenState();
}

class _NewIssueScreenState extends State<NewIssueScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _dateIssueController = TextEditingController();
  final TextEditingController _titleIssueController = TextEditingController();
  final TextEditingController _descriptioIssueController =
      TextEditingController();
  DateTime? _dateOfIssue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Issue'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CustomTextFormField(
              controller: _userNameController,
              txtLabel: 'User Name',
            ),
            const SizedBox(height: 10.0),
            //Date Picker Form
            TextFormField(
              controller: _dateIssueController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Date of Issue'),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Date of Issue cannot be empty';
                }
                return null;
              },
              onTap: () => pickDateOfBirth(context),
            ),
            // END DATE PICKER FORM
            const SizedBox(height: 10.0),
            CustomTextFormField(
              controller: _titleIssueController,
              txtLabel: 'Title',
            ),
            const SizedBox(height: 10.0),
            CustomTextFormField(
                controller: _descriptioIssueController,
                txtLabel: 'Description'),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  Future<void> pickDateOfBirth(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: _dateOfIssue ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (context, child) => Theme(
        data: ThemeData().copyWith(
          colorScheme: const ColorScheme.light(
            primary: Colors.pink,
            onPrimary: Colors.white,
            onSurface: Colors.black,
          ),
          dialogBackgroundColor: Colors.white,
        ),
        child: child ?? const Text(''),
      ),
    );

    if (newDate == null) {
      return;
    }

    setState(() {
      _dateOfIssue = newDate;
      String doi = DateFormat('dd/MM/yyyy').format(newDate);
      _dateIssueController.text = doi;
    });
  }
}
