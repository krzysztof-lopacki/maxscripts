fn convertGeometricIndexToMapIndices obj vertexIndex mapChannel =
(
 	local mapIndices = #{}
 	local facesUsingVertex = polyop.getFacesUsingVert obj vertexIndex
    for face in facesUsingVertex do
    (
		-- getMapFace returns the vertex indices of the specified map face as an array.
        faceVertices = polyop.getMapFace obj mapChannel face
		for i = 1 to faceVertices.count do
        (
			-- getFaceVerts returns the face's vertices as an array. 
			local geometricIndex = (polyop.getFaceVerts obj face)[i]
						
            if (geometricIndex == vertexIndex) do mapIndices[faceVertices[i]] = true
        )
    )
	mapIndices as array
)
