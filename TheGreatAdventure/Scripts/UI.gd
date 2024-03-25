extends CanvasLayer

# User interface
var coins = 0 # Inicializada con 0

func _ready():
	$Contador.text = str(coins) # Convierte el valor a string antes de asignarlo
