extends Node

var list: Array = []

func _on_ImportFilesDialog_file_added(file_info: Dictionary):
#	print(file_info)
	list.append(file_info)
#	print("list::    " + str(list))
