extends Node

var objective_label: Label

func set_label(label: Label):
	objective_label = label
	update_objective()

func update_objective():
	if objective_label == null:
		return

	if GameManager.has_lab_key:
		objective_label.text = "Objective: Unlock the Lab Door"
	else:
		objective_label.text = "Objective: Find the Lab Key"
