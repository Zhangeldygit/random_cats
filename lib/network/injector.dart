import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:random_cats/data/repositories_impl/cat_fact_repo_impl.dart';
import 'package:random_cats/domain/repositories/cat_fact_repo.dart';
import 'package:random_cats/domain/usecases/cat_fact_usecases.dart';
import 'package:random_cats/network/cat_fact_service.dart';
import 'package:random_cats/presentation/blocs/cat_fact/cat_fact_bloc.dart';
import 'package:random_cats/presentation/blocs/cat_fact_history/bloc/cat_fact_history_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerSingleton<Dio>(Dio());
  injector.registerSingleton<HiveInterface>(Hive);
  injector.registerSingleton(CatFactService(injector()));
  injector
      .registerSingleton<CatFactRepository>(CatFactRepositoryImpl(injector()));
  injector.registerSingleton<FetchCatFactUseCase>(
      FetchCatFactUseCaseImpl(injector()));

  injector
      .registerFactory<CatFactBloc>(() => CatFactBloc(factUseCase: injector()));
  injector.registerFactory<CatFactHistoryBloc>(() => CatFactHistoryBloc());
}
