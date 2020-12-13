extends Node2D


var direction_vector
var distance



func _physics_process(delta):
	for attractor in $Bodies.get_children():
		for attracted in $Bodies.get_children():
			if attracted != attractor:
				direction_vector = attractor.position - attracted.position
				distance = sqrt(pow(direction_vector.x, 2) + pow(direction_vector.y, 2))
				attracted.velocity += direction_vector.normalized() * attractor.mass / distance
				attracted.move_and_slide(attracted.velocity)
