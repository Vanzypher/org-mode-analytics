extends Node

var list: Array = []
#var clocks

func _on_ImportFilesDialog_file_added(file_info: Dictionary):
#	print(file_info)
	list.append(file_info)
#	print("list::    " + str(list))
	get_logbook_entries(file_info["file_contents"])


func get_logbook_entries(org_mode_text: String):
	var text: Array = org_mode_text.split("\n")
# warning-ignore:unused_variable
	var found_logbook = false
# warning-ignore:unused_variable
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
#			print(line)
#			print(last_header)
			
# warning-ignore:unused_variable
			var start_time
# warning-ignore:unused_variable
			var end_time
			
			start_time = line.substr(0, 22)
			end_time = line.substr(24, 22)
			
			# start_time and end_time from string to dictionary
			start_time = _convert_string_date_to_dict(start_time)
			end_time = _convert_string_date_to_dict(end_time)
			print(start_time)
			print(end_time)
			
			
			
		line = line.lstrip("*")
		line = line.lstrip(" ")
		last_header = line
		pass
	
	pass
# date in the format: [YYYY-MM-DD Wed HH:mm]
func _convert_string_date_to_dict(date:String) -> Dictionary:
	var date_dict : Dictionary = {}
	
	var year: int = int(date.substr(1,4))
	date_dict["year"] = year
#	print(year)
	var month: int = int(date.substr(6,2))
	date_dict["month"] = month
#	print(month)
	var day: int = int(date.substr(10,2))
	date_dict["day"] = day
#	print(day)
	var weekday: String = convert_day_of_the_week(date.substr(12,3))
	date_dict["weekday"] = weekday
#	print(day_of_the_week)
	var hour: String = date.substr(16,2)
	date_dict["hour"] = hour
#	print(hour)
	var minute: String = date.substr(19,2)
	date_dict["minute"] = minute
#	print(minute)
#	print(date_dict)
	return date_dict

func convert_day_of_the_week(day_string:String):
	match day_string:
		"Sun":
			return 0
		"Mon":
			return 1
		"Tue":
			return 2
		"Wed":
			return 3
		"Thu":
			return 4
		"Fri":
			return 5
		"Sat":
			return 6
