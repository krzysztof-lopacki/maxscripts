fn alert obj =
(
	messageBox ("[" + ((classOf obj) as string) + "] " + obj as string)
)