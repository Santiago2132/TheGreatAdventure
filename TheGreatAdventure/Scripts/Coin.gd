extends Area2D



#Función dentro de godot para eliminar la moneda cuando colisione con el
#Elemento
func _on_Area2D_body_entered(body): 
	queue_free()# Para que se quite de memoria 
	pass # Replace with function body.

