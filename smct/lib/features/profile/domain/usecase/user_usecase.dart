import 'dart:ffi';

import 'package:smct/features/profile/domain/entity/user.dart';

class UserUsecase {
  final UserRepository userRepository;

  UserUsecase(this.userRepository);

  void login(User user) {
    userRepository.login(user);
  }

  User register(User user) {
    return userRepository.register(user);
  }

  User update(User user) {
    return userRepository.update(user);
  }
}
