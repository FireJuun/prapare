import 'package:dartz/dartz.dart';
import 'package:fhir/r4.dart';
import 'package:fhir_db/fhir_db.dart';

class DbInterface {
  DbInterface();
  final ResourceDao resourceDao = ResourceDao();
  final GeneralDao generalDao = GeneralDao();

  Future<Either<Error, String>> saveGeneric(Map<String, dynamic> map) async {
    String returnKey;
    try {
      returnKey = await generalDao.save(null, map);
    } catch (error) {
      return left(error);
    }
    return right(returnKey);
  }

  Future<Either<Error, String>> saveGenericKey(
      String key, Map<String, dynamic> map) async {
    String returnKey;
    try {
      returnKey = await generalDao.save(null, map, key: key);
    } catch (error) {
      return left(error);
    }
    return right(returnKey);
  }

  Future<Either<Error, Map<String, dynamic>>> searchGeneric(String key) async {
    Map<String, dynamic> returnMap;
    try {
      returnMap = await generalDao.find(null, key);
    } catch (error) {
      return left(error);
    }
    return right(returnMap);
  }

  Future<Either<Error, Resource>> save(Resource resource) async {
    Resource resultResource;
    try {
      resultResource = await resourceDao.save(null, resource);
    } catch (error) {
      return left(error);
    }
    return right(resultResource);
  }

  Future<Either<Error, List<Resource>>> returnListOfSingleResourceType(
      String resourceType) async {
    List<Resource> resultList;
    try {
      resultList =
          await resourceDao.getAllSortedById(null, resourceType: resourceType);
    } catch (error) {
      return left(error);
    }
    return right(resultList);
  }

  Future<Either<Error, List<Resource>>> searchFunction(
      String resourceType, String searchString, String reference) async {
    List<Resource> resultList;
    try {
      resultList = await resourceDao.searchFor(
          null, resourceType, searchString, reference);
    } catch (error) {
      return left(error);
    }
    return right(resultList);
  }

  Future<Either<Error, List<Resource>>> allResources() async {
    List<Resource> resultList;
    try {
      resultList = await resourceDao.getAllResources(null);
    } catch (error) {
      return left(error);
    }
    return right(resultList);
  }
}
