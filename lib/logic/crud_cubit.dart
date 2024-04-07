import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../person_model.dart';

part 'crud_state.dart';

class CrudCubit extends Cubit<CrudState> {
  CrudCubit() : super(CrudInitial());

  List<Person> persons = [];

  void loadPersons() {
    emit(CrudSuccess(persons));
  }

  void addPerson(Person person) {
    persons.add(person);
    emit(CrudCreateSuccess(persons));
  }

  void removePerson(Person person) {
    persons.remove(person);
    emit(CrudSuccess(persons));
  }

  void updatePerson(Person person) {
    final index = persons.indexWhere((element) => element.id == person.id);
    persons[index] = person;
    emit(CrudSuccess(persons));
  }
}
