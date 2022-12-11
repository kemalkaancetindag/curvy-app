enum Smoke {
  withDrink(0),
  socialSmoker(1),
  nonSmoker(2),
  smoker(3),
  tryingQuit(4);

  const Smoke(this.value);
  final int value;
}