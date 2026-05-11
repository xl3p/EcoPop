extends Area2D

# Zone touch
var is_in_zone = false
var food = ["Кузнечик", "Бабочка"]
var location = "Meadow"
var is_hungry = false
var is_touched = false
var is_alive = false


@onready var ConditionLog = $"ConditionLog"
@onready var HungryLog = $ConditionLog/Hungry
@onready var LiveLog = $ConditionLog/UnLivble

# self params 
var base_pos = 0

func _ready() -> void:
	base_pos = get_parent().position 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func check_alive(Location_Name):
	var points = 0
	
	if (is_hungry):
		ConditionLog.visible = true
		HungryLog.visible = true
	else:
		points += 1
		ConditionLog.visible = false
		HungryLog.visible = false
	
	if (Location_Name != location):
		ConditionLog.visible = true
		LiveLog.visible = true
		
	else:
		points += 1
		LiveLog.visible = false

	if points == 2:
		is_alive = true
	else:
		is_alive = false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventScreenDrag):
		if get_parent().get_parent().get_parent().is_anim_touched == self or get_parent().get_parent().get_parent().is_anim_touched == null: 
			get_parent().top_level = true
			get_parent().position = event.position
			
			is_touched = true
			get_parent().z_index = 1000
			get_parent().get_parent().get_parent().is_anim_touched = self
			
	if (event is InputEventScreenTouch):
		if (event.pressed == false):
			get_parent().get_parent().get_parent().is_anim_touched = null
			is_touched = false
			if (is_in_zone == false):
				get_parent().top_level = false
				get_parent().position = base_pos 
