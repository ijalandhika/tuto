import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuto/design/tokens.dart';

class NotificationScreen extends StatefulWidget {
  final VoidCallback onOpen;
  final VoidCallback onDismiss;

  const NotificationScreen({
    super.key,
    required this.onOpen,
    required this.onDismiss,
  });

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _slideIn;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _slideIn = Tween<double>(begin: -40, end: 0).animate(
        CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));
    _fadeIn = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    WidgetsBinding.instance.addPostFrameCallback((_) => _ctrl.forward());
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Sunrise gradient wallpaper
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF1A3A5C),
                Color(0xFF2D6A9E),
                Color(0xFFE8943A),
                Color(0xFFF5C842),
                Color(0xFFFFF8EE),
              ],
              stops: [0.0, 0.25, 0.55, 0.75, 1.0],
            ),
          ),
        ),

        // Stars on sky
        ..._StarField.positions.map((p) => Positioned(
              top: p.dy * MediaQuery.of(context).size.height,
              left: p.dx * MediaQuery.of(context).size.width,
              child: Container(
                width: 2,
                height: 2,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            )),

        SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Clock
              Text(
                '8:47',
                style: GoogleFonts.nunito(
                  fontSize: 72,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  height: 1,
                ),
              ),
              Text(
                'Wednesday, May 21',
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withValues(alpha: 0.85),
                ),
              ),

              const SizedBox(height: 40),

              // Notification card
              AnimatedBuilder(
                animation: _ctrl,
                builder: (_, child) => Transform.translate(
                  offset: Offset(0, _slideIn.value),
                  child: Opacity(opacity: _fadeIn.value, child: child),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _NotificationCard(
                    onOpen: widget.onOpen,
                  ),
                ),
              ),

              const Spacer(),

              // Dismiss
              GestureDetector(
                onTap: widget.onDismiss,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(LumioRadius.pill),
                    border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3), width: 1),
                  ),
                  child: Text(
                    'Not now',
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final VoidCallback onOpen;
  const _NotificationCard({required this.onOpen});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onOpen,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.22),
          borderRadius: BorderRadius.circular(LumioRadius.xl),
          border: Border.all(
              color: Colors.white.withValues(alpha: 0.4), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            // App icon
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [LumioColors.accent, LumioColors.accentDeep],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text('🐢', style: TextStyle(fontSize: 24)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tuto',
                        style: GoogleFonts.nunito(
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'now',
                        style: GoogleFonts.nunito(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Maya's daily quest is ready! 🌟",
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Tap to start counting stars with Tuto',
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StarField {
  static const positions = [
    Offset(0.05, 0.04),
    Offset(0.15, 0.08),
    Offset(0.28, 0.03),
    Offset(0.42, 0.07),
    Offset(0.58, 0.02),
    Offset(0.70, 0.09),
    Offset(0.82, 0.05),
    Offset(0.92, 0.12),
    Offset(0.10, 0.15),
    Offset(0.35, 0.13),
    Offset(0.65, 0.18),
    Offset(0.85, 0.20),
  ];
}
