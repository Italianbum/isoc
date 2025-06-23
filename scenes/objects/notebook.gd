extends Node2D

signal sig_end_day
signal play_scene

@onready var left_button: Button = $LeftButton
@onready var right_button: Button = $RightButton
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var page_0: MarginContainer = %Page0
@onready var page_1: Control = %Page1
@onready var page_2: MarginContainer = %Page2
@onready var page_3: Control = %Page3
@onready var page_4: Control = %Page4
@onready var directive_label: Label = %DirectiveLabel
@onready var treat_button_1: Button = %TreatButton1
@onready var treat_button_2: Button = %TreatButton2
@onready var treat_button_3: Button = %TreatButton3
@onready var treat_button_4: Button = %TreatButton4
@onready var treat_button_5: Button = %TreatButton5
@onready var treat_button_6: Button = %TreatButton6
@onready var treat_button_7: Button = %TreatButton7
@onready var chat_button_1: Button = %ChatButton1
@onready var chat_button_2: Button = %ChatButton2
@onready var chat_button_3: Button = %ChatButton3
@onready var chat_button_4: Button = %ChatButton4
@onready var response_label_1: Label = %ResponseLabel1
@onready var response_label_2: Label = %ResponseLabel2
@onready var response_label_3: Label = %ResponseLabel3
@onready var response_label_4: Label = %ResponseLabel4
@onready var patient_image: AnimatedSprite2D = $Page1/PatientImage
@onready var age_label: Label = %AgeLabel
@onready var blood_label: Label = %BloodLabel
@onready var name_label: Label = %NameLabel
@onready var bio_label: Label = %BioLabel
@onready var case_button_1: Button = %CaseButton1
@onready var case_button_2: Button = %CaseButton2
@onready var case_button_3: Button = %CaseButton3
@onready var case_button_4: Button = %CaseButton4
@onready var case_button_5: Button = %CaseButton5
@onready var case_button_6: Button = %CaseButton6
@onready var case_button_7: Button = %CaseButton7
@onready var case_button_8: Button = %CaseButton8
@onready var case_button_9: Button = %CaseButton9
@onready var case_button_10: Button = %CaseButton10
@onready var health_label: Label = %HealthLabel
@onready var complete_button: Button = $CompleteButton
@onready var end_button: Button = $EndButton
@onready var pages_sfx: AudioStreamPlayer = $pages_sfx


var current_page: int
var pages: Array[StringName] = [&'page_0', &'page_1', &'page_2', &'page_3', &'page_4']
var patient_count: int
var chat_options: Array
var chat_count: int = 0
var current_health: int
var cases: Array[Button]
var current_blood_type: int
var current_directive: int
var treatment: bool = false
var current_case: int
var current_patient: String


func _ready() -> void:
	left_button.pressed.connect((_on_button_pressed).bind(false))
	right_button.pressed.connect((_on_button_pressed).bind(true))
	complete_button.pressed.connect(_on_complete_button_pressed)
	end_button.pressed.connect(_on_end_button_pressed)

	case_button_1.pressed.connect((_on_case_button_pressed).bind(1))
	case_button_2.pressed.connect((_on_case_button_pressed).bind(2))
	case_button_3.pressed.connect((_on_case_button_pressed).bind(3))
	case_button_4.pressed.connect((_on_case_button_pressed).bind(4))
	case_button_5.pressed.connect((_on_case_button_pressed).bind(5))
	case_button_6.pressed.connect((_on_case_button_pressed).bind(6))
	case_button_7.pressed.connect((_on_case_button_pressed).bind(7))
	case_button_8.pressed.connect((_on_case_button_pressed).bind(8))
	case_button_9.pressed.connect((_on_case_button_pressed).bind(9))
	case_button_10.pressed.connect((_on_case_button_pressed).bind(10))

	treat_button_1.pressed.connect((_on_treat_button_pressed).bind(0))
	treat_button_2.pressed.connect((_on_treat_button_pressed).bind(1))
	treat_button_3.pressed.connect((_on_treat_button_pressed).bind(2))
	treat_button_4.pressed.connect((_on_treat_button_pressed).bind(3))
	treat_button_5.pressed.connect((_on_treat_button_pressed).bind(4))
	treat_button_6.pressed.connect((_on_treat_button_pressed).bind(5))
	treat_button_7.pressed.connect((_on_treat_button_pressed).bind(6))

	cases = [
		case_button_1, case_button_2, case_button_3, case_button_4, case_button_5,
		case_button_6,case_button_7,case_button_8,case_button_9,case_button_10
		]

	left_button.disabled = true
	right_button.disabled = true
	animated_sprite_2d.animation = pages[0]
	current_page = 0
	_show_page()


