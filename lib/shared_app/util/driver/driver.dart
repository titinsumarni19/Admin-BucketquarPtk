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

//@SUPABASE
// Supabase Version
// SupabaseClient get client => supabaseClient;
// AppUser get appCurrentUser {
//   var current = client.auth.currentUser;
//   return AppUser(
//     id: current!.id,
//     email: current.email,
//   );
// }
//:@SUPABASE
