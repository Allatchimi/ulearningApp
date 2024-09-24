class SignInState {
  final String email;
  final String password;

  const SignInState({
    this.email = "",
    this.password = "",
  });

  SignInState copyWith({
    String? email,
    String? password,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
void main(){
  SignInState state= const SignInState();
  //state.email= "a@a.com";
  SignInState myStata = const SignInState(email: "a@a.com",password: "123");
}
