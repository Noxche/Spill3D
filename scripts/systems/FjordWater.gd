# Trondheimsfjord Water System
# Creates animated water for the fjord running through Trondheim

extends Node3D

# Water settings
@export var water_size: Vector2 = Vector2(300, 100)  # Fjord dimensions
@export var wave_height: float = 0.5
@export var wave_speed: float = 1.0
@export var water_color: Color = Color(0.1, 0.3, 0.6, 0.8)  # Nordic blue

# Components
var water_mesh: MeshInstance3D
var water_material: StandardMaterial3D
var time_elapsed: float = 0.0

func _ready():
	create_fjord_water()

func create_fjord_water():
	"""Create the Trondheimsfjord water surface"""
	print("Creating Trondheimsfjord...")
	
	# Create water mesh
	water_mesh = MeshInstance3D.new()
	add_child(water_mesh)
	water_mesh.name = "FjordWater"
	
	# Create plane for water surface
	var plane = PlaneMesh.new()
	plane.size = water_size
	plane.subdivide_width = 50
	plane.subdivide_depth = 20
	
	water_mesh.mesh = plane
	
	# Position water at sea level
	water_mesh.position.y = 0.0
	
	# Create Norwegian fjord material
	create_fjord_material()
	
	print("Trondheimsfjord created!")

func create_fjord_material():
	"""Create realistic Norwegian fjord water material"""
	water_material = StandardMaterial3D.new()
	
	# Norwegian fjord water properties
	water_material.albedo_color = water_color
	water_material.metallic = 0.1
	water_material.roughness = 0.1
	
	# Make it transparent like real water
	water_material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	
	# Add reflection (Nordic fjords are very reflective)
	water_material.rim_enabled = true
	water_material.rim_tint = 0.5
	
	# Enable emission for subtle glow
	water_material.emission_enabled = true
	water_material.emission = Color(0.0, 0.1, 0.2) * 0.3
	
	water_mesh.material_override = water_material

func _process(delta):
	"""Animate the fjord water"""
	time_elapsed += delta
	
	# Simple wave animation (you can make this more complex)
	if water_mesh:
		# Gentle bobbing motion like real fjord water
		water_mesh.position.y = sin(time_elapsed * wave_speed) * wave_height * 0.1

# Add water area collision for swimming/boat mechanics
func add_water_collision():
	"""Add area for water interaction (swimming, drowning, boat physics)"""
	var water_area = Area3D.new()
	add_child(water_area)
	water_area.name = "WaterArea"
	
	var collision_shape = CollisionShape3D.new()
	water_area.add_child(collision_shape)
	
	# Create box collision for water volume
	var box_shape = BoxShape3D.new()
	box_shape.size = Vector3(water_size.x, 10, water_size.y)  # Deep water
	collision_shape.shape = box_shape
	
	# Connect water interaction signals
	water_area.body_entered.connect(_on_body_entered_water)
	water_area.body_exited.connect(_on_body_exited_water)

func _on_body_entered_water(body):
	"""Handle when player or objects enter the fjord"""
	if body.name == "Player":
		print("Player entered Trondheimsfjord!")
		# You can add swimming mechanics, sound effects, etc.

func _on_body_exited_water(body):
	"""Handle when player or objects exit the fjord"""
	if body.name == "Player":
		print("Player left the fjord")
		# Reset any water-related effects
