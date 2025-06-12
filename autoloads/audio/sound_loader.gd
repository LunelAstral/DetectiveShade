class_name SoundLoader

#region Loaders
## Loads all audio types via their respective loading methods
func load_audio() -> void:
	load_ost()
	load_sfx()
	load_ui()
	load_ambient()

## Loads OSTs into MusicManager
func load_ost() -> void:
	# Add OST loads here in format (int: [preload(song_path), end_of_loop (-1 for no looping)]
	# Ex:
	#		0: [preload("res://assets/audio/ost/theme.wav"), 356]
	
	# TODO: Merge Intro and Loop into one song, combined with MusicManager "to do", change it so that
	# this is an array and the second number is an array of where to loop songs.
	var song_list : Dictionary[int, Array] = {
		0: [preload("res://assets/audio/music/Evelyn Photo Intro.wav"), -1],
		1: [preload("res://assets/audio/music/Evelyn Photo Loop.wav"), 0],
		2: [preload("res://assets/audio/music/Finale Intro.wav"), -1],
		3: [preload("res://assets/audio/music/Finale Loop.wav"), 0],
		4: [preload("res://assets/audio/music/Interrogation Room Intro.wav"), -1],
		5: [preload("res://assets/audio/music/Interrogation Room Loop.wav"), 0],
		6: [preload("res://assets/audio/music/Marina Photo Intro.wav"), -1],
		7: [preload("res://assets/audio/music/Marina Photo Loop.wav"), 0],
		8: [preload("res://assets/audio/music/Marina's Apartment Intro.wav"), -1],
		9: [preload("res://assets/audio/music/Marina's Apartment Loop.wav"), 0],
		10: [preload("res://assets/audio/music/Shade's Office Intro.wav"), -1],
		11: [preload("res://assets/audio/music/Shade's Office Loop.wav"), 0],
		12: [preload("res://assets/audio/music/Title Screen Intro.wav"), -1],
		13: [preload("res://assets/audio/music/Title Screen Loop.wav"), 0],
		14: [preload("res://assets/audio/music/Victor's Office Intro.wav"),  -1],
		15: [preload("res://assets/audio/music/Victor's Office Loop.wav"), 0]
	}
	
	for song in song_list.values():
		song.get(0).resource_name = grab_name(song.get(0).resource_path)
		MusicManager.add_ost(song.get(0), song.get(1))

## Loads SFX into the SFX BUS of SoundManager
func load_sfx() -> void:
	# Add SFX loads here in format: preload(sfx_path)
	var sfx_list : Array[AudioStream] = [
		preload("res://assets/audio/sfx/Arrest.wav"),
		preload("res://assets/audio/sfx/Door Knock.wav"),
		preload("res://assets/audio/sfx/Door Open.wav"),
		preload("res://assets/audio/sfx/Exclaim.wav"),
		preload("res://assets/audio/sfx/Screen Shake.wav"),
		preload("res://assets/audio/sfx/Screen Shake Aggressive.wav"),
	]
	
	for sfx in sfx_list:
		sfx.resource_name = grab_name(sfx.resource_path)
		SoundManager.add_sound(sfx)

## Loads UI SFX into the UI BUS of SoundManager
func load_ui() -> void:
	# Add UI loads here in format: preload(ui_sfx_path)
	var ui_list : Array[AudioStream] = [
		preload("res://assets/audio/sfx/Book Close.wav"),
		preload("res://assets/audio/sfx/Book Hover.wav"),
		preload("res://assets/audio/sfx/Book Open.wav"),
		preload("res://assets/audio/sfx/Book Turn.wav"),
		preload("res://assets/audio/sfx/Mouse Click Fail.wav"),
		preload("res://assets/audio/sfx/Mouse Click.wav"),
		preload("res://assets/audio/sfx/Object Hover 1.wav"),
		preload("res://assets/audio/sfx/Object Hover 2.wav"),
		preload("res://assets/audio/sfx/Object Hover 3.wav"),
		preload("res://assets/audio/sfx/Object Hover 4.wav"),
		preload("res://assets/audio/sfx/Object Select.wav"),
		preload("res://assets/audio/sfx/Popup.wav"),
		preload("res://assets/audio/sfx/Sticky Note Hover.wav"),
		preload("res://assets/audio/sfx/UI Open Close.wav")
	]
	
	for ui in ui_list:
		ui.resource_name = grab_name(ui.resource_path)
		SoundManager.add_sound(ui)

## Loads Ambient SFX into the Ambient BUS of SoundManager
func load_ambient() -> void:
	# Add Ambient loads here in format: preload(ambient_sfx_path)
	var ambient_list : Array[AudioStream] = [
		preload("res://assets/audio/ambient/Interrogation Room.wav"),
		preload("res://assets/audio/ambient/OS Boot.wav"),
		preload("res://assets/audio/ambient/Photo Jump.wav"),
		preload("res://assets/audio/ambient/Shade's Office.wav")
	]
	
	for ambient in ambient_list:
		ambient.resource_name = grab_name(ambient.resource_path)
		SoundManager.add_sound(ambient)
#endregion

#region Helpers
## A helper function to quickly grab the actual name of the song file by inserting its [param path].
func grab_name(path: String) -> String:
	return path.split("/")[path.split("/").size() - 1].split(".")[0]
#endregion
