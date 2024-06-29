import 'package:flutter/foundation.dart';

String defaultAdminEmail = "admin@demo.com";

bool get isDevMode {
  return kDebugMode ? true : false;
}

// String mongoBaseUrl  = "http://127.0.0.1:3000/api";
String mongoBaseUrl = "https://hyper-express-mongodb.vercel.app/api";
String get noImageUrl =>
    "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg";

class Env {}