func set_cases() -> void:
	for i in (GameStates.current_patients.size()):
		var _button: Button = cases[i]
		_button.visible = true


func _show_page() -> void:
	match current_page:
		0:
			page_0.visible = true
			animated_sprite_2d.animation = &"page_0"
			if treatment:
				complete_button.visible = false
				treatment = false
				right_button.disabled = true
				_check_end_day()
		1:
			page_1.visible = true
		2:
			page_2.visible = true
		3:
			page_3.visible = true
		4:
			page_4.visible = true
	if treatment:
		complete_button.visible = true


func _load_patient_data(patient: int) -> void:
	patient_count += 1
	if !GameStates.current_patients.has(("patient_" + str(patient))):
		return
	current_patient = ("patient_" + str(patient))

	chat_options = ChatOptions.chat_options.duplicate()
	chat_options.shuffle()
	chat_button_1.text = chat_options[0]
	chat_button_2.text = chat_options[1]
	chat_button_3.text = chat_options[2]
	chat_button_4.text = chat_options[3]

	bio_label.text  = GameStates.current_patients[current_patient]["bio"]
	name_label.text  = GameStates.current_patients[current_patient]["name"]
	age_label.text  = GameStates.current_patients[current_patient]["age"]
	blood_label.text  = _get_blood_type(GameStates.current_patients[current_patient]["blood_type"])
	health_label.text  = _get_health(GameStates.current_patients[current_patient]["health"])
	directive_label.text  = _get_directive()
	_set_patient_text()
	_set_patient_image()
	enable_treat_buttons()
	if name_label.text == "Zbychu Nowak" && GameStates.day_count in [2,5,8]:
		_disable_treat_buttons()
		play_scene.emit()
		_set_special_text()
	if name_label.text == "Nathan Dedrick" && GameStates.day_count in [4,6,8]:
		_disable_treat_buttons()
		play_scene.emit()
		_set_special_text()
	if name_label.text == "Sarah Queen" && GameStates.day_count in [6,8]:
		_disable_treat_buttons()
		play_scene.emit()
		_set_special_text()

func _set_special_text() -> void:
	chat_button_1.text = GameStates.current_act[name_label.text]["question_1"]
	chat_button_2.text = GameStates.current_act[name_label.text]["question_2"]
	chat_button_3.text = GameStates.current_act[name_label.text]["question_3"]
	chat_button_4.text = GameStates.current_act[name_label.text]["question_4"]
	response_label_1.text = GameStates.current_act[name_label.text]["response_1"]
	response_label_2.text = GameStates.current_act[name_label.text]["response_2"]
	response_label_3.text = GameStates.current_act[name_label.text]["response_3"]
	response_label_4.text = GameStates.current_act[name_label.text]["response_4"]


func _get_blood_type(index: int) -> String:
	current_blood_type = index
	return GameStates.blood_types[index]


func _get_health(index: int) -> String:
	current_health = index
	return GameStates.health_statuses[index]


func _get_directive() -> String:
	if current_health == 6:
		current_directive = 6
		return GameStates.medical_directives[6]
	if current_blood_type == 7:
		current_directive = 5
		return GameStates.medical_directives[5]
	if current_blood_type == 6:
		current_directive = 0
		return GameStates.medical_directives[0]
	if current_blood_type <= 5 && current_health == 5:
		current_directive = 2
		return GameStates.medical_directives[2]

	match current_blood_type:
		0,2,4:
			current_directive = 0
			return GameStates.medical_directives[0]
		1:
			current_directive = 1
			return GameStates.medical_directives[1]
		3,5:
			current_directive = 3
			return GameStates.medical_directives[3]

	return "Treat"


