AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "teamselect.lua" )
AddCSLuaFile( "cl_init.lua" )

include( 'shared.lua' )

DeriveGamemode("sandbox")

local Round = false

// Gamemode Functions
function GM:PlayerInitialSpawn( ply )
	self.BaseClass:PlayerInitialSpawn(ply)
	if #player.GetAll() >= 2 and not Round then
		Round = true 
		umsg.Start("TeamMenu")
		umsg.End()
		timer.Simple(0.5, function()
		end)
	else 
		ply:SetTeam(TEAM_SPECTATOR)
		ply:KillSilent()
		ply:Spectate(OBS_MODE_ROAMING)
		ply:SetMoveType(MOVETYPE_NOCLIP)
		if Round then
			umsg.Start("TeamMenu", ply)
			umsg.End()
		end
	end
end

function GM:PlayerNoClip( ply ) 
	if ply:Team() == TEAM_SPECTATOR then
		return true
	else 
		return false
	end
end

function GM:PlayerThinkDeath(ply)
	if ply:Team() == TEAM_SPECTATOR then
		return false 
	end
end

function GM:PlayerSpawn( ply )
	if ply:Team() == 1 or ply:Team() == 2 then
		self.BaseClass:PlayerSpawn(ply)
		self:PlayerLoadout(ply)
		ply:PickUpAttachment("aimpoint")
		ply:PickUpAttachment("acog")
		ply:PickUpAttachment("ballistic")
		ply:PickUpAttachment("bipod")
		ply:PickUpAttachment("cmag")
		ply:PickUpAttachment("elcan")
		ply:PickUpAttachment("kobra")
		ply:PickUpAttachment("riflereflex")
		ply:PickUpAttachment("vertgrip")
		ply:PickUpAttachment("eotech")
		ply:PickUpAttachment("laser")
		ply:PickUpAttachment("grenadelauncher")
		ply:PickUpAttachment("reflex")
		ply:PickUpAmmoType("ap")
		ply:PickUpAmmoType("birdshot")
		ply:PickUpAmmoType("frag")
		ply:PickUpAmmoType("hp")
		ply:PickUpAmmoType("incendiary")
		ply:PickUpAmmoType("magnum")
		ply:PickUpAmmoType("slug")
	end
end

function GM:PlayerLoadout( ply )
	ply:StripWeapons()
	ply:StripAmmo()
	ply:Give("cstm_rif_ak47")
	ply:Give("cstm_rif_galil")
	ply:Give("cstm_rif_m249")
	ply:Give("cstm_smg_tmp")
	ply:Give("cstm_sniper_scout")
	ply:Give("cstm_sniper_sg552")
	ply:Give("cstm_pistol_deagle")
	ply:Give("cstm_pistol_dualelites")
	ply:Give("cstm_pistol_fiveseven")
	ply:Give("cstm_pistol_glock18")
	ply:Give("cstm_rif_famas")
	ply:Give("cstm_shotgun_m3")
	ply:Give("cstm_shotgun_xm1014")
	ply:Give("cstm_smg_mac10")
	ply:Give("cstm_smg_mp5")
	ply:Give("cstm_smg_p90")
	ply:Give("cstm_smg_ump45")
	ply:Give("cstm_sniper_aug")
	ply:Give("cstm_sniper_awp")
	ply:Give("cstm_sniper_g3")
	ply:Give("cstm_sniper_sg550")
end

function GM:PlayerShouldTakeDamage( victim, pl )
	if Round then
		if pl:IsPlayer() then
			if (pl:Team() == victim:Team() and GetConVarNumber("mp_friendlyfire") == 0) then
				return false
			end
		end
		return true
	else 
		return false
	end
end

function giveshit(ply, cmd, arg)
	ply:Give("cstm_" .. arg[1])
end
concommand.Add("giveme", giveshit)

function spawnshit(ply, cmd, arg)
	local ee = ents.Create(arg[1])
	ee:SetPos(ply:GetEyeTrace().HitPos + Vector(0,0,50))
	ee:Spawn()
end
concommand.Add("spawnme", spawnshit)

function menus(ply, cmd, arg)
	umsg.Start("TeamMenu", ply)
	umsg.End()
end
concommand.Add("showmenu", menus)

function SelectTeam( ply, cmd, arg )
	if Round then
		if #arg == 1 then
			if arg[1] == "1" then
				ply:SetTeam(2)
				ply:KillSilent()
			elseif arg[1] == "2" then
				ply:SetTeam(2)
				ply:KillSilent()
			end
		end
	end
end
concommand.Add("choose_team", SelectTeam)


//Player
local _R = debug.getregistry()
local meta = _R.Player


function meta:gun( ... )
	-- body
end