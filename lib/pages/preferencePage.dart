import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class preferencePage extends StatefulWidget{
  const preferencePage({super.key});
  @override
  State<preferencePage> createState() => _preferencePage();
}


class _preferencePage extends State<preferencePage>{

  bool _isResetEnabled = false;
  Future<void>_loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isResetEnabled = prefs.getBool('isResetEnabled') ?? false;
    });
  }
  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isResetEnabled', _isResetEnabled);
    }
  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }
  @override
  void dispose() {
    super.dispose();
    _savePreferences();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Preferencias'),),
      body: Center(
        child: Column(
          children: [
            Text('Checkbox de Reseteo'),
            Checkbox(value: _isResetEnabled, onChanged: (bool? value) {
              setState(() {
                _isResetEnabled = value!;
              });
            }),
          ],
        )
      ),
    );
  }
}