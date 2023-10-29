import "models/user.dart";
import "package:firebase_auth/firebase_auth.dart" hide User;

/// The actual implementation of the [AuthenticationRepository]
class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth;

  AuthenticationRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  /// Returns the current authenticated user or null otherwise
  User? get currentUser {
    final firebaseUser = _firebaseAuth.currentUser;
    return firebaseUser == null
        ? null
        : User(id: firebaseUser.uid, email: firebaseUser.email!);
  }

  /// A nullable Stream of type [User] which emits each time authentication state
  /// is changed
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      // Assumption: email is always defined since user signs up using emails
      return firebaseUser == null
          ? null
          : User(id: firebaseUser.uid, email: firebaseUser.email!);
    });
  }

  /// Creates an account for a user using an email and password, then, signs in
  /// the user into the account.
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      // TODO: Handle Errors
    }
  }

  /// Signs in the user into their existing account.
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      // TODO: Handle Errors
    }
  }

  /// Signs out a user from their account.
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      // TODO: Handle Errors
    }
  }
}
