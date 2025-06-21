extends Node


var first_names: Array[String] = [
	"John", "Jane", "Michael", "Michelle", "Omar", "Gabreila", "Max", "Sofia", "Noah", "Ava",
	"Mei", "Kai", "Felecia", "Dion", "Zendaya", "Marcus", "Oliver", "Emma", "Carter", "Kelcie"
]
var last_names: Array[String] = [
	"Bush", "Brown", "Lim", "Rodriguez", "Garcia", "Russo", "Martin", "Hansen", "Niemi", "Santos",
	"Nguyen", "Smith", "Williams", "Johnson", "Kimbell", "Otter", "Easton", "Thayer", "Fawl", "Vanderwood"
]

var bios: Array[String] = [
	"A regular resident.", "Looking for purpose in life.", "Looking for a sense of acheivement.",
	"Trying to find their way.", "Living a life of relaxation.", "As a phobia of many things.",
	"Thinks the hospital is out to get them.", "Doesn't trust anyone.", "Tries to see the bright side of things.",
	"Comes from a far away place.","Once was the leader of a nation.", "Has a habit of forgeting things.",
	"Thinks they are a Disney Character.", "A friendly face in the community.", "Has delusions of gradeur.",
	"Has a lot of cats.","A loyal dog person.", "Thinks they are an 'influencer.'", "The village idoit.",
	"An avid racer."
]

func create_patient() -> Dictionary:
	var patient: Dictionary = {
		"name" : _get_name(),
		"age" : str(randi_range(18,80)),
		"blood_type" : randi_range(0,7),
		"health" : randi_range(1,5),
		"medical_directive" : randi_range(1,7),
		"bio" : bios[randi_range(0,19)]
	}

	return patient

func _get_name() -> String:
	var _name = first_names[randi_range(0,19)] + " " + last_names[randi_range(0,19)]
	return _name
