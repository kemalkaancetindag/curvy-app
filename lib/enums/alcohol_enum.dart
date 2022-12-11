enum Alcohol {
  notForMe(0),
  rarely(1),
  notUsing(2),
  specialOccasions(3),
  mostNights(4),
  notTried(5),
  weekEnds(6);

  const Alcohol(this.value);
  final int value;
}