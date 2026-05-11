extends Control

@onready var Zones_Nodes = {"Forest": $"Forest",
	 						"Lake": $"Lake",
 							"Meadow": $"Meadow"}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func separate_zones(visZone):
	Zones_Nodes.get(visZone).visible = true
