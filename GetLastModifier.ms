fn getLastModifier obj modifierClass =
(
    for i = obj.modifiers.count to 1 by -1 do
    (
        local modifier = obj.modifiers[i]
        if classOf modifier == modifierClass do return modifier
    )
	undefined
)
