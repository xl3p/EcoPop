extends Node
# Добавьте этот скрипт как child к ScrollContainer

var _scroll_disabled: bool = true
var _previous_scrollbar_value: float = 0.0
var _scrollbar: ScrollBar

@onready var _scroll_container: ScrollContainer = get_parent()

func _ready():
	# Для отладки на ПК не нужен
	if OS.get_name() != "Android" and OS.get_name() != "iOS":
		queue_free()
		return
	
	_scroll_container.scroll_started.connect(_on_scroll_started)
	_scroll_container.scroll_ended.connect(_on_scroll_ended)
	
	# Находим вертикальную полосу прокрутки (или горизонтальную)
	for c in _scroll_container.get_children():
		if c is VScrollBar:
			c.value_changed.connect(_on_scrollbar_changed)
			_scrollbar = c
			return

func _on_scroll_started() -> void:
	_scroll_disabled = false

func _on_scroll_ended() -> void:
	_scroll_disabled = true
	_previous_scrollbar_value = _scrollbar.value

func _on_scrollbar_changed(_value: float) -> void:
	if _scroll_disabled:
		_scrollbar.value = _previous_scrollbar_value
