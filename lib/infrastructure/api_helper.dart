import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../application/connectivity_status.dart';
import '../configs/backend_configs.dart';
import 'models/error.dart';

var logger = Logger();

class ApiBaseHelper {
  Future<Either<GlobalErrorModel, dynamic>> getEither(
      {required String endPoint,
      required bool isRequiredHeader,
      Map<String, String>? header}) async {
    DateTime executionTime = DateTime.now();
    // ignore: prefer_typing_uninitialized_variables
    Either<GlobalErrorModel, dynamic> responseJson;
    try {
      return await InternetConnectivityHelper.checkConnectivity()
          .then((value) async {
        if (value == true) {
          final response = await http.get(
              Uri.parse(BackendConfigs.baseUrl + endPoint),
              headers: isRequiredHeader ? header! : null);
          responseJson = _returnResponseEither(response);
          logger.i(
              "BaseUrl -> ${BackendConfigs.baseUrl} || EndPoints -> $endPoint || Status Code -> ${response.statusCode.toString()} || Response Time: ${DateTime.now().difference(executionTime).inMilliseconds} ms");
          return responseJson.fold((l) => Left(l), (r) => Right(r));
        } else {
          return Left(GlobalErrorModel(
              error: "Oops! It seems you are not connected to the internet."));
        }
      });
    } on SocketException catch (e) {
      logger.i("Socket Exception");
      logger.e(e.message.toString());
      return Left(GlobalErrorModel(
          error:
              "Some of our servers are undergoing maintenance. If you are currently facing difficulty in connecting, kindly wait a little and retry." +
                  "\nSorry for the inconvenience."));
    } on HttpException catch (e) {
      logger.i("HTTP Exception");
      logger.e(e.message.toString());
      return Left(GlobalErrorModel(
          error: "Sorry! We are unable to complete your request.!"));
    } on TimeoutException catch (e) {
      logger.i("TimeOut Exception");
      logger.e(e.message.toString());
      return Left(GlobalErrorModel(
          error: "Sorry! We are unable to connect our servers.!"));
    } catch (e) {
      return Left(GlobalErrorModel(error: e.toString()));
    }
  }


  Either<GlobalErrorModel, dynamic> _returnResponseEither(
      http.Response response) {
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseJson = json.decode(response.body.toString());
        return Right(responseJson);
      } else if (response.statusCode == 400) {
        var responseJson = json.decode(response.body.toString());

        var errorModel = GlobalErrorModel.fromJson(responseJson);
        return Left(GlobalErrorModel(error: errorModel.error.toString()));
      } else if (response.statusCode == 401) {
        return Left(GlobalErrorModel(
            error: "Sorry! You are not allowed to perform this operation.!"));
      } else if (response.statusCode == 404) {
        return Left(
            GlobalErrorModel(error: "Sorry! Your requested data not found!"));
      } else if (response.statusCode == 403) {
        return Left(GlobalErrorModel(error: "UnAuthorized"));
      } else if (response.statusCode == 500) {
        log(response.reasonPhrase.toString());
        return Left(GlobalErrorModel(
            error: "Sorry! We are facing some internal connection issues.!"));
      } else if (response.statusCode == 503) {
        return Left(GlobalErrorModel(
            error: "Sorry! We are facing some issues in connection.!"));
      } else {
        return Left(GlobalErrorModel(error: "Sorry! Some thing went wrong!."));
      }
    } catch (e) {
      log(e.toString());
      return Left(GlobalErrorModel(error: "Sorry! Some thing went wrong!."));
    }
  }
}
