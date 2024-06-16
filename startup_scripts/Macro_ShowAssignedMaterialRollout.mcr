macroScript ShowAssignedMaterialRollout
category:"Custom Tools" 
toolTip:"Assigned material"
Icon:#("Containers",4)
(
	include @"$userStartupScripts/../scripts/AssignedMaterialRollout.mxs"
	try (destroyDialog AssignedMaterialRollout) catch()
	createDialog AssignedMaterialRollout
)	
