extends Node


@onready var manager_label: Label = %ManagerLabel


func _ready() -> void:
	_start_ad()


func _start_ad() -> void:
	var tween = create_tween()

	manager_label.visible_ratio = 0.0
	ManageDialogue.play_ad_monika()
	manager_label.text = ManageDialogue.manager_text[0]

	tween.tween_property(manager_label,"visible_ratio", 1.0, 26)
	await tween.finished
	await get_tree().create_timer(2.0).timeout
	_start_intro()

func _start_intro() -> void:
	var tween = create_tween()

	manager_label.visible_ratio = 0.0
	ManageDialogue.play_intro_monika()
	manager_label.text = ManageDialogue.manager_text[1]

	tween.tween_property(manager_label,"visible_ratio", 1.0, 23.49)
	await tween.finished
	await get_tree().create_timer(2.0).timeout
