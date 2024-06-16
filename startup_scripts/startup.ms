macroDir = @"C:\Users\klopacki\Projects\3D\maxscripts\startup_scripts\"
macroFiles = getFiles(macroDir + "*.*")
for macroFile in macroFiles do
(
	if ((filenamefrompath macroFile) != "startup.ms") do
	(
		fileIn macroFile	
	)
)
--macros.load @"C:\Users\klopacki\Projects\3D\maxscripts\startup_scripts\"