import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Deterministic mock avatar - a colored circle with the person's initials,
/// so the POC never depends on network images.
class MockAvatar extends StatelessWidget {
  final String seed;
  final String name;
  final double size;
  final bool verified;

  const MockAvatar({
    super.key,
    required this.seed,
    required this.name,
    this.size = 44,
    this.verified = false,
  });

  Color _colorFor(String seed) {
    final hues = [0xFFC77A5B, 0xFF7FA6A0, 0xFF9E5238, 0xFFB08968];
    final idx = seed.codeUnits.fold<int>(0, (a, b) => a + b) % hues.length;
    return Color(hues[idx]);
  }

  String _initials(String name) {
    final parts = name.replaceAll('Dr. ', '').trim().split(' ');
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1)).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final avatar = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: _colorFor(seed),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        _initials(name),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: size * 0.36,
        ),
      ),
    );

    if (!verified) return avatar;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        avatar,
        Positioned(
          right: -2,
          bottom: -2,
          child: Container(
            width: size * 0.34,
            height: size * 0.34,
            decoration: const BoxDecoration(
              color: AppColors.accentFill,
              shape: BoxShape.circle,
              border: Border.fromBorderSide(BorderSide(color: Colors.white, width: 2)),
            ),
            child: Icon(Icons.check, color: Colors.white, size: size * 0.2),
          ),
        ),
      ],
    );
  }
}
