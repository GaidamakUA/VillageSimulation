extends RichTextLabel

func _ready():
	pass

func _on_TimeAccumulator_secons_changed(moment):
	print("seconds", moment.seconds)

func _on_TimeAccumulator_minutes_changed(moment):
	print("minutes", moment.minutes)

func _on_TimeAccumulator_hours_changed(moment):
	print("hours", moment.hours)

func _on_TimeAccumulator_days_changed(moment):
	print("days", moment.days)
