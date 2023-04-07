import 'package:random_cats/data/models/cat_model.dart';
import 'package:random_cats/domain/repositories/cat_fact_repo.dart';

abstract class FetchCatFactUseCase<T> {
  Future<CatModel> call();
}

class FetchCatFactUseCaseImpl implements FetchCatFactUseCase {
  FetchCatFactUseCaseImpl(this._catFactRepository);

  final CatFactRepository _catFactRepository;

  @override
  Future<CatModel> call() async {
    final data = _catFactRepository.fetchFact();
    return data;
  }
}
