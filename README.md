# ⭐ Toon Tactics - Tower Defense (Godot Engine)

**Toon Tactics** est un jeu de Tower Defense complet développé par Alan en **GDScript** sous **Godot Engine 4**. Ce projet met en avant des mécaniques de jeu avancées : algorithmes de ciblage, gestion des coordonnées spatiales (placement de grille et de chemin), et un système de monétisation in-game complet (Gacha).

## ✨ Fonctionnalités Principales
* **Placement de Tours Dynamique :** Vérification mathématique en temps réel pour empêcher le joueur de construire sur le chemin des ennemis ou trop près d'une autre tour.
* **Ciblage Intelligent (Smart Targeting) :** Les tours analysent la progression de tous les ennemis à portée et ciblent automatiquement celui qui est le plus proche de la base.
* **Système de Vagues Personnalisé :** Générateur de vagues utilisant des tableaux de configuration et des timers asynchrones (`await`).
* **Système Gacha (Lootbox) & UI :** Tirage au sort avec probabilités pondérées (Commun 60%, Rare 30%, Légendaire 10%) et enchaînement d'animations fluides via les `Tweens` de Godot.
* **Codes Promo :** Système d'échange de codes sécurisé pour l'octroi de devises ou de skins.

---

## 💻 Code Highlights (Mécaniques Clés)

### 1. Algorithme de Ciblage Intelligent (Smart Targeting)
Au lieu de tirer sur l'ennemi le plus proche de la tour, la logique calcule quel ennemi est le plus avancé sur le `Path2D` (celui qui menace le plus la base) et le verrouille.

```gdscript
func choisir_meilleure_cible():
	var meilleur_progress = -1.0
	var meilleur_ennemi = null
	
	for ennemi in ennemis_a_portee:
		# On récupère l'avancée exacte de l'ennemi sur le chemin (PathFollow2D)
		var valeur_progress = ennemi.get("progress")
		if valeur_progress != null:
			if valeur_progress > meilleur_progress:
				meilleur_progress = valeur_progress
				meilleur_ennemi = ennemi
			
	cible_actuelle = meilleur_ennemi
