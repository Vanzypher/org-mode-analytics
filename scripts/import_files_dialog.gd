extends FileDialog

onready var item_list: ItemList = get_node("/root/Main/MainPanel/ItemList")

signal file_added
signal file_removed

func _on_ImportFilesDialog_files_selected(paths: PoolStringArray):
	for path in paths:
		var file_info: Dictionary = {}
		var file_name = path.get_file()
		
		var file = File.new()
		file.open(path,File.READ)
		var content = file.get_as_text()
		file.close()
		
		file_info["file_name"] = file_name
		file_info["file_path"] = path
		file_info["file_contents"] = content
		
		item_list.add_item(file_name)
		emit_signal("file_added", file_info)

