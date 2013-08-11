local w,h = ScrW(), ScrH()

/* Main frame */
 
BuyMenu = vgui.Create("DFrame")
BuyMenu:SetSize( 600, 400)
BuyMenu:SetPos((w - 590) / 2, (h - 390)/2)
BuyMenu:SetTitle("Select Weapons")
BuyMenu:SetVisible( false )
BuyMenu:MakePopup( false )
 --
/* Tabs */
Tabs = vgui.Create( "DPropertySheet", BuyMenu )
Tabs:SetPos( 7, 33 )
Tabs:SetSize( 300, 360 )
Tabs:SetVisible( false )
 
TabS    =       vgui.Create( "DPanel", BuyMenu )
TabA    =       vgui.Create( "DPanel", BuyMenu )
TabPC 	= 		vgui.Create( "DCategoryList", BuyMenu )
TabSC 	= 		vgui.Create( "DCategoryList", TabS )
--

	TabPCR = vgui.Create( "DCollapsibleCategory")
	TabPCR:SetPos( 1, 28 )
	TabPCR:SetSize( 200, 200 )
	TabPCR:SetLabel( "Assault Rifles" )
	TabPC:AddItem(TabPCR)
	TabPCR:SetExpanded( 0 )

	TabPCSMG = vgui.Create( "DCollapsibleCategory")
	TabPCSMG:SetPos( 1, 28 )
	TabPCSMG:SetSize( 200, 200 )
	TabPCSMG:SetLabel( "Sub Machine Guns" )
	TabPC:AddItem(TabPCSMG)
	TabPC:SizeToContents()
	TabPCSMG:SetExpanded( 0 )
	
	TabPCSG = vgui.Create( "DCollapsibleCategory")
	TabPCSG:SetPos( 1, 28 )
	TabPCSG:SetSize( 200, 200 )
	TabPCSG:SetLabel( "Shotguns" )
	TabPC:AddItem(TabPCSG)
	TabPC:SizeToContents()
	TabPCSG:SetExpanded( 0 )
	
	TabPCSR = vgui.Create( "DCollapsibleCategory")
	TabPCSR:SetPos( 1, 28 )
	TabPCSR:SetSize( 200, 200 )
	TabPCSR:SetLabel( "Sniper Rifles" )
	TabPC:AddItem(TabPCSR)
	TabPC:SizeToContents()
	TabPCSR:SetExpanded( 0 )
	
	TabSHG = vgui.Create( "DCollapsibleCategory")
	TabSHG:SetPos( 1, 28 )
	TabSHG:SetSize( 200, 200 )
	TabSHG:SetLabel( "Hand Guns" )
	TabSC:AddItem(TabSHG)
	TabSC:SizeToContents()
	TabSHG:SetExpanded( 1 )
	
	Tabs:AddSheet( "Primary", TabPC, false, false )
	Tabs:AddSheet( "Secondary", TabS, false, false )
	Tabs:AddSheet( "Attachments", TabA, false, false )	
	
	ARList = vgui.Create( "DPanelList", TabPCR )
	SMGList = vgui.Create( "DPanelList", TabPCSMG )
	SGList = vgui.Create( "DPanelList", TabPCSG )
	SRList = vgui.Create( "DPanelList", TabPCSR )
	HGList = vgui.Create( "DPanelList", TabSHG )
	
/* Weapons */

AR = {}
	AR[1]	=	"models/weapons/w_rif_ak47.mdl"
	AR[2]	=	"models/weapons/w_rif_aug.mdl"
	AR[3]	=	"models/weapons/w_rif_famas.mdl"
	AR[4]	=	"models/weapons/w_rif_galil.mdl"
	AR[6]	=	"models/weapons/w_rif_sg552.mdl"

SG = {}
	SG[1]	=	"models/weapons/w_shot_m3super90.mdl"
	
SMG = {}
	SMG[1]	=	"models/weapons/w_smg_mac10.mdl"
	SMG[2]	=	"models/weapons/w_smg_mp5.mdl"
	SMG[4]	=	"models/weapons/w_smg_tmp.mdl"
	SMG[5]	=	"models/weapons/w_smg_ump45.mdl"
	
SR	=	{}
	SR[1]	=	"models/weapons/w_snip_awp.mdl"
	SR[2]	=	"models/weapons/w_snip_g3sg1.mdl"
	SR[3]	=	"models/weapons/w_snip_scout.mdl"
	SR[4]	=	"models/weapons/w_snip_sg550.mdl"

HG 	=	{}
	HG[1]	=	"models/weapons/w_pist_glock18.mdl"
	HG[2]	=	"models/weapons/w_pist_p228.mdl"
	HG[3]	=	"models/weapons/w_pist_fiveseven.mdl"
	HG[4]	=	"models/weapons/w_pist_deagle.mdl"

ARList:EnableVerticalScrollbar( false )
ARList:EnableHorizontal( true )
ARList:SetPadding( 3 )
ARList:SetPos( 10, 33 )
ARList:SetSize( 280, 140 )

SMGList:EnableVerticalScrollbar( false )
SMGList:EnableHorizontal( true )
SMGList:SetPadding( 3 )
SMGList:SetPos( 10, 33 )
SMGList:SetSize( 280, 70 )

SGList:EnableVerticalScrollbar( false )
SGList:EnableHorizontal( true )
SGList:SetPadding( 3 )
SGList:SetPos( 10, 33 )
SGList:SetSize( 280, 70 )

SRList:EnableVerticalScrollbar( false )
SRList:EnableHorizontal( true )
SRList:SetPadding( 3 )
SRList:SetPos( 10, 33 )
SRList:SetSize( 280, 70 )

HGList:EnableVerticalScrollbar( false )
HGList:EnableHorizontal( true )
HGList:SetPadding( 3 )
HGList:SetPos( 10, 33 )
HGList:SetSize( 280, 70 )

for k,v in pairs(AR) do 
        local icon = vgui.Create( "SpawnIcon", ARList )
        icon:SetModel( v )
        ARList:AddItem( icon )
end

for k,v in pairs(SMG) do
        local icon = vgui.Create( "SpawnIcon", SMGList )
        icon:SetModel( v )
        SMGList:AddItem( icon )
end

for k,v in pairs(SG) do
        local icon = vgui.Create( "SpawnIcon", SGList )
        icon:SetModel( v )
        SGList:AddItem( icon )
end

for k,v in pairs(SR) do
        local icon = vgui.Create( "SpawnIcon", SRList )
        icon:SetModel( v )
        SRList:AddItem( icon )
end

for k,v in pairs(HG) do
        local icon = vgui.Create( "SpawnIcon", HGList )
        icon:SetModel( v )
        HGList:AddItem( icon )
end


--Function
function ShowBuyMenu(ply, cmd, arg)
    BuyMenu:SetVisible(true)
	Tabs:SetVisible(true)
    BuyMenu:MakePopup()
end
concommand.Add("buymenu", ShowBuyMenu)