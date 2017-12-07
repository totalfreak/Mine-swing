extends RigidBody2D

const SMOOTH_SPEED = 200
var repos = Vector2()
var repos_velo = Vector2()
var position = Vector2()

var joint
var holderJoint
var isHoldingClick = false
var target_dir
var new_pos

var rock
var manager

func _ready():
	joint = get_parent().get_node("PickaxeJoint")
	holderJoint = get_parent().get_node("NodeToJointTo")
	#if get_tree().get_root().has_node("Rock"):
	manager = get_parent().get_parent().get_node("GameManager")
	rock = get_parent().get_parent().get_node("Rock")
	rock.connect("body_enter", self, "doMine", [ ])
	set_fixed_process(true)

func _fixed_process(delta):
	holderJoint.set_global_pos(joint.get_global_pos())
	if Input.is_action_pressed("left_click"):
		isHoldingClick = true
		target_dir = (get_global_mouse_pos() - joint.get_global_pos()).normalized()
		var mouse_dist = joint.get_global_pos().distance_to(get_global_mouse_pos())
		new_pos = joint.get_global_pos() + target_dir * SMOOTH_SPEED * (mouse_dist/20 * delta)
	
	if isHoldingClick:
		joint.set_global_pos(new_pos)


func doMine(body):
	manager.add(rock.getValue())