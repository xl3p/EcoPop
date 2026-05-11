extends TouchScreenButton

@onready var GameScene = $"../../../Node2D"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	if $"../..".visible == true:
		Global.current_location_id = 1
		Global.current_location_name = "Lake"
		
		GameScene.visible = true
		GameScene.separate_zones()
		GameScene.separate_anims()
		
		$"../..".visible = false
