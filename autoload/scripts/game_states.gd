extends Node

const health_statuses: Array = ["Undetermined", "Good", "Fair", "Poor", "Serious", "Critical", "Dead"]
const blood_types: Array = ["O+", "O-", "A+", "A-", "B+", "B-", "AB+", "AB-"]
const medical_directives: Array = ["Prescribe Pill A","Prescribe Pill B","Prescribe Pill C","Prescribe Pill D","Prescribe Placebo","Admit to Hospice", "Discharge"]

var first_run = true
var current_patients: Dictionary
var score: int = 0
var day: bool = false

func reset() -> void:
	current_patients = {}
	score = 0
	day = false
	first_run = true
