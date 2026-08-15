------------------
---- MONITORS ----
------------------
hl.monitor({
	output = "eDP-1",
	mode = "3840x2160",
	position = "0x0",
	scale = 2,
})

--------------------
---- WORKSPACES ----
--------------------

-- Assign workspaces 1-10 to eDP-1
for i = 1, 10 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "eDP-1",
		default = (i == 1),
	})
end
