AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( 'shared.lua' )
 
// Gamemode Functions

function GM:PlayerSpawn(ply)
	ply:ChatPrint("spawn")
	ply:PickUpAttachment("aimpoint")
	ply:PickUpAttachment("acog")
	ply:PickUpAttachment("ballistic")
	ply:PickUpAttachment("bipod")
	ply:PickUpAttachment("cmag")
	ply:PickUpAttachment("elcan")
	ply:PickUpAttachment("eotech557")
	ply:PickUpAttachment("m203")
	ply:PickUpAttachment("kobra")
	ply:PickUpAttachment("reflexsight")
	ply:PickUpAttachment("riflereflex")
	ply:PickUpAttachment("vertgrip")
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