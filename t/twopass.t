include ../../plugin_tap/procedures/more.proc
include ../procedures/pitch_two-pass.proc

@plan(3)

sound = Create Sound as pure tone: "tone",
  ... 1, 0, 0.4, 44100, 220, 0.2, 0.01, 0.01

runScript: "../scripts/to_pitch_two-pass.praat", 0.75, 1.5

@is: numberOfSelected("Pitch"), 1, "script creates a Pitch object")
Remove

selectObject: sound
@pitchTwoPass(0.75, 1.5)

@is: numberOfSelected("Pitch"), 1, "procedures creates a Pitch object"
Remove

removeObject: sound

@ok_selection()

@done_testing()
