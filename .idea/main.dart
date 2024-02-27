import 'dart:io';

class Room {
  String description;
  Map<String, Room> exits;

  Room(this.description, this.exits);
}

class Player {
  Room currentRoom;

  Player(this.currentRoom);
}

void main() {
  // Herbergi
  var room1 = Room('You are in a dark room.', {});
  var room2 = Room('You are in a bright room.', {});
  var room3 = Room('You are in a mysterious room.', {});
  var room4 = Room('You are in a cozy room.', {});

  // Herbergi tengd við útganga
  room1.exits = {'north': room4, 'east': room2};
  room2.exits = {'east': room3, 'west': room1};
  room3.exits = {'west': room1, 'east': room4};
  room4.exits = {'north': room2, 'east': room3};

  var DrDart = Player(room1);

  print('Welcome to the adventures of DrDart adventure game!');

  while (true) {
    print('\n${DrDart.currentRoom.description}');
    stdout.write('Choose your next move, type "exit" to quit, "North", "South", "East", "West" to enter rooms: ');
    var moveOut = stdin.readLineSync()?.toLowerCase() ?? '';

    if (moveOut == 'exit') {
      print('I thought so!');
      break;
    } else if (moveOut == 'open door') {
      if (DrDart.currentRoom == room3) {
        print('You opened the door and are outside now!');
        break;
      } else {
        print('There is no door to open here.');
      }
    } else if (DrDart.currentRoom.exits.containsKey(moveOut)) {
      DrDart.currentRoom = DrDart.currentRoom.exits[moveOut]!;
      switch (moveOut) {
        case 'north':
        case 'south':
        case 'east':
        case 'west':
          print('There is no exit in that direction. Try again.');
          break;
        default:
          print('Invalid move. Try again.');
      }
    }
  }
}
