fileIn "ConvertGeometricIndexToMapIndices.ms" 
fileIn "Alert.ms"
fileIn "GetLastModifier.ms" 
fileIn "AddColors.ms" 

try (destroyDialog SetVertexColorRollout) catch()

rollout SetVertexColorRollout "Vertex Color Painter" width:180
(
	local SELECTION_CHANNEL = 1
	local VERTEX_COLOR_CHANNEL = 0

	group "Color 1"
	(
		colorPicker color1 "" color:(color 255 0 0) align:#left across:2
		button paintButton1 "Paint with Color 1" align:#right
	)
	group "Color 2"
	(
		colorPicker color2 "" color:(color 0 255 0) align:#left across:2
		button paintButton2 "Paint with Color 2" align:#right
	)
	group "Color 3"
	(
		colorPicker color3 "" color:(color 0 0 255) align:#left across:2
		button paintButton3 "Paint with Color 3" align:#right
	)	
	group "Color 4"
	(
		colorPicker color4 "" color:(color 255 255 255) align:#left across:2
		button paintButton4 "Paint with Color 4" align:#right
	)		
	group "Color 5"
	(
		colorPicker color5 "" color:(color 0 0 0) align:#left across:2
		button paintButton5 "Paint with Color 5" align:#right
	)

	-- local method for painting the object
	fn paintWithColor pickedColor =
	(
		local colorVector = point3 (pickedColor.red/255) (pickedColor.green/255) (pickedColor.blue/255)
		
		undo "Paint with Color" on
		(
			if selection.count == 0 then
			(
				messageBox "No object selected. Please select an object with vertices."
			)
			else
			(
				local obj = selection[1]
				if classOf obj != PolyMeshObject do
				(
					messageBox "Selected object is not a PolyMeshObject. Please select a PolyMeshObject."
					return()
				)
				
				local vertexPaintMod = getLastModifier obj VertexPaint
				if (vertexPaintMod == undefined) do
				(
					messageBox "There must be a VertexPaint modifier on the stack.."
					return()
				)
				
				local selectionModifer = obj.modifiers[1]
				local selectionModiferClass = classOf selectionModifer
				local useSoftSelection = false
				if (selectionModiferClass == Poly_Select) then
				(
					useSoftSelection = selectionModifer.useSoftSelection
				)
				else if (selectionModiferClass == Edit_Poly) then
				(
					useSoftSelection = selectionModifer.useSoftSel 
				)
				else
				(
					messageBox "The last modifer has to be Poly Select or Edit_Poly."
					return()
				)
				
				local state = vertexPaintMod.AcquirePaintState obj
				local totalVerts = polyop.getNumVerts obj
				if useSoftSelection then
				(
					for vertexIndex = 1 to totalVerts do
					(
						local selectionAmount = polyop.getVDataValue obj SELECTION_CHANNEL vertexIndex
						local baseColor = state.GetVertAverageColor vertexIndex
						local newColor = addColors baseColor [colorVector.x, colorVector.y, colorVector.z, selectionAmount]
 						state.SetVertColor vertexIndex [newColor.x, newColor.y, newColor.z, newColor.w]
					)
				)
				else
				(
					local vertSelection = getVertSelection obj selectionModifer
					for vertexIndex = 1 to totalVerts do
					(
						if vertSelection[vertexIndex] then
						(
							state.SetVertColor vertexIndex [colorVector.x, colorVector.y, colorVector.z, 1]
						)
					)
				)
				vertexPaintMod.ApplyPaintState obj state
				vertexPaintMod.ReleasePaintState obj state
			)
		)
	)
	
	on paintButton1 pressed do
	(
		paintWithColor color1.color
	)
	
	on paintButton2 pressed do
	(
		paintWithColor color2.color
	)
	
	on paintButton3 pressed do
	(
		paintWithColor color3.color
	)
	
	on paintButton4 pressed do
	(
		paintWithColor color4.color
	)
	
	on paintButton5 pressed do
	(
		paintWithColor color5.color
	)
)
1
createDialog SetVertexColorRollout