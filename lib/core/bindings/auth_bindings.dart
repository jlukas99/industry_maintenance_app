import 'package:get/get.dart';
import 'package:industry_maintenance_app/features/user_auth/data/datasources/user_data_source.dart';
import 'package:industry_maintenance_app/features/user_auth/data/repositories/user_repo_imp.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/repositories/user_repo.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/usecases/create_user_usecase.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/usecases/login_user_usecase.dart';


// class AuthBindings extends Bindings{
//   @override
//   void dependencies() {
//     Get.lazyPut<UserDataSource>(() => UserDataSourceImp());
//     Get.lazyPut<UserRepo>(()=> UserRepoImp(dataSource: Get.find()));
//     Get.lazyPut(() => CreateUserUseCase(repo: Get.find()));
//     Get.lazyPut(() => LoginUserUseCase(repo: Get.find()));
//     Get.lazyPut(() => AuthController(loginUserUseCase: Get.find(), createUserUseCase: Get.find()));
//     // TODO: implement dependencies
//   }
//
// }