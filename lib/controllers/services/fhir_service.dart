import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class FhirService {
  final http.Client httpClient;
  FhirService({@required this.httpClient});

  // Ensure service has been initialized. Set values if null
  Future<void> _init() async {
    // todo:
  }

  //todo: set resource type
  Future<List<String>> getAll() async {
    await _init();
    try {
      final data = null; // todo
      if (data != null) {
        // todo: map data, then return it
      } else
        print('getAll is null');
    } catch (e) {
      print('error: $e');
    }
    return null;
  }

  // Accepts ID
  Future<String> getById(String id) async {
    await _init();
    try {
      final data = null; // todo
      if (data != null) {
        // todo: map data, then return it
      } else
        print('getId is null');
    } catch (e) {
      print('error: $e');
    }
    return null;
  }

  Future<bool> deleteById(String id) async {
    await _init();
    try {
      final index = 0;
      if (index > 0) {
        //todo: delete row by id
      }
      return false;
    } catch (e) {
      print('error: $e');
    }
    return false;
  }

  // Accepts Object
  Future<bool> addOrUpdate(String obj) async {
    await _init();
    try {
      // todo: add/update data
    } catch (e) {
      print('error: $e');
    }
    return false; // is this necessary?
  }

  Future<bool> edit(String obj) async {
    await _init();
    try {
      // todo: edit data
    } catch (e) {
      print('error: $e');
    }
    return false; // is this necessary?
  }

  //todo: set resource type
  Future<bool> delete(obj) => deleteById(obj.id);
}
