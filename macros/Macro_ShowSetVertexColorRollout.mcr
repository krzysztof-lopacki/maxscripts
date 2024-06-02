macroScript ShowSetVertexColorRollout 
category:"Custom Tools" 
toolTip:"Show Set Vertex Color"
Icon:#("Compound",4)
(
	include "../scripts/SetVertexColor.mxs"
	try (destroyDialog SetVertexColorRollout) catch()
	createDialog SetVertexColorRollout
)	
