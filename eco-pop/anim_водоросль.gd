extends Control

@onready var area = $Area2D

func _input(event: InputEvent):
	if event is InputEventScreenTouch and event.pressed:
		if _is_point_over_area(event.position):
			print("Касание по Area2D!")
			# Здесь просто вызываем нужное действие
			_handle_area_tap()

func _is_point_over_area(point: Vector2) -> bool:
	# Получаем глобальную позицию Area2D
	var area_pos = area.global_position
	var area_size = Vector2(32, 32)  # Укажите реальный размер вашей области
	
	# Простая проверка: попала ли точка в прямоугольник области
	if point.x >= area_pos.x and point.x <= area_pos.x + area_size.x:
		if point.y >= area_pos.y and point.y <= area_pos.y + area_size.y:
			return true
	return false

func _handle_area_tap():
	print("Область нажата! Выполняем действие...")
	# Добавьте сюда код, который должен выполняться при нажатии
	# Например: 
	# get_tree().change_scene_to_file("res://level2.tscn")
	# queue_free()
	# $AnimationPlayer.play("tap_animation")
