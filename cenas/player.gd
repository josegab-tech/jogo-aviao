extends CharacterBody2D
#variáveis para a suavização do movimento do avião
@export var maxSpeed: float = 300.0
@export var acceleration: float = 1500.0
@export var friction: float = 1200.0

#variaveis para movimento

var currentVelocity: Vector2 = Vector2.ZERO
var inputVector: Vector2 = Vector2.ZERO



func _physics_process(delta: float) -> void:
	inputVector = Input.get_vector("move_left","move_right","move_up","move_down")
	#Verificar se pressionou algo
	if inputVector != Vector2.ZERO:
		currentVelocity = currentVelocity.move_toward(inputVector *
		 maxSpeed, acceleration *delta)
	else:
		currentVelocity = currentVelocity.move_toward(Vector2.ZERO, friction * delta)
	
	velocity = currentVelocity
	
	move_and_slide()
