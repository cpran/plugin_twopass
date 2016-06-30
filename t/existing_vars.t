include ../../plugin_tap/procedures/more.proc

pitchTwoPass.step    = 100
pitchTwoPass.floor   = 200
pitchTwoPass.ceiling = 300

include ../procedures/pitch_two-pass.proc

@plan(3)

@is: pitchTwoPass.step   , 100,
  ... "step remains unchanged if previously specified"

@is: pitchTwoPass.floor  , 200,
  ... "floor remains unchanged if previously specified"

@is: pitchTwoPass.ceiling, 300,
  ... "ceiling remains unchanged if previously specified"

@done_testing()
