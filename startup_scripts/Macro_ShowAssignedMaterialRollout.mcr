macroScript ShowAssignedMaterialRollout
category:"Custom Tools" 
toolTip:"Assigned material"
Icon:#("Compound",4)
(
	fileIn "../scripts/AssignedMaterialRollout.mxs"
	try (destroyDialog AssignedMaterialRollout) catch()
	createDialog AssignedMaterialRollout
)	
