# Game Manager - Handles global game state
# Manages game initialization, scene transitions, and overall game flow

extends Node

# Game state enum
enum GameState {
	MAIN_MENU,
	PLAYING,
	PAUSED,
	SETTINGS,
	LOADING
}

# Current game state
var current_state: GameState = GameState.MAIN_MENU

# Game settings
var game_settings = {
	"master_volume": 1.0,
	"sfx_volume": 1.0,
	"music_volume": 1.0,
	"graphics_quality": "medium",
	"language": "norwegian"  # Default to Norwegian for Trondheim game
}

# Player data
var player_data = {
	"name": "Turist",  # Norwegian for "Tourist"
	"level": 1,
	"experience": 0,
	"money": 100,
	"current_location": "Sentrum"  # Downtown Trondheim
}

func _ready():
	print("Trondheim 3D - Game Manager initialized")
	print("Velkommen til Trondheim! (Welcome to Trondheim!)")
	
	# Set up autoload singleton
	set_process(true)
	
	# Load saved settings
	load_game_settings()

func _input(event):
	# Global input handling
	if event.is_action_pressed("ui_cancel") and current_state == GameState.PLAYING:
		toggle_pause()

func change_state(new_state: GameState):
	"""Change game state with proper cleanup"""
	print("Changing game state from ", GameState.keys()[current_state], " to ", GameState.keys()[new_state])
	
	# Handle state exit
	match current_state:
		GameState.PLAYING:
			pass  # Save game state if needed
		GameState.PAUSED:
			pass  # Resume systems
	
	# Set new state
	current_state = new_state
	
	# Handle state enter
	match new_state:
		GameState.MAIN_MENU:
			load_main_menu()
		GameState.PLAYING:
			start_game()
		GameState.PAUSED:
			pause_game()
		GameState.LOADING:
			show_loading_screen()

func toggle_pause():
	"""Toggle between playing and paused states"""
	if current_state == GameState.PLAYING:
		change_state(GameState.PAUSED)
	elif current_state == GameState.PAUSED:
		change_state(GameState.PLAYING)

func start_game():
	"""Initialize game world and player"""
	print("Starting game in Trondheim...")
	get_tree().paused = false
	
	# Load main game scene if not already loaded
	if get_tree().current_scene.scene_file_path != "res://scenes/main/TrondheimWorld.tscn":
		get_tree().change_scene_to_file("res://scenes/main/TrondheimWorld.tscn")

func pause_game():
	"""Pause the game"""
	get_tree().paused = true
	print("Game paused")

func load_main_menu():
	"""Load the main menu scene"""
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/ui/MainMenu.tscn")

func show_loading_screen():
	"""Show loading screen during scene transitions"""
	print("Loading...")

func save_game():
	"""Save current game progress"""
	var save_data = {
		"player_data": player_data,
		"game_settings": game_settings,
		"timestamp": Time.get_unix_time_from_system()
	}
	
	var file = FileAccess.open("user://savegame.dat", FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(save_data))
		file.close()
		print("Game saved successfully")
	else:
		print("Failed to save game")

func load_game():
	"""Load saved game progress"""
	if FileAccess.file_exists("user://savegame.dat"):
		var file = FileAccess.open("user://savegame.dat", FileAccess.READ)
		if file:
			var json_string = file.get_as_text()
			file.close()
			
			var json = JSON.new()
			var parse_result = json.parse(json_string)
			if parse_result == OK:
				var save_data = json.data
				player_data = save_data.get("player_data", player_data)
				game_settings = save_data.get("game_settings", game_settings)
				print("Game loaded successfully")
				return true
	
	print("No save file found or failed to load")
	return false

func load_game_settings():
	"""Load game settings from file"""
	if FileAccess.file_exists("user://settings.dat"):
		var file = FileAccess.open("user://settings.dat", FileAccess.READ)
		if file:
			var json_string = file.get_as_text()
			file.close()
			
			var json = JSON.new()
			var parse_result = json.parse(json_string)
			if parse_result == OK:
				game_settings = json.data
				apply_settings()

func save_game_settings():
	"""Save current game settings"""
	var file = FileAccess.open("user://settings.dat", FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(game_settings))
		file.close()
		print("Settings saved")

func apply_settings():
	"""Apply current settings to the game"""
	# Apply audio settings
	AudioServer.set_bus_volume_db(0, linear_to_db(game_settings.master_volume))
	
	# Apply other settings as needed
	print("Settings applied")
