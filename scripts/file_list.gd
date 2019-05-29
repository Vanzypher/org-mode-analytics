extends Node

var list: Array = []


func _on_ImportFilesDialog_file_added(file_info: Dictionary):
#	print(file_info)
	list.append(file_info)
#	print("list::    " + str(list))
	get_logbook_entries(file_info["file_contents"])


func get_logbook_entries(org_mode_text: String):
	var text: Array = org_mode_text.split("\n")
	var found_logbook = false
	var last_header: String = ""
	
	for line in text:
		line = line.rstrip(" ")
		line = line.lstrip(" ")
		
		if line == ":LOGBOOK:":
			found_logbook = true
			continue
		if line == ":END:":
			found_logbook = false
			continue
		
		if line.begins_with("CLOCK:"):
			line = line.trim_prefix("CLOCK: ")
			print(line)
#			print(last_header)
			
			var start_time
			var end_time
			
			start_time = line.substr(1, 20)
			end_time = line.substr(25, 20)
			
		line = line.lstrip("*")
		line = line.lstrip(" ")
		last_header = line
		pass
	
		
	
	pass