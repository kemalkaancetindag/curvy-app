enum LoginMethod {
  google(0),
  facebook(1),
  apple(2),
  phone(3);

  const LoginMethod(this.value);
  final int value;
}