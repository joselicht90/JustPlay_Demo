import 'dart:math';
import 'package:injectable/injectable.dart';
import 'package:just_play_demo/data/models/game.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

@lazySingleton
class GamesRepository {
  final rnd = Random();

  String _getRandomText() => loremIpsum(
        words: 4,
        initWithLorem: true,
      );

  //This info will be fetched from a real API
  Future<List<Game>> getGames() async {
    final games = [
      Game(
        id: 0,
        locationDescription: _getRandomText(),
        startTime: DateTime.now().add(const Duration(hours: 5)),
        maxPlayers: 20,
        joinedPlayers: 12,
        price: rnd.nextInt(20 - 10).toDouble(),
        image: 'assets/images/placeholder_1.jpeg',
      ),
      Game(
        id: 1,
        locationDescription: _getRandomText(),
        startTime: DateTime.now().add(const Duration(hours: 6)),
        maxPlayers: 23,
        joinedPlayers: 11,
        price: rnd.nextInt(20 - 10).toDouble(),
        image: 'assets/images/placeholder_2.jpeg',
      ),
      Game(
        id: 2,
        locationDescription: _getRandomText(),
        startTime: DateTime.now().add(const Duration(hours: 7)),
        maxPlayers: 8,
        joinedPlayers: 4,
        price: rnd.nextInt(20 - 10).toDouble(),
        image: 'assets/images/placeholder_3.jpeg',
      ),
      Game(
        id: 3,
        locationDescription: _getRandomText(),
        startTime: DateTime.now().add(const Duration(hours: 8)),
        maxPlayers: 5,
        joinedPlayers: 4,
        price: rnd.nextInt(20 - 10).toDouble(),
        image: 'assets/images/placeholder_4.jpeg',
      ),
      Game(
        id: 4,
        locationDescription: _getRandomText(),
        startTime: DateTime.now().add(const Duration(hours: 27)),
        maxPlayers: 25,
        joinedPlayers: 20,
        price: rnd.nextInt(20 - 10).toDouble(),
        image: 'assets/images/placeholder_5.jpeg',
      ),
      Game(
        id: 5,
        locationDescription: _getRandomText(),
        startTime: DateTime.now().add(const Duration(hours: 32)),
        maxPlayers: 12,
        joinedPlayers: 11,
        price: rnd.nextInt(20 - 10).toDouble(),
        image: 'assets/images/placeholder_6.jpeg',
      ),
      Game(
        id: 6,
        locationDescription: _getRandomText(),
        startTime: DateTime.now().add(const Duration(hours: 40)),
        maxPlayers: 11,
        joinedPlayers: 5,
        price: rnd.nextInt(20 - 10).toDouble(),
        image: 'assets/images/placeholder_7.jpeg',
      ),
      Game(
        id: 7,
        locationDescription: _getRandomText(),
        startTime: DateTime.now().add(const Duration(hours: 41)),
        maxPlayers: 15,
        joinedPlayers: 4,
        price: rnd.nextInt(20 - 10).toDouble(),
        image: 'assets/images/placeholder_8.jpeg',
      ),
    ];

    return games;
  }
}
