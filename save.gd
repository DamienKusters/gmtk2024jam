extends Node

const save_file_location = "user://save.json"

var template = {
	"scores": {},
}

# Contains loaded save file
var cache: Dictionary = {}

func _init():
	load_file()

#region HelperFunctions
func _cache_not_loaded():
	var not_loaded = cache.is_empty()
	if not_loaded:
		push_error('[Save] Attempting to read from cache while it has not been loaded.')
	return not_loaded

func get_stage_score(key: String) -> float:
	if _cache_not_loaded():
		return -1
	return cache.scores[key] if cache.scores.has(key) else -1

func set_stage_score(key: String, value: float) -> bool:
	if _cache_not_loaded():
		return false
	cache.scores[key] = value
	return true
#endregion

func save_file():
	if cache.is_empty():
		return # Saving is never allowed when cache is empty
	_save_to_disk(save_file_location, cache)

func load_file():
	cache = _load_from_disk(save_file_location, template)

func _save_to_disk(location: String, data: Dictionary):
	var file = FileAccess.open(location, FileAccess.WRITE)
	file.store_line(JSON.stringify(data))

func _load_from_disk(location: String, fallback_data: Dictionary) -> Dictionary:
	if !FileAccess.file_exists(location):
		return fallback_data
	var file = FileAccess.open(location, FileAccess.READ)
	var content = file.get_as_text()
	if content == "":
		return fallback_data
	#TODO: if this crashes, consider it corrupt.
	return JSON.parse_string(content)
