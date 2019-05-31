extends Node

var current_date : Dictionary
var current_day_of_year : int

func _init():
	current_date = OS.get_datetime();
# warning-ignore:return_value_discarded
	current_date.erase("dst")
# warning-ignore:return_value_discarded
	current_date.erase("second")
	generate_calendar_backwards(current_date)


func generate_calendar_backwards(from_date):
	var starting_date:Dictionary = from_date
	var day : int = starting_date["day"]
	var month : int = starting_date["month"]
	var year : int = starting_date.year

	current_day_of_year = nth_day_of_year(day, month, year)
	


func year_is_leap(year : int) -> bool:
	var year_div_by_4 = year % 4 == 0
	var year_div_by_100 = year % 100 == 0
	var year_div_by_400 = year % 400 == 0
	
	if (year_div_by_4 and not year_div_by_100) or year_div_by_400:
		return true
	else: 
		return false


# warning-ignore:unused_argument
func nth_day_of_year(day:int,month:int,year:int):
	var accumulative_day : int = 0
	for curr_month in month+1:
		if curr_month == 0:
			continue
		for curr_day in days_in_month(curr_month,year)+1:
			if curr_day == 0:
				continue
			accumulative_day += 1
#			print("day" + str(curr_day) + " month " + str(curr_month))
			pass
		pass
	return accumulative_day
	

func days_in_month(month,year):
	
	match month:
		1,3,5,7,8,10,12:
			return 31
		4,6,9,11:
			return 30
		2:
			if year_is_leap(year):
				return 29
			else:
				return 28
