import 'package:demo/helper/extensions.dart';
import 'package:demo/logic/crud_cubit.dart';
import 'package:demo/ui/screens/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../person_model.dart';
import '../widgets/custom_date_and_time_picker.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nationalIdController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController ageController = TextEditingController();
    final TextEditingController dateOfBirthController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Screen'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: nationalIdController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'National ID',
              hintText: 'Enter your national ID',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: nameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: 'Name',
              hintText: 'Enter your name',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Age',
              hintText: 'Enter your age',
            ),
          ),
          const SizedBox(height: 16),
          CustomDatePicker(controller: dateOfBirthController),
          const SizedBox(height: 16),
          BlocBuilder<CrudCubit, CrudState>(
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  context.read<CrudCubit>().addPerson(
                        Person(
                          DateTime.now().second,
                          nameController.text,
                          int.parse(ageController.text),
                          int.parse(nationalIdController.text),
                          dateOfBirthController.text,
                        ),
                      );
                  context.push(const ListScreen());
                },
                child: const Text('Submit'),
              );
            },
          ),
        ],
      ),
    );
  }
}
