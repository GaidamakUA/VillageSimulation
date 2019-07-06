extends Node

signal secons_changed(moment)
signal minutes_changed(moment)
signal hours_changed(moment)
signal days_changed(moment)

const SECONDS_IN_MINUTE = 60
const MINUTES_IN_HOUR = 60
const HOURS_IN_DAY = 24

export(int, 1, 2400) var time_speedup: int

var time: float = 0
var seconds: int = 0
var minutes: int = 0
var hours: int = 0
var days: int = 0

func _process(delta):
	time += delta * time_speedup
	var new_seconds = int(round(time))
	var new_minutes = new_seconds / SECONDS_IN_MINUTE
	var new_hours = new_minutes / MINUTES_IN_HOUR
	var new_days = new_hours / HOURS_IN_DAY
		
	if (seconds != new_seconds):
		seconds = new_seconds
		emit_signal("secons_changed", Moment.new(new_seconds))
	if (minutes != new_minutes):
		minutes = new_minutes
		emit_signal("minutes_changed", Moment.new(new_seconds))
	if (hours != new_hours):
		hours = new_hours
		emit_signal("hours_changed", Moment.new(new_seconds))
	if (days != new_days):
		days = new_days
		emit_signal("days_changed", Moment.new(new_seconds))

class Moment:
	var seconds: int
	var minutes: int
	var hours: int
	var days: int
	
	func _init(s: int):
		seconds = s % 60
		minutes = s / 60 % 60
		hours = s / 60 / 60 % 24
		days = s / 60 / 60 / 24