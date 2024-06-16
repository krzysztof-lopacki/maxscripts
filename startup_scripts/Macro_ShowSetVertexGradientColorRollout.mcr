macroScript ShowSetVertexGradientColorRollout 
category:"Custom Tools" 
toolTip:"Vertex Gradient Color"
Icon:#("SnapsControls",9)
(
	fileIn "../scripts/SetVertexGradientColor.mxs"
	try (destroyDialog SetVertexGradientColorRollout) catch()
	createDialog SetVertexGradientColorRollout
)	
