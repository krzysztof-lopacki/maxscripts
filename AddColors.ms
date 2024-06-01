-- Colors should be point4(0-1, 0-1, 0-1, 0-1)
fn addColors color1 color2 =
(
	if (color1.w == 0 and color2.w == 0) then
	(
		[0, 0, 0, 0]
	)
	else
	(
		local ar = color1.w + color2.w - (color1.w * color2.w)
		local asr = color2.w / ar
		local a1 = 1 - asr
		local a2 = asr * (1 - color1.w)
		local ab = asr * color1.w
		local r = color1.x * a1 + color2.x * a2 + color2.x * ab
		local g = color1.y * a1 + color2.y * a2 + color2.y * ab
		local b = color1.z * a1 + color2.z * a2 + color2.z * ab
		
		[r, g, b, ar]	
	)
)