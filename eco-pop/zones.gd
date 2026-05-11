extends Node2D

@onready var Zones_Nodes = {"Forest": $"Control2/Forest",
	 						"Lake": $"Control2/Lake",
 							"Meadow": $"Control2/Meadow"}

@onready var Zones_Areas = {"Forest": $Control2/Forest/Area2D,
							"Lake": $Control2/Lake/Area2D,
							"Meadow": $Control2/Meadow/Area2D}

func separate_zones():
	for zone in Zones_Nodes:
		Zones_Nodes.get(zone).visible = false
	Zones_Nodes.get(Global.current_location_name).visible = true

func separate_anims(show_curAr = true):
	for area in $Control2/Lake/Area2D.Areas:
		area.get_parent().visible = false
		print(area, " Lake ")
	
	for area in $Control2/Meadow/Area2D.Areas:
		area.get_parent().visible = false
		print(area, " Луг ")
		
	for area in $Control2/Forest/Area2D.Areas:
		area.get_parent().visible = false
		print(area, " Forest ")
		
	if show_curAr == true:
		for area in Zones_Areas.get(Global.current_location_name).Areas:
			area.get_parent().visible = true
			print(area, " current ")
			
func sum_points():
	""" Считает кол-во живых обитателей всего """
	var points = $Control2/Lake/Area2D.get_AnPoints() + $Control2/Forest/Area2D.get_AnPoints() + $Control2/Meadow/Area2D.get_AnPoints()
	
	$Label.text = "%d/15" % points
	 
