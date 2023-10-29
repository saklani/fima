import "models/user.dart";
import "enums/authentication_state.dart";

/// The actual implementation of the [AuthenticationRepository]
class AuthenticationRepository {

  /// Returns the current authenticated user or null otherwise
  User? get currentUser {
    throw UnimplementedError();
  }

  /// A nullable Stream of type [User] which emits each time authentication state
  /// is changed
  Stream<User?> get user {
    throw UnimplementedError();
  }

  /// Returns the current [AuthenticationState] of the user
  Stream<AuthenticationState> get state {
    throw UnimplementedError();
  }

  /// Creates an account for a user using an email and password, then, signs in
  /// the user into the account.
  /// Updates the [AuthenticationState]
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    throw UnimplementedError();
  }

  /// Signs in the user into their existing account.
  /// Updates the [AuthenticationState]
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    throw UnimplementedError();
  }

  /// Signs out a user from their account.
  /// Updates the [AuthenticationState]
  Future<void> signOut() async {
    throw UnimplementedError();
  }
}
