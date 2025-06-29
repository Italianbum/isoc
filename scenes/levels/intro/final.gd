extends Node

const PAUSE_MENU: PackedScene = preload("res://scenes/ui/pause_menu/pause_menu.tscn")

@onready var manager_label: Label = %ManagerLabel
@onready var disagree_button: Button = $DisagreeButton
@onready var agree_button: Button = $AgreeButton


func _ready() -> void:
	disagree_button.pressed.connect((_on_button_pressed.bind(false)))
	disagree_button.pressed.connect((_on_button_pressed.bind(true)))
	determine_cut_scene()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		add_child(PAUSE_MENU.instantiate())
		get_tree().root.set_input_as_handled()
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func determine_cut_scene() -> void:
	if GameStates.day:
		GameStates.manager_count_good += 1
		_good_job()
	else:
		GameStates.manager_count_bad += 1
		_bad_job()


func _good_job() -> void:
	var tween = create_tween()
	var audio_time: float

	manager_label.visible_ratio = 0.0
	match GameStates.manager_count_good:
		2:
			ManageDialogue.play_pill_1_monika()
		3:
			ManageDialogue.play_pill_2_monika()
		4:
			ManageDialogue.play_pill_3_monika()
		5:
			ManageDialogue.play_pill_4_monika()
		6:
			ManageDialogue.play_pill_5_monika()
			audio_time = 5.87
		7:
			ManageDialogue.play_agree_monika()
			audio_time = 18.50
		8:
			ManageDialogue.play_disagree_monika()
			audio_time = 23.41

	manager_label.text = ManageDialogue.manager_text[GameStates.manager_count_good]

	tween.tween_property(manager_label,"visible_ratio", 1.0, audio_time)
	await tween.finished
	await get_tree().create_timer(2.0).timeout

	if GameStates.manager_count_good in [7,8]:
		await get_tree().create_timer(4.0).timeout
		ScreenTransition.transition_to_scene("res://scenes/ui/main_menu/main_menu.tscn")
	else:
		agree_button.visible = true
		disagree_button.visible = true


func _bad_job() -> void:
	var tween = create_tween()
	var audio_time: float

	manager_label.visible_ratio = 0.0
	match GameStates.manager_count_bad:
		9:
			ManageDialogue.play_saving_1_monika()
		10:
			ManageDialogue.play_saving_2_monika()
		11:
			ManageDialogue.play_saving_3_monika()
		12:
			ManageDialogue.play_saving_4_monika()
			audio_time = 20.50


	manager_label.text = ManageDialogue.manager_text[GameStates.manager_count_bad]

	tween.tween_property(manager_label,"visible_ratio", 1.0, audio_time)
	await tween.finished
	await get_tree().create_timer(6.0).timeout
	ScreenTransition.transition_to_scene("res://scenes/ui/main_menu/main_menu.tscn")


func _on_button_pressed(button: bool) -> void:
	agree_button.visible = false
	disagree_button.visible = false
	if button:
		GameStates.manager_count_good += 1
	else:
		GameStates.manager_count_good += 2
	_good_job()
