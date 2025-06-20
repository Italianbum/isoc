extends Node

const health_statuses: Array = ["Undetermined", "Good", "Fair", "Poor", "Serious", "Critical", "Dead"]
const blood_types: Array = ["O+", "O-", "A+", "A-", "B+", "B-", "AB+", "AB-"]
const medical_directives: Array = ["Blood Donation","Stablize","Treat","Admit to Hospice","Discharge","Euthanize", "Directive 7"]

var first_run = true
var current_patients: Dictionary
