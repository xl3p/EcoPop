extends Area2D

var Anims = []
var Areas = []
const Location_Name = "Meadow"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func correct_anims():
	for area in Areas:
		if area.food != null:
			area.is_hungry = true
			for anim in Anims:
				if anim in area.food:
					var indx = Anims.find(anim)
					if Areas.get(indx).is_alive:
						area.is_hungry = false
		area.check_alive(Location_Name)
			
			

func delete_anim(anim):
	var indx = Anims.find(anim)
	if (indx != -1):
		self.Anims.pop_at(indx)
		
func delete_area(area):
	var indx = Areas.find(area)
	if (indx != -1):
		self.Areas.pop_at(indx)


func get_AnPoints():
	correct_anims()
	var res = 0
	
	for area in Areas:
		if  area.is_alive:
			res += 1
		
	return res

func _on_area_entered(area: Area2D) -> void:
	if $"..".visible == true and area.get_parent().visible == true:
		if area.is_touched:
			area.is_in_zone = true
			
			Areas.append(area)
			Anims.append(area.get_parent().name)
			
			correct_anims()
			
			$"../../..".sum_points()

func _on_area_exited(area: Area2D) -> void:
	if visible:
		if area.is_touched:
			area.is_in_zone = false
			delete_anim(area.get_parent().name)
			delete_area(area)
			
			area.ConditionLog.visible = false
			area.HungryLog.visible = false
			area.LiveLog.visible = false
	
			correct_anims()
			
			$"../../..".sum_points()
