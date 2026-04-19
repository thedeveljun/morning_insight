import 'package:flutter/material.dart';
import '../../domain/models/market_issue.dart';

class IssueCard extends StatelessWidget {
  final MarketIssue issue;

  const IssueCard({
    super.key,
    required this.issue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFE0ECFF),
              borderRadius: BorderRadius.circular(999),
            ),
            child: const Text(
              'TODAY ISSUE',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1D4ED8),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            issue.title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            issue.subtitle,
            style: const TextStyle(
              fontSize: 13,
              height: 1.4,
              color: Color(0xFF6B7280),
            ),
          ),
          const Spacer(),
          Text(
}