extends Node

var current_date : Dictionary
var calendar: Array = []

func _init():
	current_date = OS.get_datetime();
	current_date.erase("dst")
	current_date.erase("second")
#	print(current_date)
#	generate_calendar_backwards(current_date)
	print("leap 2020 : " + str(year_is_leap(2020)))
	print("leap 2019 : " + str(year_is_leap(2019)))

func generate_calendar_backwards(from_date):
	var starting_date:Dictionary = from_date
	var n_days : int = year_is_leap(starting_date["Year"])
	
	
	calendar.push_front(starting_date)
	


func year_is_leap(year : int) -> int:
	var year_div_by_4 = year % 4 == 0
	var year_div_by_100 = year % 100 == 0
	var year_div_by_400 = year % 400 == 0
	
	if (year_div_by_4 and not year_div_by_100) or year_div_by_400:
		return 366
	else: 
		return 365
