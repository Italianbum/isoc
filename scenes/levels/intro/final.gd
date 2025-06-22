extends Node

@onready var manager_label: Label = %ManagerLabel



func _ready() -> void:
	determine_cut_scene()

func determine_cut_scene() -> void:
	if GameStates.day:
		GameStates.manager_count_good += 1
		_good_job()
	else:
		GameStates.manager_count_bad -= 1
		_bad_job()


func _good_job() -> void:
	var tween = create_tween()

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
		7:
			ManageDialogue.play_agree_monika()
	manager_label.text = ManageDialogue.manager_text[GameStates.manager_count_good]

	tween.tween_property(manager_label,"visible_ratio", 1.0, 26)
	await tween.finished
	await get_tree().create_timer(2.0).timeout

	if GameStates.manager_count_good == 6:
		determine_cut_scene()
	else:
		ScreenTransition.transition_to_scene("res://scenes/ui/main_menu/main_menu.tscn")

func _bad_job() -> void:
	var tween = create_tween()

	manager_label.visible_ratio = 0.0
	match GameStates.manager_count_good:
		9:
			ManageDialogue.play_saving_1_monika()
		10:
			ManageDialogue.play_saving_2_monika()
		11:
			ManageDialogue.play_saving_3_monika()
		12:
			ManageDialogue.play_saving_4_monika()
		13:
			ManageDialogue.play_saving_4_monika()
	manager_label.text = ManageDialogue.manager_text[GameStates.manager_count_bad]

	tween.tween_property(manager_label,"visible_ratio", 1.0, 23.49)
	await tween.finished
	await get_tree().create_timer(2.0).timeout
	ScreenTransition.transition_to_scene("res://scenes/ui/main_menu/main_menu.tscn")
