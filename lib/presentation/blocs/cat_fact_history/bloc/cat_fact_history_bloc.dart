import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:random_cats/data/models/cat_model.dart';
import 'package:random_cats/network/injector.dart';

part 'cat_fact_history_event.dart';
part 'cat_fact_history_state.dart';

class CatFactHistoryBloc
    extends Bloc<CatFactHistoryEvent, CatFactHistoryState> {
  CatFactHistoryBloc() : super(CatFactHistoryInitial()) {
    on<CatFactHistoryEvent>((event, emit) async {
      emit(CatFactHistoryLoading());

      final box = injector.get<HiveInterface>().box('facts');
      final boxValues = box.values.toList(growable: false);
      final catFacts = <CatModel>[];
      catFacts.addAll(boxValues.cast());
      emit(CatFactHistorySuccess(catModels: catFacts));
    });
  }
}
