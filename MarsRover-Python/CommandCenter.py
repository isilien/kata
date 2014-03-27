#!/usr/bin/python

import sys

class Rover:

	def __init__(self, coordinate = [0, 0], direction = "N"):
		self.coordinate = coordinate
		self.direction = direction


class Planet:

	def __init__(self, width = 10, height = 10, obstacles = []):
		self.width = width
		self.height = height
		self.obstacles = obstacles


class CommandCenter:
	
	def __init__(self):
		self.rover = Rover()
		self.planet = Planet()

		self.rover_direction = 	{	"r": { "N": "E", "S": "W", "W": "N", "E": "S" },
									"l": { "N": "W", "S": "E", "W": "S", "E": "N" } }

		self.rover_movement = 	{  	"f":	{	"x": { "N":  0, "S":  0, "W": -1, "E":  1 },
										 		"y": { "N":  1, "S": -1, "W":  0, "E":  0 } },
									"b":	{	"x": { "N":  0, "S":  0, "W":  1, "E": -1 },
										 		"y": { "N": -1, "S":  1, "W":  0, "E":  0 } } }

	def check_collision(self, towards):		
		if self.rover.coordinate in self.planet.obstacles:
			# move rover back
			self.move("f") if towards == "b" else self.move("b")
			return True
		else:			
			return False
		
	
	def turn(self, direction):		
		self.rover.direction = self.rover_direction[direction][self.rover.direction]


	def move(self, towards):
		self.rover.coordinate[0] += self.rover_movement[towards]["x"][self.rover.direction] 
		self.rover.coordinate[0] %= self.planet.width
		self.rover.coordinate[1] += self.rover_movement[towards]["y"][self.rover.direction]
		self.rover.coordinate[1] %= self.planet.height

		if self.check_collision(towards):
			print "Houston, we have a problem!"
			print 'Curiosity is at ({0}, {1}), facing {2}'.format(self.rover.coordinate[0], self.rover.coordinate[1], self.rover.direction)
			sys.exit()


	def send_instructions(self, instructions):		
		for instruction in instructions:
			if instruction == "f" or instruction == "b":
				self.move(instruction)
			else:
				self.turn(instruction)
		print 'Curiosity is at ({0}, {1}), facing {2}'.format(self.rover.coordinate[0], self.rover.coordinate[1], self.rover.direction)
