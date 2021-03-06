AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "teamselect.lua" )
AddCSLuaFile( "cl_init.lua" )

include( 'shared.lua' )

DeriveGamemode("sandbox")
math.randomseed(os.time())

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
		local v = GetCameraPos()
		timer.Simple(1, function()
			print("setting ply to " .. v:__tostring())
			ply:SetPos(v)
		end)		
		ply:Lock()
		if Round then
			umsg.Start("TeamMenu", ply)
			umsg.End()
		end
	end
end

function GetSpawnPos( ply )
	local vector = Vector(0,0,0)
	if ply:Team() == 1 then
		vector = Vector(4940.808594 + math.random(1, 500), 6616.148438 - math.random(1, 300), -853.556458)
	elseif ply:Team() == 2 then
		vector = Vector(5640.761719 + math.random(1, 290), 4358.299805 + math.random(1, 270), -843.028503)
	end
	return vector
end

function GetCameraPos()
	local n1 = math.random(1, 3)
	local x, y, z = 4736.417480, 5314.400391 - math.random(1, 650), -342.520813
	if n1 == 2 then
		x, y, z = 5943.297852 + math.random(1, 200), 5599.052246, -303.236877
	elseif n1 == 3 then
		x, y, z = 7130.868164, 6053.958496 - math.random(1, 400), -272.230988
	end
	return Vector(x, y, z)
end

function GM:PlayerNoClip( ply ) 
	if ply:Team() == TEAM_SPECTATOR then
		return true
	else 
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
		ply:SetPos(GetSpawnPos(ply))
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
	if victim:Team() == TEAM_SPECTATOR then
		return false
	end
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

function pos(ply, cmd, arg)
	ply:ChatPrint(ply:GetPos():__tostring())
end
concommand.Add("ppos", pos)

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
				ply:SetTeam(1)
				ply:SetModel( 'models/player/Police.mdl' )
				ply:UnLock()
				ply:Spawn()
			elseif arg[1] == "2" then
				ply:SetTeam(2)
				ply:SetModel( 'models/player/Group03/Male_01.mdl' )
				ply:UnLock()
				ply:Spawn()
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