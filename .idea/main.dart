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
  var room1 = Room('You are in a dark room.', {});
  var room2 = Room('You are in a bright room.', {});
  var room3 = Room('You are in a mysterious room.', {});
  var room4 = Room('You are in a cozy room.', {});

  room1.exits = {'north': room4, 'east': room2};
  room2.exits = {'west': room1, 'east': room3};
  room3.exits = {'west': room2, 'east': room4};
  room4.exits = {'south': room1, 'east': room3};

  var drDart = Player(room1);

  print('Welcome to the adventures of DrDart adventure game!');

  while (true) {
    print('\n${drDart.currentRoom.description}');
    stdout.write(
        'Choose your next move, type "exit" to quit, "open door" to leave, or direction (North/South/East/West) to move: ');
    var moveOut = stdin.readLineSync()?.toLowerCase() ?? '';
    if (moveOut == 'exit') {
      print('Thank you for playing!');
      return;

      } else if (moveOut == 'open door') {
        if (drDart.currentRoom == room2) {
          print('You hear a voice calling for help from another room!');
        } else if (drDart.currentRoom == room3) {
          print('You opened the door and are outside now!');
          break;
        } else {
          print('There is no door to open here.');
        }
      } else if (['north', 'south', 'east', 'west'].contains(moveOut)) {
        if (drDart.currentRoom.exits.containsKey(moveOut)) {
          drDart.currentRoom = drDart.currentRoom.exits[moveOut]!;
        } else {
          print('There is no exit in that direction. Try again.');
        }
      } else {
        print('Invalid input. Try again.');
      }
    }
  }
