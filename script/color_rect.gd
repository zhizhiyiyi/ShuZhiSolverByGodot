extends ColorRect

func changeColor() -> void:
	if color == Color.WHITE:
		color = Color.BLACK
	else:
		color = Color.WHITE

func _ready() -> void:
	color = Color.WHITE
	mouse_filter = Control.MOUSE_FILTER_STOP


func _on_mouse_entered() -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		changeColor()

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		changeColor()
