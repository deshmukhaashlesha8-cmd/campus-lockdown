extends Node

var objective_label: Label

func set_label(label: Label):
	objective_label = label
	update_objective()

func update_objective():
	if objective_label == null:
		return

	if not GameManager.access_key_1:
		objective_label.text = "Objective: Find the Access Key in the Admin Office"

	elif not GameManager.access_key_2:
		objective_label.text = "Objective: Go to the Library and find Key 2"

	elif not GameManager.access_key_3:
		objective_label.text = "Objective: Access the Computer Lab and find the correct computer"

	elif GameManager.all_tasks_done():
		objective_label.text = "Objective: Activate Campus Lockdown"
