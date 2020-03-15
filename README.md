<p align="center"><img src="https://miro.medium.com/max/3200/1*ogNimrTnf_COR7ImVFr3-A.png" width="400"></p>

### 🔥 Emergency Flutter

Emergency mobile application for fast response built with Flutter which uses flutter_sms and geolocator plugins to send 
messages to responders and determine the location of the sender.

### 🤘 Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### 🎈 Dependencies

```yaml
environment:
  sdk: ">=2.1.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter
    
  cupertino_icons: ^0.1.2
  geolocator: ^5.1.5
  flutter_sms: ^1.1.0
  device_info: ^0.4.1+1
```

### ⚙️ Configuration

In <code>lib/main.dart</code>, you can customize the recipient and the message.

```dart
sendSms() async {
  ...
    
  String message = 'An emergency alert was triggered in ${androidInfo.brand} device. Last known location is at $location';
  List<String> recipient = ['09985986027', '09183242541']; //Emergency Hotline Numbers
    
  sendMessage(message, recipient); //Send the message
}
```

### 🛠️ Building

To build, visit the Flutter [documentation](https://flutter.dev).

### 💻 Developer

Developed by Isaac [(facebook.com/isaacdarcilla)](https://web.facebook.com/isaacdarcilla)

### ✨ Support

Fork or star this repository for support.

### 🚫 No Scammers
