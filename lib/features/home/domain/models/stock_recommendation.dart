class StockRecommendation {
  final String rank;
  final String name;
  final String market;
  final int score;
  final String reason;
  final String risk;
  final double expectedRange;

  const StockRecommendation({
    required this.rank,
    required this.name,
    required this.market,
    required this.score,
    required this.reason,
    required this.risk,
    required this.expectedRange,
  });
}
