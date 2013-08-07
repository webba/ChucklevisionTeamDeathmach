AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( 'shared.lua' )

DeriveGamemode("sandbox")
 
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
	ply:PickUpAttachment("reflexsight")
	ply:PickUpAttachment("riflereflex")
	ply:PickUpAttachment("vertgrip")
end

function GM:PlayerLoadout( ply )
	ply:StripWeapons()
	ply:StripAmmo()
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