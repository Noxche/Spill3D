# Main Trondheim World Scene Template
# This script helps set up the complete Trondheim game world

extends Node3D

# Scene components
@export var terrain_enabled: bool = true
@export var water_enabled: bool = true
@export var player_spawn_enabled: bool = true

# Norwegian environment settings
@export var season: String = "summer"  # summer, winter, autumn, spring
@export var weather: String = "clear"  # clear, rain, snow, fog
@export var time_of_day: float = 12.0  # 0-24 hours

# References to major systems
var terrain_system: Node3D
var water_system: Node3D
var player_spawn: Node3D

func _ready():
	print("Initializing Trondheim World...")
	setup_trondheim_world()

func setup_trondheim_world():
	"""Set up the complete Trondheim game world"""
	
	if terrain_enabled:
		create_terrain_system()
	
	if water_enabled:
		create_water_system()
	
	if player_spawn_enabled:
		create_player_spawn()
	
	# Apply Norwegian environmental settings
	apply_norwegian_environment()
	
	print("Trondheim world initialized!")

func create_terrain_system():
	"""Create the main terrain"""
	# In Godot, you would typically load a pre-made terrain scene
	# For now, we'll create a simple placeholder
	
	terrain_system = Node3D.new()
	add_child(terrain_system)
	terrain_system.name = "TrondheimTerrain"
	
	# Load terrain script
	var terrain_script = load("res://scripts/systems/TrondheimTerrain.gd")
	terrain_system.set_script(terrain_script)
	
	print("Terrain system created")

func create_water_system():
	"""Create fjord and water bodies"""
	water_system = Node3D.new()
	add_child(water_system)
	water_system.name = "FjordSystem"
	
	# Load water script
	var water_script = load("res://scripts/systems/FjordWater.gd")
	water_system.set_script(water_script)
	
	print("Fjord system created")

func create_player_spawn():
	"""Create player spawn point in appropriate Trondheim location"""
	player_spawn = Node3D.new()
	add_child(player_spawn)
	player_spawn.name = "PlayerSpawn"
	
	# Spawn player in city center (Torvet - main square)
	player_spawn.position = Vector3(0, 2, 0)  # Slightly above ground
	
	print("Player spawn created at Torvet (city center)")

func apply_norwegian_environment():
	"""Apply Norwegian-specific environmental settings"""
	# Set up lighting for Nordic conditions
	setup_nordic_lighting()
	
	# Add Nordic weather effects
	setup_weather_system()
	
	# Configure Nordic day/night cycle
	setup_nordic_daynight()

func setup_nordic_lighting():
	"""Set up lighting that matches Norwegian conditions"""
	# Nordic countries have unique lighting conditions
	var sun = DirectionalLight3D.new()
	add_child(sun)
	sun.name = "NordicSun"
	
	# Adjust for Norwegian latitude (around 63°N for Trondheim)
	if season == "summer":
		sun.light_energy = 1.2  # Bright summer days
		sun.rotation_degrees.x = -30  # High summer sun
	elif season == "winter":
		sun.light_energy = 0.6  # Dim winter light
		sun.rotation_degrees.x = -10  # Low winter sun
	
	# Nordic light color (slightly cool)
	sun.light_color = Color(0.95, 0.95, 1.0)
	
	print("Nordic lighting configured for " + season)

func setup_weather_system():
	"""Set up Norwegian weather patterns"""
	match weather:
		"rain":
			print("Adding Norwegian rain...")
			# Add rain particles, gray skies
		"snow":
			print("Adding Norwegian snow...")
			# Add snow particles, winter atmosphere
		"fog":
			print("Adding Nordic fog...")
			# Add fog effects common in Norwegian fjords
		_:
			print("Clear Norwegian weather")

func setup_nordic_daynight():
	"""Set up day/night cycle appropriate for Norwegian latitude"""
	# Trondheim has extreme day/night variations by season
	print("Configuring Nordic day/night cycle...")
	
	# In summer: nearly 24h daylight
	# In winter: very short days (4-6 hours)
	# This affects gameplay and atmosphere significantly

# Utility functions for placing Norwegian landmarks
func add_landmark(landmark_name: String, position: Vector3):
	"""Add a Norwegian landmark at specified position"""
	var landmark = Node3D.new()
	add_child(landmark)
	landmark.name = landmark_name
	landmark.position = position
	
	print("Added landmark: " + landmark_name + " at " + str(position))

# Pre-defined Trondheim landmarks
func place_trondheim_landmarks():
	"""Place major Trondheim landmarks"""
	add_landmark("Nidarosdomen", Vector3(50, 10, 0))      # Cathedral
	add_landmark("Bakklandet", Vector3(-100, 20, 50))     # Old town
	add_landmark("TorgetSquare", Vector3(0, 0, 0))        # Main square
	add_landmark("OldTownBridge", Vector3(-50, 5, 0))     # Historic bridge
	add_landmark("NTNU_Campus", Vector3(200, 15, -100))   # University
