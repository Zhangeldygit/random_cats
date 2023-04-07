part of 'cat_fact_history_bloc.dart';

abstract class CatFactHistoryEvent extends Equatable {
  const CatFactHistoryEvent();

  @override
  List<Object> get props => [];
}

class EventFactHistory extends CatFactHistoryEvent {}
