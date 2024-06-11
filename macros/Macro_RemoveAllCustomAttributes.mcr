macroScript ShowRemoveAllCustomAttributesRollout
category:"Custom Tools" 
toolTip:"Remove all custom attributes"
Icon:#("Compound",12)
(
	include "../scripts/RemoveAllCustomAttributes.mxs"
	try (destroyDialog RemoveAllCustomAttributesRollout) catch()
	createDialog RemoveAllCustomAttributesRollout
)	
