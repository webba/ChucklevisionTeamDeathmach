--Background window
local BoonMenu = {}
local w,h = ScrW(), ScrH()
BoonMenu.DermaPanel = vgui.Create( "DFrame" )
BoonMenu.DermaPanel:SetPos((w - 432) / 2, (h - 245)/2)
BoonMenu.DermaPanel:SetSize( 432, 245 )
BoonMenu.DermaPanel:SetTitle( "Team Select" )
BoonMenu.DermaPanel:SetVisible( false )
BoonMenu.DermaPanel:SetDraggable( false ) 
BoonMenu.DermaPanel:ShowCloseButton( true )
BoonMenu.DermaPanel:SetBackgroundBlur( true )
 
BoonMenu.DermaPanel2 = vgui.Create( "DPanel", BoonMenu.DermaPanel )
BoonMenu.DermaPanel2:SetPos( 10, 33 )
BoonMenu.DermaPanel2:SetSize( 200, 200 )
BoonMenu.DermaPanel2.Paint = function()
       draw.RoundedBox(2, 0, 0, 200, 200, Color( 167, 88, 75, 255)  )
end

BoonMenu.DermaPanel3 = vgui.Create( "DPanel", BoonMenu.DermaPanel )
BoonMenu.DermaPanel3:SetPos( 220, 33 )
BoonMenu.DermaPanel3:SetSize( 200, 200 )
BoonMenu.DermaPanel3.Paint = function()
       draw.RoundedBox(2, 0, 0, 200, 200, Color( 84, 125, 140, 255)  )
end

local icon1 = vgui.Create( "DModelPanel", BoonMenu.DermaPanel )
icon1:SetPos( 10, 33 )
icon1:SetSize( 200, 200 )
icon1:SetModel( 'models/player/Group03/Male_01.mdl' )
icon1.DoClick = function ()
	RunConsoleCommand( 'choose_team', '1' )
	icon1:SetVisible(false)
	BoonMenu.DermaPanel:SetVisible(false)
end

local icon2 = vgui.Create( "DModelPanel", BoonMenu.DermaPanel )
icon2:SetPos( 220, 33 )
icon2:SetSize( 200, 200 )
icon2:SetModel( 'models/player/Police.mdl' )
icon2.DoClick = function ()
	RunConsoleCommand( 'choose_team', '2' )
	icon2:SetVisible(false)
	BoonMenu.DermaPanel:SetVisible(false)
end

--Function
function ShowBoonMenu( um )
    BoonMenu.DermaPanel:SetVisible(true)
	icon1:SetVisible(true)
	icon2:SetVisible(true)
    BoonMenu.DermaPanel:MakePopup()
end
usermessage.Hook("TeamMenu", ShowBoonMenu)

--