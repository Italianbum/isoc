extends Node2D


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



var current_page: int
var pages: Array[StringName] = [&'page_0', &'page_1', &'page_2', &'page_3', &'page_4']
var patient_count: int
var chat_options: Array
var chat_count: int = 0
var current_health: int
var cases: Array[Button]
var current_blood_type: int
var current_directive: int


func _ready() -> void:
	left_button.pressed.connect((_on_button_pressed).bind(false))
	right_button.pressed.connect((_on_button_pressed).bind(true))

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
		1:
			page_1.visible = true
		2:
			page_2.visible = true
		3:
			page_3.visible = true
		4:
			page_4.visible = true



func _load_patient_data(patient: int) -> void:
	patient_count += 1
	if !GameStates.current_patients.has(("patient_" + str(patient))):
		return
	chat_options = ChatOptions.chat_options.duplicate()
	chat_options.shuffle()
	chat_button_1.text = chat_options[0]
	chat_button_2.text = chat_options[1]
	chat_button_3.text = chat_options[2]
	chat_button_4.text = chat_options[3]
	bio_label.text  = GameStates.current_patients[("patient_" + str(patient))]["bio"]
	name_label.text  = GameStates.current_patients[("patient_" + str(patient))]["name"]
	age_label.text  = GameStates.current_patients[("patient_" + str(patient))]["age"]
	blood_label.text  = _get_blood_type(GameStates.current_patients[("patient_" + str(patient))]["blood_type"])
	health_label.text  = _get_health(GameStates.current_patients[("patient_" + str(patient))]["health"])
	directive_label.text  = _get_directive()
	_set_patient_text()

func _get_blood_type(index: int) -> String:
	current_blood_type = index
	return GameStates.blood_types[index]

func _get_health(index: int) -> String:
	current_health = index
	return GameStates.health_statuses[index]

func _get_directive() -> String:
	print(current_blood_type)
	if current_health == 6:
		current_directive = 4
		return GameStates.medical_directives[4]
	if current_blood_type == 7:
		return GameStates.medical_directives[5]
	if current_blood_type == 6:
		return GameStates.medical_directives[0]
	if current_blood_type <= 5 && current_health == 5:
		return GameStates.medical_directives[2]
	match current_blood_type:
		0,2,4:
			return GameStates.medical_directives[0]
		1:
			return GameStates.medical_directives[1]
		3,5:
			return GameStates.medical_directives[3]

	return "Treat"

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

func _set_patient_text() -> void:
	response_label_1.text = ChatOptions.chat_responses[chat_button_1.text][current_health]
	response_label_2.text = ChatOptions.chat_responses[chat_button_2.text][current_health]
	response_label_3.text = ChatOptions.chat_responses[chat_button_3.text][current_health]
	response_label_4.text = ChatOptions.chat_responses[chat_button_4.text][current_health]


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


func _on_case_button_pressed(case: int) -> void:
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
