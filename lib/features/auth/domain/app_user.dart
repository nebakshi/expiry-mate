import 'package:equatable/equatable.dart';

/// PLAN §8.1 — users document.
class AppUser extends Equatable {
  const AppUser({
    required this.uid,
    this.name,
    this.email,
    this.photoUrl,
    required this.authProvider,
    this.isGuest = false,
    this.isPremium = false,
  });

  final String uid;
  final String? name;
  final String? email;
  final String? photoUrl;
  final String authProvider; // google | apple | guest
  final bool isGuest;
  final bool isPremium;

  Map<String, dynamic> toFirestore(DateTime now) => {
        'uid': uid,
        'name': name,
        'email': email,
        'photoUrl': photoUrl,
        'authProvider': authProvider,
        'isGuest': isGuest,
        'isPremium': isPremium,
        'updatedAt': now.toIso8601String(),
      };

  @override
  List<Object?> get props =>
      [uid, name, email, photoUrl, authProvider, isGuest, isPremium];
}
