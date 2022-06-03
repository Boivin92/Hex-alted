extends TileMap
var tileScene = preload("res://scenes/Tile.tscn")
const TILE_LENGTH = 120
const TILE_HEIGHT = 105
const TILE_OFFSET = 5

func _init():
	randomize()

func _ready():
	for t in get_used_cells():
		var tempTile = tileScene.instance()
		tempTile.position = t * Vector2(TILE_LENGTH + TILE_OFFSET,TILE_HEIGHT + TILE_OFFSET)
		if int(t[1]) % 2 == 1:
			tempTile.position = tempTile.position + Vector2((TILE_LENGTH+TILE_OFFSET) / 2,0) 
		var randomData = generate_random_tile()
		randomData.Position = t
		tempTile.setup(randomData)
		add_child(tempTile)
		tempTile.connect("edit", self, "tile_edit")
	self.clear()

func tile_edit(node):
	$EditPage.EditTile(node)
	$EditPage.show()

func generate_random_tile():
	var data : TileData = TileData.new()
	data.FriendlyForce = randi() % 10
	data.OpponentForce = randi() % 10
	data.Scouting = randi() % 2
	data.OpponentHero = randi() % 2
	data.FriendlyHero = randi() % 2
	data.Name = random_city()
	return data

func random_city():
	var cities = ["Accreton",
	"Monmouth",
	"Oldham",
	"Dalmellington",
	"Fallholt",
	"Pran",
	"Stawford",
	"Longdale",
	"Balmoral",
	"Holmfirth",
	"Transmere",
	"Streatham",
	"Blencogo",
	"Yellowseed",
	"Oar's Rest",
	"Narfolk",
	"Tarnstead",
	"Frostford",
	"Aerilon",
	"Aberdyfi",
	"Arcton",
	"Briar Glen",
	"Tergaron",
	"Nancledra",
	"Peatsland",
	"Culcheth",
	"Swinford",
	"Chester",
	"Hampstead",
	"Pathstow",
	"Swadlincote",
	"Aucteraden",
	"Doveport",
	"Deathfall",
	"South Warren",
	"Carlisle",
	"Kilkenny",
	"Silverkeep",
	"Warcester",
	"Leurbost"]
	cities.shuffle()
	return cities[0]
