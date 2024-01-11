import 'package:firebase_auth/firebase_auth.dart';
import 'package:industry_maintenance_app/core/constants/constants.dart';

import 'package:industry_maintenance_app/features/user_auth/domain/entities/user.dart';

abstract class UserDataSource {
  const UserDataSource();

  Future<void> createUser({
    required String userName,
    required String userSurName,
    required String userPassword,
    required String userLogin,
  });

  Future<String> loginUser({
    required String userLogin,
    required String userPassword,
  });

  Future<MyUser> getUser({
    required String userID,
  });

  Future<void> logOutUser();
}

class UserDataSourceImp implements UserDataSource {
  @override
  Future<void> createUser({
    required String userName,
    required String userSurName,
    required String userPassword,
    required String userLogin,
  }) async {
    final testUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userLogin,
      password: userPassword,
    );
    await firestoreTestCompany.collection('users').doc(testUser.user!.uid).set(
          MyUser(
            userName: userName,
            userPassword: userPassword,
            userLogin: userLogin,
            userSurName: userSurName,
          ).toJson(),
        );
    // final userID = user.id;
    // await FIREBASE_PATH.collection('users').doc(userID).update({'userID': userID});
    // // TODO: implement createUser

    // throw UnimplementedError();
  }

  @override
  Future<String> loginUser({
    required String userLogin,
    required String userPassword,
  }) async {
    final user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: userLogin, password: userPassword);
    // final userData = await FIREBASE_PATH.collection('users').doc(loggedUser.user!.uid)
    //     .get();
    // MyUser user = MyUser.fromJson(userData.data());
    // return user;
    return user.user!.uid;
  }

  @override
  Future<MyUser> getUser({required String userID}) async {
    final myUser =
        await firestoreTestCompany.collection('users').doc(userID).get();
    final MyUser user = MyUser.fromJson(myUser.data());
    return user;
  }

  @override
  Future<void> logOutUser() async {
    await FirebaseAuth.instance.signOut();
  }
}
