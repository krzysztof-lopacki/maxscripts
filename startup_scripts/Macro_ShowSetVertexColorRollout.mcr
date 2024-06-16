macroScript ShowSetVertexColorRollout 
category:"Custom Tools" 
toolTip:"Set Vertex Color"
Icon:#("Material_Modifiers",3)
(
	include @"$userStartupScripts/../scripts/SetVertexColor.mxs"
	try (destroyDialog SetVertexColorRollout) catch()
	createDialog SetVertexColorRollout
)	
