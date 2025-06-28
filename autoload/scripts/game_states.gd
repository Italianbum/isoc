extends Node

const health_statuses: Array = ["Undetermined", "Good", "Fair", "Poor", "Serious", "Critical", "Deceased"]
const blood_types: Array = ["O+", "O-", "A+", "A-", "B+", "B-", "AB+", "AB-"]
const medical_directives: Array = ["Prescribe Pill A","Prescribe Pill B","Prescribe Pill C","Prescribe Pill D","Prescribe Placebo","Admit to Hospice", "Discharge"]

var first_run = true
var current_patients: Dictionary
var score: int = 0
var day: bool = false
var patient_count: int = 0
var day_count: int = 0
var current_act: Dictionary
var manager_count_good: int = 1
var manager_count_bad: int = 8

var key_patient_1: Dictionary = {
		"name" : "Zbychu Nowak",
		"age" : "28",
		"blood_type" : 0,
		"health" : 1,
		"medical_directive" : 3,
		"bio" : "Unknown, an anomaly but tough. Found passed out in an alley, he was brought to us." +
			"Very hard to communicate with. The scars around his hands tell us this is no easy patient." +
			"With the amount of fight he has caused throughout his time here, he might be better off in a more equipped facility."
	}

var key_patient_2: Dictionary = {
		"name" : "Nathan Dedrick",
		"age" : "37",
		"blood_type" : 3,
		"health" : 0,
		"medical_directive" : 3,
		"bio" : "Admitted here after countless hours of overtime and meeting all the deadlines." +
			"One day, he just snapped. Now he runs around telling us he's the chief manager of the drones," +
			"whatever that means. A real case we have before us."
	}

var key_patient_3: Dictionary = {
		"name" : "Sarah Queen",
		"age" : "32",
		"blood_type" : 5,
		"health" : 0,
		"medical_directive" : 3,
		"bio" : "A fallen Rockstar, that's what we call her around here. " +
		"Before being admitted to us, she toured all around the world. " +
		"But one day, these guys showed up with the right paperwork, and we had to admit her. " +
		"Even when I make my trips to the small fishing village on the weekends, " +
		"I still see glimpses of the star power she once wielded. The locals still blast her songs. " +
		"What an idol we have here."
	}


func reset() -> void:
	current_patients = {}
	score = 0
	day = false
	first_run = true
	patient_count = 0
	day_count = 0
	current_act = ChatOptions.key_dialogue_act_one
	manager_count_good = 1
	manager_count_bad = 8


func patient_treated(patient: String, option: int, directive: int, health: int, blood_type: int) -> void:
	var _patient_data = current_patients[patient]
	if option in [5,6]:
		current_patients[patient] = PatientBuilder.create_patient()
		return
	if health == 6:
		return
	if option in [0,1,2,3]:
		_patient_data["health"] += 1
		if option == 2:
			randi_range(blood_type,7)
		elif option == directive:
			match blood_type:
				0:
					_patient_data["blood_type"] = 1
				1:
					_patient_data["blood_type"] = [2,4][randi_range(0,1)]
				2:
					_patient_data["blood_type"] = 3
				4:
					_patient_data["blood_type"] = 5
				3,5:
					_patient_data["blood_type"] = 6
				6:
					_patient_data["blood_type"] = 7
	if option == 4:
		_patient_data["health"] -= 1

	_patient_data["age"] = str(1 + int(_patient_data["age"]))
	current_patients[patient] = _patient_data


func add_key_patient() -> void:
	match day_count:
		2:
			current_patients["patient_" + str(GameStates.current_patients.size() + 1)] = key_patient_1
		3:
			current_patients["patient_" + str(GameStates.current_patients.size() + 1)] = key_patient_2
		5:
			current_patients["patient_" + str(GameStates.current_patients.size() + 1)] = key_patient_3
