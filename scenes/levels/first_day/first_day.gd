extends Node2D

const PAUSE_MENU: PackedScene = preload("res://scenes/ui/pause_menu/pause_menu.tscn")
@onready var notebook: Node2D = $Notebook

var patient_count: int
var chat_options: Array
var chat_count: int = 0
var current_health: int
var current_score: int = GameStates.score


func _ready() -> void:
	_build_patient_list()
	notebook.sig_end_day.connect(_on_end_day)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		add_child(PAUSE_MENU.instantiate())
		get_tree().root.set_input_as_handled()
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _build_patient_list() -> void:
	if GameStates.first_run:
		GameStates.current_patients = {
			"patient_" + str(GameStates.current_patients.size() + 1) : PatientBuilder.create_patient(),
			"patient_" + str(GameStates.current_patients.size() + 2): PatientBuilder.create_patient(),
			"patient_" + str(GameStates.current_patients.size() + 3): PatientBuilder.create_patient()
		}
		GameStates.first_run = false
	else:
		GameStates.current_patients["patient_" + str(GameStates.current_patients.size() + 1)] =  PatientBuilder.create_patient()
	notebook.set_cases()


func _on_end_day() -> void:
	if GameStates.score > current_score:
		GameStates.day = true
	else:
		GameStates.day = false
	ScreenTransition.transition_to_scene("uid://c7y7kh8k4adgv")
