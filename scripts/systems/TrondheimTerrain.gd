# Trondheim Terrain Generator
# Creates basic terrain that mimics Trondheim's geography

@tool
extends Node3D

# Terrain settings
@export var terrain_size: Vector2 = Vector2(500, 500)  # Large terrain for open world
@export var height_scale: float = 50.0  # Maximum height variation
@export var subdivisions: int = 100  # Terrain detail level

# Geographic features
@export var fjord_enabled: bool = true
@export var hills_enabled: bool = true
@export var city_center_flat: bool = true

# References
var mesh_instance: MeshInstance3D
var terrain_mesh: PlaneMesh
var terrain_material: StandardMaterial3D

func _ready():
	if Engine.is_editor_hint():
		create_trondheim_terrain()

func create_trondheim_terrain():
	"""Generate basic Trondheim-inspired terrain"""
	print("Generating Trondheim terrain...")
	
	# Create mesh instance if it doesn't exist
	if not mesh_instance:
		setup_terrain_mesh()
	
	# Apply Trondheim geographic features
	apply_trondheim_geography()
	
	# Create Norwegian-style material
	create_norwegian_material()
	
	print("Trondheim terrain generated!")

func setup_terrain_mesh():
	"""Set up the basic terrain mesh"""
	# Create MeshInstance3D
	mesh_instance = MeshInstance3D.new()
	add_child(mesh_instance)
	mesh_instance.name = "TerrainMesh"
	
	# Create plane mesh with high subdivision for detail
	terrain_mesh = PlaneMesh.new()
	terrain_mesh.size = terrain_size
	terrain_mesh.subdivide_width = subdivisions
	terrain_mesh.subdivide_depth = subdivisions
	
	mesh_instance.mesh = terrain_mesh
	
	# Add collision for player walking
	var collision_shape = CollisionShape3D.new()
	var static_body = StaticBody3D.new()
	add_child(static_body)
	static_body.add_child(collision_shape)
	
	# Generate collision from mesh
	collision_shape.shape = mesh_instance.mesh.create_trimesh_shape()
	
	print("Basic terrain mesh created")

func apply_trondheim_geography():
	"""Apply height variations that mimic Trondheim's geography"""
	
	# This is a simplified version - in a real implementation,
	# you'd use noise functions or heightmaps to create realistic terrain
	
	if fjord_enabled:
		create_fjord_area()
	
	if hills_enabled:
		create_residential_hills()
	
	if city_center_flat:
		create_flat_city_center()

func create_fjord_area():
	"""Create water area representing Trondheimsfjord"""
	print("Adding fjord geography...")
	# This would lower terrain in fjord areas
	# Implementation would involve mesh manipulation

func create_residential_hills():
	"""Create gentle hills for residential areas like Bakklandet"""
	print("Adding residential hills...")
	# This would add rolling hills to certain areas

func create_flat_city_center():
	"""Create flat area for downtown Trondheim"""
	print("Creating flat city center...")
	# This would flatten certain areas for urban development

func create_norwegian_material():
	"""Create material that looks like Norwegian landscape"""
	terrain_material = StandardMaterial3D.new()
	
	# Norwegian landscape colors
	terrain_material.albedo_color = Color(0.4, 0.5, 0.3)  # Nordic green
	terrain_material.roughness = 0.8
	terrain_material.metallic = 0.0
	
	# Add some texture variation (you'd load actual textures here)
	# terrain_material.albedo_texture = load("res://textures/norwegian_grass.png")
	
	mesh_instance.material_override = terrain_material
	print("Norwegian landscape material applied")

# Tool script functions for editor
func _get_configuration_warnings():
	var warnings = []
	
	if terrain_size.x < 100 or terrain_size.y < 100:
		warnings.append("Terrain size might be too small for open world game")
	
	if subdivisions < 50:
		warnings.append("Low subdivision count may result in blocky terrain")
	
	return warnings
