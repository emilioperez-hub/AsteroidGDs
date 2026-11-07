extends Node
@export var ScoreDisplay : TextEdit
@export var HPDisplay: TextEdit
@export var VictoryDisplay: TextEdit
@export var DefeatDisplay: TextEdit
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ScoreDisplay.text = "Score: "+ str(GameManager.score)
	HPDisplay.text = "Lifes: "+ str(GameManager.HP)
	if GameManager.score >= 10:
		VictoryDisplay.visible = true
	if GameManager.HP <= 0:
		DefeatDisplay.visible = true
	pass
