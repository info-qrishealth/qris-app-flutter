import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qris_health/modules/login_module/models/user/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void updateUser({required User user}) {
    emit(UserUpdated(user: user));
  }

  void updateUserLocation({required String? location}) {
    updateUser(user: state.user.copyWith.call(location: location));
  }
}
