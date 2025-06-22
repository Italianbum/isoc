extends Node2D

const PAUSE_MENU: PackedScene = preload("res://scenes/ui/pause_menu/pause_menu.tscn")
@onready var notebook: Node2D = $Notebook


var patient_count: int
var chat_options: Array
var chat_count: int = 0
var current_health: int

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		add_child(PAUSE_MENU.instantiate())
		get_tree().root.set_input_as_handled()
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _ready() -> void:

	_build_patient_list()


func _build_patient_list() -> void:
	GameStates.current_patients = {
	"patient_" + str(GameStates.current_patients.size() + 1) : PatientBuilder.create_patient(),
	"patient_" + str(GameStates.current_patients.size() + 2): PatientBuilder.create_patient(),
	"patient_" + str(GameStates.current_patients.size() + 3): PatientBuilder.create_patient()
	}
	notebook.set_cases()
