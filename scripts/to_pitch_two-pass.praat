# Generate Pitch objects using Hirst's two-pass method
#
# This script is part of the twopass plugin for CPrAN.
# The latest versi  on is available through CPrAN or at
# <http://cpran.net/plugins/twopass>
#
# This script is part of the twopass CPrAN plugin for Praat.
# The latest version is available through CPrAN or at
# <http://cpran.net/plugins/twopass>
#
# The twopass plugin is free software: you can redistribute it
# and/or modify it under the terms of the GNU General Public
# License as published by the Free Software Foundation, either
# version 3 of the License, or (at your option) any later version.
#
# The twopass plugin is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty
# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with twopass. If not, see <http://www.gnu.org/licenses/>.
#
# Copyright 2014, 2015 Jose Joaquin Atria

include ../procedures/pitch_two-pass.proc
include ../../plugin_utils/procedures/check_directory.proc
include ../../plugin_selection/procedures/selection.proc

form To Pitch (two-pass)...
  positive Floor_factor 0.75
  positive Ceiling_factor 1.5 (=use 2.5 for expressive speech)
endform

extension$ = "wav"

n =  numberOfSelected("Sound")

if !n
  exitScript: No objects selected
endif

# Save selection
for i to n
  sound[i] = selected(i)
endfor

# Iterate through selection
for i to n
  sound = sound[i]
  selectObject: sound
  @pitchTwoPass(floor_factor, ceiling_factor)
  pitch[i] = pitchTwoPass.id
endfor

# Select newly created objects
@clearSelection()
for i to n
  plusObject: pitch[i]
endfor
