import 'package:industry_maintenance_app/core/constants/constants.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';

import '../../domain/entities/user.dart';

abstract class UserDataSource{
  const UserDataSource();
  
  Future<void> createUser({
    required String userName,
    required String userSurName,
    required String userPassword,
    required String userLogin,
});
  
  Future<User> loginUser({
    required String userLogin,
    required String userPassword,
});
  
}

class UserDataSourceImp implements UserDataSource{
  @override
  Future<void> createUser({
    required String userName, 
    required String userSurName, 
    required String userPassword, 
    required String userLogin}) async{
      final user = await FIREBASE_PATH.collection('users').add(User(
        userName: userName,
        userPassword: userPassword,
        userLogin: userLogin,
        userSurName: userSurName,
      ).toJson());
      final userID = user.id;
      await FIREBASE_PATH.collection('users').doc(userID).update({'userID': userID});
      // // TODO: implement createUser

    // throw UnimplementedError();
  }

  @override
  Future<User> loginUser({
    required String userLogin, 
    required String userPassword}) async{
    final userData = await FIREBASE_PATH.collection('users').
    where('userPassword', isEqualTo: userPassword).
    where('userLogin', isEqualTo: userLogin).get();
    User user = User.fromJson(userData.docs[0].data());
    return user;
    // TODO: implement loginUser
    throw UnimplementedError();
  }
}