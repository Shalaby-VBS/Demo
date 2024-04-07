import 'package:demo/logic/crud_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../person_model.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Screen'),
      ),
      body: BlocBuilder<CrudCubit, CrudState>(
        builder: (context, state) {
          if (state is CrudSuccess) {
            return ListView.builder(
              itemCount: state.persons.length,
              itemBuilder: (context, index) {
                final person = state.persons[index];
                return ListTile(
                  title: Text(person.name),
                  subtitle: Text(person.age.toString()),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<CrudCubit>().removePerson(person);
                    },
                  ),
                );
              },
            );
          } else if (state is CrudLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CrudCreateSuccess) {
            return ListView.builder(
              itemCount: state.persons.length,
              itemBuilder: (context, index) {
                final person = state.persons[index];
                return ListTile(
                  title: Text(person.name),
                  subtitle: Text(person.age.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          context.read<CrudCubit>().updatePerson(
                                Person(
                                  person.id,
                                  person.name,
                                  person.age,
                                  person.nationalId,
                                  person.dateOfBirth,
                                ),
                              );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<CrudCubit>().removePerson(person);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
