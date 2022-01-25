import 'package:flutter/material.dart';

enum AlertType {
  error, success, info, warning
}

class AlertBuilder extends StatelessWidget {

  final String text;
  final AlertType? type;
  final IconData? icon;

  AlertBuilder(this.text, {this.type = AlertType.error, this.icon});

  @override
  Widget build(BuildContext context) {

    AlertSettings settings = this.settings();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
          color: settings.background,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: settings.border, width: 2)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon ?? settings.icon),
          const SizedBox(width: 15),
          Flexible(child: Text(text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), softWrap: true))
        ],
      ),
    );
  }

  AlertSettings settings() {

    switch (type) {
      case AlertType.success:
        return AlertSettings(Colors.green.withOpacity(0.3), Colors.green.withOpacity(0.5), Icons.check);
      case AlertType.info:
        return AlertSettings(Colors.blue.withOpacity(0.3), Colors.blue.withOpacity(0.5), Icons.info);
      case AlertType.warning:
        return AlertSettings(Colors.orange.withOpacity(0.3), Colors.orange.withOpacity(0.5), Icons.warning);
      default:
        return AlertSettings(Colors.red.withOpacity(0.3), Colors.red.withOpacity(0.5), Icons.priority_high);
    }

  }
}

class AlertSettings {

  final Color background;
  final Color border;
  final IconData icon;

  AlertSettings(this.background, this.border, this.icon);

}
