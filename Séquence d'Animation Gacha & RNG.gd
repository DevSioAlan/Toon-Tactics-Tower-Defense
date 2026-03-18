func lancer_anim():
	# Étape 1 : Tremblement de la Lootbox
	var tween = get_tree().create_tween()
	tween.tween_property(boite, "scale", Vector2(1.2, 1.2), 0.2)
	tween.tween_property(boite, "rotation_degrees", 10, 0.1)
	tween.tween_property(boite, "rotation_degrees", -10, 0.1)
	tween.tween_property(boite, "rotation_degrees", 0, 0.1)
	tween.tween_callback(anim_capsule_finale) # Enchaîne sur l'étape 2

# ... (Étape 2 omise pour la brièveté) ...

func reveler_lot():
	# Logique de tirage avec taux de drop
	var chance = randi_range(1, 100)
	if chance <= 60:
		lot_final_nom = data["commun"].pick_random() # 60% Chance
	elif chance <= 90:
		lot_final_nom = data["rare"].pick_random()   # 30% Chance
	else:
		lot_final_nom = data["legendaire"].pick_random() # 10% Chance

	# Effet de Pop (Élasticité) pour révéler le lot gagné
	var tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property(item_visuel, "scale", Vector2(1, 1), 0.6).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	tween.tween_property(item_visuel, "position", position_item_origine, 0.6).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
