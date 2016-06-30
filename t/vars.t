include ../../plugin_tap/procedures/more.proc
include ../procedures/pitch_two-pass.proc

@no_plan()

synth = Create SpeechSynthesizer: "English", "default"
sound = To Sound: "This is some text.", "no"

default_time_step = pitchTwoPass.step
new_time_step = 1
pitchTwoPass.step = new_time_step
@pitchTwoPass: 0.75, 1.5

@is: do("Get time step"), new_time_step,
  ... "specify time step using variables"
Remove

selectObject: sound
pitchTwoPass.step = undefined
@pitchTwoPass: 0.75, 1.5

@is: do("Get time step"), default_time_step,
  ... "reset time step to default"
old_max = Get maximum: 0, 0, "Hertz", "None"
Remove

selectObject: sound
new_ceiling = 100
pitchTwoPass.ceiling = new_ceiling
@pitchTwoPass: 0.75, 1.5

new_max = Get maximum: 0, 0, "Hertz", "None"
@cmp_ok: old_max, ">", new_max,
  ... "lowering ceiling decreases maximum"

@cmp_ok: new_max - new_ceiling, "<", 1,
  ... "new maximum close to ceiling"
Remove

removeObject: sound, synth

@ok_selection()

@done_testing()
