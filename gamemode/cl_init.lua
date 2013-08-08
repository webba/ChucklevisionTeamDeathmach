include( 'shared.lua' )
include( 'teamselect.lua' )


function PlayerDraw( ply )
	if ply:Team() == TEAM_SPECTATOR then
		return false
	end
end
hook.Add("PrePlayerDraw", "SpectatorDraw", PlayerDraw)