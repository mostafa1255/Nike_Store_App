import 'package:get_it/get_it.dart';
import 'package:nike_store_app/app/data/data_source/home_local_data_source/home_local_data_source_impl.dart';
import 'package:nike_store_app/app/data/data_source/home_remote_data_source/home_remote_data_source_impl.dart';
import 'package:nike_store_app/app/data/repos/home_rep/home_repo_impl.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl()));
}
