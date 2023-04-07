import 'package:random_cats/data/models/cat_model.dart';

abstract class CatFactRepository {
  Future<CatModel> fetchFact();
}
