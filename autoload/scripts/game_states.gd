extends Node

const health_statuses: Array = ["Undetermined", "Good", "Fair", "Poor", "Serious", "Critical", "Dead"]
const blood_types: Array = ["O+", "O-", "A+", "A-", "B+", "B-", "AB+", "AB-"]
const medical_directives: Array = ["Blood Donation","Stablize","Treat","Admit to Hospice","Discharge","Euthanize", "Directive 7"]

var first_run = true
var current_patients: Dictionary
var chat_options: Array[String] = [
	"How are you feeling?",
	"Does anything hurt?",
	"How can I help?",
	"Have you taken your medications?",
	"How long have you been here?",
	"How long have you been sick?",
	"Do you feel any strong pain?",
	"Do you have any issues with your senses? ",
	"Let me check your heart rate.",
	"Let me check your eyesight.",
	"Let me check your blood pressure.",
	"Let me check your breathing.",
	"Can you open your mouth and say aaaaaaah.",
	"Can you stand up and hold up your arms for me?",
	"Let's test your reflexes.",
	"Are you happy here?",
	"Would you like to leave?",
	"Do you trust me?",
	"Are you worried about anything?"
	]
