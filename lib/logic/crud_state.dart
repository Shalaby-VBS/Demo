part of 'crud_cubit.dart';

@immutable
sealed class CrudState {}

final class CrudInitial extends CrudState {}

final class CrudLoading extends CrudState {}

final class CrudSuccess extends CrudState {
  final List<Person> persons;

  CrudSuccess(this.persons);
}

final class CrudCreateSuccess extends CrudState {
  final List<Person> persons;

  CrudCreateSuccess(this.persons);
}

final class CrudError extends CrudState {
  final String message;

  CrudError(this.message);
}
