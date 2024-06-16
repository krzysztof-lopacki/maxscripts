macroScript ShowRemoveAllCustomAttributesRollout
category:"Custom Tools" 
toolTip:"Remove all custom attributes"
Icon:#("Containers",12)
(
	include @"$userStartupScripts/../scripts\RemoveAllCustomAttributes.mxs"
	try (destroyDialog RemoveAllCustomAttributesRollout) catch()
	createDialog RemoveAllCustomAttributesRollout
)	
