import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onToggleDarkMode;

  const SettingsScreen({
    super.key,
    required this.isDarkMode,
    required this.onToggleDarkMode,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationEnabled = true;
  String _notifyTime = '오전 8:00';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _notificationEnabled = prefs.getBool('notificationEnabled') ?? true;
      _notifyTime = prefs.getString('notifyTime') ?? '오전 8:00';
      _isLoading = false;
    });
  }

  Future<void> _saveNotificationEnabled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notificationEnabled', value);
  }

  Future<void> _saveNotifyTime(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('notifyTime', value);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                '추천 알림 받기',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('매일 추천 종목 알림을 받습니다.'),
              value: _notificationEnabled,
              onChanged: (value) async {
                setState(() {
                  _notificationEnabled = value;
                });
                await _saveNotificationEnabled(value);
              },
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                '추천 알림 시간',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(_notifyTime),
              trailing: const Icon(Icons.chevron_right),
              onTap: () async {
                final selected = await showTimePicker(
                  context: context,
                  initialTime: const TimeOfDay(hour: 8, minute: 0),
                );

                if (selected != null) {
                  final hour = selected.hour;
                  final minute = selected.minute.toString().padLeft(2, '0');
                  final period = hour < 12 ? '오전' : '오후';
                  final displayHour = hour == 0
                      ? 12
                      : hour > 12
                          ? hour - 12
                          : hour;

                  final formatted = '$period $displayHour:$minute';

                  setState(() {
                    _notifyTime = formatted;
                  });

                  await _saveNotifyTime(formatted);
                }
              },
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                '다크모드',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('어두운 테마를 사용합니다.'),
              value: widget.isDarkMode,
              onChanged: (value) async {
                widget.onToggleDarkMode(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
