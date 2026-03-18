func verifier_emplacement_valide(pos):
	if chemin_ennemis:
		# Conversion des coordonnées pour correspondre au tracé de la route
		var souris_local = chemin_ennemis.to_local(pos)
		var point_sur_chemin = chemin_ennemis.curve.get_closest_point(souris_local)
		var point_global = chemin_ennemis.to_global(point_sur_chemin)
		
		# Calcul de la distance entre la souris et le bord de la route
		var distance_route = pos.distance_to(point_global)
		
		if distance_route < 115:
			return false # Trop près de la route !

	var tours_existantes = get_tree().get_nodes_in_group("Tours")
	for tour in tours_existantes:
		if tour == tour_fantome: continue
		if pos.distance_to(tour.global_position) < 90:
			return false # Chevauchement avec une autre tour
			
	return true
