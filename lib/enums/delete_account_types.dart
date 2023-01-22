enum DeleteAccount {
  problem(0),
  dontLiked(1),
  reset(2),
  foundOne(3),
  littleBreak(4),
  personalReason(5);

  const DeleteAccount(this.value);
  final int value;
}