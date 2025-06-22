extends Node

const health_statuses: Array = ["Undetermined", "Good", "Fair", "Poor", "Serious", "Critical", "Deceased"]
const blood_types: Array = ["O+", "O-", "A+", "A-", "B+", "B-", "AB+", "AB-"]
const medical_directives: Array = ["Prescribe Pill A","Prescribe Pill B","Prescribe Pill C","Prescribe Pill D","Prescribe Placebo","Admit to Hospice", "Discharge"]

var first_run = true
var current_patients: Dictionary
var score: int = 0
var day: bool = false
var patient_count: int = 0

func reset() -> void:
	current_patients = {}
	score = 0
	day = false
	first_run = true

func patient_treated(patient: String, option: int, directive: int, health: int, blood_type: int) -> void:
	var _patient_data = current_patients[patient]
	if directive in [5,6]:
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

	_patient_data["age"] += 1
	current_patients[patient] = _patient_data
