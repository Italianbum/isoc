extends Node

const PAUSE_MENU: PackedScene = preload("res://scenes/ui/pause_menu/pause_menu.tscn")

@onready var chat_button_1: Button = %ChatButton1
@onready var chat_button_2: Button = %ChatButton2
@onready var chat_button_3: Button = %ChatButton3
@onready var chat_button_4: Button = %ChatButton4
@onready var bio_label: Label = %BioLabel
@onready var treat_button_1: Button = %TreatButton1
@onready var treat_button_2: Button = %TreatButton2
@onready var treat_button_3: Button = %TreatButton3
@onready var treat_button_4: Button = %TreatButton4
@onready var treat_button_5: Button = %TreatButton5
@onready var treat_button_6: Button = %TreatButton6
@onready var treat_button_7: Button = %TreatButton7
@onready var name_label: Label = %NameLabel
@onready var age_label: Label = %AgeLabel
@onready var blood_label: Label = %BloodLabel
@onready var health_label: Label = %HealthLabel
@onready var directive_label: Label = %DirectiveLabel
@onready var doctor_label: Label = %DoctorLabel
@onready var patient_label: Label = %PatientLabel

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
	GameStates.current_patients = KeyPatients.key_patients_act_one
	chat_button_1.pressed.connect((on_chat_button_pressed).bind(1))
	chat_button_2.pressed.connect((on_chat_button_pressed).bind(2))
	chat_button_3.pressed.connect((on_chat_button_pressed).bind(3))
	chat_button_4.pressed.connect((on_chat_button_pressed).bind(4))
	treat_button_1.pressed.connect((on_treat_button_pressed).bind(1))
	treat_button_2.pressed.connect((on_treat_button_pressed).bind(2))
	treat_button_3.pressed.connect((on_treat_button_pressed).bind(3))
	treat_button_4.pressed.connect((on_treat_button_pressed).bind(4))
	treat_button_5.pressed.connect((on_treat_button_pressed).bind(5))
	treat_button_6.pressed.connect((on_treat_button_pressed).bind(6))
	treat_button_7.pressed.connect((on_treat_button_pressed).bind(7))
	_load_patient_data()


func _load_patient_data() -> void:
	patient_count += 1
	if !GameStates.current_patients.has(("patient_" + str(patient_count))):
		print("nomore")
		return
	chat_options = ChatOptions.chat_options.duplicate()
	chat_options.shuffle()
	chat_button_1.text = chat_options[0]
	chat_button_2.text = chat_options[1]
	chat_button_3.text = chat_options[2]
	chat_button_4.text = chat_options[3]
	_disable_treat_buttons()
	_enable_chat_buttons()
	bio_label.text  = GameStates.current_patients[("patient_" + str(patient_count))]["bio"]
	name_label.text  = GameStates.current_patients[("patient_" + str(patient_count))]["name"]
	age_label.text  = GameStates.current_patients[("patient_" + str(patient_count))]["age"]
	blood_label.text  = _get_blood_type(GameStates.current_patients[("patient_" + str(patient_count))]["blood_type"])
	health_label.text  = _get_health(GameStates.current_patients[("patient_" + str(patient_count))]["health"])
	directive_label.text  = _get_directive(GameStates.current_patients[("patient_" + str(patient_count))]["medical_directive"])

func _get_blood_type(index: int) -> String:
	return GameStates.blood_types[index]

func _get_health(index: int) -> String:
	current_health = index
	return GameStates.health_statuses[index]

func _get_directive(index: int) -> String:
	return GameStates.medical_directives[index]

func _enable_treat_buttons() -> void:
	treat_button_1.disabled = false
	treat_button_2.disabled = false
	treat_button_3.disabled = false
	treat_button_4.disabled = false
	treat_button_5.disabled = false
	treat_button_6.disabled = false
	treat_button_7.disabled = false

func _disable_treat_buttons() -> void:
	treat_button_1.disabled = true
	treat_button_2.disabled = true
	treat_button_3.disabled = true
	treat_button_4.disabled = true
	treat_button_5.disabled = true
	treat_button_6.disabled = true
	treat_button_7.disabled = true

func _enable_chat_buttons() -> void:
	chat_button_1.disabled = false
	chat_button_2.disabled = false
	chat_button_3.disabled = false
	chat_button_4.disabled = false

func _set_patient_text(prompt:String) -> void:
	var _responses: Array = ChatOptions.chat_responses[prompt]
	var tween = create_tween()
	patient_label.text = _responses[current_health]
	tween.tween_property(patient_label,"visible_ratio", 1.0, clampf(0.1 * float(current_health),0.1,2.0))
	await tween.finished


func on_chat_button_pressed(option: int) -> void:
	chat_count += 1
	var tween = create_tween()
	doctor_label.visible_ratio = 0.0
	patient_label.visible_ratio = 0.0

	if chat_count >= 4:
		_enable_treat_buttons()
	if chat_options.size() > (3 + chat_count):
		match option:
			1:
				doctor_label.text = chat_button_1.text
				chat_button_1.text = chat_options[(3 + chat_count)]
			2:
				doctor_label.text = chat_button_2.text
				chat_button_2.text = chat_options[(3 + chat_count)]
			3:
				doctor_label.text = chat_button_3.text
				chat_button_3.text = chat_options[(3 + chat_count)]
			4:
				doctor_label.text = chat_button_4.text
				chat_button_4.text = chat_options[(3 + chat_count)]
	else:
		match option:
			1:
				doctor_label.text = chat_button_1.text
				chat_button_1.disabled = true
			2:
				doctor_label.text = chat_button_2.text
				chat_button_2.disabled = true
			3:
				doctor_label.text = chat_button_3.text
				chat_button_3.disabled = true
			4:
				doctor_label.text = chat_button_4.text
				chat_button_4.disabled = true
	tween.tween_property(doctor_label,"visible_ratio", 1.0, 0.5)
	await tween.finished
	await get_tree().create_timer(.4).timeout
	_set_patient_text(doctor_label.text)


func on_treat_button_pressed(option: int) -> void:
	chat_count = 0
	_load_patient_data()
