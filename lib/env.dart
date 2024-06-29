import 'package:flutter/foundation.dart';

String defaultAdminEmail = "admin@demo.com";

bool get isDevMode {
  return kDebugMode ? true : false;
}

// String mongoBaseUrl  = "http://127.0.0.1:3000/api";
String mongoBaseUrl = "https://hyper-express-mongodb.vercel.app/api";
String get supabaseUrl => "https://zyasuspibmxsnsyxevgx.supabase.co";
String get anonKey =>
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp5YXN1c3BpYm14c25zeXhldmd4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTkyMDU2NDMsImV4cCI6MjAzNDc4MTY0M30.tGnyswhn_2BS7o6Zf66oWP7BOayhdMyJOLtvqAYV_iM";

String get noImageUrl =>
    "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg";

class Env {}
