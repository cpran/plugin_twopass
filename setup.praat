# Setup script for twopass
#
# Find the latest version of this plugin at
# https://gitlab.com/cpran/plugin_twopass
#
# Written by Jose Joaquín Atria
#
# This script is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# A copy of the GNU General Public License is available at
# <http://www.gnu.org/licenses/>.

## Static commands:

Add menu command: "Objects", "Praat", "twopass", "CPrAN", 1, ""
Add menu command: "Objects", "Praat", "To Pitch in batch (two-pass)...",               "twopass", 2, "scripts/batch_to_pitch_two-pass.praat"

## Dynamic commands

# Sound commands
Add action command: "Sound", 0, "", 0, "", 0, "To Pitch (two-pass)...", "Analyse periodicity -", 1, "scripts/to_pitch_two-pass.praat"
