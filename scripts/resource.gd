extends Area2D
class_name resource

# nodes
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var timer: Timer = $Timer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

@export var sprite : Texture = null
@export var pickupSound : AudioStream = null

# variables
var value : int = 1
var id : String = ""
var description : String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_2d.texture = sprite
	audio_stream_player_2d.stream = pickupSound

# call this generic function when you grab an item
func pickup() -> int:
	collision_shape_2d.disabled = true
	sprite_2d.visible = false
	audio_stream_player_2d.play()
	timer.start()
	return value

func clear():
	queue_free()