@tool

extends TileMapLayer

@export var mirroredTilemap: TileMapLayer
@export var sync_map := false:
	set = _sync_map_toggled
var tile_coord
var tile_source
var tile_alt

func _ready():
	print("sync is ready")

func _sync_map_toggled(value):
	print("sync Map toggled ", value)
	if value:
		sync_mirrored_world()
		print("mirrored sync triggered")

func sync_mirrored_world():
	print("syncing mirrored")
	
	if not mirroredTilemap:
		print("mirrored world not assigned")
		return
	
	mirroredTilemap.clear()
	print("Getting Used Cells")
	for cell in get_used_cells():
		tile_coord = get_cell_atlas_coords(cell) 
		tile_source = get_cell_source_id(cell)
		tile_alt = get_cell_alternative_tile(cell)
		print("Source Cell: ",cell,", atlas coordinats ", tile_coord)
		
		if tile_coord != null:
			mirroredTilemap.set_cell(cell, tile_source, tile_coord, tile_alt)
			print("set mirrored cell: ",cell," with tile: ",tile_coord)
	print("mirrored synced")
