import "dart:io";

void room(); {

var room1 = Room('You are in a dark room.', {});
var room2 = Room('You are in a bright room.', {});
var room3 = Room('You are in a mysterious room.', {});
var room4 = Room('You are in a cozy room.', {});

room1.exits = {'north': room4, 'east': room2};
room2.exits = {'west': room1, 'east': room3};
room3.exits = {'west': room2, 'east': room4};
room4.exits = {'south': room1, 'east': room3};

}