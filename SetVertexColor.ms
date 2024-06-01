include "convertGeometricIndexToMapIndices.ms"

global SELECTION_CHANNEL = 1
global VERTEX_COLOR_CHANNEL = 0
global pickedColor = [1.0, 1.0, 1.0]

undo "Paint softly" on
(
	if selection.count == 0 then
	(
		messageBox "No object selected. Please select an object with vertices."
	)
	else
	(
		local obj = selection[1]
		if classOf obj != Editable_Poly then
		(
			messageBox "Selected object is not a Editable_Poly. Please select a Editable_Poly."
			return()
		)
		
		local totalVerts = polyop.getNumVerts obj
		if obj.useSoftSelection then
		(
			for vertexIndex = 1 to totalVerts do
			(
				local selectionAmount = polyop.getVDataValue obj SELECTION_CHANNEL vertexIndex
				local mapIndices = (convertGeometricIndexToMapIndices obj vertexIndex VERTEX_COLOR_CHANNEL)
				for mappingIndex in mapIndices do
				(
					local currentColor = polyop.getMapVert obj VERTEX_COLOR_CHANNEL mappingIndex
					local newColor = (selectionAmount * pickedColor) + (1 - selectionAmount) * currentColor
					
					--print ((mappingIndex as string) + " : " + (newColor as string))
					polyop.setMapVert obj 0 mappingIndex newColor
				)
			)
		)
		else
		(
			local vertSelection = polyOp.getVertSelection obj			
			for vertexIndex = 1 to totalVerts do
			(
				if vertSelection[vertexIndex] then
				(
					local mappingIndices = (getMappingIndices obj 0 vertexIndex)
					for mappingIndex in mappingIndices do
						polyop.setMapVert obj 0 mappingIndex pickedColor
					)
			)
		)
		redrawViews()
	)
)