func enable_treat_buttons() -> void:
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


func _set_patient_text() -> void:
	response_label_1.text = ChatOptions.chat_responses[chat_button_1.text][current_health]
	response_label_2.text = ChatOptions.chat_responses[chat_button_2.text][current_health]
	response_label_3.text = ChatOptions.chat_responses[chat_button_3.text][current_health]
	response_label_4.text = ChatOptions.chat_responses[chat_button_4.text][current_health]


func _set_patient_image() -> void:
	match name_label.text:
		"Sarah Queen":
			patient_image.animation = &"p2"
		"Zbychu Nowak":
			patient_image.animation = &"p1"
		"Nathan Dedrick":
			patient_image.animation = &"p3"

	if name_label.text in ["Sarah Queen","Zbychu Nowak","Nathan Dedrick"]:
		patient_image.flip_h = false
		patient_image.modulate = Color(1.0,1.0,1.0,1.0)
	else:
		patient_image.animation = &"random"
		patient_image.frame = randi_range(0,2)
		patient_image.flip_h = true
		patient_image.modulate = Color(0.0,0.0,0.0,1.0)


func _disable_case() -> void:
	match current_case:
		1:
			case_button_1.disabled = true
		2:
			case_button_2.disabled = true
		3:
			case_button_3.disabled = true
		4:
			case_button_4.disabled = true
		5:
			case_button_5.disabled = true
		6:
			case_button_6.disabled = true
		7:
			case_button_7.disabled = true
		8:
			case_button_8.disabled = true
		9:
			case_button_9.disabled = true
		10:
			case_button_10.disabled = true


func _check_end_day() -> void:
	for case: Button in cases:
		if case.visible:
			if not case.disabled:
				return
	end_button.visible = true


func _on_treat_button_pressed(option: int) -> void:
	match option:
		0,1,2,3:
			if option == current_directive:
				GameStates.score += 1
			else:
				GameStates.score -= 1
		4:
			GameStates.score -= 1
		5:
			if option == current_directive:
				GameStates.score += 3
			else:
				GameStates.score -= 2
		6:
			if option == current_directive:
				GameStates.score += 1
			else:
				GameStates.score -= 5
	_disable_case()
	treatment = true
	complete_button.visible = true
	GameStates.patient_treated(current_patient,option, current_directive, current_health, current_blood_type)
	if name_label.text in ["Sarah Queen","Zbychu Nowak","Nathan Dedrick"]:
		owner.fade_patient_image()


func _on_case_button_pressed(case: int) -> void:
	current_case = case
	_load_patient_data(case)
	_on_button_pressed(true)


func _on_button_pressed(button: bool) -> void:
	left_button.disabled = true
	right_button.disabled = true
	page_0.visible = false
	page_1.visible = false
	page_2.visible = false
	page_3.visible = false
	page_4.visible = false
	complete_button.visible = false
	pages_sfx.play()

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


func _on_complete_button_pressed() -> void:
	var _frame: int

	left_button.disabled = true
	complete_button.visible = false
	page_0.visible = false
	page_1.visible = false
	page_2.visible = false
	page_3.visible = false
	page_4.visible = false

	match current_page:
		0:
			return
		1:
			_frame = 11
		2:
			_frame = 22
		3:
			_frame = 33
		4:
			_frame = 44
	pages_sfx.play()
	animated_sprite_2d.animation = &"return_to_0"
	animated_sprite_2d.frame = _frame
	animated_sprite_2d.play_backwards(&"return_to_0")
	await animated_sprite_2d.animation_finished

	current_page = 0
	_show_page()
	_check_end_day()


func _on_end_button_pressed() -> void:
	sig_end_day.emit()
