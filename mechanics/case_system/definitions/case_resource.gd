## The Case resource type that holds all the information pertaining to a case.
class_name Case extends Resource

@export var actors : Array[Actor]
@export var clues : Array[Clue]
@export var locations : Array[Location]
@export var emails : Array[Email]

# TODO: Write this up either on a Miro or uploadable document to verify how the case system should
# operate.
