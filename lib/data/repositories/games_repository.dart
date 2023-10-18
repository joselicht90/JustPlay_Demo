import 'dart:math';
import 'package:injectable/injectable.dart';
import 'package:just_play_demo/data/models/game.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

@lazySingleton
class GamesRepository {
  final rnd = Random();

  String _getRandomLocationDescription() => loremIpsum(
        words: 4,
        initWithLorem: true,
      );

  String _getRandomDescription() => loremIpsum(
        paragraphs: 1,
        words: 30,
        initWithLorem: true,
      );

  //This info will be fetched from a real API
  Future<List<Game>> getGames() async {
    final games = [
      Game(
        id: 0,
        locationDescription: _getRandomLocationDescription(),
        startTime: DateTime.now().add(const Duration(hours: 5)),
        maxPlayers: 20,
        joinedPlayers: 12,
        price: rnd.nextInt(20 - 10).toDouble(),
        image: 'assets/images/placeholder_1.jpeg',
        description: _getRandomDescription(),
      ),
      Game(
        id: 1,
        locationDescription: _getRandomLocationDescription(),
        startTime: DateTime.now().add(const Duration(hours: 6)),
        maxPlayers: 23,
        joinedPlayers: 11,
        price: rnd.nextInt(20 - 10).toDouble(),
        image: 'assets/images/placeholder_2.jpeg',
        description: _getRandomDescription(),
      ),
      Game(
        id: 2,
        locationDescription: _getRandomLocationDescription(),
        startTime: DateTime.now().add(const Duration(hours: 7)),
        maxPlayers: 8,
        joinedPlayers: 4,
        price: rnd.nextInt(20 - 10).toDouble(),
        image: 'assets/images/placeholder_3.jpeg',
        description: _getRandomDescription(),
      ),
      Game(
        id: 3,
        locationDescription: _getRandomLocationDescription(),
        startTime: DateTime.now().add(const Duration(hours: 8)),
        maxPlayers: 5,
        joinedPlayers: 4,
        price: rnd.nextInt(20 - 10).toDouble(),
        image: 'assets/images/placeholder_4.jpeg',
        description: _getRandomDescription(),
      ),
      Game(
        id: 4,
        locationDescription: _getRandomLocationDescription(),
        startTime: DateTime.now().add(const Duration(hours: 27)),
        maxPlayers: 25,
        joinedPlayers: 20,
        price: rnd.nextInt(20 - 10).toDouble(),
        image: 'assets/images/placeholder_5.jpeg',
        description: _getRandomDescription(),
      ),
      Game(
        id: 5,
        locationDescription: _getRandomLocationDescription(),
        startTime: DateTime.now().add(const Duration(hours: 32)),
        maxPlayers: 12,
        joinedPlayers: 11,
        price: rnd.nextInt(20 - 10).toDouble(),
        image: 'assets/images/placeholder_6.jpeg',
        description: _getRandomDescription(),
      ),
      Game(
        id: 6,
        locationDescription: _getRandomLocationDescription(),
        startTime: DateTime.now().add(const Duration(hours: 40)),
        maxPlayers: 11,
        joinedPlayers: 5,
        price: rnd.nextInt(20 - 10).toDouble(),
        image: 'assets/images/placeholder_7.jpeg',
        description: _getRandomDescription(),
      ),
      Game(
        id: 7,
        locationDescription: _getRandomLocationDescription(),
        startTime: DateTime.now().add(const Duration(hours: 41)),
        maxPlayers: 15,
        joinedPlayers: 4,
        price: rnd.nextInt(20 - 10).toDouble(),
        image: 'assets/images/placeholder_8.jpeg',
        description: _getRandomDescription(),
      ),
    ];

    return games;
  }
}
