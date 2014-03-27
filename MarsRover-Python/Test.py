#!/usr/bin/python

from CommandCenter import CommandCenter 
from CommandCenter import Rover 

# Curiosity should be at (2, 2)
nasa = CommandCenter()
nasa.rover = Rover([0, 0], "N")
nasa.planet.obstacles = []
instructions = "ffrff"
nasa.send_instructions(instructions)

# Curiosity should be at (0, 2)
nasa.rover = Rover([0, 0], "N")
nasa.planet.obstacles = []
instructions = "ffrffffffffff"
nasa.send_instructions(instructions)

# Curiosity should be at (1, 2) and report collision
nasa.rover = Rover([0, 0], "N")
nasa.planet.obstacles = [ [2, 2], [4, 4] ]
instructions = "ffrffffffffff"
nasa.send_instructions(instructions)
