extends Node2D
var score = 0
var upgrade_cost = 10
var upg = 1
@onready var score_label = $UI/scorel
@onready var clickb = $UI/clickb
@onready var clickup = $UI/clickup
@onready var costl = $UI/costl
func _ready():
	update_score()
	clickb.pressed.connect(_on_button_pressed)
	clickup.pressed.connect(_on_upgrade_pressed)
func _on_button_pressed():
	# Увеличиваем счёт на 1
	score += upg
	# Обновляем надпись
	update_score()
func _on_upgrade_pressed():
	if score >= upgrade_cost:
		score -= upgrade_cost
		upgrade_cost = upgrade_cost*2
		upg += 1
	update_score()
	update_upgrade_label()
# Функция для обновления текста на экране
func update_score():
	score_label.text = "Счёт: " + str(score)
	
func update_upgrade_label():
	costl.text = "Улучшить клик (" + str(upgrade_cost) + ")"
