extends RigidBody2D

@export var sceneName = "LoseScreen"

func _on_FallArea_body_entered(body):
	if body.name == "Player":
		Global.lives -= 1
		if Global.lives <= 0:
			Global.lives = 3
			get_tree().call_deferred("change_scene_to_file", "res://scenes/" + sceneName + ".tscn")
		else:
			get_tree().call_deferred("reload_current_scene")
