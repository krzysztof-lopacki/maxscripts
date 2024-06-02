fn getLastModifier obj modifierClass =
(
    for i = 1 to obj.modifiers.count by 1 do
    (
        local modifier = obj.modifiers[i]
        if classOf modifier == modifierClass do return modifier
    )
	undefined
)
