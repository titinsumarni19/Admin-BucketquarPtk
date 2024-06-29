import 'package:hyper_ui/core.dart';

MongoDBClient get client => MongoDBClient();

// MongoDB Version
AppUser? get appCurrentUser {
  if (DBService.get("id") == null) return null;
  return AppUser(
    id: DBService.get("id")!,
    email: DBService.get("email")!,
    role: DBService.get("role")!,
  );
}
