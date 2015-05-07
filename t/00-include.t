include ../../plugin_testsimple/procedures/test_simple.proc

@plan(1)

include ../procedures/pitch_two-pass.proc
@ok(1, "can include pitch_two-pass")

@done_testing()
