import 'package:flutter/foundation.dart';
import 'package:prapare/controllers/services/fhir_service.dart';

class FhirModel {
  final FhirService apiClient;

  FhirModel({@required this.apiClient}) : assert(apiClient != null);

  getAll() {
    return apiClient.getAll();
  }

  // Accepts ID
  getById(id) {
    return apiClient.getById(id);
  }

  deleteById(id) {
    return apiClient.deleteById(id);
  }

  // Accepts object
  addOrUpdate(obj) {
    return apiClient.addOrUpdate(obj);
  }

  edit(obj) {
    return apiClient.edit(obj);
  }

  delete(obj) {
    return apiClient.delete(obj);
  }
}
