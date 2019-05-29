extends Button

onready var file_dialog: FileDialog = get_node("/root/Main/MainPanel/ImportFilesDialog")

func _on_ImportFilesButton_pressed():
	file_dialog.popup_centered()
