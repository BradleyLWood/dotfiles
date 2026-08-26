------------------
---- MONITORS ----
------------------

hl.monitor({
	output = "DP-1",
	mode = "2560x1440@60",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = "DVI-D-1",
	mode = "1440x900@60",
	position = "2560x300",
	scale = 1,
})

--------------------
---- WORKSPACES ----
--------------------

-- Assign workspaces 1-7 to DP-1
for i = 1, 7 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "DP-1",
		default = (i == 1),
	})
end

-- Assign workspaces 6-10 to DVI-D-1
for i = 8, 10 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "DVI-D-1",
		default = (i == 6),
	})
end
