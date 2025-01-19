part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  final User user;
  const UserState({this.user = const User(userId: '', dob: '', gender: '')});

  @override
  List<Object> get props => [user];
}

final class UserInitial extends UserState {}

final class UserUpdated extends UserState {
  const UserUpdated({required super.user});
}
