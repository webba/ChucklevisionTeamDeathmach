AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( 'shared.lua' )

DeriveGamemode("base")
 
// Gamemode Functions
function GM:PlayerInitialSpawn( ply )
	self.BaseClass:PlayerInitialSpawn(ply)
end


function GM:PlayerSpawn( ply )
	self.BaseClass:PlayerSpawn(ply)
	self:PlayerLoadout(ply)
	ply:ChatPrint("spawn")
	ply:PickUpAttachment("aimpoint")
	ply:PickUpAttachment("acog")
	ply:PickUpAttachment("ballistic")
	ply:PickUpAttachment("bipod")
	ply:PickUpAttachment("cmag")
	ply:PickUpAttachment("elcan")
	ply:PickUpAttachment("kobra")
	ply:PickUpAttachment("riflereflex")
	ply:PickUpAttachment("vertgrip")
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
	ply:Give("cstm_pistol_p228")
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