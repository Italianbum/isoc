extends Node2D

const PAUSE_MENU: PackedScene = preload("res://scenes/ui/pause_menu/pause_menu.tscn")
@onready var notebook: Node2D = $Notebook
@onready var patient_image: AnimatedSprite2D = $PatientImage
@onready var doctor_label: Label = %DoctorLabel
@onready var patient_label: Label = %PatientLabel


var patient_count: int
var chat_options: Array
var chat_count: int = 0
var current_health: int
var current_score: int = GameStates.score


func _ready() -> void:
	_build_patient_list()
	notebook.sig_end_day.connect(_on_end_day)
	notebook.play_scene.connect(_on_play_scene)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		add_child(PAUSE_MENU.instantiate())
		get_tree().root.set_input_as_handled()
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _build_patient_list() -> void:
	GameStates.day_count += 1
	if GameStates.first_run:
		GameStates.current_act = ChatOptions.key_dialogue_act_one
		GameStates.current_patients = {
			"patient_" + str(GameStates.current_patients.size() + 1) : PatientBuilder.create_patient(),
			"patient_" + str(GameStates.current_patients.size() + 2): PatientBuilder.create_patient(),
			"patient_" + str(GameStates.current_patients.size() + 3): PatientBuilder.create_patient()
		}
		GameStates.first_run = false
		GameStates.patient_count = 3
	else:
		if GameStates.day_count in [2,4,6]:
			GameStates.add_key_patient()
			if GameStates.day_count == 6:
				GameStates.current_act = ChatOptions.key_dialogue_act_two
		elif GameStates.patient_count > 7:
			GameStates.current_act = ChatOptions.key_dialogue_act_three
		else:
			GameStates.current_patients["patient_" + str(GameStates.current_patients.size() + 1)] =  PatientBuilder.create_patient()
			GameStates.patient_count += 1
	notebook.set_cases()


func _set_patient_image() -> void:
	patient_image.modulate = Color(0.0,0.0,0.0,0.0)
	patient_image.visible = true
	var tween = create_tween()


	match notebook.name_label.text:
		"Sarah Queen":
			patient_image.animation = &"p2"
		"Zbychu Nowak":
			patient_image.animation = &"p1"
		"Nathan Dedrick":
			patient_image.animation = &"p3"

	tween.tween_property(patient_image,"modulate", Color(1.0,1.0,1.0,1.0), 3.0)



func _fade_patient_image() -> void:
	var tween = create_tween()
	tween.tween_property(patient_image,"modulate", Color(0.0,0.0,0.0,0.0), 3.0)


func _on_play_scene() -> void:
	match notebook.name_label.text:
		"Zbychu Nowak":
			notebook.enable_treat_buttons()
		"Nathan Dedrick":
			notebook.enable_treat_buttons()
		"Sarah Queen":
			notebook.enable_treat_buttons()
	_set_patient_image()

func _on_end_day() -> void:
	if GameStates.score > current_score:
		GameStates.day = true
	else:
		GameStates.day = false
	if GameStates.day_count in [2,4,6,8] or GameStates.day_count > 8:
		ScreenTransition.transition_to_scene("uid://cc335cp3b3clc")
	else:
		ScreenTransition.transition_to_scene("uid://c7y7kh8k4adgv")
