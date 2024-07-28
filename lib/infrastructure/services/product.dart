import 'package:dartz/dartz.dart';
import 'package:ecom_app/infrastructure/models/product.dart';

import '../../configs/end_points.dart';
import '../api_helper.dart';
import '../models/error.dart';

abstract class ProductRepository {
  Future<Either<GlobalErrorModel, ProductListingModel>> getProducts(
      String token);
}

class ProductRepositoryImp extends ProductRepository {
  @override
  Future<Either<GlobalErrorModel, ProductListingModel>> getProducts(
      String token) async {
    var data = await ApiBaseHelper().getEither(
        endPoint: ApiEndPoints.kGetProducts,
        isRequiredHeader: true,
        header: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'x-rapidapi-key': token
        });
    return data.fold((l) => Left(GlobalErrorModel(error: l.error.toString())),
        (r) {
      return Right(ProductListingModel.fromJson(r));
    });
  }
}
