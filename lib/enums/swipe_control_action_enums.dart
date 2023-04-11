enum SwipeControlAction {
  ad(0),
  premiumReminder(1),
  pass(3),
  noSwipesLeft(4);

  const SwipeControlAction(this.value);
  final int value;
}