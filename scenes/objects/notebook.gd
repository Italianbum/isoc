extends Node2D


@onready var left_button: Button = $LeftButton
@onready var right_button: Button = $RightButton
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var page_0: MarginContainer = %Page0
@onready var page_1: Control = %Page1
@onready var page_2: MarginContainer = %Page2
@onready var page_3: Control = %Page3
@onready var page_4: Control = %Page4

var current_page: int
var pages: Array[StringName] = [&'page_0', &'page_1', &'page_2', &'page_3', &'page_4']

func _ready() -> void:
	left_button.pressed.connect((_on_button_pressed).bind(false))
	right_button.pressed.connect((_on_button_pressed).bind(true))
	left_button.disabled = true
	animated_sprite_2d.animation = pages[0]
	current_page = 0
	_show_page()

func _show_page() -> void:
	match current_page:
		0:
			page_0.visible = true
		1:
			page_1.visible = true
		2:
			page_2.visible = true
		3:
			page_3.visible = true
		4:
			page_4.visible = true

func _on_button_pressed(button: bool) -> void:
	left_button.disabled = true
	right_button.disabled = true
	page_0.visible = false
	page_1.visible = false
	page_2.visible = false
	page_3.visible = false
	page_4.visible = false

	if button:
		current_page = clampi(current_page + 1, 0, 4)
		animated_sprite_2d.play()
		await animated_sprite_2d.animation_finished
		animated_sprite_2d.animation = pages[current_page]
	else:
		current_page = clampi(current_page - 1, 0, 4)
		animated_sprite_2d.play_backwards(pages[current_page])
		await animated_sprite_2d.animation_finished
		animated_sprite_2d.animation = pages[current_page]

	if current_page == 0:
		right_button.disabled = false
	elif current_page == 4:
		left_button.disabled = false
	else:
		left_button.disabled = false
		right_button.disabled = false

	_show_page()
