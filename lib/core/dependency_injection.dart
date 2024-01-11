import 'package:get_it/get_it.dart';
import 'package:industry_maintenance_app/core/widgets/app_bar/cubit/app_bar_cubit.dart';
import 'package:industry_maintenance_app/core/widgets/my_end_drawer/presentation/bloc/end_drawer_cubit.dart';
import 'package:industry_maintenance_app/features/department_page/data/datasources/department_data_source.dart';
import 'package:industry_maintenance_app/features/department_page/data/repositories/department_repo_imp.dart';
import 'package:industry_maintenance_app/features/department_page/domain/repositories/department_repo.dart';
import 'package:industry_maintenance_app/features/department_page/domain/usecases/fetch_departments_usecase.dart';
import 'package:industry_maintenance_app/features/department_page/domain/usecases/find_department_usecase.dart';
import 'package:industry_maintenance_app/features/department_page/presentation/department_cubit/department_cubit.dart';
import 'package:industry_maintenance_app/features/main_page/presentation/bloc/main_page_cubit.dart';
import 'package:industry_maintenance_app/features/user_auth/data/datasources/user_data_source.dart';
import 'package:industry_maintenance_app/features/user_auth/data/repositories/user_repo_imp.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/repositories/user_repo.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/usecases/create_user_usecase.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/usecases/get_user.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/usecases/log_out_user_usecase.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/usecases/login_user_usecase.dart';
import 'package:industry_maintenance_app/features/user_auth/presentation/bloc/login_cubit/login_cubit.dart';
import 'package:industry_maintenance_app/features/zone_page/data/datasources/zone_data_source.dart';
import 'package:industry_maintenance_app/features/zone_page/data/repositories/zone_repo_imp.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/repositories/zone_repo.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/usecases/create_zone_usecase.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/usecases/delete_zone_usecase.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/usecases/fetch_zone_usecase.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/usecases/find_zone_usecase.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/usecases/zone_exists_usecase.dart';
import 'package:industry_maintenance_app/features/zone_page/presentation/bloc/add_zone_cubit/add_zone_cubit.dart';
import 'package:industry_maintenance_app/features/zone_page/presentation/bloc/zone_cubit.dart';

final depInjection = GetIt.instance;

Future<void> initInjection() async {
  ///auth dependecny injections
  ///

  depInjection.registerFactory(
    () => AppBarCubit(
      getUserUseCase: depInjection(),
      logOutUserUseCase: depInjection(),
    ),
  );
  depInjection.registerLazySingleton(
    () => GetUserUseCase(repo: depInjection()),
  );
  depInjection.registerLazySingleton(
    () => LogOutUserUseCase(repo: depInjection()),
  );

  depInjection.registerFactory(
    () => EndDrawerCubit(logOutUserUseCase: depInjection()),
  );

  depInjection.registerFactory(
    () => MainPageCubit(getUserUseCase: depInjection()),
  );
  depInjection.registerFactory(
    () => LoginCubit(loginUserUseCase: depInjection()),
  );
  depInjection.registerLazySingleton(
    () => LoginUserUseCase(repo: depInjection()),
  );
  depInjection.registerLazySingleton(
    () => CreateUserUseCase(repo: depInjection()),
  );
  depInjection.registerLazySingleton<UserRepo>(
    () => UserRepoImp(dataSource: depInjection()),
  );
  depInjection.registerLazySingleton<UserDataSource>(() => UserDataSourceImp());

  depInjection.registerFactory(
    () => ZoneCubit(
      findZoneUseCase: depInjection(),
      deleteZoneUeCase: depInjection(),
      fetchZoneUseCase: depInjection(),
      getUserUseCase: depInjection(),
    ),
  );
  depInjection.registerLazySingleton(
    () => FindZoneUseCase(repo: depInjection()),
  );
  depInjection.registerLazySingleton(
    () => DeleteZoneUseCase(repo: depInjection()),
  );
  depInjection.registerLazySingleton(
    () => FetchZoneUseCase(repo: depInjection()),
  );
  depInjection.registerLazySingleton<ZoneRepo>(
    () => ZoneRepoImp(zoneDataSource: depInjection()),
  );
  depInjection.registerLazySingleton<ZoneDataSource>(() => ZoneDataSourceImp());

  depInjection.registerFactory(
    () => AddZoneCubit(
      createZoneUseCase: depInjection(),
      zoneExistsUseCase: depInjection(),
    ),
  );
  depInjection.registerLazySingleton(
    () => ZoneExistsUseCase(repo: depInjection()),
  );
  depInjection.registerLazySingleton(
    () => CreateZoneUseCase(repo: depInjection()),
  );

  depInjection.registerFactory(
    () => DepartmentCubit(
      findDepartmentUseCase: depInjection(),
      getUserUseCase: depInjection(),
      fetchDepartmentsUseCase: depInjection(),
    ),
  );
  depInjection.registerLazySingleton(
    () => FindDepartmentUseCase(repo: depInjection()),
  );
  depInjection.registerLazySingleton(
    () => FetchDepartmentsUseCase(repo: depInjection()),
  );
  depInjection.registerLazySingleton<DepartmentRepo>(
    () => DepartmentRepoImp(dataSource: depInjection()),
  );
  depInjection.registerLazySingleton<DepartmentDataSource>(
    () => DepartmentDataSourceImp(),
  );
}
