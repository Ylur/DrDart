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



// Tegund herberja og númer.
  var room1 = Room('You are in a dark room.', {});
  var room2 = Room('You are in a bright room.', {});
  var room3 = Room('You are in a mysterious room.', {});
  var room4 = Room('You are in a cozy room.', {});

// Exits.
  room1.exits = {'north': room4, 'east': room2};
  room2.exits = {'east': room3, 'west': room1};
  room3.exits = {'west': room1, 'east': room4};
  room4.exits = {'north': room2, 'east': room3};

//
  room2.exits['north'] = room3;
  room1.exits['south'] = room2;
  room3.exits['west'] = room4;
  room4.exits['west'] = room1;




  var DrDart = Player(room1);

  print('Welcome to the adventures of DrDart adventure game!');

  while (true) {
    print('\n${DrDart.currentRoom.description}');
    stdout.write('Choose your next move (type exit to quit): ');
    var moveOut = stdin.readLineSync()?.toLowerCase() ?? '';

    if (moveOut == 'exit') {
      print('I thought so!');
      break;
    } else
    if (moveOut == 'Open door') {
      print('You opened the door and are outside now!');
      break;
    }




    if (DrDart.currentRoom.exits.containsKey(moveOut)) {
      DrDart.currentRoom = DrDart.currentRoom.exits[moveOut]!;
    } else {
      print('Invalid move. Try again.');
    }
  }
}
