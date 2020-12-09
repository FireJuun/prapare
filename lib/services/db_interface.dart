import 'package:dartz/dartz.dart';
import 'package:fhir/r4.dart';
import 'package:fhir_db/resource_dao.dart';

class DbInterface {
  DbInterface();
  final ResourceDao resourceDao = ResourceDao();

  Future<Either<DbFailure, Resource>> save(Resource resource) async {
    Resource resultResource;
    try {
      resultResource = await resourceDao.save(null, resource);
    } catch (error) {
      return left(DbFailure(error.toString()));
    }
    return right(resultResource);
  }

  Future<Either<DbFailure, List<Resource>>> returnListOfSingleResourceType(
      String resourceType) async {
    List<Resource> resultList;
    try {
      resultList =
          await resourceDao.getAllSortedById(null, resourceType: resourceType);
    } catch (error) {
      return left(DbFailure(error.toString()));
    }
    return right(resultList);
  }

  Future<Either<DbFailure, List<Resource>>> searchFunction(
      String resourceType, String searchString, String reference) async {
    List<Resource> resultList;
    try {
      resultList = await resourceDao.searchFor(
          null, resourceType, searchString, reference);
    } catch (error) {
      return left(DbFailure(error.toString()));
    }
    return right(resultList);
  }

  Future<Either<DbFailure, List<Resource>>> allResources() async {
    List<Resource> resultList;
    try {
      resultList = await resourceDao.getAllResources(null);
    } catch (error) {
      return left(DbFailure(error.toString()));
    }
    return right(resultList);
  }
}

class DbFailure {
  DbFailure(this.errorMessage);
  String errorMessage;
}
