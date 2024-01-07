extends CharacterBody2D
class_name Actor
# This class will be the base of the player and the enemy class, from which the both will inherit
# CharacterBody2D is new in Godot 4.0, it was KinematicBody2D in Godot 3.x

# there are many ways to export variables: The @export_category("General") enables this category on the right menu
# we can add variables to this category and re-parameterize it manually in the menu
@export_category("General") 
@export var gravity = 1000.0
@export var max_gravity = 30.0
@export var actual_speed = 300.0
var max_speed2 = 1000.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Godot will automatically run it every frame of the game, typically 30-60 times per second
# Similar to _process, use in characters like player or anything that involves physics, that will collide, detect the ground, etc.
# delta is a value that the engine will give us at each call to this function, and represents the time that has passed since the last frame
# to make our code not dependent on framerate, we need delta - if the game slows down (weak computer), the character will still move at the same speed
func _physics_process(delta: float) -> void:
	
	# this function asks for linear_velocity, of type Vector2
	# Vector2 has two parameters, the first is x-axis, second is y axis - our character will move 300 pixel on x axis
	# velocity is now a node property, and node_and_slide takes no arguments
	# velocity is also a vector, how many pixel we want to move per second in a given direction
	# to get a movement in the amount of pixels we want to move the character in 1 frame we need to multiply "velocity" by delta, but the engine will do that in the move_and_slide method
	# old syntax: var velocity: Vector2 = Vector2(300, 0)
	# in the new Godot 4 syntax, velocity (sebesség) has x and y fields
	velocity.y += gravity * delta
	
	# setting up the maximum gravity - we do not want an infinite big value
	# old syntax takes two lines:
	# if velocity.y > max_gravity: 
	#	velocity.y = max_gravity
	# this max value we want to add into a specific script of the enemy or the main character
	velocity.y = max(velocity.y, max_gravity)
	
	# the move_and_slide() function if a collision occurs (our character hit the wall), tries to slowly move it along the surface that it hit. This will modify the velocity of the character.
	move_and_slide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
