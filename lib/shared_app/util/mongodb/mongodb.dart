import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

final timeout = Duration(seconds: 1);
final ping = Duration(seconds: 1);

// final socket = WebSocket(
//   Uri.parse('ws://127.0.0.1:8080'),
//   timeout: timeout,
//   pingInterval: ping,
// );

enum MongoQuery {
  snapshot,
  select,
  single,
  insert,
  update,
  delete,
}

class MongoDBUser {}

class MongoDBAuth {
  MongoDBUser get currentUser {
    return MongoDBUser();
  }

  Future<dynamic> signInWithPassword({
    required String email,
    required String password,
  }) async {
    //TODO: implement
    var response = await dio.post(
      "$mongoBaseUrl/auth/login",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "email": email,
        "password": password,
      },
    );
    Map obj = response.data;
    DBService.set("id", obj["data"]["id"]);
    DBService.set("email", obj["data"]["email"]);
    DBService.set("role", obj["data"]["role"]);
    return Future.value(obj);
  }

  Future<dynamic> signUp({
    required String email,
    required String password,
  }) async {
    //TODO: implement
    var response = await dio.post(
      "$mongoBaseUrl/auth/register",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "email": email,
        "password": password,
      },
    );
    Map obj = response.data;
    return Future.value(obj);
  }

  Future<dynamic> resetPasswordForEmail(
    String email,
  ) {
    //TODO: implement
    return Future.value(null);
  }

  Future<dynamic> signOut() {
    //TODO: implement
    DBService.clear("id");
    DBService.clear("email");
    DBService.clear("password");
    DBService.clear("role");
    DBService.clear("token");
    return Future.value(null);
  }
}

class MongoDBClient {
  String? collectionName;
  MongoQuery? mongoQuery;
  Map<String, dynamic>? value;
  List<Map<String, dynamic>>? values;
  dynamic id;
  MongoDBAuth auth = MongoDBAuth();

  Stream<dynamic> snapshot() {
    return Stream.empty();
    // socket.connection.firstWhere((state) => state is Connected).then((value) {
    //   socket.send(
    //     jsonEncode(
    //       {
    //         'collection': collectionName,
    //         'param': queryParam,
    //       },
    //     ),
    //   );
    // });
    // return socket.messages.asBroadcastStream();
  }

  MongoDBClient from(String collectionName) {
    this.collectionName = collectionName;
    return this;
  }

  MongoDBClient select([String columns = '*']) {
    mongoQuery = MongoQuery.select;
    return this;
  }

  MongoDBClient single() {
    mongoQuery = MongoQuery.single;
    return this;
  }

  MongoDBClient order(
    String column, {
    bool ascending = true,
  }) {
    filters.add({
      "field": "sort",
      "operator": "eq",
      "value": "$column,${ascending ? 'asc' : 'desc'}",
    });
    return this;
  }

  MongoDBClient insert(List<Map<String, dynamic>> _values) {
    mongoQuery = MongoQuery.insert;
    values = _values;
    return this;
  }

  MongoDBClient update(Map<String, dynamic> _value) {
    mongoQuery = MongoQuery.update;
    value = _value;
    return this;
  }

  MongoDBClient delete() {
    mongoQuery = MongoQuery.delete;
    return this;
  }

  MongoDBClient ilike(String field, dynamic value) {
    if (field == "_id" || field == "id") {
      id = value;
      return this;
    }

    filters.add({
      "field": field,
      "operator": "ilike",
      "value": value,
    });
    return this;
  }

  MongoDBClient limit(int value) {
    filters.add({
      "field": "limit",
      "operator": "eq",
      "value": value,
    });
    return this;
  }

  MongoDBClient eq(String field, dynamic value) {
    if (field == "_id" || field == "id") {
      id = value;
      return this;
    }

    filters.add({
      "field": field,
      "operator": "eq",
      "value": value,
    });
    return this;
  }

  MongoDBClient eqo(String field, dynamic value) {
    if (field == "_id" || field == "id") {
      id = value;
      return this;
    }

    var arr = value.split(" ");
    var fieldOperator = arr[0];
    var fieldValue = arr[1];

    if (fieldOperator == "==") {
      return this.eq(field, value);
    } else if (fieldOperator == "<") {
      return this.lt(field, value);
    } else if (fieldOperator == "<=") {
      return this.lte(field, value);
    } else if (fieldOperator == ">") {
      return this.gt(field, value);
    } else if (fieldOperator == ">=") {
      return this.gte(field, fieldValue);
    } else if (fieldOperator == "!=") {
      return this.neq(field, value);
    }

    filters.add({
      "field": field,
      "operator": "eq",
      "value": value,
    });
    return this;
  }

