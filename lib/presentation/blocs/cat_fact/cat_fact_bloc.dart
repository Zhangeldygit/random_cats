import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:random_cats/data/models/cat_model.dart';
import 'package:random_cats/domain/usecases/cat_fact_usecases.dart';
import 'package:random_cats/network/injector.dart';

part 'cat_fact_event.dart';
part 'cat_fact_state.dart';

class CatFactBloc extends Bloc<CatFactEvent, CatFactState> {
  final FetchCatFactUseCase factUseCase;

  CatFactBloc({required this.factUseCase}) : super(CatFactInitial()) {
    on<EventFact>((event, emit) async {
      emit(CatFactLoading());
      try {
        final box = injector.get<HiveInterface>().box('facts');

        final catFact = await factUseCase.call();
        box.add(catFact);
        emit(CatFactSuccess(catModel: catFact));
      } catch (e) {
        emit(CatFactError('Something went wrong'));
      }
    });
  }
}
