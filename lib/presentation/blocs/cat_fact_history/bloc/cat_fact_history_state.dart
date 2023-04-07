part of 'cat_fact_history_bloc.dart';

abstract class CatFactHistoryState extends Equatable {
  const CatFactHistoryState();

  @override
  List<Object?> get props => [];
}

class CatFactHistoryInitial extends CatFactHistoryState {}

class CatFactHistoryLoading extends CatFactHistoryState {}

class CatFactHistorySuccess extends CatFactHistoryState {
  final List<CatModel> catModels;

  const CatFactHistorySuccess({required this.catModels});

  @override
  List<Object?> get props => [catModels];
}