  MongoDBClient neq(String field, dynamic value) {
    if (field == "_id" || field == "id") {
      id = value;
      return this;
    }

    filters.add({
      "field": field,
      "operator": "neq",
      "value": value,
    });
    return this;
  }

  MongoDBClient gt(String field, dynamic value) {
    filters.add({
      "field": field,
      "operator": "gt",
      "value": value,
    });
    return this;
  }

  MongoDBClient lt(String field, dynamic value) {
    filters.add({
      "field": field,
      "operator": "lt",
      "value": value,
    });
    return this;
  }

  MongoDBClient gte(String field, dynamic value) {
    filters.add({
      "field": field,
      "operator": "gte",
      "value": value,
    });
    return this;
  }

  MongoDBClient lte(String field, dynamic value) {
    filters.add({
      "field": field,
      "operator": "lte",
      "value": value,
    });
    return this;
  }

  Future exec() async {
    if (mongoQuery == null) return this;

    printg(mongoQuery);

    switch (mongoQuery!) {
      case MongoQuery.select:
        return await execSelect();
      case MongoQuery.single:
        return await execSingle();
      case MongoQuery.insert:
        return await execInsert();

      case MongoQuery.update:
        return await execUpdate();
      case MongoQuery.delete:
        return await execDelete();
      case MongoQuery.snapshot:
        // Do nothing
        break;
    }
    return null;
  }

  List<Map<String, dynamic>> filters = [];

  String getQueryParameter() {
    if (filters.isEmpty) return "";
    var values = [];
    for (var filter in filters) {
      values.add("${filter["field"]}=${filter["operator"]}~${filter["value"]}");
    }
    return values.join("&");
  }

  String get queryParam {
    var qp = getQueryParameter();
    var extraParam = "";
    if (qp.isNotEmpty) {
      extraParam = "?$qp";
    }
    return extraParam;
  }

  Future<List> execSelect() async {
    var url = "$mongoBaseUrl/$collectionName$queryParam";
    printg(url);
    var response = await dio.get(
      url,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return response.data;
  }

  Future execSingle() async {
    var url = "$mongoBaseUrl/$collectionName/${id}$queryParam";
    printg(url);
    var response = await dio.get(
      url,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return response.data;
  }

  Future execInsert() async {
    List responses = [];
    var url = "$mongoBaseUrl/$collectionName$queryParam";
    for (var value in values!) {
      printg("url: $url");
      printg("value: $value");
      printg("value: $value");
      var response = await dio.post(
        url,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: value,
      );
      responses.add(response.data);
    }
    return responses;
  }

  Future execUpdate() async {
    var response = await dio.put(
      "$mongoBaseUrl/$collectionName/$id$queryParam",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: value,
    );
    return response.data;
  }

  Future execDelete() async {
    var response = await dio.delete(
      "$mongoBaseUrl/$collectionName/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: value,
    );
    return response.data;
  }
}

MongoDBClient get mongoClient => MongoDBClient();

Future<void> mongoTest() async {
  // await mongoClient.from("users").insert([
  //   {
  //     "name": "Doro",
  //     "email": "denyocr.world@gmail.com",
  //     "age": r.randomIntBetween(10, 60),
  //   }
  // ]).exec();

  var values = await mongoClient
      .from("users")
      .select()
      .order("created_at", ascending: false)
      .exec();

  for (var item in values) {
    print("${item["_id"]} - ${item["name"]}");
  }

  // values = await mongoClient.from("users").select().ne("age", 2222).exec();
  // print("ddr: $values");
  // mongoClient.from("user_test").select().snapshot();

  // mongoClient
  //     .from("users")
  //     .update({
  //       "name": r.randomName(),
  //       "email": "denyocr.world@gmail.com",
  //     })
  //     .eq("_id", "66795cf3b8842600c31c94f6")
  //     .exec();

  // mongoClient.from("users").delete().eq(
  //       "_id",
  //       values.first["_id"],
  //     );
}

// 1. implement filter on .snapshot()
// 1. implement .single on .snapshot()
// 1. return List on insert
