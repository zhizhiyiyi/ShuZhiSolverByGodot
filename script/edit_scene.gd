extends Node2D


func _on_create_button_pressed() -> void:
	# 清空内容
	clearContainter($GridContainer)
	# 重绘格子
	repaintGridContainer()
	# 清空数字条
	clearContainter($UpNumLabelGridContainer)
	clearContainter($DownNumLabelGridContainer)
	# 重绘数字条
	repaintNumLabel()
	
func _on_create_row_slider_value_changed(value: float) -> void:
	var sliderValue : int = $CreateRowSlider.value
	$CreateRowSlider/RowLabel.text = str(sliderValue) + "行"
	
func _on_create_col_slider_value_changed(value: float) -> void:
	var sliderValue : int = $CreateColSlider.value
	$CreateColSlider/ColLabel.text = str(sliderValue) + "列"

func clearContainter(currContainer : GridContainer) -> void:
	for child in currContainer.get_children():
		currContainer.remove_child(child)

func repaintGridContainer() -> void:
	$GridContainer.set_size(Vector2(750, 500))
	# 填充新内容
	var gridSize := Vector2($CreateRowSlider.value, $CreateColSlider.value)
	var gapSize : int = 3
	var cellSizeByY : int = $GridContainer.size.y / $CreateRowSlider.value - gapSize
	var cellSizeByX : int = $GridContainer.size.x / $CreateColSlider.value - gapSize
	var cellMinSize : int = cellSizeByY if cellSizeByY <= cellSizeByX else cellSizeByX
	var cellSize := Vector2(cellMinSize, cellMinSize)
	$GridContainer.columns = $CreateColSlider.value
	for i in range(gridSize.x * gridSize.y):
		var cellInstance = load("res://scene/color_rect.tscn").instantiate()
		cellInstance.custom_minimum_size = cellSize
		$GridContainer.add_child(cellInstance)
	
func repaintNumLabel() -> void:
	$UpNumLabelGridContainer.set_size(Vector2(750, 253))
	$UpNumLabelGridContainer.columns = $CreateColSlider.value
	var upNumLabelWidth : int = $UpNumLabelGridContainer.size.x / $CreateColSlider.value
	for i in range($CreateColSlider.value):
		var newLabel := Label.new()
		newLabel.set_size(Vector2(upNumLabelWidth, $UpNumLabelGridContainer.size.y))
		newLabel.text = "test00000000000"
		newLabel
		$UpNumLabelGridContainer.add_child(newLabel)
