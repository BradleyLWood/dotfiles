#!/usr/bin/env fish

function radio
	set init_vol 50
	set station (cat ~/Music/radio-streams | fzf | grep -o '".*"')
	#set station (station | tr -d '"')

	# TODO not working
	if not set -q station[1]
		echo "no matches"
		exit 1
	end
	
	#tmux neww fish -c "mpv --no-video --volume=$init_vol $station"
	#echo "mpv --no-video --volume=$init_vol $station"
	echo "mpv $station"
	#mpv --no-video --volume=$init_vol $station
end
