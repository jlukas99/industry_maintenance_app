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
