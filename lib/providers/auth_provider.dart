import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final bool isAuthenticated;
  final String? userEmail;
  final String? userName;

  const AuthState({
    this.isAuthenticated = false,
    this.userEmail,
    this.userName,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    String? userEmail,
    String? userName,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      userEmail: userEmail ?? this.userEmail,
      userName: userName ?? this.userName,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());

  Future<bool> signIn(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 1000));
    
    // For demo purposes, accept any email/password
    state = state.copyWith(
      isAuthenticated: true,
      userEmail: email,
      userName: 'Dr. ${email.split('@')[0]}',
    );
    
    return true;
  }

  void signOut() {
    state = const AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
