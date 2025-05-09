import 'package:flutter/material.dart';
import '../widgets/utils.dart';

class FlutterAbsensiMainButton extends StatelessWidget {
  final Function? onTap;
  final String? label;
  final bool? enabled;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? labelColor;

  const FlutterAbsensiMainButton({
    Key? key,
    this.label,
    this.onTap,
    this.icon,
    this.backgroundColor = Utils.mainThemeColor,
    this.iconColor = Colors.white,
    this.labelColor = Colors.white,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Material(
            color: enabled! ? backgroundColor : backgroundColor!.withOpacity(0.5),
            child: InkWell(
              onTap: enabled! ? () => onTap!() : null,
              highlightColor: Colors.white.withOpacity(0.2),
              splashColor: Colors.white.withOpacity(0.1),
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null)
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Icon(icon, color: iconColor, size: 20),
                      ),
                    Text(
                      label!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: labelColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}