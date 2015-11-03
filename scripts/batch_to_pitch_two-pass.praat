# Batch generation of Pitch objects using Hirst's two-pass method
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

include ../../plugin_strutils/procedures/file_list_full_path.proc
include ../../plugin_utils/procedures/check_directory.proc
include ../../plugin_utils/procedures/require.proc
@require("5.3.44")

form Batch to Pitch (two-pass)...
  positive Floor_factor 0.75
  positive Ceiling_factor 1.5 (=use 2.5 for expressive speech)
  comment  Leave paths empty for GUI selector
  sentence Read_from
  sentence Save_to
endform

@checkDirectory(read_from$, "Read sounds from...")
read_from$ = checkDirectory.name$

@checkDirectory(save_to$, "Save Pitch objects to...")
save_to$ = checkDirectory.name$

@fileListFullPath: "list", read_from$, "*wav", 0
list = selected("Strings")

procedure for_each.action ()
  noprogress runScript: "to_pitch_two-pass.praat", floor_factor, ceiling_factor
  Save as text file: save_to$ + selected$("Pitch") + ".Pitch"
  Remove
endproc

include ../../plugin_vieweach/procedures/for_each.proc
@for_each()

removeObject: list
