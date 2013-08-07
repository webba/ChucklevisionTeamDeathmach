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
	ply:ChatPrint(ply:LookupBone("ValveBiped.Bip01_Head1"))
	ply:ChatPrint(ply:LookupBone("ValveBiped.Anim_Attachment_RH"))
	ply:ChatPrint(ply:LookupBone("ValveBiped.Bip01_Spine"))
	ply:ChatPrint(ply:LookupBone("ValveBiped.Bip01_R_Hand"))
	ply:ChatPrint(ply:LookupBone("ValveBiped.Bip01_R_Forearm"))
	ply:ChatPrint(ply:LookupBone("ValveBiped.Bip01_R_Foot"))
	ply:ChatPrint(ply:LookupBone("ValveBiped.Bip01_R_Thigh"))
	ply:ChatPrint(ply:LookupBone("ValveBiped.Bip01_R_Calf"))
	ply:ChatPrint(ply:LookupBone("ValveBiped.Bip01_R_Shoulder"))
	ply:ChatPrint(ply:LookupBone("ValveBiped.Bip01_R_Elbow"))
	ply:ChatPrint(ply:LookupBone("ValveBiped.Bip01_L_Hand"))
	ply:ChatPrint(ply:LookupBone("ValveBiped.Bip01_L_Forearm"))
	ply:ChatPrint(ply:LookupBone("ValveBiped.Bip01_L_Foot"))
	ply:ChatPrint(ply:LookupBone("ValveBiped.Bip01_L_Thigh"))
	ply:ChatPrint(ply:LookupBone("ValveBiped.Bip01_L_Calf"))
	ply:ChatPrint(ply:LookupBone("ValveBiped.Bip01_L_Shoulder"))
	ply:ChatPrint(ply:LookupBone("ValveBiped.Bip01_L_Elbow"))
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