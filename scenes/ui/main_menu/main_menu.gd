extends CanvasLayer

const OPTIONS_MENU: PackedScene = preload("res://scenes/ui/options_menu/options_menu.tscn")
const CREDITS: PackedScene = preload("res://scenes/ui/credits/credits.tscn")

@onready var current_focus: Node = self
@onready var margin_container: MarginContainer = $MarginContainer
@onready var sfx_slider: HSlider = %SfxSlider
@onready var music_slider: HSlider = %MusicSlider
@onready var sound_panel: PanelContainer = $SoundPanel
@onready var dialogue: HSlider = %Dialogue
@onready var master_slider: HSlider = %MasterSlider


func _ready() -> void:
	$%PlayButton.pressed.connect(_on_play_pressed)
	$%OptionsButton.pressed.connect(_on_options_pressed)
	$%QuitButton.pressed.connect(_on_quit_pressed)
	$%CreditsButton.pressed.connect(_on_credits_pressed)
	if GameStates.first_run:
		sfx_slider.value_changed.connect(_on_audio_slider_changed.bind("sfx"))
		music_slider.value_changed.connect(_on_audio_slider_changed.bind("music"))
		dialogue.value_changed.connect(_on_audio_slider_changed.bind("dialogue"))
		master_slider.value_changed.connect(_on_audio_slider_changed.bind("Master"))
		sfx_slider.value = _get_bus_volume_percent("sfx")
		music_slider.value = _get_bus_volume_percent("music")
		dialogue.value = _get_bus_volume_percent("dialogue")
		master_slider.value = _get_bus_volume_percent("Master")
		sound_panel.visible = true
	GameStates.reset()
	GameStates.first_run = true

# launces main scene defined in ScreenTransition
func _on_play_pressed() -> void:
	# set any starting conditions here
	ScreenTransition.transition_to_scene(ScreenTransition.main_scene_file_path)


# launches credits menu, and binds back key to close fnc
func _on_credits_pressed() -> void:
	margin_container.visible = false
	var credits_instance: CanvasLayer = CREDITS.instantiate()
	add_child(credits_instance)
	current_focus = credits_instance
	credits_instance.sig_back_pressed.connect(_on_secondary_menu_closed.bind(credits_instance))


# launches options menu, and binds back key to close fnc
func _on_options_pressed() -> void:
	margin_container.visible = false
	var options_instance: CanvasLayer = OPTIONS_MENU.instantiate()
	add_child(options_instance)
	current_focus = options_instance
	options_instance.sig_back_pressed.connect(_on_secondary_menu_closed.bind(options_instance))


func _on_quit_pressed() -> void:
	get_tree().quit()


# closes the passed in secondary menu
func _on_secondary_menu_closed(menu_instance: Node) -> void:
	current_focus = self
	menu_instance.queue_free()
	margin_container.visible = true


# closes secondary menus using escape key
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		# if current focus is secondary menu
		if current_focus != self:
			# if is options menu
			if "is_control_menu_open" in current_focus:
				# closing controls menu in options if open
				if current_focus.is_control_menu_open:
					current_focus.on_controls_closed(current_focus.controls_instance)
					return

			# else close secondary menu
			_on_secondary_menu_closed(current_focus)


func _on_audio_slider_changed(value: float, bus_name: String) -> void:
	_set_bus_volume_percent(bus_name, value)


func _get_bus_volume_percent(bus_name: String) -> float:
	var bus_index: int = AudioServer.get_bus_index(bus_name)
	var volume_db: float = AudioServer.get_bus_volume_db(bus_index)
	return db_to_linear(volume_db)


func _set_bus_volume_percent(bus_name: String, percent: float) -> void:
	var bus_index: int = AudioServer.get_bus_index(bus_name)
	var volume_db: float = linear_to_db(percent)
	AudioServer.set_bus_volume_db(bus_index, volume_db)
