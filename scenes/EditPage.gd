extends ConfirmationDialog

var TilePosition : Vector2
var currentTile : Node

func _ready():
	pass
	
func EditTile(node):
	currentTile = node
	fill_info(node.get_infos())
	
func fill_info(data):
	$Vbox/HBoxContainer/Name.text = data.Name
	$Vbox/Allied.value = data.FriendlyForce
	$Vbox/Wyld.value = data.OpponentForce
	$Vbox/AHero.pressed = data.FriendlyHero
	$Vbox/WHero.pressed = data.OpponentHero
	$Vbox/Scout.pressed = data.Scouting
	TilePosition = data.Position

func get_infos():
	var data = TileData.new()
	data.Name = $Vbox/HBoxContainer/Name.text
	data.FriendlyForce = $Vbox/Allied.value
	data.OpponentForce = $Vbox/Wyld.value
	data.FriendlyHero = $Vbox/AHero.pressed
	data.OpponentHero = $Vbox/WHero.pressed
	data.Scouting = $Vbox/Scout.pressed
	data.Position = TilePosition
	return data


func _on_EditPage_confirmed():
	currentTile.setup(get_infos())
