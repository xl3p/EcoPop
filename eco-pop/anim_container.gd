extends ScrollContainer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $GridContainer.is_anim_touched == null:
		self.set_process_input(true)
		self.set_process_unhandled_input(true)
		vertical_scroll_mode = ScrollContainer.SCROLL_MODE_AUTO
	else:
		self.set_process_input(false)
		self.set_process_unhandled_input(false)
		vertical_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
