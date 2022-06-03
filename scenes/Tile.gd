extends Node2D

signal edit
var GridPosition = Vector2(-1,-1)

func setup(data):
	$hero.visible = data.FriendlyHero
	$villain.visible = data.OpponentHero
	$scouting.visible = data.Scouting
	$HBoxContainer/allyForces.text = String(data.FriendlyForce)
	$HBoxContainer/opponentForces.text = String(data.OpponentForce)
	$name.text = data.Name
	GridPosition = data.Position

func get_infos():
	var data = TileData.new()
	data.Name = $name.text
	data.FriendlyForce = int($HBoxContainer/allyForces.text)
	data.OpponentForce = int($HBoxContainer/opponentForces.text)
	data.FriendlyHero = $hero.visible
	data.OpponentHero = $villain.visible
	data.Scouting = $scouting.visible
	data.Position = GridPosition
	return data

func _on_Button_pressed():
	emit_signal("edit", self)
