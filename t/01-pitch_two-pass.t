include ../../plugin_testsimple/procedures/test_simple.proc
include ../procedures/pitch_two-pass.proc

@plan(2)

sound = Create Sound as pure tone: "tone", 1, 0, 0.4, 44100, 220, 0.2, 0.01, 0.01
runScript: "../scripts/to_pitch_two-pass.praat", 0.75, 1.5

@ok( if numberOfSelected("Pitch") = 1 then 1 else 0 fi,
  ... "script creates a Pitch object")
Remove

selectObject: sound
@pitchTwoPass(0.75, 1.5)

@ok( if numberOfSelected("Pitch") = 1 then 1 else 0 fi,
  ... "procedures creates a Pitch object")
Remove

removeObject: sound

# Make sure all objects have been removed
select all
assert numberOfSelected() = 0

@done_testing()
