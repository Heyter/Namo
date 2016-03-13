// NNNNNNNN        NNNNNNNN                                                                HHHHHHHHH     HHHHHHHHH                                      kkkkkkkk                
// N:::::::N       N::::::N                                                                H:::::::H     H:::::::H                                      k::::::k                
// N::::::::N      N::::::N                                                                H:::::::H     H:::::::H                                      k::::::k                
// N:::::::::N     N::::::N                                                                HH::::::H     H::::::HH                                      k::::::k                
// N::::::::::N    N::::::N  aaaaaaaaaaaaa      mmmmmmm    mmmmmmm      ooooooooooo          H:::::H     H:::::H    aaaaaaaaaaaaa       cccccccccccccccc k:::::k    kkkkkkk     
// N:::::::::::N   N::::::N  a::::::::::::a   mm:::::::m  m:::::::mm  oo:::::::::::oo        H:::::H     H:::::H    a::::::::::::a    cc:::::::::::::::c k:::::k   k:::::k      
// N:::::::N::::N  N::::::N  aaaaaaaaa:::::a m::::::::::mm::::::::::mo:::::::::::::::o       H::::::HHHHH::::::H    aaaaaaaaa:::::a  c:::::::::::::::::c k:::::k  k:::::k       
// N::::::N N::::N N::::::N           a::::a m::::::::::::::::::::::mo:::::ooooo:::::o       H:::::::::::::::::H             a::::a c:::::::cccccc:::::c k:::::k k:::::k        
// N::::::N  N::::N:::::::N    aaaaaaa:::::a m:::::mmm::::::mmm:::::mo::::o     o::::o       H:::::::::::::::::H      aaaaaaa:::::a c::::::c     ccccccc k::::::k:::::k         
// N::::::N   N:::::::::::N  aa::::::::::::a m::::m   m::::m   m::::mo::::o     o::::o       H::::::HHHHH::::::H    aa::::::::::::a c:::::c              k:::::::::::k          
// N::::::N    N::::::::::N a::::aaaa::::::a m::::m   m::::m   m::::mo::::o     o::::o       H:::::H     H:::::H   a::::aaaa::::::a c:::::c              k:::::::::::k          
// N::::::N     N:::::::::Na::::a    a:::::a m::::m   m::::m   m::::mo::::o     o::::o       H:::::H     H:::::H  a::::a    a:::::a c::::::c     ccccccc k::::::k:::::k         
// N::::::N      N::::::::Na::::a    a:::::a m::::m   m::::m   m::::mo:::::ooooo:::::o     HH::::::H     H::::::HHa::::a    a:::::a c:::::::cccccc:::::ck::::::k k:::::k        
// N::::::N       N:::::::Na:::::aaaa::::::a m::::m   m::::m   m::::mo:::::::::::::::o     H:::::::H     H:::::::Ha:::::aaaa::::::a  c:::::::::::::::::ck::::::k  k:::::k       
// N::::::N        N::::::N a::::::::::aa:::am::::m   m::::m   m::::m oo:::::::::::oo      H:::::::H     H:::::::H a::::::::::aa:::a  cc:::::::::::::::ck::::::k   k:::::k      
// NNNNNNNN         NNNNNNN  aaaaaaaaaa  aaaammmmmm   mmmmmm   mmmmmm   ooooooooooo        HHHHHHHHH     HHHHHHHHH  aaaaaaaaaa  aaaa    cccccccccccccccckkkkkkkk    kkkkkkk     

//Amplify Stuff
require("amplify")

//AirStuck
local function airstuck()
      if input.IsKeyDown(KEY_F) then
	     amplify.AirStuck(true)
else
	     amplify.AirStuck(false)
	end
end
hook.Add("CreateMove", "airstuck", airstuck)


//Speed
CreateClientConVar("N_Speed", 8, true, false)
local function Speed()
	if input.IsKeyDown(KEY_G) then
		amplify.Speed(GetConVarNumber("N_speed"))
	else
		amplify.Speed(0)
	end
end
hook.Add("CreateMove", "Speed", Speed)


local Namo = {}
Namo.Message = function(...)
        chat.AddText(Color(0, 255, 255), "[♥Namo♥] ", ...)
end


//A Whole ton of variables
Namo.FriendsList = {}
Namo.TextEntries = {}
Namo.Hooks = {}
Namo.EntityESP = {}
Namo.BoneOrder = {}
Namo.Traitors = {}
Namo.Murderers = {}
Namo.Options = {}

//Aimbot
Namo.Options["Aimbot_Toggle"] = false
Namo.Options["Aimbot_LOSCheck"] = false
Namo.Options["Aimbot_AutoWall"] = true
Namo.Options["Aimbot_AimOnKey"] = false
Namo.Options["Aimbot_AimOnKey_Key"] = 0
Namo.Options["Aimbot_SmoothAim"] = false
Namo.Options["Aimbot_SmoothAim_Value"] = 600
Namo.Options["Aimbot_AimPriority"] = "Distance"
Namo.Options["Aimbot_FOV"] = false
if LocalPlayer():GetFOV() != nil then Namo.Options["Aimbot_FOV_Value"] = LocalPlayer():GetFOV() else Namo.Options["Aimbot_FOV_Value"] = 75 end
Namo.Options["Aimbot_StickToTarget"] = false
Namo.Options["Aimbot_BoneAim"] = false
Namo.Options["Aimbot_AutoShoot"] = false
Namo.Options["Aimbot_AimTeam"] = false
Namo.Options["Aimbot_AimOpponents"] = true
Namo.Options["Aimbot_AimFriends"] = false
Namo.Options["Aimbot_AimEnemies"] = false
Namo.Options["Aimbot_AimNPCs"] = false
Namo.Options["Aimbot_AimSpectators"] = false
Namo.Options["Aimbot_AimTeamV"] = "Aim"
Namo.Options["Aimbot_AimOpponentsV"] = "Aim"
Namo.Options["Aimbot_AimFriendsV"] = "Aim"
Namo.Options["Aimbot_AimEnemiesV"] = "Aim"
Namo.Options["Aimbot_AimNPCsV"] = "Aim"
Namo.Options["Aimbot_AimSpectatorsV"] = "Aim"
Namo.Options["Aimbot_OffsetX"] = 0
Namo.Options["Aimbot_OffsetY"] = 0

//Esp
Namo.Options["ESP_Toggle"] = false
Namo.Options["ESP_ShowTeam"] = true
Namo.Options["ESP_ShowOpponents"] = true
Namo.Options["ESP_ShowFriends"] = false
Namo.Options["ESP_ShowEnemies"] = false
Namo.Options["ESP_ShowNPCs"] = false
Namo.Options["ESP_ShowSpectators"] = false
Namo.Options["ESP_ShowTeamV"] = "Show"
Namo.Options["ESP_ShowOpponentsV"] = "Show"
Namo.Options["ESP_ShowFriendsV"] = "Show"
Namo.Options["ESP_ShowEnemiesV"] = "Show"
Namo.Options["ESP_ShowNPCsV"] = "Show"
Namo.Options["ESP_ShowSpectatorsV"] = "Show"
Namo.Options["ESP_Entity_Toggle"] = false
Namo.Options["ESP_Entities_NameTags"] = false
Namo.Options["ESP_Entities_BoundaryBoxes"] = false
Namo.Options["ESP_Entities_BoundaryBoxes_Mode"] = "2D"
Namo.Options["ESP_BoundaryBoxes"] = false
Namo.Options["ESP_BoundaryBoxes_Mode"] = "2D"
Namo.Options["ESP_NameTags"] = false
Namo.Options["ESP_Weapon"] = false
Namo.Options["ESP_Distance"] = false
Namo.Options["ESP_Health"] = false
Namo.Options["ESP_Skeleton"] = false
Namo.Options["ESP_Crosshair"] = false
Namo.Options["ESP_Crosshair_Size"] = 50
Namo.Options["ESP_Crosshair_Mode"] = "Team"
Namo.Options["ESP_Crosshair_Color_R"] = 0
Namo.Options["ESP_Crosshair_Color_G"] = 0
Namo.Options["ESP_Crosshair_Color_B"] = 255
Namo.Options["ESP_Crosshair_Color_A"] = 255

//Misc
Namo.Options["Misc_AdminBox"] = false
Namo.Options["Misc_AdminBox_Mode"] = "Auto"
Namo.Options["Misc_AdminBox_PosX"] = 0
Namo.Options["Misc_AdminBox_PosY"] = 0
Namo.Options["Misc_SpectatorsBox"] = false
Namo.Options["Misc_SpectatorsBox_Mode"] = "Auto"
Namo.Options["Misc_SpectatorsBox_PosX"] = 150
Namo.Options["Misc_SpectatorsBox_PosY"] = 0
Namo.Options["Misc_AutoButton"] = false
Namo.Options["Misc_speed"] = false
Namo.Options["Misc_speed_speed"] = 8

//Friends
Namo.Options["Friends_FriendIsEnemy"] = false
Namo.Options["Friends_SteamFriends"] = false
Namo.Options["Friends_SteamEnemies"] = false

//Cams
Namo.Options["Cams_Toggle"] = false
Namo.Options["Cams_CSNoclip"] = false
Namo.Options["Cams_CSNoclip_Speed"] = 10
Namo.Options["Cams_ThirdPerson"] = false
Namo.Options["Cams_ThirdPerson_Zoom"] = 30

//Bhop
Namo.Options["Bhop_Toggle"] = false
Namo.Options["Bhop_FastWalk"] = false
Namo.Options["Bhop_AutoHop"] = false
Namo.Options["Bhop_AutoStrafe"] = false
Namo.Options["Bhop_EdgeJump"] = false
Namo.Options["Bhop_EdgeJump_Distance"] = 40
Namo.Options["Bhop_Sideways"] = false
Namo.Options["Bhop_WOnly"] = false

//Spam, Broken
Namo.Options["Spam_Toggle"] = false
Namo.Options["Spam_Delay"] = false
Namo.Options["Spam_Delay_Value"] = 10
Namo.Options["Spam_AntiAntiSpam"] = false
Namo.Options["Spam_Message_1"] = false
Namo.Options["Spam_Message_2"] = false
Namo.Options["Spam_Message_3"] = false
Namo.Options["Spam_Message_4"] = false
Namo.Options["Spam_Message_5"] = false

//CommieSpam
local Spams = {
	"Self Cultivation is the key to understanding Communism",
	"Workers of the World Unite!",
	"You have nothing to lose but your Chains!",
	"Peace, Bread, Work",
	"One, Two, Three, Four, Frag the Rich to Feed the Poor!",
	"www.Marxists.Org",
	"Russia and China only failed from communism because of their transition to capitalism, Cuba does well on its own",
	"Yes, people have starved under Communism, but less people starve from communism then from capitalism",
	"Communism is a society with no laws, no government, no state, no class system, no currency, etc",
	"Communism is a stateless, classless, moneyless, worldwide society and workers own the means of production",
}
local Spammer = CreateClientConVar("N_spam", "0", true, false)

local RJokes = {
	"Why doesn't Mexico have an Olympic team? Because everybody who can run, jump and swim are already in the U.S.",
	"Why can't you play Uno with a Mexican? They steal all the green cards.",
	"Father's day, the most confusing day in the ghetto.",
	"Why don't blacks celebrate thanksgiving? KFC isn't open on holidays.",
	"What would martin Luther king be if he was white? Alive.",
	"Why is there cotton in pill bottles? To remind black people that they were cotton pickers before drug dealers.",
	"What did the little Mexican boy get for Christmas? My bike.",
	"Why wasn't there any blacks in the flint stones? Because they were still monkeys.",
	"How can you tell when the Mexicans have moved into your neighbourhood? The Blacks get car insurance.",
	"What does it mean when you see a bunch of blacks running in one direction? Jail break.",
	"Why do blacks wear white gloves? So they don't bite their fingers eating tootsie rolls.",
	"Why do blacks smell? So blind people can hate them too.",
	"A black guy and a Mexican guy opened a restaurant. It's called Nacho Mama.",
	"How long does it take a black lady to shit? About 9 months.",
	"What do you call a black priest? Holy Shit.",
	"Hey, I'm not saying Hitler was a great guy, but he really saved the History channel.",
	"Which part of the Bible won't you find a black man? The Book of Job.",
	"What's long and hard on a nigger? First grade.",
	"What's long, black and smelly? The unemployment line.",
	"What do you get when you cross a Mexican and a nigger? Someone who is too lazy to steal.",
	"I'm not racist, my shadow is black.",
	"What did God say when he saw the first black person? Ooops, I burnt one!",
	"Where is the best place to hide a nigger's food stamps? Under his work boots.",
	"What you call 10 black people in the back of a truck? A good days hunting.",
	"What does NAACP stand for? National Association of Apes Called People.",
	"What do you call a Mexican with a vasectomy? A dry Martinez.",
	"How do you keep black people out of your back yard? Hang one in the front!",
	"What's yellow and black and makes you laugh: A bus full of niggers going over a cliff.",
	"What's the difference between a jew and a pizza? A pizza doesn't scream when you put it in the oven!",
	"Why did God create black men? So fat white girls could dance (and get laid).",
	"Why do blacks raise chickens? To teach their kids how to walk.",
	"How do you starve a black man? Put his food stamps in his work boots.",
	"Why don't vampires go south of the border? Because every time they suck a Mexican's blood, they get the vshits for a month.",
	"Pakistan army will never try to win the war against India, someone told them winner has to speak English on live television.",
	"Black magic.... It doesn't work.",
	"Son asking father. Why are niggers so black daddy? Well son, whip this one while I think about it.",
	"How do you keep a Jew out of a canoe? With chips.",
	"Why is there so little Puerto Rican literature? Because spray paint wasn't invented until 1949",
	"In Kentucky, what do divorces and tornados have in common? Either way, someone is going to lose a trailer.",
	"What's black and blue and hates sex? A rape victim.",
	"What does a redneck say after sex? Thanks Mom.",
	"Why did the redneck cross the road? Because he couldn't get his dick out of the chicken.",
	"How do you kill 100 Mexicans? Blow up their van.",
	"What do you call a Mexican midget? A paragraph",
	"Whats a Jews favourite day of the week? Fry-day",
	"What did the little black boy say when he got diarrhea? I'm melting!",
	"How many jews can you fit in a VW Beetle? 54, two in the front, two in the back, and fifty in the ashtray",
}
local Jokes = CreateClientConVar("N_jokes", "0", true, false)

local function RandomString() return tostring(math.random(-9999999999, 9999999999)) end
local function RandomShortString() return tostring(math.random(0, 100)) end
local MenuOpen = false
local UpdateBoneThink = false
local UpdateBoneThinkNum = 0
local NormSvCheats, NormHostTimeScale, TimeScaleChange = 0, 1, false
local FPSValue = 0
local DisplayBoxWidths = 0
local AdminsListBool = false
local SpecsListBool = false
local AdminBoxTall, AdminBoxWide, SpecBoxTall, SpecBoxWide = 0, 0, 0, 0
local GMode
local MDone = false
if string.find(string.lower(GAMEMODE.Name), "terror") != nil then
	GMode = 1
elseif string.find(string.lower(GAMEMODE.Name), "murder") != nil then
	GMode = 2
else
	GMode = 3
end

//Fancy Smancy fonts
surface.CreateFont("Menu_Title",{font = "coolvetica", size = 25})
surface.CreateFont("ESP_Font_Main",{font = "coolvetica", size = 20})
surface.CreateFont("ESP_Font_Entity",{font = "coolvetica", size = 17})
surface.CreateFont("ESP_Font_Health",{font = "coolvetica", size = 12})
surface.CreateFont("Cams",{font = "Arial", size = 25})




//Hack Management
function AddHook( NormID, Event, ID, Function )
	table.insert( Namo.Hooks, NormID.."|"..Event.."|"..ID )
	hook.Add( Event, ID, Function )
end

function RemoveHook( NormID )
	for k, v in pairs( Namo.Hooks ) do
		local SubTable = string.Explode( "|", v )
		if SubTable[1] == NormID then
			hook.Remove( SubTable[2], SubTable[3] )
			table.remove( Namo.Hooks, k )
		end
	end
end



//ESP Colours
function GetTeam( Ply )
	local Team = Ply:Team()
	local t, c
	if GMode == 1 then
		if Team == TEAM_SPECTATOR then
			t = Team
			c = team.GetColor(Team)
		else
			if table.HasValue(Namo.Traitors, Ply:SteamID()) then
				t = 1
				c = Color(255,0,0)
			elseif Ply:GetRole() == 2 then
				t = 0
				c = Color(0,0,255)
			else
				t = 0
				c = Color(0,255,255)
			end
		end
	elseif GMode == 2 then
		if Team == TEAM_SPECTATOR then
			t = Team
			c = team.GetColor(Team)
		else
			if table.HasValue(Namo.Murderers, Ply:SteamID()) then
				t = 2
				c = Color(255,0,0)
			else
				t = 1
				local Moo = false
				for k, v in pairs(Ply:GetWeapons()) do
					if v:GetClass() == "weapon_mu_magnum" then
						Moo = true
						break
					end
				end
				if Moo == true then
					c = Color(0,255,255)
				else
					c = Color(0,255,255)
				end
			end
		end
	else
		t = Team
		c = team.GetColor(Team)
	end
	return t, c
end



//UnloadNamo
function UnloadNamo( Display )
	//Menu
	concommand.Remove("N_menu")

	//Hooks
	Namo.Options["Misc_AdminBox"] = false
	Namo.Options["Misc_SpectatorsBox"] = false 

	timer.Simple( 0.5, function() 
		for k, v in pairs( Namo.Hooks ) do
			local SubTable = string.Explode( "|", v )
			hook.Remove( SubTable[2], SubTable[3] )
		end
		table.Empty( Namo.Hooks )
	end)
end



//Reload Namo
function ReloadNamo( Display )
	local Admin = Namo.Options["Misc_AdminBox"]
	local Spec = Namo.Options["Misc_SpectatorsBox"]
	UnloadNamo()
	timer.Simple( 0.5, function()
		LoadNamo()
		if Admin then
			Namo.Options["Misc_AdminBox"] = true
			AddDisplayBox( "Admins", 1 )
		end
		if Spec then
			Namo.Options["Misc_SpectatorsBox"] = true
			AddDisplayBox( "Spectators", 2 )
		end
		LocalPlayer():ConCommand("N_menu")
		if Display then
			AddHook( "Reloaded", "HUDPaint", RandomString(), function()
				draw.SimpleTextOutlined( "♥Namo Hack Reloaded Successfully!♥", "Menu_Title", ScrW()/2, 50, Color(0,150,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0) )
				timer.Simple( 3, function()
					RemoveHook("Reloaded")
				end)
			end)
		end
	end)
end



//LoadNamo
function LoadNamo( Display )
	//Commands
	CreateClientConVar("N_panic", 0, false, false)
	concommand.Add("N_menu", NamoMenu)

	local EntTable = ents.GetAll()
	local FastWalk = false
	local MenuDelay, FPSDelay = false, false
	local ForwardMove = 0
	local SideMove = 0
	local TapS = false
	local WLeft, WRight, WForward, WBack, WActive = false, false, true, false, false
	local NoclipPos, NoclipAngles, NoclipOn, NoclipX, NoclipY, NoclipDuck, NoclipJump = LocalPlayer():EyePos(), LocalPlayer():GetAngles(), false, 0, 0, false, false
	local ScaleActive, ScaleNum = false, 1
	local SpamWait, Spam1, Spam2, Spam3, Spam4, Spam5 = false, false, false, false, false, false
	
	
	
	
	//Hooks
	AddHook( "Menu", "Think", RandomString(), function()
		if input.IsKeyDown(KEY_INSERT) && !MenuDelay then
			MenuDelay = true
			NamoMenu()
			timer.Simple( 0.5, function() MenuDelay = false end )
		end

		
		
		
		//FPS
		if FPSDelay == false then
			FPSDelay = true
			timer.Simple( 0.5, function() FPSValue = math.Round(1/RealFrameTime()) FPSDelay = false end )
		end


		
		//Reset T Round
		if GMode == 1 then
			if GetRoundState() != 3 then
				table.Empty(Namo.Traitors)
			else
				for k, v in pairs(player.GetAll()) do
					local Ply = v
					local Team = Ply:GetRole()
					if Team == 2 then return end
					if LocalPlayer():GetRole() != 1 then
						for k, v in pairs(Ply:GetWeapons()) do
							if table.HasValue(v.CanBuy, 1) && !table.HasValue(Namo.Traitors, Ply:SteamID()) then
								table.insert(Namo.Traitors, Ply:SteamID())
							end
						end
					else
						if Team == 1 && !table.HasValue(Namo.Traitors, Ply:SteamID()) then
							table.insert(Namo.Traitors, Ply:SteamID())
						end
					end
				end
			end
		elseif GMode == 2 then
			if !MDone then
				for k, v in pairs(ents.GetAll()) do
					if v:GetClass() == "weapon_mu_knife" then
						table.insert(Namo.Murderers, v:GetOwner():SteamID())
					end
				end
				MDone = true
			else
				for k, v in pairs(ents.GetAll()) do
					if v:GetClass() == "weapon_mu_knife" then
						if !table.HasValue(Namo.Murderers, v:GetOwner():SteamID()) then
							table.Empty(Namo.Murderers)
							MDone = false
						end
					end
				end
			end
		end
	end)

	
	
CreateClientConVar("N_Silent", 0, false, false)
if GetConVarNumber("N_Silent") == 1 then
	local ang;
	hook.Add("CreateMove", "", function(ucmd)
		if(!ang) then ang = ucmd:GetViewAngles(); end
		ang = ang + Angle(ucmd:GetMouseY() * .023, ucmd:GetMouseX() * -.023, 0);
		ang.x = math.NormalizeAngle(ang.x);
		ang.p = math.Clamp(ang.p, -89, 89);
		if(ucmd:CommandNumber() == 0) then
			ucmd:SetViewAngles(ang);
			return;
		end
		local target = nil
	hook.Add("Think","",function()
		if not input.IsKeyDown(KEY_V) then return end
		target = nil
		local ply = LocalPlayer()
		for k,v in next, player.GetAll() do
			if ( v == ply ) or ( not v:IsValid() ) or ( v:IsDormant() ) or ( v:Team() == TEAM_SPECTATOR ) or ( v:Health() < 1 ) or ( not v:Alive() ) then
				continue 
			end
			local Visible = { start = ply:GetShootPos(), endpos = v:GetAttachment(v:LookupAttachment("forward")).Pos, filter = {ply,v}, mask = MASK_SHOT}
			local tr = util.TraceLine(Visible)
			if tr.Fraction == 1 then
				target = v
			end	
		end
		if ( target != nil ) then
			local GetPosition = (target:GetAttachment(target:LookupAttachment("forward")).Pos - ply:GetShootPos()):Angle()
			ply:SetEyeAngles(GetPosition)
			RunConsoleCommand("+attack")
			timer.Simple(0.1, function() 
				RunConsoleCommand("-attack")
			end)
		end
	end)
	end);
end	
	
	
//Aimbot
	AddHook( "Aimbot", "Think", RandomString(), function()
		if GetConVarNumber("N_panic") == 0 && Namo.Options["Aimbot_Toggle"] && !MenuOpen && !(Namo.Options["Cams_Toggle"] && Namo.Options["Cams_CSNoclip"]) then
			if !Namo.Options["Aimbot_AimOnKey"] || ( ( ( Namo.Options["Aimbot_AimOnKey_Key"] >= 107 && Namo.Options["Aimbot_AimOnKey_Key"] <= 113 ) && input.IsMouseDown(Namo.Options["Aimbot_AimOnKey_Key"]) ) || input.IsKeyDown(Namo.Options["Aimbot_AimOnKey_Key"]) ) then
				local FinAngleP
				local AimSpotT = {}
				local PlayerDistance, NewPlayerDistance, MousePos, NewMousePos = math.huge, math.huge, math.huge, math.huge
				if !Namo.Options["Aimbot_StickToTarget"] then EntTable = ents.GetAll() end
				for k, v in pairs(EntTable) do
					if v != LocalPlayer() && v:IsValid() && v:Health() > 0 && ( v:IsNPC() || v:IsPlayer() ) then
						local Ent = v
						local AimTeam, AimOpponents, AimFriends, AimEnemies, AimSpectators, AimNPCs = false, false, false, false, false, false
						local AimTeamV, AimOpponentsV, AimFriendsV, AimEnemiesV, AimSpectatorsV, AimNPCsV = true, true, true, true, true, true
						if !Ent:IsNPC() then
							local Team, _ = GetTeam(Ent)
							if Ent:Team() != TEAM_SPECTATOR && Namo.Options["Aimbot_AimTeam"] && Team == GetTeam(LocalPlayer()) then
								if Namo.Options["Aimbot_AimTeamV"] == "Aim" then
									AimTeam = true
								else
									AimTeamV = false
								end
							end
							if Ent:Team() != TEAM_SPECTATOR && Namo.Options["Aimbot_AimOpponents"] && Team != GetTeam(LocalPlayer()) then
								if Namo.Options["Aimbot_AimOpponentsV"] == "Aim" then
									AimOpponents = true
								else
									AimOpponentsV = false
								end
							end
							if Ent:Team() != TEAM_SPECTATOR && Namo.Options["Aimbot_AimFriends"] && ( (!Namo.Options["Friends_FriendIsEnemy"] && table.HasValue( Namo.FriendsList, Ent:SteamID() ) ) || (Namo.Options["Friends_FriendIsEnemy"] && !table.HasValue( Namo.FriendsList, Ent:SteamID() ) ) ) then
								if Namo.Options["Aimbot_AimFriendsV"] == "Aim" then
									AimFriends = true
								else
									AimFriendsV = false
								end
							end
							if Ent:Team() != TEAM_SPECTATOR && Namo.Options["Aimbot_AimEnemies"] && ( (!Namo.Options["Friends_FriendIsEnemy"] && !table.HasValue( Namo.FriendsList, Ent:SteamID() ) ) || (Namo.Options["Friends_FriendIsEnemy"] && table.HasValue( Namo.FriendsList, Ent:SteamID() ) ) ) then
								if Namo.Options["Aimbot_AimEnemiesV"] == "Aim" then
									AimEnemies = true
								else
									AimEnemiesV = false
								end
							end
							if Namo.Options["Aimbot_AimSpectators"] && Ent:Team() == TEAM_SPECTATOR then
								if Namo.Options["AimSpectatorsV"] == "Aim" then
									AimSpectators = true
								else
									AimSpectatorsV = false
								end
							end
						else
							if Namo.Options["Aimbot_AimNPCs"] && Namo.Options["Aimbot_AimNPCsV"] == "Aim" then
								if Namo.Options["Aimbot_AimNPCsV"] == "Aim" then
									AimNPCs = true
								else
									AimNPCsV = false
								end
							end
						end
						if (AimTeam || AimOpponents || AimFriends || AimEnemies || AimSpectators || AimNPCs) && (AimTeamV && AimOpponentsV && AimFriendsV && AimEnemiesV && AimSpectatorsV && AimNPCsV) then
							local LOS, AimP, AimF = false, false, false
							local AimSpot

							if Namo.Options["Aimbot_BoneAim"] && Namo.BoneOrder[1] != nil then
								table.Empty( AimSpotT )
								for k, v in pairs(Namo.BoneOrder) do
									if Ent:GetBonePosition(Ent:LookupBone(v)) != nil && AimSpot == nil then
										AimSpot = Ent:GetBonePosition(Ent:LookupBone(v))
									end
									if Ent:GetBonePosition(Ent:LookupBone(v)) != nil then
										local BonePos = Ent:GetBonePosition(Ent:LookupBone(v))
										if v == "ValveBiped.Bip01_Head1" then BonePos = BonePos+Vector(0,0,1) end
										table.insert( AimSpotT, BonePos )
									end
								end
								if AimSpot == nil then AimSpot = Ent:LocalToWorld(Ent:OBBCenter()) end
								if AimSpotT == nil then AimSpotT = {Ent:LocalToWorld(Ent:OBBCenter())} end
							else
								AimSpot = Ent:LocalToWorld(Ent:OBBCenter())
								AimSpotT = {Ent:LocalToWorld(Ent:OBBCenter())}
							end

							local CurAngle = LocalPlayer():EyeAngles()
							local CurPos = LocalPlayer():GetShootPos()

							AimSpot = AimSpot+(CurAngle:Right()*Namo.Options["Aimbot_OffsetX"]) 
							AimSpot.z = AimSpot.z + Namo.Options["Aimbot_OffsetY"]

							local FinAngle = ( AimSpot - CurPos ):Angle()
							if FinAngle.y > 180 then
								FinAngle.y = FinAngle.y-360
							end

							if Namo.Options["Aimbot_AimPriority"] == "Distance" then
								if LocalPlayer():GetShootPos():Distance(AimSpot) < PlayerDistance then NewPlayerDistance = LocalPlayer():GetShootPos():Distance(AimSpot) AimP = true end
							elseif Namo.Options["Aimbot_AimPriority"] == "Crosshair" then
								local FirstCalc = math.Distance( CurAngle.x, CurAngle.y, FinAngle.x, FinAngle.y )
								local Calc
								if FirstCalc > 180 && ( ( CurAngle.y >= 0 && FinAngle.y < 0 ) || ( CurAngle.y < 0 && FinAngle.y >= 0 ) ) then
									Calc = 360 - math.Distance( CurAngle.x, CurAngle.y, FinAngle.x, FinAngle.y )
								else
									Calc = math.Distance( CurAngle.x, CurAngle.y, FinAngle.x, FinAngle.y )
								end
								if Calc < MousePos then NewMousePos = Calc AimP = true end
							end

							if Namo.Options["Aimbot_FOV"] then
								local CalcX = FinAngle.y - CurAngle.y
								local CalcY = FinAngle.x - CurAngle.x
								if CalcY < 0 then CalcY = CalcY * -1 end
								if CalcX < 0 then CalcX = CalcX * -1 end
								if CalcY > 180 then CalcY = 360 - CalcY end
								if CalcX > 180 then CalcX = 360 - CalcX end
								if CalcX <= Namo.Options["Aimbot_FOV_Value"]/2 && CalcY <= Namo.Options["Aimbot_FOV_Value"]*0.4 then AimF = true end
							else
								AimF = true
							end

							if Namo.Options["Aimbot_LOSCheck"] || Namo.Options["Aimbot_AutoWall"] then
								for k, v in pairs(AimSpotT) do
									local TrLOS = {}
									TrLOS.start = LocalPlayer():GetShootPos()
									TrLOS.endpos = v
									TrLOS.filter = {}
									if Namo.Options["Aimbot_StickToTarget"] then
										for k, v in pairs(ents.GetAll()) do
											if v:IsValid() && ( v:IsPlayer() || v:IsNPC() ) then
												table.insert( TrLOS.filter, v )
											end
										end
									else TrLOS.filter = {LocalPlayer(), Ent} end
									if Namo.Options["Aimbot_AutoWall"] then TrLOS.mask = MASK_SHOT else TrLOS.mask = MASK_VISIBLE_AND_NPCS end
									if util.TraceLine(TrLOS).Fraction == 1 then
										LOS = true
										AimSpot = v
										break
									end
								end
							else
								LOS = true
							end
							if LOS && AimP && AimF then
								EntTable = {Ent}
								FinAngleP = FinAngle
								PlayerDistance = NewPlayerDistance
								MousePos = NewMousePos
							elseif Namo.Options["Aimbot_StickToTarget"] && EntTable[2] != nil then
								EntTable = ents.GetAll()
							end
						end
					end
				end
				if EntTable != nil && FinAngleP != nil then
					if Namo.Options["Aimbot_SmoothAim"] then
						SmoothAngles( FinAngleP, Namo.Options["Aimbot_SmoothAim_Value"] )
					else
						if Namo.Options["Aimbot_AutoShoot"] then
							LocalPlayer():SetEyeAngles(FinAngleP)
							LocalPlayer():ConCommand("+attack")
							timer.Simple( 0.1, function() LocalPlayer():ConCommand("-attack") end )
						else
							LocalPlayer():SetEyeAngles(FinAngleP)
						end
					end
				elseif EntTable[2] == nil then
					EntTable = ents.GetAll()
				end
			else
				if EntTable[2] == nil then
					EntTable = ents.GetAll()
				end
			end
		end
	end)

//360 noscope
function Final()
    targetheadpos,targetheadang = target:GetBonePosition(aimbone)
    LocalPlayer():SetEyeAngles((targetheadpos - LocalPlayer():GetShootPos()):Angle())
    timer.Create("6",0.0001,1,function() LocalPlayer():ConCommand("+attack") end)
    timer.Create("7",0.1,1,function() LocalPlayer():ConCommand("-attack") end)
end

function two()
    LocalPlayer():ConCommand("-jump")
    timer.Create("1",0.1,1,function() LocalPlayer():SetEyeAngles(LocalPlayer():EyeAngles() + Angle(0,90,0) ) end)
    timer.Create("2",0.2,1,function() LocalPlayer():SetEyeAngles(LocalPlayer():EyeAngles() + Angle(0,90,0)) end)
    timer.Create("3",0.3,1,function() LocalPlayer():SetEyeAngles(LocalPlayer():EyeAngles() + Angle(0,90,0)) end)
    timer.Create("4",0.4,1,function() LocalPlayer():SetEyeAngles(LocalPlayer():EyeAngles() + Angle(0,90,0)) end)
    timer.Create("5",0.5,1,Final)
end

function one()
    if LocalPlayer():GetEyeTraceNoCursor().Entity:IsNPC() or LocalPlayer():GetEyeTraceNoCursor().Entity:IsPlayer() then
        target = LocalPlayer():GetEyeTraceNoCursor().Entity
        aimbone = LocalPlayer():GetEyeTraceNoCursor().Entity:LookupBone("ValveBiped.Bip01_Head1")
        targetheadpos,targetheadang = LocalPlayer():GetEyeTraceNoCursor().Entity:GetBonePosition(aimbone)
        LocalPlayer():SetEyeAngles((targetheadpos - LocalPlayer():GetShootPos()):Angle())
        LocalPlayer():ConCommand("+jump")
        timer.Create("1",0.2,1,two)
    else
       Namo.Message ("You are not currently looking at a player/npc")
    end
end

concommand.Add("N_360",one)	


	
//Spam
local function Spam()
    if Spammer:GetBool() then
        RunConsoleCommand("say", " "..table.Random(Spams))
    end
end
timer.Create("Spammins", .5,0,Spam)

local function NrJokes()
    if Jokes:GetBool() then
        RunConsoleCommand("say", " "..table.Random(RJokes))
    end
end
timer.Create("Spamm", .5,0, NrJokes)


	AddHook( "ChatSpam", "Think", RandomString(), function()
		if GetConVarNumber("N_panic") == 0 then
			if !SpamWait then
				if Namo.Options["Spam_Toggle"] then
					if Namo.Options["Spam_Delay"] then
						SpamWait = true
						Spam1, Spam2, Spam3, Spam4, Spam5 = false, false, false, false, false
						local Timer = Namo.Options["Spam_Delay_Value"]
						if Namo.Options["Spam_Message_1"] && Namo.TextEntries["Spam1"] != nil then
							local String = Namo.TextEntries["Spam1"]
							if Namo.Options["Spam_AntiAntiSpam"] then String = String.." ("..RandomShortString()..")" end
							timer.Simple( Timer, function()
								LocalPlayer():ConCommand("say "..String)
								Spam1 = true
							end)
							Timer = Timer + Namo.Options["Spam_Delay_Value"]
						else Spam1 = true end

						if Namo.Options["Spam_Message_2"] && Namo.TextEntries["Spam2"] != nil then
							local String = Namo.TextEntries["Spam2"]
							if Namo.Options["Spam_AntiAntiSpam"] then String = String.." ("..RandomShortString()..")" end
							timer.Simple( Timer, function()
								LocalPlayer():ConCommand("say "..String)
								Spam2 = true
							end)
							Timer = Timer + Namo.Options["Spam_Delay_Value"]
						else Spam2 = true end

						if Namo.Options["Spam_Message_3"] && Namo.TextEntries["Spam3"] != nil then
							local String = Namo.TextEntries["Spam3"]
							if Namo.Options["Spam_AntiAntiSpam"] then String = String.." ("..RandomShortString()..")" end
							timer.Simple( Timer, function()
								LocalPlayer():ConCommand("say "..String)
								Spam3 = true
							end)
							Timer = Timer + Namo.Options["Spam_Delay_Value"]
						else Spam3 = true end

						if Namo.Options["Spam_Message_4"] && Namo.TextEntries["Spam4"] != nil then
							local String = Namo.TextEntries["Spam4"]
							if Namo.Options["Spam_AntiAntiSpam"] then String = String.." ("..RandomShortString()..")" end
							timer.Simple( Timer, function()
								LocalPlayer():ConCommand("say "..String)
								Spam4 = true
							end)
							Timer = Timer + Namo.Options["Spam_Delay_Value"]
						else Spam4 = true end

						if Namo.Options["Spam_Message_5"] && Namo.TextEntries["Spam5"] != nil then
							local String = Namo.TextEntries["Spam5"]
							if Namo.Options["Spam_AntiAntiSpam"] then String = String.." ("..RandomShortString()..")" end
							timer.Simple( Timer, function()
								LocalPlayer():ConCommand("say "..String)
								Spam5 = true
							end)
							Timer = Timer + Namo.Options["Spam_Delay_Value"]
						else Spam5 = true end
					else
						if Namo.Options["Spam_Message_1"] && Namo.TextEntries["Spam1"] != nil then
							local String = Namo.TextEntries["Spam1"]
							if Namo.Options["Spam_AntiAntiSpam"] then String = String.." ("..RandomShortString()..")" end
							LocalPlayer():ConCommand("say "..String)
						end
						if Namo.Options["Spam_Message_1"] && Namo.TextEntries["Spam2"] != nil then
							local String = Namo.TextEntries["Spam2"]
							if Namo.Options["Spam_AntiAntiSpam"] then String = String.." ("..RandomShortString()..")" end
							LocalPlayer():ConCommand("say "..String)
						end
						if Namo.Options["Spam_Message_1"] && Namo.TextEntries["Spam3"] != nil then
							local String = Namo.TextEntries["Spam3"]
							if Namo.Options["Spam_AntiAntiSpam"] then String = String.." ("..RandomShortString()..")" end
							LocalPlayer():ConCommand("say "..String)
						end
						if Namo.Options["Spam_Message_1"] && Namo.TextEntries["Spam4"] != nil then
							local String = Namo.TextEntries["Spam4"]
							if Namo.Options["Spam_AntiAntiSpam"] then String = String.." ("..RandomShortString()..")" end
							LocalPlayer():ConCommand("say "..String)
						end
						if Namo.Options["Spam_Message_1"] && Namo.TextEntries["Spam5"] != nil then
							local String = Namo.TextEntries["Spam5"]
							if Namo.Options["Spam_AntiAntiSpam"] then String = String.." ("..RandomShortString()..")" end
							LocalPlayer():ConCommand("say "..String)
						end
					end
				end
			else
				if Spam1 && Spam2 && Spam3 && Spam4 && Spam5 then SpamWait = false end
			end
		end
	end)
	
	
	
//ESP	
	AddHook( "ESP", "HUDPaint", RandomString(), function()
		if GetConVarNumber("N_panic") == 0 then
			if Namo.Options["Cams_Toggle"] && Namo.Options["Cams_CSNoclip"] then
				local MaxX, MaxY, MinX, MinY = ESPGetPos( LocalPlayer() )
				local Dist = math.floor(LocalPlayer():GetPos():Distance(NoclipPos)/40)
				draw.SimpleTextOutlined( "You are here ".."["..Dist.."]", "Cams", ((MaxX-MinX)/2)+MinX, MinY-5, Color(0,150,250), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color(0,0,0) )
				surface.SetDrawColor( Color(0,255,255) )
				surface.DrawLine( MaxX, MaxY, MinX, MaxY )
				surface.DrawLine( MaxX, MaxY, MaxX, MinY )
				surface.DrawLine( MinX, MinY, MaxX, MinY )
				surface.DrawLine( MinX, MinY, MinX, MaxY )
			end
			if Namo.Options["ESP_Toggle"] || Namo.Options["ESP_Entity_Toggle"] then
				for k, v in pairs( ents.GetAll() ) do
					if v:IsValid() && v != LocalPlayer() && !v:IsDormant() then
						local Ent = v
						if Namo.Options["ESP_Entity_Toggle"] then
							for k, v in pairs( Namo.EntityESP ) do
								if v == Ent:GetClass() && Ent:GetOwner() != LocalPlayer()  then
									local MaxX, MaxY, MinX, MinY, V1, V2, V3, V4, V5, V6, V7, V8 = ESPGetPos( Ent )
									if Namo.Options["ESP_Entities_NameTags"] == true then
										local Name = Ent:GetClass()
										local Dist = math.floor(Ent:GetPos():Distance(LocalPlayer():GetShootPos())/40)
										draw.SimpleTextOutlined( Name.." ["..Dist.."]", "ESP_Font_Entity", ((MaxX-MinX)/2)+MinX, MinY-5, Color(0,160,240), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color(0,0,0) )
									end
									if Namo.Options["ESP_Entities_BoundaryBoxes"] == true then
										surface.SetDrawColor( Color(0,160,240) )
										if Namo.Options["ESP_Entities_BoundaryBoxes_Mode"] == "2D" then
											surface.DrawLine( MaxX, MaxY, MinX, MaxY )
											surface.DrawLine( MaxX, MaxY, MaxX, MinY )
											surface.DrawLine( MinX, MinY, MaxX, MinY )
											surface.DrawLine( MinX, MinY, MinX, MaxY )
										else
											//Top Box
											surface.DrawLine( V4.x, V4.y, V6.x, V6.y )
											surface.DrawLine( V1.x, V1.y, V8.x, V8.y )
											surface.DrawLine( V6.x, V6.y, V8.x, V8.y )
											surface.DrawLine( V4.x, V4.y, V1.x, V1.y )

											//Bottom Box
											surface.DrawLine( V3.x, V3.y, V5.x, V5.y )
											surface.DrawLine( V2.x, V2.y, V7.x, V7.y )
											surface.DrawLine( V3.x, V3.y, V2.x, V2.y )
											surface.DrawLine( V5.x, V5.y, V7.x, V7.y )

											//Verticals
											surface.DrawLine( V3.x, V3.y, V4.x, V4.y )
											surface.DrawLine( V2.x, V2.y, V1.x, V1.y )
											surface.DrawLine( V7.x, V7.y, V8.x, V8.y )
											surface.DrawLine( V5.x, V5.y, V6.x, V6.y )
										end
									end
								end
							end
						end
						if Namo.Options["ESP_Toggle"] then
							if Namo.Options["ESP_Crosshair"] == true then
								local _, TeamColor = GetTeam(LocalPlayer())
								if Namo.Options["ESP_Crosshair_Mode"] == "Team" && Color(Namo.Options["ESP_Crosshair_Color_R"], Namo.Options["ESP_Crosshair_Color_G"], Namo.Options["ESP_Crosshair_Color_B"]) != TeamColor then
									Namo.Options["ESP_Crosshair_Color_R"] = TeamColor.r
									Namo.Options["ESP_Crosshair_Color_G"] = TeamColor.g
									Namo.Options["ESP_Crosshair_Color_B"] = TeamColor.b
								end
								surface.SetDrawColor(Color(Namo.Options["ESP_Crosshair_Color_R"], Namo.Options["ESP_Crosshair_Color_G"], Namo.Options["ESP_Crosshair_Color_B"], Namo.Options["ESP_Crosshair_Color_A"]))
								surface.DrawLine((ScrW()/2)-Namo.Options["ESP_Crosshair_Size"], ScrH()/2, (ScrW()/2)+Namo.Options["ESP_Crosshair_Size"], ScrH()/2)
								surface.DrawLine(ScrW()/2, (ScrH()/2)-Namo.Options["ESP_Crosshair_Size"], ScrW()/2, (ScrH()/2)+Namo.Options["ESP_Crosshair_Size"])
							end
							if Ent:IsNPC() || Ent:IsPlayer() then
								local Name
								local ShowTeam, ShowOpponents, ShowFriends, ShowEnemies, ShowNPCs, ShowSpectators = false, false, false, false, false, false
								local ShowTeamV, ShowOpponentsV, ShowFriendsV, ShowEnemiesV, ShowNPCsV, ShowSpectatorsV = true, true, true, true, true, true

								if !Ent:IsNPC() && Ent:Health() > 0 then
									local Team, _ = GetTeam(Ent)
									if Ent:Team() != TEAM_SPECTATOR && Namo.Options["ESP_ShowTeam"] && Team == GetTeam(LocalPlayer()) then
										if Namo.Options["ESP_ShowTeamV"] == "Show" then
											ShowTeam = true
										else
											ShowTeamV = false
										end
									end
									if Ent:Team() != TEAM_SPECTATOR && Namo.Options["ESP_ShowOpponents"] && Team != GetTeam(LocalPlayer()) then
										if Namo.Options["ESP_ShowOpponentsV"] == "Show" then
											ShowOpponents = true
										else
											ShowOpponentsV = false
										end
									end
									if Ent:Team() != TEAM_SPECTATOR && Namo.Options["ESP_ShowFriends"] && ( (!Namo.Options["Friends_FriendIsEnemy"] && table.HasValue( Namo.FriendsList, Ent:SteamID() ) ) || (Namo.Options["Friends_FriendIsEnemy"] && !table.HasValue( Namo.FriendsList, Ent:SteamID() ) ) ) then
										if Namo.Options["ESP_ShowFriendsV"] == "Show" then
											ShowFriends = true
										else
											ShowFriendsV = false
										end
									end
									if Ent:Team() != TEAM_SPECTATOR && Namo.Options["ESP_ShowEnemies"] && ( (!Namo.Options["Friends_FriendIsEnemy"] && !table.HasValue( Namo.FriendsList, Ent:SteamID() ) ) || (Namo.Options["Friends_FriendIsEnemy"] && table.HasValue( Namo.FriendsList, Ent:SteamID() ) ) ) then
										if Namo.Options["ESP_ShowEnemiesV"] =="Show" then
											ShowEnemies = true
										else
											ShowEnemiesV = false
										end
									end
									if Namo.Options["ESP_ShowSpectators"] && Ent:Team() == TEAM_SPECTATOR then
										if Namo.Options["ESP_ShowSpectatorsV"] == "Show" then
											ShowSpectators = true
										else
											ShowSpectatorsV = false
										end
									end
									Name = Ent:Nick()
								else
									if Namo.Options["ESP_ShowNPCs"] && Ent:IsNPC() then
										if Namo.Options["ESP_ShowNPCsV"] == "Show" then
											ShowNPCs = true
										else
											ShowNPCsV = false
										end
									end
									Name = Ent:GetClass()
								end
								if (ShowTeam || ShowOpponents || ShowFriends || ShowEnemies || ShowNPCs || ShowSpectators) && (ShowTeamV && ShowOpponentsV && ShowFriendsV && ShowEnemiesV && ShowNPCsV && ShowSpectatorsV) then
									local MaxX, MaxY, MinX, MinY, V1, V2, V3, V4, V5, V6, V7, V8 = ESPGetPos( Ent )
									local DrawColor
									local ESPPos = MinY
									if Ent:IsNPC() then	DrawColor = Color(170,220,120) else _, DrawColor = GetTeam(Ent) end
									if Namo.Options["ESP_BoundaryBoxes"] then
										surface.SetDrawColor( DrawColor )
										if Namo.Options["ESP_BoundaryBoxes_Mode"] == "2D" then
											surface.DrawLine( MaxX, MaxY, MinX, MaxY )
											surface.DrawLine( MaxX, MaxY, MaxX, MinY )
											surface.DrawLine( MinX, MinY, MaxX, MinY )
											surface.DrawLine( MinX, MinY, MinX, MaxY )
										else
											//Top Box
											surface.DrawLine( V4.x, V4.y, V6.x, V6.y )
											surface.DrawLine( V1.x, V1.y, V8.x, V8.y )
											surface.DrawLine( V6.x, V6.y, V8.x, V8.y )
											surface.DrawLine( V4.x, V4.y, V1.x, V1.y )

											//Bottom Box
											surface.DrawLine( V3.x, V3.y, V5.x, V5.y )
											surface.DrawLine( V2.x, V2.y, V7.x, V7.y )
											surface.DrawLine( V3.x, V3.y, V2.x, V2.y )
											surface.DrawLine( V5.x, V5.y, V7.x, V7.y )

											//Vertical Lines
											surface.DrawLine( V3.x, V3.y, V4.x, V4.y )
											surface.DrawLine( V2.x, V2.y, V1.x, V1.y )
											surface.DrawLine( V7.x, V7.y, V8.x, V8.y )
											surface.DrawLine( V5.x, V5.y, V6.x, V6.y )
										end
									end
									
									//Does that guy have any STDs?
									if Namo.Options["ESP_Health"] then					
										local HealthColor = Color( (1-(Ent:Health()/Ent:GetMaxHealth()))*255, (Ent:Health()/Ent:GetMaxHealth())*255, 0 )
										local HealthString = tostring(Ent:Health())

										if MaxY-MinY <= 45 then
											local TopHealthFar = ((1-(Ent:Health()/Ent:GetMaxHealth()))*43)+MinY+1
											local BottomHealthFar = 43-((1-(Ent:Health()/Ent:GetMaxHealth()))*43)
											draw.RoundedBox( 0, MinX-15, MinY, 10, 45, Color(0,0,0) )
											draw.RoundedBox( 0, MinX-14, TopHealthFar, 8, BottomHealthFar, HealthColor )
											draw.SimpleTextOutlined( HealthString.."%", "ESP_Font_Entity", MinX-17, MinY+22.5, HealthColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color(0,0,0) )
										else
											local TopHealthClose = (MinY+((1-(Ent:Health()/Ent:GetMaxHealth()))*(MaxY-MinY)))+1
											local BottomHealthClose = ((Ent:Health()/Ent:GetMaxHealth())*(MaxY-MinY))-2
											draw.RoundedBox( 0, MinX-15, MinY, 10, MaxY-MinY, Color(0,0,0) )
											draw.RoundedBox( 0, MinX-14, TopHealthClose, 8, BottomHealthClose, HealthColor )
											draw.SimpleTextOutlined( HealthString.."%", "ESP_Font_Entity", MinX-17, ((MinY-MaxY)/2)+MaxY, HealthColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color(0,0,0) )
										end

									end
									
									//That foo's name
									if Namo.Options["ESP_NameTags"] then
										if GMode == 2 && Ent:GetBystanderName() != nil then

											draw.SimpleTextOutlined( "N: "..Name.." ("..Ent:GetBystanderName()..")", "ESP_Font_Main", MaxX+5, ESPPos, DrawColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0) )
										else
											draw.SimpleTextOutlined( "N: "..Name, "ESP_Font_Main", MaxX+5, ESPPos, DrawColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0) )
										end
										ESPPos = ESPPos + 15
									end
									
									//What rooty tooty point n' shooty hes holding
									if Namo.Options["ESP_Weapon"] then
										if Ent:GetActiveWeapon():IsValid() then
											local WName = Ent:GetActiveWeapon():GetPrintName()
											draw.SimpleTextOutlined( "W: "..WName, "ESP_Font_Main", MaxX+5, ESPPos, DrawColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0) )
											ESPPos = ESPPos + 15
										end
									end
									
									//How far away his bitch ass is
									if Namo.Options["ESP_Distance"] then
										local Dist = math.floor(Ent:GetPos():Distance(LocalPlayer():GetShootPos())/40)
										draw.SimpleTextOutlined( "D: "..Dist, "ESP_Font_Main", MaxX+5, ESPPos, DrawColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0) )
										ESPPos = ESPPos + 15
									end
									
									//Jack Skeleton
									if Namo.Options["ESP_Skeleton"] then
										local Bones = {}
										local Success = true
										for k, v in pairs(Namo.Bones) do
											if Ent:LookupBone(v) != nil && Ent:GetBonePosition(Ent:LookupBone(v)) != nil then
												table.insert( Bones, Ent:GetBonePosition(Ent:LookupBone(v)):ToScreen() )
											else
												Success = false
												return
											end
										end
										if Success then
											surface.SetDrawColor( DrawColor )
											//Spine
											surface.DrawLine( Bones[1].x, Bones[1].y, Bones[2].x, Bones[2].y )
											surface.DrawLine( Bones[2].x, Bones[2].y, Bones[3].x, Bones[3].y )
											surface.DrawLine( Bones[3].x, Bones[3].y, Bones[4].x, Bones[4].y )
											surface.DrawLine( Bones[4].x, Bones[4].y, Bones[5].x, Bones[5].y )
											surface.DrawLine( Bones[5].x, Bones[5].y, Bones[6].x, Bones[6].y )
											surface.DrawLine( Bones[6].x, Bones[6].y, Bones[7].x, Bones[7].y )

											//NoodleLegs
											surface.DrawLine( Bones[7].x, Bones[7].y, Bones[14].x, Bones[14].y )
											surface.DrawLine( Bones[14].x, Bones[14].y, Bones[15].x, Bones[15].y )
											surface.DrawLine( Bones[15].x, Bones[15].y, Bones[16].x, Bones[16].y )
											surface.DrawLine( Bones[16].x, Bones[16].y, Bones[17].x, Bones[17].y )

											surface.DrawLine( Bones[7].x, Bones[7].y, Bones[18].x, Bones[18].y )
											surface.DrawLine( Bones[18].x, Bones[18].y, Bones[19].x, Bones[19].y )
											surface.DrawLine( Bones[19].x, Bones[19].y, Bones[20].x, Bones[20].y )
											surface.DrawLine( Bones[20].x, Bones[20].y, Bones[21].x, Bones[21].y )

											//Noodle Arms
											surface.DrawLine( Bones[3].x, Bones[3].y, Bones[8].x, Bones[8].y )
											surface.DrawLine( Bones[8].x, Bones[8].y, Bones[9].x, Bones[9].y )
											surface.DrawLine( Bones[9].x, Bones[9].y, Bones[10].x, Bones[10].y )

											surface.DrawLine( Bones[3].x, Bones[3].y, Bones[11].x, Bones[11].y )
											surface.DrawLine( Bones[11].x, Bones[11].y, Bones[12].x, Bones[12].y )
											surface.DrawLine( Bones[12].x, Bones[12].y, Bones[13].x, Bones[13].y )

										end
									end
								end
							end
						end
					end
				end
			end
		end
	end)
	
	

//Bhop
	AddHook( "BhopCalcView", "CalcView", RandomString(), function( ply, pos, angles, fov )
		if GetConVarNumber("N_panic") == 0 && Namo.Options["Bhop_Toggle"] then
			if Namo.Options["Bhop_Sideways"] then
				local CamData = {}
				if TapS then CamData.angles = LocalPlayer():EyeAngles()+Angle(0,180,0) else CamData.angles = LocalPlayer():EyeAngles()+Angle(0,90,0) end
				CamData.origin = LocalPlayer():GetShootPos()
				CamData.fov = fov

				return CamData
			elseif Namo.Options["Bhop_WOnly"] then
				local CamData = {}
				if WLeft then
					CamData.angles = LocalPlayer():EyeAngles()-Angle(0,90,0)
				elseif WRight then
					CamData.angles = LocalPlayer():EyeAngles()+Angle(0,90,0)
				elseif WBack then
					CamData.angles = LocalPlayer():EyeAngles()+Angle(0,180,0)
				end
				CamData.origin = LocalPlayer():GetShootPos()
				CamData.fov = fov

				return CamData
			end
		end
	end)
	AddHook( "Bhop", "CreateMove", RandomString(), function(ucmd)
		if Namo.Options["Bhop_Toggle"] && GetConVarNumber("N_panic") == 0 then
			if Namo.Options["Bhop_FastWalk"] then
				if LocalPlayer():IsOnGround() && ( ucmd:KeyDown(IN_FORWARD) || ucmd:KeyDown(IN_BACK) ) then
					if FastWalk == false then
						ucmd:SetSideMove(ucmd:GetSideMove()-5000)
					else
						ucmd:SetSideMove(ucmd:GetSideMove()+5000)
					end
					FastWalk = !FastWalk
				end
			end
			if Namo.Options["Bhop_AutoHop"] then
				if ucmd:KeyDown(IN_JUMP) then
					if LocalPlayer():WaterLevel() <= 1 && LocalPlayer():GetMoveType() != MOVETYPE_LADDER && !LocalPlayer():IsOnGround() then
						ucmd:RemoveKey(IN_JUMP)
					end
				end
			end
			if Namo.Options["Bhop_AutoStrafe"] && !LocalPlayer():IsOnGround() && LocalPlayer():WaterLevel() <= 1 && LocalPlayer():GetMoveType() != MOVETYPE_LADDER && !( LocalPlayer():KeyDown(IN_FORWARD) || LocalPlayer():KeyDown(IN_BACK) || LocalPlayer():KeyDown(IN_MOVELEFT) || LocalPlayer():KeyDown(IN_MOVERIGHT) ) then
				if Namo.Options["Bhop_Sideways"] && !TapS then
					if ucmd:GetMouseX() < 0 then
						ucmd:SetForwardMove(-1000000)
					end
					if ucmd:GetMouseX() > 0 then
						ucmd:SetForwardMove(1000000)
					end
				elseif Namo.Options["Bhop_WOnly"] then
					if ucmd:GetMouseX() < 0 then
						ucmd:SetForwardMove(1000000)
						if !WLeft then
							if WRight then
								ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,180,0))
							elseif WForward then
								ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,90,0))
							elseif WBack then
								ucmd:SetViewAngles(ucmd:GetViewAngles()-Angle(0,90,0))
							end
							WLeft = true
							WRight, WForward, WBack = false, false, false
						end
					elseif ucmd:GetMouseX() > 0 then
						ucmd:SetForwardMove(1000000)
						if !WRight then
							if WLeft then
								ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,180,0))
							elseif WForward then
								ucmd:SetViewAngles(ucmd:GetViewAngles()-Angle(0,90,0))
							elseif WBack then
								ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,90,0))
							end
							WRight = true
							WLeft, WForward, WBack = false, false, false
						end
					end
				else
					if ucmd:GetMouseX() < 0 then
						ucmd:SetSideMove(-1000000)
					end
					if ucmd:GetMouseX() > 0 then
						ucmd:SetSideMove(1000000)
					end
				end
			end
			if Namo.Options["Bhop_EdgeJump"] then
				if LocalPlayer():IsOnGround() then
					local WalkAngle
					if LocalPlayer():GetVelocity():Length() != 0 then
						WalkAngle = Angle( 0, LocalPlayer():GetVelocity():Angle().y, 0 )
					else
						WalkAngle = Angle( 0, LocalPlayer():EyeAngles().y, 0 )
					end
					local FinPos = LocalPlayer():EyePos() + (WalkAngle:Forward()*(Namo.Options["Bhop_EdgeJump_Distance"]-50))
					FinPos.z = LocalPlayer():GetPos().z-5
					local GroundDetect = {
							start = LocalPlayer():GetShootPos(),
							endpos = FinPos,
							filter = LocalPlayer(),
							mask = MASK_PLAYERSOLID
						}
					if util.TraceLine(GroundDetect).Fraction == 1 then
						ucmd:SetButtons( ucmd:GetButtons() + IN_JUMP )
					end
				end
			end
			if Namo.Options["Bhop_Sideways"] then
				if ucmd:KeyDown(IN_MOVELEFT) && !TapS then
					if ucmd:KeyDown(IN_MOVERIGHT) then ForwardMove = 0 elseif ForwardMove == 0 then ForwardMove = -1000000 end
					ucmd:SetSideMove(SideMove)
					ucmd:SetForwardMove(ForwardMove)
				end
				if ucmd:KeyDown(IN_MOVERIGHT) && !TapS then
					if ucmd:KeyDown(IN_MOVELEFT) then ForwardMove = 0 elseif ForwardMove == 0 then ForwardMove = 1000000 end
					ucmd:SetSideMove(SideMove)
					ucmd:SetForwardMove(ForwardMove)
				end
				if !ucmd:KeyDown(IN_MOVELEFT) && !ucmd:KeyDown(IN_MOVERIGHT) && !TapS then ForwardMove = 0 end

				if ucmd:KeyDown(IN_FORWARD) && !TapS then
					if ucmd:KeyDown(IN_BACK) then SideMove = 0 elseif SideMove == 0 then SideMove = -1000000 end
					ucmd:SetSideMove(SideMove)
					ucmd:SetForwardMove(ForwardMove)
				end
				if ucmd:KeyDown(IN_BACK) && LocalPlayer():IsOnGround() && !TapS then
					if ucmd:KeyDown(IN_FORWARD) then SideMove = 0 elseif SideMove == 0 then SideMove = 1000000 end
					ucmd:SetSideMove(SideMove)
					ucmd:SetForwardMove(ForwardMove)
				elseif ucmd:KeyDown(IN_BACK) && !LocalPlayer():IsOnGround() && !TapS then
					ForwardMove = 1000000
					ucmd:SetViewAngles(ucmd:GetViewAngles()-Angle(0,90,0))
					ucmd:SetForwardMove(ForwardMove)
					TapS = true
				end
				if !ucmd:KeyDown(IN_FORWARD) && !ucmd:KeyDown(IN_BACK) && !TapS then SideMove = 0 end
				if !LocalPlayer():IsOnGround() && ucmd:KeyDown(IN_BACK) && TapS then
					ucmd:SetForwardMove(1000000)
				elseif ( !ucmd:KeyDown(IN_BACK) || LocalPlayer():IsOnGround() ) && TapS then
					ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,90,0))
					TapS = false
				end
			elseif Namo.Options["Bhop_WOnly"] then
				if ucmd:KeyDown(IN_MOVELEFT) && !WLeft then
					if WRight then
						ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,180,0))
					elseif WForward then
						ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,90,0))
					elseif WBack then
						ucmd:SetViewAngles(ucmd:GetViewAngles()-Angle(0,90,0))
					end
					WLeft = true
					WRight, WForward, WBack = false, false, false
				elseif ucmd:KeyDown(IN_MOVERIGHT) && !WRight then
					if WLeft then
						ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,180,0))
					elseif WForward then
						ucmd:SetViewAngles(ucmd:GetViewAngles()-Angle(0,90,0))
					elseif WBack then
						ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,90,0))
					end
					WRight = true
					WLeft, WForward, WBack = false, false, false
				elseif ucmd:KeyDown(IN_FORWARD) && !WForward then
					if WRight then
						ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,90,0))
					elseif WLeft then
						ucmd:SetViewAngles(ucmd:GetViewAngles()-Angle(0,90,0))
					elseif WBack then
						ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,180,0))
					end
					WForward = true
					WLeft, WRight, WBack = false, false, false
				elseif ucmd:KeyDown(IN_BACK) && !WBack then
					if WRight then
						ucmd:SetViewAngles(ucmd:GetViewAngles()-Angle(0,90,0))
					elseif WForward then
						ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,180,0))
					elseif WLeft then
						ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,90,0))
					end
					WBack = true
					WLeft, WRight, WForward = false, false, false
				end
				if !ucmd:KeyDown(IN_MOVELEFT) && !ucmd:KeyDown(IN_MOVERIGHT) && !ucmd:KeyDown(IN_FORWARD) && !ucmd:KeyDown(IN_BACK) then WActive = false else WActive = true end
				if WActive then
					ucmd:SetForwardMove(1000000)
					ucmd:SetSideMove(0)
				end
			end
		end
	end)

	
	
	
//Cams
	AddHook( "Cams", "CalcView", RandomString(), function( ply, Pos, Ang, FOV )
		if Namo.Options["Cams_Toggle"] && GetConVarNumber("N_panic") == 0 then
			local CamData = {}
			if Namo.Options["Cams_CSNoclip"] then
				local Speed = Namo.Options["Cams_CSNoclip_Speed"]/5
				local MouseAngs = Angle( NoclipY, NoclipX, 0 )
				if LocalPlayer():KeyDown(IN_SPEED) then
					Speed = Speed * 5
				end
				if LocalPlayer():KeyDown(IN_FORWARD) then
					NoclipPos = NoclipPos+(MouseAngs:Forward()*Speed)
				end
				if LocalPlayer():KeyDown(IN_BACK) then
					NoclipPos = NoclipPos-(MouseAngs:Forward()*Speed)
				end
				if LocalPlayer():KeyDown(IN_MOVELEFT) then
					NoclipPos = NoclipPos-(MouseAngs:Right()*Speed)
				end
				if LocalPlayer():KeyDown(IN_MOVERIGHT) then
					NoclipPos = NoclipPos+(MouseAngs:Right()*Speed)
				end
				if NoclipJump then
					NoclipPos = NoclipPos+Vector(0,0,Speed)
				end
				if NoclipDuck then
					NoclipPos = NoclipPos-Vector(0,0,Speed)
				end
				CamData.origin = NoclipPos
				CamData.angles = MouseAngs
				CamData.fov = FOV
				CamData.drawviewer = true
			elseif Namo.Options["Cams_ThirdPerson"] then
				CamData.origin = Pos-(Ang:Forward()*(Namo.Options["Cams_ThirdPerson_Zoom"]*10))
				CamData.angles = Ang
				CamData.fov = FOV
				CamData.drawviewer = true
			end
			return CamData
		end
	end)
	AddHook( "Bhop", "CreateMove", RandomString(), function(ucmd)
		if Namo.Options["Cams_Toggle"] && Namo.Options["Cams_CSNoclip"] && GetConVarNumber("N_panic") == 0 then
			if NoclipOn == false then
				NoclipPos, NoclipAngles = LocalPlayer():EyePos(), ucmd:GetViewAngles()
				NoclipY, NoclipX = ucmd:GetViewAngles().x, ucmd:GetViewAngles().y
				NoclipOn = true
			end
			ucmd:ClearMovement()
			if ucmd:KeyDown(IN_JUMP) then
				ucmd:RemoveKey(IN_JUMP)
				NoclipJump = true
			elseif NoclipJump then
				NoclipJump = false
			end
			if ucmd:KeyDown(IN_DUCK) then
				ucmd:RemoveKey(IN_DUCK)
				NoclipDuck = true
			elseif NoclipDuck then
				NoclipDuck = false
			end
			NoclipX = NoclipX-(ucmd:GetMouseX()/50)
			if NoclipY+(ucmd:GetMouseY()/50) > 89 then NoclipY = 89 elseif NoclipY+(ucmd:GetMouseY()/50) < -89 then NoclipY = -89 else NoclipY = NoclipY+(ucmd:GetMouseY()/50) end
			ucmd:SetViewAngles(NoclipAngles)
		elseif NoclipOn == true then
			NoclipOn = false
		end
	end)
	if Display then
		AddHook( "Loaded", "HUDPaint", RandomString(), function()
			draw.SimpleTextOutlined( "♥Namo Hack Loaded Successfully!♥", "Menu_Title", ScrW()/2, 50, Color(0,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0) )
			timer.Simple( 3, function()
				RemoveHook("Loaded")
			end)
		end)
	end
end



//Rattle meh bones
Namo.Bones = {
"ValveBiped.Bip01_Head1",
"ValveBiped.Bip01_Neck1",
"ValveBiped.Bip01_Spine4",
"ValveBiped.Bip01_Spine2",
"ValveBiped.Bip01_Spine1",
"ValveBiped.Bip01_Spine",
"ValveBiped.Bip01_Pelvis",
"ValveBiped.Bip01_R_UpperArm",
"ValveBiped.Bip01_R_Forearm",
"ValveBiped.Bip01_R_Hand",
"ValveBiped.Bip01_L_UpperArm",
"ValveBiped.Bip01_L_Forearm",
"ValveBiped.Bip01_L_Hand",
"ValveBiped.Bip01_R_Thigh",
"ValveBiped.Bip01_R_Calf",
"ValveBiped.Bip01_R_Foot",
"ValveBiped.Bip01_R_Toe0",
"ValveBiped.Bip01_L_Thigh",
"ValveBiped.Bip01_L_Calf",
"ValveBiped.Bip01_L_Foot",
"ValveBiped.Bip01_L_Toe0"
}



//Key Binds
Namo.KeyBinds = {
[0] = "NONE",
[1] = "0",
[2] = "1",
[3] = "2",
[4] = "3",
[5] = "4",
[6] = "5",
[7] = "6",
[8] = "7",
[9] = "8",
[10] = "9",
[11] = "A",
[12] = "B",
[13] = "C",
[14] = "D",
[15] = "E",
[16] = "F",
[17] = "G",
[18] = "H",
[19] = "I",
[20] = "J",
[21] = "K",
[22] = "L",
[23] = "M",
[24] = "N",
[25] = "O",
[26] = "P",
[27] = "Q",
[28] = "R",
[29] = "S",
[30] = "T",
[31] = "U",
[32] = "V",
[33] = "W",
[34] = "X",
[35] = "Y",
[36] = "Z",
[37] = "PAD_0",
[38] = "PAD_1",
[39] = "PAD_2",
[40] = "PAD_3",
[41] = "PAD_4",
[42] = "PAD_5",
[43] = "PAD_6",
[44] = "PAD_7",
[45] = "PAD_8",
[46] = "PAD_9",
[47] = "PAD_DIVIDE",
[48] = "PAD_MULTIPLY",
[49] = "PAD_MINUS",
[50] = "PAD_PLUS",
[51] = "PAD_ENTER",
[52] = "PAD_DECIMAL",
[53] = "LBRACKET",
[54] = "RBRACKET",
[55] = "SEMICOLON",
[56] = "APOSTROPHE",
[57] = "BACKQUOTE",
[58] = "COMMA",
[59] = "PERIOD",
[60] = "SLASH",
[61] = "BACKSLASH",
[62] = "MINUS",
[63] = "EQUAL",
[64] = "ENTER",
[65] = "SPACE",
[66] = "BACKSPACE",
[67] = "TAB",
[68] = "CAPSLOCK",
[69] = "NUMLOCK",
[70] = "ESCAPE",
[71] = "SCROLLLOCK",
[72] = "INSERT",
[73] = "DELETE",
[74] = "HOME",
[75] = "END",
[76] = "PAGEUP",
[77] = "PAGEDOWN",
[78] = "BREAK",
[79] = "LSHIFT",
[80] = "RSHIFT",
[81] = "LALT",
[82] = "RALT",
[83] = "LCONTROL",
[84] = "RCONTROL",
[85] = "LWIN",
[86] = "RWIN",
[87] = "APP",
[88] = "UP",
[89] = "LEFT",
[90] = "DOWN",
[91] = "RIGHT",
[92] = "F1",
[93] = "F2",
[94] = "F3",
[95] = "F4",
[96] = "F5",
[97] = "F6",
[98] = "F7",
[99] = "F8",
[100] = "F9",
[101] = "F10",
[102] = "F11",
[103] = "F12",
}

//Mouse Binds, These must be seperated at all costs, it will break if not
Namo.MouseBinds = {
[107] = "MOUSE_LEFT",
[108] = "MOUSE_RIGHT",
[109] = "MOUSE_MIDDLE",
[110] = "MOUSE_4",
[111] = "MOUSE_5",
[112] = "MOUSE_WHEEL_UP",
[113] = "MOUSE_WHEEL_DOWN"
}




//Aimbot
function Aimbot( FinAngle )
	if Namo.Options["Aimbot_SmoothAim"] then
		SmoothAngles( FinAngle, Namo.Options["Aimbot_SmoothAim_Value"] )
	else
		LocalPlayer():SetEyeAngles(FinAngle)
	end
end

function SmoothAngles( FinAngle, SmoothValue )
	local SmoothValue = 10-(10*(SmoothValue/1000))
	local CloseToAngle = false
	local SmoothDirectionX = 1
	local SmoothDirectionY = 1
	local CurAngle = LocalPlayer():EyeAngles()
	if FinAngle.x > 89 then FinAngle.x = FinAngle.x - 360 end
	if CurAngle == FinAngle then
		SmoothDirectionX = 1
	elseif CurAngle.y < 0 && FinAngle.y < 0 then
		CloseToAngle = true
		if CurAngle.y > FinAngle.y then
			SmoothDirectionX = 2
		elseif CurAngle.y < FinAngle.y then
			SmoothDirectionX = 3
		end
	elseif CurAngle.y >= 0 && FinAngle.y >= 0 then
		CloseToAngle = true
		if CurAngle.y > FinAngle.y then
			SmoothDirectionX = 2
		elseif CurAngle.y < FinAngle.y then
			SmoothDirectionX = 3
		end
	elseif CurAngle.y >= 0 && FinAngle.y < 0 then
		local FlipAngle = CurAngle-(Angle(0,180,0))
		if FlipAngle.y > FinAngle.y then
			SmoothDirectionX = 3
		elseif FlipAngle.y < FinAngle.y then
			SmoothDirectionX = 2
		end
	elseif CurAngle.y < 0 && FinAngle.y >= 0 then
		local FlipAngle = CurAngle+(Angle(0,180,0))
		if FlipAngle.y < FinAngle.y then
			SmoothDirectionX = 2	
		elseif FlipAngle.y > FinAngle.y then
			SmoothDirectionX = 3
		end
	end
	if FinAngle.x < CurAngle.x then
		SmoothDirectionY = 2
	elseif FinAngle.x > CurAngle.x then
		SmoothDirectionY = 3
	end
	local X, Y = false, false
	if SmoothDirectionX == 2 then
		if CurAngle.y-SmoothValue < FinAngle.y && CloseToAngle then
			LocalPlayer():SetEyeAngles(Angle(CurAngle.x,FinAngle.y,CurAngle.z))
			Y = true
		else
			LocalPlayer():SetEyeAngles(Angle(CurAngle.x,CurAngle.y-SmoothValue,CurAngle.z))
		end
	elseif SmoothDirectionX == 3 then
		if CurAngle.y+SmoothValue > FinAngle.y && CloseToAngle then
			LocalPlayer():SetEyeAngles(Angle(CurAngle.x,FinAngle.y,CurAngle.z))
			Y = true
		else
			LocalPlayer():SetEyeAngles(Angle(CurAngle.x,CurAngle.y+SmoothValue,CurAngle.z))
		end
	end
	if SmoothDirectionY == 2 then
		//up
		if CurAngle.x-SmoothValue < FinAngle.x then
			LocalPlayer():SetEyeAngles(Angle(FinAngle.x,LocalPlayer():EyeAngles().y,LocalPlayer():EyeAngles().z))
			X = true
		else
			LocalPlayer():SetEyeAngles(Angle(CurAngle.x-SmoothValue,LocalPlayer():EyeAngles().y,LocalPlayer():EyeAngles().z))
		end
	elseif SmoothDirectionY == 3 then
		//down
		if CurAngle.x+SmoothValue > FinAngle.x then
			LocalPlayer():SetEyeAngles(Angle(FinAngle.x,LocalPlayer():EyeAngles().y,LocalPlayer():EyeAngles().z))
			X = true
		else
			LocalPlayer():SetEyeAngles(Angle(CurAngle.x+SmoothValue,LocalPlayer():EyeAngles().y,LocalPlayer():EyeAngles().z))
		end
	end
	if Namo.Options["Aimbot_AutoShoot"] && X && Y then
		LocalPlayer():ConCommand("+attack")
		timer.Simple( 0.1, function() LocalPlayer():ConCommand("-attack") end )
	end
end




//ESP
function ESPGetPos( Ent )
	if Ent:IsValid() then
		local Points = {
			Vector( Ent:OBBMaxs().x, Ent:OBBMaxs().y, Ent:OBBMaxs().z ),
			Vector( Ent:OBBMaxs().x, Ent:OBBMaxs().y, Ent:OBBMins().z ),
			Vector( Ent:OBBMaxs().x, Ent:OBBMins().y, Ent:OBBMins().z ),
			Vector( Ent:OBBMaxs().x, Ent:OBBMins().y, Ent:OBBMaxs().z ),
			Vector( Ent:OBBMins().x, Ent:OBBMins().y, Ent:OBBMins().z ),
			Vector( Ent:OBBMins().x, Ent:OBBMins().y, Ent:OBBMaxs().z ),
			Vector( Ent:OBBMins().x, Ent:OBBMaxs().y, Ent:OBBMins().z ),
			Vector( Ent:OBBMins().x, Ent:OBBMaxs().y, Ent:OBBMaxs().z )
		}
		local MaxX, MaxY, MinX, MinY
		local V1, V2, V3, V4, V5, V6, V7, V8
		for k, v in pairs( Points ) do
			local ScreenPos = Ent:LocalToWorld( v ):ToScreen()
			if MaxX != nil then
				MaxX, MaxY, MinX, MinY = math.max( MaxX, ScreenPos.x ), math.max( MaxY, ScreenPos.y), math.min( MinX, ScreenPos.x ), math.min( MinY, ScreenPos.y)
			else
				MaxX, MaxY, MinX, MinY = ScreenPos.x, ScreenPos.y, ScreenPos.x, ScreenPos.y
			end

			if V1 == nil then
				V1 = ScreenPos
			elseif V2 == nil then
				V2 = ScreenPos
			elseif V3 == nil then
				V3 = ScreenPos
			elseif V4 == nil then
				V4 = ScreenPos
			elseif V5 == nil then
				V5 = ScreenPos
			elseif V6 == nil then
				V6 = ScreenPos
			elseif V7 == nil then
				V7 = ScreenPos
			elseif V8 == nil then
				V8 = ScreenPos
			end
		end
		return MaxX, MaxY, MinX, MinY, V1, V2, V3, V4, V5, V6, V7, V8
	end
end



//Menu Items
function AddMenuTab( Parent, Text, Tab, PosX, PosY, TabID )
	local AddMenuTab = vgui.Create( "DButton", Parent )
	AddMenuTab:SetText( Text )
	AddMenuTab:SetTextColor( Color(255,255,255) )
	AddMenuTab:SetPos( PosX, PosY )
	function AddMenuTab:Paint() end
	AddMenuTab.DoClick = function()
		ChangeTab( Tab, TabID )
	end
	if TabID == 12 then
		AddMenuTab:SetSize( 48, 30 )
	else
		AddMenuTab:SetSize( 49, 30 )
	end
end

function AddLabel( Parent, Text, PosX, PosY, CloseOn )
	local AddLabel = vgui.Create("DLabel", Parent)
	AddLabel:SetText( Text )
	AddLabel:SetPos( PosX, PosY )
	AddLabel:SetColor(Color(255,255,255,255))
	AddLabel:SizeToContents()
	if CloseOn != nil then
		AddLabel.Think = function()
			if CloseOn == "Admins" then
				if AdminsListBool then
					AddLabel:Remove()
				end
			elseif CloseOn == "Spectators" then
				if SpecsListBool then
					AddLabel:Remove()
				end
			end
		end
	end
	return AddLabel:GetSize()
end

function AddMainMenuButton( Parent, Text, PosX, PosY, DoClick )
	local AddMainMenuButton = vgui.Create( "DButton", Parent )
	AddMainMenuButton:SetText( Text )
	AddMainMenuButton:SetTextColor( Color(255,255,255) )
	AddMainMenuButton:SetSize( 100, 30 )
	AddMainMenuButton:SetPos( PosX, PosY )
	function AddMainMenuButton:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color(150,150,150,255) )
		
		surface.SetDrawColor( Color(0,0,0,255) )
		surface.DrawOutlinedRect( 0, 0, w, h )
	end
	AddMainMenuButton.DoClick = DoClick
end

function AddGenericButton( Parent, Text, SizeX, SizeY, PosX, PosY, DoClick )
	local AddGenericButton = vgui.Create( "DButton", Parent )
	AddGenericButton:SetText( Text )
	AddGenericButton:SetTextColor( Color(255,255,255) )
	AddGenericButton:SetSize( SizeX, SizeY )
	AddGenericButton:SetPos( PosX, PosY )
	function AddGenericButton:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color(150,150,150,255) )
		
		surface.SetDrawColor( Color(0,0,0,255) )
		surface.DrawOutlinedRect( 0, 0, w, h )
	end
	AddGenericButton.DoClick = DoClick
end

function AddKeyBind( Parent, PosX, PosY, Var )
	local KeyBind = vgui.Create( "DButton", Parent )
	if Namo.Options["Aimbot_AimOnKey_Key"] >= 107 && Namo.Options["Aimbot_AimOnKey_Key"] <= 113 then
		KeyBind:SetText( Namo.MouseBinds[Namo.Options["Aimbot_AimOnKey_Key"]])
	else
		KeyBind:SetText( Namo.KeyBinds[Namo.Options["Aimbot_AimOnKey_Key"]])
	end
	KeyBind:SetTextColor( Color(255,255,255,255) )
	KeyBind:SetSize( 100, 15 )
	KeyBind:SetPos( PosX, PosY )
	KeyBind:SetTooltip( "Click button then press any key to change bind" )
	KeyBind.Paint = function()
		draw.RoundedBox( 0, 1, 1, 99, 14, Color(150,150,150,255) )
		surface.SetDrawColor( Color(0,0,0) )
		surface.DrawOutlinedRect( 0, 0, 100, 15 )
	end
	KeyBind.DoClick = function()
		KeyBind:SetText("...")
		local NoClickMenu = vgui.Create( "DFrame" )
		NoClickMenu:SetTitle("")
		NoClickMenu:ShowCloseButton(false)
		NoClickMenu:SetDraggable(false)
		NoClickMenu:SetSize(ScrW(), ScrH())
		NoClickMenu:Center()
		NoClickMenu:MakePopup()
		function NoClickMenu:Paint( w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color(0,0,0,150) )
			draw.SimpleTextOutlined( "Press Any Key", "Menu_Title", w/2, h/2, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,1,Color(0,0,0))
			draw.SimpleTextOutlined( "Press ESC to cancel", "Menu_Title", w/2, h/2+30, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,1,Color(0,0,0))
			draw.SimpleTextOutlined( "Hold ESC to clear bind", "Menu_Title", w/2, h/2+60, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,1,Color(0,0,0))
		end
		local ESCStuff, ESCNum = false, 0
		KeyBind.Think = function()
			if !ESCStuff then
				for i = 107, 113 do
					if input.IsMouseDown(i) then
						Namo.Options[Var] = i
						KeyBind:SetText(Namo.MouseBinds[i])
						NoClickMenu:Close()
						KeyBind.Think = nil
					end
				end
				for i = 0, 159 do
					if input.IsKeyDown(i) then
						if i == 70 then
							LocalPlayer():ConCommand("cancelselect")
							ESCStuff = true
						else
							Namo.Options[Var] = i
							KeyBind:SetText(Namo.KeyBinds[i])
							NoClickMenu:Close()
							KeyBind.Think = nil
						end
					end
				end
			else
				if input.IsKeyDown(70) then
					if ESCNum >= 200 then
						Namo.Options[Var] = 0
						KeyBind:SetText(Namo.KeyBinds[0])
						NoClickMenu:Close()
						KeyBind.Think = nil
					else ESCNum = ESCNum + 1 end
				else
					KeyBind:SetText(Namo.KeyBinds[Namo.Options[Var]])
					NoClickMenu:Close()
					KeyBind.Think = nil
				end
			end
		end
	end
end

function AddCheckBox( Parent, Text, PosX, PosY, ToolTip, Var, ExtraFunc )
	local AddCheckBox = vgui.Create( "DCheckBoxLabel", Parent )
	AddCheckBox:SetText( Text )
	AddCheckBox:SetPos( PosX, PosY )
	AddCheckBox:SetTooltip( ToolTip )
	AddCheckBox:SetTextColor( Color(255,255,255,255) )
	AddCheckBox:SizeToContents()
	AddCheckBox:SetChecked( Namo.Options[Var] )
	AddCheckBox.OnChange = function()
		Namo.Options[Var] = AddCheckBox:GetChecked()
		if ExtraFunc != nil then
			local IsChecked = AddCheckBox:GetChecked()
			ExtraFunc()
		end
	end
end

function AddBoneButton( Parent, PosX, PosY, Bone )
	local AddBoneButton = vgui.Create( "DButton", Parent )
	if table.HasValue( Namo.BoneOrder, Bone ) then
		for k, v in pairs(Namo.BoneOrder) do
			if v == Bone then
				AddBoneButton:SetText(tostring(k))
			end
		end
	else
		AddBoneButton:SetText("-")
	end
	AddBoneButton:SetTextColor( Color(255,255,255,255) )
	AddBoneButton:SetSize( 16, 16 )
	AddBoneButton:SetPos( PosX-8, PosY-8 )
	AddBoneButton:SetTooltip( "Select bones in the order you want to aim at them" )
	function AddBoneButton:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color(150,150,150,255) )
		
		surface.SetDrawColor( Color(0,0,0,255) )
		surface.DrawOutlinedRect( 0, 0, w, h )
	end
	AddBoneButton.DoRightClick = function()
		local BoneNum
		if table.HasValue( Namo.BoneOrder, Bone ) then
			for k, v in pairs( Namo.BoneOrder ) do
				if v == Bone then BoneNum = k end
			end
		else BoneNum = 0 end

		if BoneNum == 0 then
			table.insert( Namo.BoneOrder, Bone )
		elseif BoneNum == 1 then
			table.remove( Namo.BoneOrder, BoneNum )
		else
			table.remove( Namo.BoneOrder, BoneNum )
			table.insert( Namo.BoneOrder, BoneNum-1, Bone )
		end
		UpdateBoneThink = true
	end
	AddBoneButton.DoClick = function()
		local BoneNum
		if table.HasValue( Namo.BoneOrder, Bone ) then
			for k, v in pairs( Namo.BoneOrder ) do
				if v == Bone then BoneNum = k end
			end
		else BoneNum = 0 end

		if BoneNum == 0 then
			table.insert( Namo.BoneOrder, 1, Bone )
		elseif BoneNum == 21 then
			table.remove( Namo.BoneOrder, BoneNum )
		else
			if BoneNum != table.Count( Namo.BoneOrder ) then
				table.remove( Namo.BoneOrder, BoneNum )
				table.insert( Namo.BoneOrder, BoneNum+1, Bone )
			else
				table.remove( Namo.BoneOrder, BoneNum )
			end
		end
		UpdateBoneThink = true
	end
	AddBoneButton.Think = function()
		if UpdateBoneThink then
			if UpdateBoneThinkNum != 21 then
				local BoneNum
				if table.HasValue( Namo.BoneOrder, Bone ) then
					for k, v in pairs( Namo.BoneOrder ) do
						if v == Bone then BoneNum = k end
					end
				else BoneNum = 0 end
				if BoneNum != 0 then
					AddBoneButton:SetText(tostring(BoneNum))
				else
					AddBoneButton:SetText("-")
				end
				UpdateBoneThinkNum = UpdateBoneThinkNum+1
			end
			if UpdateBoneThinkNum == 21 then
				UpdateBoneThinkNum = 0
				UpdateBoneThink = false
			end
		end
	end
end

function AddComboBox( Parent, PosX, PosY, SizeX, SizeY, Var, ChoiceTable, ExtraFunc )
	local AddComboBox = vgui.Create( "DComboBox", Parent )
	AddComboBox:SetPos( PosX, PosY )
	AddComboBox:SetSize( SizeX, SizeY )
	AddComboBox:SetValue(Namo.Options[Var])
	for k, v in pairs( ChoiceTable ) do
		AddComboBox:AddChoice(v)
	end
	AddComboBox.OnSelect = function(Selected)
		Namo.Options[Var] = Selected:GetValue()
		if ExtraFunc != nil then
			ExtraFunc()
		end
	end
end

function AddSlider( Parent, Var, PosX, PosY, Min, Max, Decimals )
	local AddSlider = vgui.Create( "Slider", Parent )
	AddSlider:SetSize( 150, 15 )
	AddSlider:SetPos( PosX, PosY )
	AddSlider:SetMin( Min )
	AddSlider:SetMax( Max )
	AddSlider:SetDecimals( Decimals )
	AddSlider:SetValue( Namo.Options[Var] )
	AddSlider.OnValueChanged = function( Panel, Value )
		Namo.Options[Var] = math.Round( Value, Decimals )
	end
	AddSlider.Paint = function()
		draw.RoundedBox( 0, 0, 0, 135, 15, Color(255,255,255,255) )
		surface.SetDrawColor(Color(0,0,0,255))
		surface.DrawOutlinedRect( 0, 0, 135, 15 )
		surface.DrawLine( 105, 0, 105, 15 )
	end
end

function AddTextEntry( Parent, Width, PosX, PosY, DefaultText, Var, Save )
	local AddTextEntry = vgui.Create("DTextEntry", Parent)
	AddTextEntry:SetWide(Width)
	AddTextEntry:SetPos(PosX,PosY)
	if Save != nil && Namo.TextEntries[Var] != nil then
		AddTextEntry:SetText(Namo.TextEntries[Var])
	else
		AddTextEntry:SetText(DefaultText)
	end
	AddTextEntry.OnGetFocus = function()
		if AddTextEntry:GetText() == DefaultText then
			AddTextEntry:SetText("")
		end
	end
	AddTextEntry.OnLoseFocus = function()
		if AddTextEntry:GetText() == "" then
			AddTextEntry:SetText(DefaultText)
			Namo.TextEntries[Var] = nil
		else
			Namo.TextEntries[Var] = AddTextEntry:GetText()
		end
	end
end

function AddDisplayBox( Title, Mode )
	local DisplayBox = vgui.Create( "DFrame" )
	DisplayBox:SetTitle("")
	DisplayBox:ShowCloseButton(false)
	DisplayBox:SetDraggable(true)
	DisplayBox:SetSize( 150, 50 )
	function DisplayBox:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, 24, Color(0,0,0,255) )
		draw.RoundedBox( 0, 0, 0, w, h, Color(0,10,20,245) )
		draw.SimpleText( Title, "Menu_Title", w/2, 13, Color(0,100,200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	
	
//Misc

//AntiScreenGrab
local goatse = "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"
function render.Capture()
     chat.AddText( "Someone tried to capture your screen!" )
     return goatse
end
render.Capture = function() return goatse end
render.Capture = function() return goatse end


	if Mode == 1 then
		DisplayBox:SetPos( Namo.Options["Misc_AdminBox_PosX"], Namo.Options["Misc_AdminBox_PosY"] )
		local AdminTable = {"Moo"}
		local Wait = false
		AddHook( "AdminDisplayBox", "Think", RandomString(), function()
			if !Namo.Options["Misc_AdminBox"] then
				DisplayBox:Close()
				RemoveHook("AdminDisplayBox")
			end
			local PoX, PoY = DisplayBox:GetPos()
			if  Namo.Options["Misc_AdminBox_PosX"] != PoX ||  Namo.Options["Misc_AdminBox_PosY"] != PoY then
				Namo.Options["Misc_AdminBox_PosX"], Namo.Options["Misc_AdminBox_PosY"] = PoX, PoY
			end
			local TempAdminTable = {}
			for k, v in pairs(player.GetAll()) do
				if v:IsAdmin() || v:IsSuperAdmin() then
					table.insert( TempAdminTable, v:Nick() )
				end
			end
			if table.concat(TempAdminTable) != table.concat(AdminTable) then
				if !AdminsListBool && !Wait then
					AdminsListBool = true
					timer.Simple( 0.1, function() AdminsListBool = false Wait = true end )
				elseif Wait then
					AdminTable = table.Copy(TempAdminTable)
					local TextWidth, Tall = 140, 30
					local OldWidth, OldTall = DisplayBox:GetSize()
					if AdminTable[1] != nil then
						for k, v in pairs(AdminTable) do
							local TempTextWidth = AddLabel( DisplayBox, v, 5, Tall, "Admins" )
							if TempTextWidth > TextWidth then TextWidth = TempTextWidth end
							Tall = Tall + 15
						end
						DisplayBox:SetSize( TextWidth + 10, Tall+5 )
					else
						AddLabel( DisplayBox, "No Admins Online", 5, Tall, "Admins" )
						DisplayBox:SetSize( 150, 50 )
					end
					local DifferenceX, DifferenceY = OldWidth - TextWidth+10, OldTall - Tall+5
					local Var = "AdminBox"
					if DifferenceX < 0 then
						DifferenceX = DifferenceX * -1
						RightPos = Namo.Options["Misc_"..Var.."_PosX"] - DifferenceX
					else
						RightPos = Namo.Options["Misc_"..Var.."_PosX"] + DifferenceX
					end
					if DifferenceY < 0 then
						DifferenceY = DifferenceY * -1
						BottomPos = Namo.Options["Misc_"..Var.."_PosY"] - DifferenceY
					else
						BottomPos = Namo.Options["Misc_"..Var.."_PosY"] + DifferenceY
					end

					if Namo.Options["Misc_"..Var.."_Mode"] == "Auto" then
						local PosX, PosY
						if Namo.Options["Misc_"..Var.."_PosX"] > ScrW()/2 then PosX = RightPos else PosX = Namo.Options["Misc_"..Var.."_PosX"] end
						if Namo.Options["Misc_"..Var.."_PosY"] > ScrH()/2 then PosY = BottomPos else PosY = Namo.Options["Misc_"..Var.."_PosY"] end
						DisplayBox:SetPos( PosX, PosY )
					elseif Namo.Options["Misc_"..Var.."_Mode"] == "Top Right" then
						DisplayBox:SetPos( RightPos, Namo.Options["Misc_"..Var.."_PosY"] )
					elseif Namo.Options["Misc_"..Var.."_Mode"] == "Bottom Left" then
						DisplayBox:SetPos( Namo.Options["Misc_"..Var.."_PosX"], BottomPos )
					elseif Namo.Options["Misc_"..Var.."_Mode"] == "Bottom Right" then
						DisplayBox:SetPos( RightPos, BottomPos )
					end
					Wait = false
				end
			end
		end)
	elseif Mode == 2 then
		DisplayBox:SetPos( Namo.Options["Misc_SpectatorsBox_PosX"], Namo.Options["Misc_SpectatorsBox_PosY"] )
		local SpecsTable = {"Moo"}
		local Wait = false
		AddHook( "SpecDisplayBox", "Think", RandomString(), function()
			if !Namo.Options["Misc_SpectatorsBox"] then
				DisplayBox:Close()
				RemoveHook("SpecDisplayBox")
			end
			local PoX, PoY = DisplayBox:GetPos()
			if  Namo.Options["Misc_SpectatorsBox_PosX"] != PoX ||  Namo.Options["Misc_SpectatorsBox_PosY"] != PoY then
				Namo.Options["Misc_SpectatorsBox_PosX"], Namo.Options["Misc_SpectatorsBox_PosY"] = PoX, PoY
			end
			local TempSpecsTable = {}
			for k, v in pairs(player.GetAll()) do
				if v:GetObserverTarget() == LocalPlayer() then
					table.insert( TempSpecsTable, v:Nick() )
				end
			end
			if table.concat(TempSpecsTable) != table.concat(SpecsTable) then
				if !SpecsListBool && !Wait then
					SpecsListBool = true
					timer.Simple( 0.1, function() SpecsListBool = false Wait = true end )
				elseif Wait then
					SpecsTable = table.Copy(TempSpecsTable)
					local TextWidth, Tall = 140, 30
					local OldWidth, OldTall = DisplayBox:GetSize()
					if SpecsTable[1] != nil then
						for k, v in pairs(SpecsTable) do
							local TempTextWidth = AddLabel( DisplayBox, v, 5, Tall, "Spectators" )
							if TempTextWidth > TextWidth then TextWidth = TempTextWidth end
							Tall = Tall + 15
						end
						DisplayBox:SetSize( TextWidth + 10, Tall+5 )
					else
						AddLabel( DisplayBox, "No Spectators", 5, Tall, "Spectators" )
						DisplayBox:SetSize( 150, 50 )
					end
					local DifferenceX, DifferenceY = OldWidth - TextWidth+10, OldTall - Tall+5
					local Var = "SpectatorsBox"
					if DifferenceX < 0 then
						DifferenceX = DifferenceX * -1
						RightPos = Namo.Options["Misc_"..Var.."_PosX"] - DifferenceX
					else
						RightPos = Namo.Options["Misc_"..Var.."_PosX"] + DifferenceX
					end
					if DifferenceY < 0 then
						DifferenceY = DifferenceY * -1
						BottomPos = Namo.Options["Misc_"..Var.."_PosY"] - DifferenceY
					else
						BottomPos = Namo.Options["Misc_"..Var.."_PosY"] + DifferenceY
					end

					if Namo.Options["Misc_"..Var.."_Mode"] == "Auto" then
						local PosX, PosY
						if Namo.Options["Misc_"..Var.."_PosX"] > ScrW()/2 then PosX = RightPos else PosX = Namo.Options["Misc_"..Var.."_PosX"] end
						if Namo.Options["Misc_"..Var.."_PosY"] > ScrH()/2 then PosY = BottomPos else PosY = Namo.Options["Misc_"..Var.."_PosY"] end
						DisplayBox:SetPos( PosX, PosY )
					elseif Namo.Options["Misc_"..Var.."_Mode"] == "Top Right" then
						DisplayBox:SetPos( RightPos, Namo.Options["Misc_"..Var.."_PosY"] )
					elseif Namo.Options["Misc_"..Var.."_Mode"] == "Bottom Left" then
						DisplayBox:SetPos( Namo.Options["Misc_"..Var.."_PosX"], BottomPos )
					elseif Namo.Options["Misc_"..Var.."_Mode"] == "Bottom Right" then
						DisplayBox:SetPos( RightPos, BottomPos )
					end
					Wait = false
				end
			end
		end)
	end
end



//Prop Kill
function MT()
    timer.Simple(.02,Turn)
    timer.Simple(.04,Turn)
    timer.Simple(.06,Turn)
    timer.Simple(.08,Turn)
    timer.Simple(.10,Turn)
    timer.Simple(.12,Turn)
    timer.Simple(.14,Turn)
    timer.Simple(.16,Turn)
    timer.Simple(.18,Turn)
    timer.Simple(.20,Turn)
    timer.Simple(.22,Turn)
    timer.Simple(.24,Turn)
    timer.Simple(.26,Turn)
    timer.Simple(.28,Turn)
    timer.Simple(.30,Turn)
    timer.Simple(.32,Turn)
    timer.Simple(.34,Turn)
    timer.Simple(.36,Turn)
    timer.Simple(.46,TurnBack)
    timer.Simple(.7,function() RunConsoleCommand("+attack") end)
    timer.Simple(.72,function() RunConsoleCommand("-attack") end)
end
function Turn()
    LocalPlayer():SetEyeAngles(LocalPlayer():EyeAngles()-Angle(0,10,0))
end
function TurnBack()
    LocalPlayer():SetEyeAngles(LocalPlayer():EyeAngles()-Angle(0,180,0))
end
concommand.Add("N_Pk",MT)


//Traitor Finder
local TraitWep = { "weapon_ttt_jihad","weapon_ttt_c4", "weapon_ttt_knife", "weapon_ttt_phammer", "weapon_ttt_sipistol", "weapon_ttt_flaregun", "weapon_ttt_push", "weapon_ttt_radio", "weapon_ttt_teleport", "(Disguise)" ,"spiderman's_swep", "weapon_ttt_trait_defilibrator", "weapon_ttt_xbow", "weapon_ttt_dhook", "weapon_awp", "weapon_jihadbomb", "weapon_ttt_knife", "weapon_ttt_c4", "weapon_ttt_decoy", "weapon_ttt_flaregun", "weapon_ttt_phammer", "weapon_ttt_push", "weapon_ttt_radio", "weapon_ttt_sipistol", "weapon_ttt_teleport", "weapon_ttt_awp", "weapon_ttt_silencedsniper", "weapon_ttt_turtlenade", "weapon_ttt_death_station", "weapon_ttt_sg552", "weapon_ttt_tripmine"}

for _,v in pairs(player.GetAll()) do
        v.HatTraitor = nil
end
for _,v in pairs(ents.GetAll()) do
        v.HatESPTracked = nil
end

hook.Add("PostDrawOpaqueRenderables", "wire_animations_idle", function()
        if GAMEMODE.round_state != ROUND_ACTIVE then
                for _,v in pairs(player.GetAll()) do
                        v.HatTraitor = nil
                end
                for _,v in pairs(ents.GetAll()) do
                        v.HatESPTracked = nil
                end
                return
        end
        for _,v in pairs( ents.GetAll() ) do
                if v and IsValid(v) and (table.HasValue(TraitWep, v:GetClass()) and !v.HatESPTracked) then
                        local pl = v.Owner
                        if pl and IsValid(pl) and pl:IsTerror() then
                                if pl:IsDetective() then
                                        v.HatESPTracked = true
                                else
                                        v.HatESPTracked = true
                                        pl.HatTraitor = true
                                        chat.AddText( pl, Color(0,255,255), " is a ",Color(255,0,0), "TRAITOR",Color(0,255,255), " with a ",Color(0,255,255),v:GetClass().."!")
                                end
                        end
                end
        end
          
  

end)



function AddSavePage( Parent, Mode )
	local ManageSaves = vgui.Create("DListView", Parent)
	ManageSaves:SetPos( 25, 55 )
	ManageSaves:SetSize( 550, 200 )
	ManageSaves:SetMultiSelect(false)
	ManageSaves:AddColumn("Title")
	ManageSaves:AddColumn("Date Created")
	function RefreshSaveList(Location, Parent)
		Parent:Clear()
		if !file.Exists( "Namo_saves"..Location, "DATA" ) then file.CreateDir( "Namo_saves"..Location ) end
		if file.Exists( "Namo_saves"..Location, "DATA" ) then
			local Files, Dirs = file.Find( "Namo_saves"..Location.."/*", "DATA" )
			for k, v in pairs( Files ) do
				local Title = string.StripExtension(v)
				local SaveTable = string.Explode( "|", file.Read( "Namo_saves"..Location.."/"..v, "DATA" ) )
				local Date = SaveTable[1]
				local Time = SaveTable[2]
				if Time != nil && Date != nil then
					Parent:AddLine(Title, Date.."|"..Time)
				else
					Parent:AddLine(Title, "This save has been corrupted")
				end
			end
		end
	end
	RefreshSaveList(Mode, ManageSaves)
	
	AddTextEntry( Parent, 275, 25, 275, "Input Save Title", Mode )
	AddGenericButton( Parent, "Refresh Listings", 100, 20, 475, 275, function () RefreshSaveList(Mode, ManageSaves) end )
	AddGenericButton( Parent, "Delete", 51, 20, 419, 275, function()
		if ManageSaves:GetSelectedLine() != nil then
			local SaveTitle = ManageSaves:GetLine(ManageSaves:GetSelectedLine()):GetValue(1)
			if file.Exists( "Namo_saves"..Mode.."/"..SaveTitle..".txt", "DATA" ) then file.Delete( "Namo_saves"..Mode.."/"..SaveTitle..".txt" ) end
			RefreshSaveList(Mode, ManageSaves)
		end
	end)
	AddGenericButton( Parent, "Load", 52, 20, 362, 275, function()
		if ManageSaves:GetSelectedLine() != nil then
			local SaveTitle = ManageSaves:GetLine(ManageSaves:GetSelectedLine()):GetValue(1)
			if file.Exists( "Namo_saves"..Mode.."/"..SaveTitle..".txt", "DATA" ) then
				local SaveFile = file.Read( "Namo_saves"..Mode.."/"..SaveTitle..".txt" )
				local SaveFileTable = string.Explode( "|", SaveFile )
				for k, v in pairs( SaveFileTable ) do
					if k != 1 && k != 2 then
						if ManageSaves:GetLine(ManageSaves:GetSelectedLine()):GetValue(2) != "This save has been corrupted" then
							if Mode == "Friends" then
								table.insert( Namo.FriendsList, v )
							elseif Mode == "Configs" then
								if string.Left( v, 1 ) == "{" then
									Namo.BoneOrder = util.JSONToTable( v )
								else
									local CommandTable = string.Explode( " ", v )
									if CommandTable[3] == "true" || CommandTable[3] == "false" then
										Namo.Options[CommandTable[1]] = tobool(CommandTable[3])
									elseif isnumber(tonumber(CommandTable[3])) then
										Namo.Options[CommandTable[1]] = tonumber(CommandTable[3])
									else
										Namo.Options[CommandTable[1]] = tostring(CommandTable[3])
									end
								end
							elseif Mode == "Entities" then
								table.insert( Namo.EntityESP, v )
							end
						end
					end
				end
				if ManageSaves:GetLine(ManageSaves:GetSelectedLine()):GetValue(2) != "This save has been corrupted" then
					if Mode == "Friends" then
						RefreshFriendsList()
					elseif Mode == "Configs" then
						CloseMenu()
						ReloadNamo(false)
					elseif Mode == "Entities" then
						RefreshEntsList()
					end
				end
			end
		end
	end)
	AddGenericButton( Parent, "Save", 52, 20, 305, 275, function()
		if Namo.TextEntries[Mode] != nil then
			local Files, Dirs = file.Find( "Namo_saves"..Mode.."/*", "DATA" )
			for k, v in pairs( Files ) do
				local Title = string.StripExtension(v)
				if Title == Namo.TextEntries[Mode] then return end
			end
			if !file.Exists( "Namo_saves"..Mode, "DATA" ) then file.CreateDir( "Namo_saves"..Mode ) end
			if file.Exists( "Namo_saves"..Mode, "DATA" ) then
				if tonumber( os.date("%H"), 10 ) < 12 then
					local SaveText = os.date("%d/%m/%y | %I:%M AM")
					if Mode == "Friends" then
						for k, v in pairs( Namo.FriendsList ) do
							SaveText = SaveText.."|"..v
						end
						file.Write( "Namo_saves"..Mode.."/"..Namo.TextEntries[Mode]..".txt", SaveText)
					elseif Mode == "Configs" then
						for k, v in pairs( Namo.Options ) do
							SaveText = SaveText.."|"..k.." = "..tostring(v)
						end
						SaveText = SaveText.."|"..util.TableToJSON( Namo.BoneOrder )
						file.Write( "Namo_saves"..Mode.."/"..Namo.TextEntries[Mode]..".txt", SaveText)
					elseif Mode == "Entities" then
						for k, v in pairs( Namo.EntityESP ) do
							SaveText = SaveText.."|"..v
						end
						file.Write( "Namo_saves"..Mode.."/"..Namo.TextEntries[Mode]..".txt", SaveText)
					end
				else
					local SaveText = os.date("%d/%m/%y | %I:%M PM")
					if Mode == "Friends" then
						for k, v in pairs( Namo.FriendsList ) do
							SaveText = SaveText.."|"..v
						end
						file.Write( "Namo_saves"..Mode.."/"..Namo.TextEntries[Mode]..".txt", SaveText)
					elseif Mode == "Configs" then
						for k, v in pairs( Namo.Options ) do
							SaveText = SaveText.."|"..k.." = "..tostring(v)
						end
						SaveText = SaveText.."|"..util.TableToJSON( Namo.BoneOrder )
						file.Write( "Namo_saves"..Mode.."/"..Namo.TextEntries[Mode]..".txt", SaveText)
					elseif Mode == "Entities" then
						for k, v in pairs( Namo.EntityESP ) do
							SaveText = SaveText.."|"..v
						end
						file.Write( "Namo_saves"..Mode.."/"..Namo.TextEntries[Mode]..".txt", SaveText)
					end
				end
			end
			RefreshSaveList(Mode, ManageSaves)
		end
	end)
	AddGenericButton( Parent, "Rename", 52, 20, 305, 300, function()
		if ManageSaves:GetSelectedLine() != nil && Namo.TextEntries[Mode] != nil then
			local SaveTitle = ManageSaves:GetLine(ManageSaves:GetSelectedLine()):GetValue(1)
			if file.Exists( "Namo_saves"..Mode.."/"..SaveTitle..".txt", "DATA" ) then
				local Files, Dirs = file.Find( "Namo_saves"..Mode.."/*", "DATA" )
				for k, v in pairs( Files ) do
					local Title = string.StripExtension(v)
					if Title == Namo.TextEntries[Mode] then return end
				end
				local SaveFileText = file.Read( "Namo_saves"..Mode.."/"..SaveTitle..".txt", "DATA" )
				file.Delete( "Namo_saves"..Mode.."/"..SaveTitle..".txt" )
				file.Write( "Namo_saves"..Mode.."/"..Namo.TextEntries[Mode]..".txt", SaveFileText )
				RefreshSaveList(Mode, ManageSaves)
			end
		end
	end)
end

function NamoMenu()
	if MenuOpen then
		CloseMenu()
		return
	end
	MenuOpen = true
	
	//Menu Frame
	local Menu = vgui.Create("DFrame")
	Menu:SetTitle("")
	Menu:ShowCloseButton(false)
	Menu:SetDraggable(true)
	Menu:SetSize(600, 400)
	Menu:Center()
	Menu:MakePopup()
	function Menu:Paint( w, h )
		//Title Bar
		draw.RoundedBox( 0, 0, 0, w, 24, Color(0,0,255,255) )
		draw.RoundedBox( 0, 0, 0, w, h, Color(0,10,255,245) )
		
		draw.SimpleText( "♥Namo Hack♥", "Menu_Title", w/2, 11, Color(0,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		draw.SimpleText( "♥FPS: "..FPSValue, "ESP_Font_Main", 5, 2, Color(0,255,255),TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM )
		draw.SimpleText( "♥Ping: "..LocalPlayer():Ping(), "ESP_Font_Main", 68, 2, Color(0,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM )
		
		//Menu Tabs
		draw.RoundedBox( 0, 0, 25, w, 30, Color(128,128,128,255) )
		surface.SetDrawColor( Color(0,0,0) )
		surface.DrawLine( 0, 24, w, 24 )
		surface.DrawLine( 0, 55, w, 55 )
		surface.DrawLine( 0, 24, 0, 55 )
		surface.DrawLine( 50, 24, 50, 55 )
		surface.DrawLine( 100, 24, 100, 55 )
		surface.DrawLine( 150, 24, 150, 55 )
		surface.DrawLine( 200, 24, 200, 55 )
		surface.DrawLine( 250, 24, 250, 55 )
		surface.DrawLine( 300, 24, 300, 55 )
		surface.DrawLine( 350, 24, 350, 55 )
		surface.DrawLine( 400, 24, 400, 55 )
		surface.DrawLine( 450, 24, 450, 55 )
		surface.DrawLine( 500, 24, 500, 55 )
		surface.DrawLine( 550, 24, 550, 55 )
		surface.DrawLine( 599, 24, 599, 55 )
    end
	
	//Tab Frames
	local Main = vgui.Create("DPanel", Menu)
	Main:SetPos( 0 , 25 )
	Main:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	Main:SetVisible( false )
	function Main:Paint()
		draw.RoundedBox( 0, 1, 0, 49, 30, Color(0,0,255,255) )
	end
	
	local Aimbot = vgui.Create("DPanel", Menu)
	Aimbot:SetPos( 0 , 25 )
	Aimbot:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	Aimbot:SetVisible( false )
	function Aimbot:Paint()
		draw.RoundedBox( 0, 51, 0, 49, 30, Color(0,0,255,255) )

		surface.SetDrawColor( Color(255,255,255,255) )

		//Head
		surface.DrawCircle( 490, 75, 30, {255,255,255,255} )

		//Spine
		surface.DrawLine( 490, 105, 490, 255 )
		//Legs
		surface.DrawLine( 490, 255, 440, 305 )
		surface.DrawLine( 490, 255, 540, 305 )
		//Arms
		surface.DrawLine( 490, 180, 440, 130 )
		surface.DrawLine( 490, 180, 540, 130 )
		//Hands
		surface.DrawLine( 440, 130, 420, 130 )
		surface.DrawLine( 540, 130, 560, 130 )
		//Feet
		surface.DrawLine( 440, 305, 400, 305 )
		surface.DrawLine( 540, 305, 580, 305 )
	end
	
	local ESP = vgui.Create("DPanel", Menu)
	ESP:SetPos( 0 , 25 )
	ESP:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	ESP:SetVisible( false )
	function ESP:Paint()
		draw.RoundedBox( 0, 101, 0, 49, 30, Color(0,0,255,255) )
	end
	
	local Ents = vgui.Create("DPanel", Menu)
	Ents:SetPos( 0 , 25 )
	Ents:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	Ents:SetVisible( false )
	function Ents:Paint()
		draw.RoundedBox( 0, 151, 0, 49, 30, Color(0,0,255,255) )
	end
	
	local Misc = vgui.Create("DPanel", Menu)
	Misc:SetPos( 0 , 25 )
	Misc:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	Misc:SetVisible( false )
	function Misc:Paint()
		draw.RoundedBox( 0, 201, 0, 49, 30, Color(0,0,255,255) )
		draw.SimpleText( "Sonic Speed Cheats work now :D", "ESP_Font_Main", 300, 115, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		draw.SimpleText( "Press G to run at a faster speed", "ESP_Font_Main", 300, 127, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	
	local Friends = vgui.Create("DPanel", Menu)
	Friends:SetPos( 0 , 25 )
	Friends:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	Friends:SetVisible( false )
	function Friends:Paint()
		draw.RoundedBox( 0, 251, 0, 49, 30, Color(0,0,255,255) )
		draw.SimpleText( "Friends                                                       Enemies", "ESP_Font_Main", 300, 43, Color(0,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	
	local Cams = vgui.Create("DPanel", Menu)
	Cams:SetPos( 0 , 25 )
	Cams:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	Cams:SetVisible( false )
	function Cams:Paint()
		draw.RoundedBox( 0, 301, 0, 49, 30, Color(0,0,255,255) )
	end
	
	local Bhop = vgui.Create("DPanel", Menu)
	Bhop:SetPos( 0 , 25 )
	Bhop:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	Bhop:SetVisible( false )
	function Bhop:Paint()
		draw.RoundedBox( 0, 351, 0, 49, 30, Color(0,0,255,255) )
	end
	
	local Spam = vgui.Create("DPanel", Menu)
	Spam:SetPos( 0 , 25 )
	Spam:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	Spam:SetVisible( false )
	function Spam:Paint()
		draw.SimpleText( "Favouritised spam", "ESP_Font_Main", 300, 163, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		draw.SimpleText( "Use N_spam 1 for commie spam", "ESP_Font_Main", 300, 183, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		draw.RoundedBox( 0, 401, 0, 49, 30, Color(0,0,255,255) )
	end
	
	local IDK = vgui.Create("DPanel", Menu)
	IDK:SetPos( 0 , 25 )
	IDK:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	IDK:SetVisible( false )
	function IDK:Paint()
		draw.SimpleText( "Hey there, Yeah I'm talking to you, I just wanted to say Hi", "ESP_Font_Main", 300, 43, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		draw.SimpleText( "This is a secret text, if you can find this good job", "ESP_Font_Main", 300, 63, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		draw.SimpleText( "Here is the URL to update the cheats", "ESP_Font_Main", 300, 243, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		draw.SimpleText( "https://github.com/Nam0/NamoHack", "ESP_Font_Main", 300, 263, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
		
		draw.RoundedBox( 0, 451, 0, 49, 30, Color(0,0,255,255) )
	end
	
	local ILY = vgui.Create("DPanel", Menu)
	ILY:SetPos( 0 , 25 )
	ILY:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	ILY:SetVisible( false )
	function ILY:Paint()
		draw.SimpleText( "Hey, Why did you click this tab? Do you love me?", "ESP_Font_Main", 300, 43, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		draw.RoundedBox( 0, 501, 0, 49, 30, Color(0,0,255,255) )
	end
	
	
	local Config = vgui.Create("DPanel", Menu)
	Config:SetPos( 0 , 25 )
	Config:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	Config:SetVisible( false )
	function Config:Paint()
		draw.RoundedBox( 0, 551, 0, 48, 30, Color(0,0,255,255) )
		draw.SimpleText( "Configuration save manager", "ESP_Font_Main", 300, 43, Color(0,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	
	local FriendSaves = vgui.Create("DPanel", Menu)
	FriendSaves:SetPos( 0 , 25 )
	FriendSaves:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	FriendSaves:SetVisible( false )
	function FriendSaves:Paint()
		draw.RoundedBox( 0, 251, 0, 49, 30, Color(0,0,255,255) )
		draw.SimpleText( "Friends list save manager", "ESP_Font_Main", 300, 43, Color(0,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	
	local EntitySaves = vgui.Create("DPanel", Menu)
	EntitySaves:SetPos( 0 , 25 )
	EntitySaves:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	EntitySaves:SetVisible( false )
	function EntitySaves:Paint()
		draw.RoundedBox( 0, 151, 0, 49, 30, Color(0,0,255,255) )
		draw.SimpleText( "Entity ESP save manager", "ESP_Font_Main", 300, 43, Color(0,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local CustomCrosshair = vgui.Create("DPanel", Menu)
	CustomCrosshair:SetPos( 0 , 25 )
	CustomCrosshair:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	CustomCrosshair:SetVisible( false )
	function CustomCrosshair:Paint()
		draw.RoundedBox( 0, 101, 0, 49, 30, Color(0,0,255,255) )
		draw.SimpleText( "Custom Crosshair", "ESP_Font_Main", 300, 43, Color(0,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	
	//Close Button		
	local CloseButton = vgui.Create("DButton", Menu)
	CloseButton:SetSize(24, 24)
	CloseButton:SetPos(Menu:GetWide()-24, 0)
	CloseButton:SetText("X")
	CloseButton:SetColor(Color(255,255,255))
	function CloseButton:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color(0,30,100,200) )
	end
	CloseButton.DoClick = function() CloseMenu() end
	
	//Panic Button
	local PanicButton = vgui.Create("DButton", Menu)
	PanicButton:SetSize(40, 24)
	PanicButton:SetPos(Menu:GetWide()-64, 0)
	if GetConVarNumber("N_panic") == 1 then
		PanicButton:SetText("Enable")
		PanicButton:SetColor(Color(50,200,0,255))
	else
		PanicButton:SetText("Disable")
		PanicButton:SetColor(Color(255,0,0,255))
	end
	function PanicButton:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color(150,150,150,255) )
	end
	PanicButton.DoClick = function()
		if GetConVarNumber("N_panic") == 1 then
			RunConsoleCommand("N_panic", 0)
			PanicButton:SetText("Disable")
			PanicButton:SetColor(Color(255,0,0,255))
		else
			RunConsoleCommand("N_panic", 1)
			PanicButton:SetText("Enable")
			PanicButton:SetColor(Color(50,200,0,255))
		end
	end
		
	//Menu Tabs
	AddMenuTab( Menu, "Main", Main, 1, 25, 1 )
	AddMenuTab( Menu, "Aimbot", Aimbot, 51, 25, 2 )
	AddMenuTab( Menu, "ESP", ESP, 101, 25, 3 )
	AddMenuTab( Menu, "Ents", Ents, 151, 25, 4 )
	AddMenuTab( Menu, "Misc", Misc, 201, 25, 5 )
	AddMenuTab( Menu, "Friends", Friends, 251, 25, 6 )
	AddMenuTab( Menu, "Cams", Cams, 301, 25, 7 )
	AddMenuTab( Menu, "Bhop", Bhop, 351, 25, 8 )
	AddMenuTab( Menu, "Spam", Spam, 401, 25, 9 )
	AddMenuTab( Menu, "IDK", IDK, 451, 25, 10 )
	AddMenuTab( Menu, "ILY", ILY, 501, 25, 11 )
	AddMenuTab( Menu, "Config", Config, 551, 25, 12 )
	
	function ChangeTab ( Tab, TabID )
		Main:SetVisible(false)
		Aimbot:SetVisible(false)
		ESP:SetVisible(false)
		Ents:SetVisible(false)
		Misc:SetVisible(false)
		Friends:SetVisible(false)
		Cams:SetVisible(false)
		Bhop:SetVisible(false)
		Spam:SetVisible(false)
		Config:SetVisible(false)
		IDK:SetVisible(false)
		ILY:SetVisible(false)
		FriendSaves:SetVisible(false)
		EntitySaves:SetVisible(false)
		CustomCrosshair:SetVisible(false)
		
		Tab:SetVisible(true)
		Namo.ActiveTab = TabID
	end
	
	//Main Tab
	AddMainMenuButton( Main, "Unload Hack", 100, 60, function()
		CloseMenu()
		UnloadNamo(true)
	end)
	AddMainMenuButton( Main, "Reload Hack", 250, 60, function()
		CloseMenu()
		ReloadNamo(true)
	end)
	AddMainMenuButton( Main, "Clear Saved Files", 400, 60, function()
		if file.Exists( "sh", "DATA" ) then
			local Files, Dirs = file.Find( "Saves*", "DATA" )
			for k, v in pairs( Files ) do
				file.Delete( "Namo_saves"..v )
			end
			for k, v in pairs( Dirs ) do
				local Files, Dirs = file.Find( "Namo_saves"..v.."/*", "DATA" )
				local Dir = v
				for k, v in pairs( Files ) do
					file.Delete( "Namo_saves"..Dir.."/"..v )
				end
			end
		end
	end)
	
	//Aimbot Tab
	AddCheckBox( Aimbot, "Aimbot", 15, 45, "Enables/Disables Aimbot", "Aimbot_Toggle" )
	AddCheckBox( Aimbot, "LOS Check", 15, 65, "Only aims at visible players (players within your line of sight)", "Aimbot_LOSCheck" )
	AddCheckBox( Aimbot, "Auto Wall", 15, 85, "Aim at people behind walls that can be shot through", "Aimbot_AutoWall")
	AddCheckBox( Aimbot, "Auto Shoot", 100, 85, "Automatically shoot when the aimbot is locked onto someone", "Aimbot_AutoShoot")

	AddCheckBox( Aimbot, "Aim On Key", 15, 105, "Aimbot only active when selected key is held down", "Aimbot_AimOnKey" )
	AddKeyBind( Aimbot, 100, 105, "Aimbot_AimOnKey_Key" )
	AddLabel( Aimbot, "Aim Priority:", 40, 125 )
	AddComboBox( Aimbot, 100, 125, 100, 15, "Aimbot_AimPriority", {"Distance", "Crosshair"} )
	AddCheckBox( Aimbot, "Smooth Aim", 15, 145, "Aims at other players slowly (looks more legit)", "Aimbot_SmoothAim")
	AddSlider( Aimbot, "Aimbot_SmoothAim_Value", 100, 145, 0, 1000, 0 )
	AddCheckBox( Aimbot, "FOV", 15, 165, "Only aim at players within the selected field of view", "Aimbot_FOV")
	AddSlider( Aimbot, "Aimbot_FOV_Value", 100, 165, 0, 360, 0 )
	AddCheckBox( Aimbot, "Stick To Target", 15, 185, "Will stay aiming at the one target as long as they fall within the selected criteria above", "Aimbot_StickToTarget" )
	AddCheckBox( Aimbot, "Bone Aim", 15, 205, "Aims only at selected bone", "Aimbot_BoneAim" )

	AddCheckBox( Aimbot, "Team", 15, 245, "Aim at/ignore players on your team", "Aimbot_AimTeam" )
	AddCheckBox( Aimbot, "Opponents", 15, 265, "Aim at/ignore players on the other team", "Aimbot_AimOpponents" )
	AddCheckBox( Aimbot, "Friends", 15, 285, "Aim at/ignore players on your friends list", "Aimbot_AimFriends" )
	AddCheckBox( Aimbot, "Enemies", 15, 305, "Aim at/ignore players on your enemies list", "Aimbot_AimEnemies" )
	AddCheckBox( Aimbot, "NPCs", 15, 325, "Aim at/ignore NPCs", "Aimbot_AimNPCs" )
	AddCheckBox( Aimbot, "Spectators", 15, 345, "Aim at/ignore players who are in spectator mode", "Aimbot_AimSpectators" )

	AddComboBox( Aimbot, 100, 245, 70, 15, "Aimbot_AimTeamV", {"Aim", "Ignore"} )
	AddComboBox( Aimbot, 100, 265, 70, 15, "Aimbot_AimOpponentsV", {"Aim", "Ignore"} )
	AddComboBox( Aimbot, 100, 285, 70, 15, "Aimbot_AimFriendsV", {"Aim", "Ignore"} )
	AddComboBox( Aimbot, 100, 305, 70, 15, "Aimbot_AimEnemiesV", {"Aim", "Ignore"} )
	AddComboBox( Aimbot, 100, 325, 70, 15, "Aimbot_AimNPCsV", {"Aim", "Ignore"} )
	AddComboBox( Aimbot, 100, 345, 70, 15, "Aimbot_AimSpectatorsV", {"Aim", "Ignore"} )

	//AddLabel( Parent, Text, PosX, PosY, CloseOn )
	AddLabel( Aimbot, "Offset X:", 200, 325 )
	AddLabel( Aimbot, "Offset Y:", 200, 345 )
	AddSlider( Aimbot, "Aimbot_OffsetX", 250, 320, -100, 100, 0 )
	AddSlider( Aimbot, "Aimbot_OffsetY", 250, 340, -100, 100, 0 )
	
	AddBoneButton( Aimbot, 490, 75, "ValveBiped.Bip01_Head1" )
	AddBoneButton( Aimbot, 490, 120, "ValveBiped.Bip01_Neck1" )
	AddBoneButton( Aimbot, 490, 150, "ValveBiped.Bip01_Spine4" )
	AddBoneButton( Aimbot, 490, 175, "ValveBiped.Bip01_Spine2" )
	AddBoneButton( Aimbot, 490, 200, "ValveBiped.Bip01_Spine1" )
	AddBoneButton( Aimbot, 490, 225, "ValveBiped.Bip01_Spine" )
	AddBoneButton( Aimbot, 490, 255, "ValveBiped.Bip01_Pelvis" )
	AddBoneButton( Aimbot, 470, 160, "ValveBiped.Bip01_R_UpperArm" )
	AddBoneButton( Aimbot, 450, 140, "ValveBiped.Bip01_R_Forearm" )
	AddBoneButton( Aimbot, 430, 130, "ValveBiped.Bip01_R_Hand" )
	AddBoneButton( Aimbot, 510, 165, "ValveBiped.Bip01_L_UpperArm" )
	AddBoneButton( Aimbot, 530, 140, "ValveBiped.Bip01_L_Forearm" )
	AddBoneButton( Aimbot, 550, 130, "ValveBiped.Bip01_L_Hand" )
	AddBoneButton( Aimbot, 470, 275, "ValveBiped.Bip01_R_Thigh" )
	AddBoneButton( Aimbot, 450, 295, "ValveBiped.Bip01_R_Calf" )
	AddBoneButton( Aimbot, 430, 305, "ValveBiped.Bip01_R_Foot" )
	AddBoneButton( Aimbot, 410, 305, "ValveBiped.Bip01_R_Toe0" )
	AddBoneButton( Aimbot, 510, 275, "ValveBiped.Bip01_L_Thigh" )
	AddBoneButton( Aimbot, 530, 295, "ValveBiped.Bip01_L_Calf" )
	AddBoneButton( Aimbot, 550, 305, "ValveBiped.Bip01_L_Foot" )
	AddBoneButton( Aimbot, 570, 305, "ValveBiped.Bip01_L_Toe0" )

	AddGenericButton( Aimbot, "Fill", 85, 30, 400, 325, function()
		for k, v in pairs(Namo.Bones) do
			if !table.HasValue( Namo.BoneOrder, v ) then
				table.insert( Namo.BoneOrder, v )
			end
		end
		UpdateBoneThink = true
	end)
	AddGenericButton( Aimbot, "Clear", 85, 30, 495, 325, function()
		table.Empty( Namo.BoneOrder )
		UpdateBoneThink = true
	end)
	

	//ESP Tab
	AddCheckBox( ESP, "ESP", 15, 45, "Enables/Disables ESP", "ESP_Toggle" )
	AddCheckBox( ESP, "Team", 15, 65, "Draw/Ignore ESP for players on your team", "ESP_ShowTeam" )
	AddCheckBox( ESP, "Opponents", 15, 85, "Draw/Ignore ESP for players not on your team", "ESP_ShowOpponents" )
	AddCheckBox( ESP, "Friends", 15, 105, "Draw/Ignore ESP for players on your friends list", "ESP_ShowFriends" )
	AddCheckBox( ESP, "Enemies", 15, 125, "Draw/Ignore ESP for players on your enemies list", "ESP_ShowEnemies" )
	AddCheckBox( ESP, "NPCs", 15, 145, "Draw/Ignore ESP for NPCs", "ESP_ShowNPCs" )
	AddCheckBox( ESP, "Spectators", 15, 165, "Draw/Ignore ESP for spectators", "ESP_ShowSpectators" )

	AddComboBox( ESP, 100, 65, 70, 15, "ESP_ShowTeamV", {"Show", "Ignore"} )
	AddComboBox( ESP, 100, 85, 70, 15, "ESP_ShowOpponentsV", {"Show", "Ignore"} )
	AddComboBox( ESP, 100, 105, 70, 15, "ESP_ShowFriendsV", {"Show", "Ignore"} )
	AddComboBox( ESP, 100, 125, 70, 15, "ESP_ShowEnemiesV", {"Show", "Ignore"} )
	AddComboBox( ESP, 100, 145, 70, 15, "ESP_ShowNPCsV", {"Show", "Ignore"} )
	AddComboBox( ESP, 100, 165, 70, 15, "ESP_ShowSpectatorsV", {"Show", "Ignore"} )

	AddCheckBox( ESP, "Boundary Boxes", 15, 190, "Display a box around players", "ESP_BoundaryBoxes" )
	AddComboBox( ESP, 120, 190, 35, 15, "ESP_BoundaryBoxes_Mode", { "2D", "3D" } )
	AddCheckBox( ESP, "Name Tags", 15, 210, "Display player names", "ESP_NameTags" )
	AddCheckBox( ESP, "Weapon", 15, 230, "Display equipped weapon of players", "ESP_Weapon" )
	AddCheckBox( ESP, "Distance", 15, 250, "Display distance between you and other players", "ESP_Distance" )
	AddCheckBox( ESP, "Health", 15, 270, "Display health of players", "ESP_Health" )
	AddCheckBox( ESP, "Skeleton", 15, 290, "Draws the skeleton of players", "ESP_Skeleton" )
	AddCheckBox( ESP, "Crosshair", 15, 310, "Draws crosshair on screen", "ESP_Crosshair" )
	AddGenericButton( ESP, "Customize", 80, 15, 90, 310, function() ChangeTab(CustomCrosshair,15) end )

	AddCheckBox( ESP, "Entity ESP", 185, 65, "Draw ESP for selected entities", "ESP_Entity_Toggle" )
	AddCheckBox( ESP, "Name Tags", 185, 85, "Draw ESP for selected entities", "ESP_Entities_NameTags" )
	AddCheckBox( ESP, "Boundary Boxes", 185, 105, "Draw ESP for selected entities", "ESP_Entities_BoundaryBoxes" )
	AddComboBox( ESP, 290, 105, 40, 15, "ESP_Entities_BoundaryBoxes_Mode", { "2D", "3D" } )
	
	
	//Crosshair Custimization
	AddGenericButton( CustomCrosshair, "<-- Finished   ", 100, 20, 25, 335, function () ChangeTab( ESP, 3 ) end )
	AddLabel( CustomCrosshair, "Size:", 15, 60 )
	AddLabel( CustomCrosshair, "Mode:", 15, 80)
	AddSlider( CustomCrosshair, "ESP_Crosshair_Size", 50, 60, 1, ScrW()/2, 0 )
	AddComboBox( CustomCrosshair, 50, 80, 105, 15, "ESP_Crosshair_Mode", { "Team", "Custom" } )

	local Mixer = vgui.Create( "DColorMixer", CustomCrosshair )
	Mixer:SetSize( 250, 160 )
	Mixer:SetPos( 335, 60 )
	Mixer:SetPalette( false )
	Mixer:SetAlphaBar( true )
	Mixer:SetWangs( true )
	if Namo.Options["ESP_Crosshair_Mode"] == "Team" then
		Mixer:SetColor( team.GetColor(LocalPlayer():Team()) )
	else
		Mixer:SetColor( Color(Namo.Options["ESP_Crosshair_Color_R"], Namo.Options["ESP_Crosshair_Color_G"], Namo.Options["ESP_Crosshair_Color_B"], Namo.Options["ESP_Crosshair_Color_A"]) )
	end
	Mixer.Think = function()
		if Namo.Options["ESP_Crosshair_Mode"] == "Custom" then
			Namo.Options["ESP_Crosshair_Color_R"] = Mixer:GetColor().r
			Namo.Options["ESP_Crosshair_Color_G"] = Mixer:GetColor().g
			Namo.Options["ESP_Crosshair_Color_B"] = Mixer:GetColor().b
		end
		Namo.Options["ESP_Crosshair_Color_A"] = Mixer:GetColor().a
	end

	//Ents Tab
	local ESPOffEntsList = vgui.Create("DListView", Ents)
	ESPOffEntsList:SetPos( 25, 55 )
	ESPOffEntsList:SetSize( 225, 295 )
	ESPOffEntsList:SetMultiSelect(false)
	ESPOffEntsList:AddColumn("Off ESP")
	
	local ESPOnEntsList = vgui.Create("DListView", Ents)
	ESPOnEntsList:SetPos( 350, 55 )
	ESPOnEntsList:SetSize( 225, 295 )
	ESPOnEntsList:SetMultiSelect(false)
	ESPOnEntsList:AddColumn("On ESP")
	
	function RefreshEntsList()
		ESPOnEntsList:Clear()
		ESPOffEntsList:Clear()
		for k, v in pairs( Namo.EntityESP ) do
			ESPOnEntsList:AddLine(v)
		end
		for k, v in pairs( ents.GetAll() ) do
			local Name = v:GetClass()
			local Copy = false
			if Name != "player" then
				if !table.HasValue( Namo.EntityESP, Name ) then
					for k, v in pairs (ESPOffEntsList:GetLines() ) do
						if v:GetValue(1) == Name then Copy = true end
					end
					if Copy == false then ESPOffEntsList:AddLine(Name) end
				end
			end
		end
	end
	RefreshEntsList()
	
	AddGenericButton( Ents, "Refresh", 80, 30, 260, 55, function() RefreshEntsList() end )
	AddGenericButton( Ents, "------->", 80, 30, 260, 167.5, function()
		if ESPOffEntsList:GetSelectedLine() != nil then
			table.insert( Namo.EntityESP, ESPOffEntsList:GetLine(ESPOffEntsList:GetSelectedLine()):GetValue(1) )
		end
		RefreshEntsList()
	end)
	AddGenericButton( Ents, "<-------", 80, 30, 260, 207.5, function()
		if ESPOnEntsList:GetSelectedLine() != nil then
			for k, v in pairs( Namo.EntityESP ) do
				if v == ESPOnEntsList:GetLine(ESPOnEntsList:GetSelectedLine()):GetValue(1) then
					table.remove( Namo.EntityESP, k )
				end
			end
		end
		RefreshEntsList()
	end)
	AddGenericButton( Ents, "Add All", 80, 30, 260, 95, function()
		for k, v in pairs( ESPOffEntsList:GetLines() ) do
			table.insert( Namo.EntityESP, v:GetValue(1) )
		end
		RefreshEntsList() 
	end)
	AddGenericButton( Ents, "Clear Ents", 80, 30, 260, 280, function() table.Empty( Namo.EntityESP ) RefreshEntsList() end )
	AddGenericButton( Ents, "Manage Saves", 80, 30, 260, 320, function() ChangeTab(EntitySaves, 14) end )
	
	//Entity Saves Manager
	AddSavePage( EntitySaves, "Entities" )
	AddGenericButton( EntitySaves, "<-- Finished   ", 100, 20, 25, 335, function () ChangeTab( Ents, 4 ) end )

	//Misc Tab
	AddCheckBox( Misc, "Admin Box", 15, 45, "Display all admins in a box", "Misc_AdminBox", function()
		if Namo.Options["Misc_AdminBox"] then
			AddDisplayBox( "Admins", 1 )
		end
	end)
	AddComboBox( Misc, 120, 45, 90, 15, "Misc_AdminBox_Mode", {"Auto", "Top Left", "Top Right", "Bottom Left", "Bottom Right"} )
	AddCheckBox( Misc, "Spectators Box", 15, 65, "Display all people spectating you in a box", "Misc_SpectatorsBox", function()
		if Namo.Options["Misc_SpectatorsBox"] then
			AddDisplayBox( "Spectators", 2 )
		end
	end)
	AddComboBox( Misc, 120, 65, 90, 15, "Misc_SpectatorsBox_Mode", {"Auto", "Top Left", "Top Right", "Bottom Left", "Bottom Right"} )

	AddKeyBind( Misc, 45, 105, "Airstuck_Key" )
	AddKeyBind( Misc, 45, 125, "Speed_Key" )
	
	//IDK Tab
	AddTextEntry( IDK, 485, 45, 53, "", "IDK1", true )
	
	//ILY Tab
	AddTextEntry( ILY, 485, 45, 53, "", "ILY1", true )
	
	//Friends Tab
	local FriendsList = vgui.Create("DListView", Friends)
	FriendsList:SetPos( 25, 55 )
	FriendsList:SetSize( 275, 200 )
	FriendsList:SetMultiSelect(false)
	FriendsList:AddColumn("Player Name")
	FriendsList:AddColumn("Steam ID")
	
	local EnemiesList = vgui.Create("DListView", Friends)
	EnemiesList:SetPos( 300, 55 )
	EnemiesList:SetSize( 275, 200 )
	EnemiesList:SetMultiSelect(false)
	EnemiesList:AddColumn("Player Name")
	EnemiesList:AddColumn("Steam ID")
	
	function RefreshFriendsList()
		FriendsList:Clear()
		EnemiesList:Clear()
		for k, v in pairs(player.GetAll()) do
			if v != LocalPlayer() then
				if Namo.Options["Friends_SteamFriends"] && v:GetFriendStatus() == "friend" then
					if !table.HasValue(Namo.FriendsList, v:SteamID()) then table.insert(Namo.FriendsList, v:SteamID()) end
				end
				if Namo.Options["Friends_SteamEnemies"] && v:GetFriendStatus() == "friend" then
					local PlayerSteamID = v:SteamID()
					for k, v in pairs(Namo.FriendsList) do
						if v == PlayerSteamID then
							table.remove(Namo.FriendsList, k)
						end
					end
					if table.HasValue(Namo.FriendsList, v:SteamID()) then table.remove(Namo.FriendsList, v:SteamID()) end
				end
				if Namo.Options["Friends_FriendIsEnemy"] then
					if table.HasValue(Namo.FriendsList, v:SteamID()) then
						EnemiesList:AddLine(v:Nick(), v:SteamID())
					else
						FriendsList:AddLine(v:Nick(), v:SteamID())
					end
				else
					if table.HasValue(Namo.FriendsList, v:SteamID()) then
						FriendsList:AddLine(v:Nick(), v:SteamID())
					else
						EnemiesList:AddLine(v:Nick(), v:SteamID())
					end
				end
			end
		end
	end
	RefreshFriendsList()
	
	AddMainMenuButton( Friends, "Remove Friend", 112.5, 260, function()
		local SelectedLine = FriendsList:GetSelectedLine()
		if SelectedLine != nil then
			local PlayerNick = FriendsList:GetLine(SelectedLine):GetValue(1)
			local PlayerSteamID = FriendsList:GetLine(SelectedLine):GetValue(2)
			if Namo.Options["Friends_FriendIsEnemy"] then
				table.insert(Namo.FriendsList, PlayerSteamID)
			else
				for k, v in pairs(Namo.FriendsList) do
					if v == PlayerSteamID then
						table.remove(Namo.FriendsList, k)
						break
					end
				end
			end
			RefreshFriendsList()
		end
	end)
	
	AddMainMenuButton( Friends, "Add Friend", 387.5, 260, function()
		local SelectedLine = EnemiesList:GetSelectedLine()
		if SelectedLine != nil then
			local PlayerNick = EnemiesList:GetLine(SelectedLine):GetValue(1)
			local PlayerSteamID = EnemiesList:GetLine(SelectedLine):GetValue(2)
			if Namo.Options["Friends_FriendIsEnemy"] then
				for k, v in pairs(Namo.FriendsList) do
					if v == PlayerSteamID then
						table.remove(Namo.FriendsList, k)
						break
					end
				end
			else
				table.insert(Namo.FriendsList, PlayerSteamID)
			end
			RefreshFriendsList()
		end
	end)
	
	AddMainMenuButton( Friends, "Refresh List", (Friends:GetWide()/2)-50, 260, function() RefreshFriendsList() end )
	AddMainMenuButton( Friends, "Manage Saves", (Friends:GetWide()/2)-50, 300, function() ChangeTab( FriendSaves, 13 ) end )
	AddMainMenuButton( Friends, "Clear Friends", 387.5, 300, function() table.Empty( Namo.FriendsList ) RefreshFriendsList() end )
	AddCheckBox( Friends, "Friend Is Enemy", 5, 265, "Turns the friends list into the enemies list", "Friends_FriendIsEnemy", function() RefreshFriendsList() end )
	AddCheckBox( Friends, "Steam Friends", 5, 285, "Make your friends on steam automatically appear on the friends list", "Friends_SteamFriends", function() RefreshFriendsList() end )
	AddCheckBox( Friends, "Steam Enemies", 5, 305, "Make your friends on steam automatically appear on the enemies list", "Friends_SteamEnemies", function() RefreshFriendsList() end )
	
	//Manage Friend Saves
	AddSavePage( FriendSaves, "Friends" )
	AddGenericButton( FriendSaves, "<-- Finished   ", 100, 20, 25, 335, function () ChangeTab( Friends, 6 ) end )

	//Cams Tab
	AddCheckBox( Cams, "Cams", 15, 45, "Enables/Disables cams hacks", "Cams_Toggle" )
	AddCheckBox( Cams, "Client Side Noclip", 15, 65, "Fly around the map freely (everyone else on the server wont see you flying)", "Cams_CSNoclip" )
	AddSlider( Cams, "Cams_CSNoclip_Speed", 125, 65, 0, 100, 0 )
	AddCheckBox( Cams, "Thirdperson", 15, 85, "An over shoulder view", "Cams_ThirdPerson" )
	AddSlider( Cams, "Cams_ThirdPerson_Zoom", 125, 85, 0, 100, 0 )

	//Bhop Tab
	AddCheckBox( Bhop, "Bhop", 15, 45, "Enables/Disables Bhop hacks", "Bhop_Toggle" )
	AddCheckBox( Bhop, "Fast Walk", 15, 65, "Makes you walk slightly faster", "Bhop_FastWalk" )
	AddCheckBox( Bhop, "Auto Hop", 15, 85, "Hold space to bhop", "Bhop_AutoHop" )
	AddCheckBox( Bhop, "Auto Strafe", 15, 105, "Automatically turns in the air", "Bhop_AutoStrafe")
	AddCheckBox( Bhop, "Edge Jump", 15, 125, "Jumps just before an edge", "Bhop_EdgeJump")
	AddSlider( Bhop, "Bhop_EdgeJump_Distance", 100, 125, 0, 100, 0 )
	AddCheckBox( Bhop, "Sideways", 15, 145, "Turns your camera so you can bhop normally while in Sideways mode", "Bhop_Sideways")
	AddCheckBox( Bhop, "W-Only", 15, 165, "Turns your camera so you can bhop normally while in W-Only mode", "Bhop_WOnly")

	//Spam Tab
	AddCheckBox( Spam, "Spam", 15, 45, "Enables/Disables Chat Spammer", "Spam_Toggle" )
	AddCheckBox( Spam, "Delay", 15, 65, "Pauses between each spam for x seeconds", "Spam_Delay" )
	AddSlider( Spam, "Spam_Delay_Value", 80, 65, 0, 10, 2 )
	AddCheckBox( Spam, "Anti-Anti-Spam", 15, 85, "Adds a random number to the end of your message to help avoid Anti-Spammers", "Spam_AntiAntiSpam" )
	AddCheckBox( Spam, "Message 1", 15, 265, "Enable spam message #1", "Spam_Message_1" )
	AddCheckBox( Spam, "Message 2", 15, 285, "Enable spam message #2", "Spam_Message_2" )
	AddCheckBox( Spam, "Message 3", 15, 305, "Enable spam message #3", "Spam_Message_3" )
	AddCheckBox( Spam, "Message 4", 15, 325, "Enable spam message #4", "Spam_Message_4" )
	AddCheckBox( Spam, "Message 5", 15, 345, "Enable spam message #5", "Spam_Message_5" )
	AddTextEntry( Spam, 485, 100, 262, "", "Spam1", true )
	AddTextEntry( Spam, 485, 100, 282, "", "Spam2", true )
	AddTextEntry( Spam, 485, 100, 302, "", "Spam3", true )
	AddTextEntry( Spam, 485, 100, 322, "", "Spam4", true )
	AddTextEntry( Spam, 485, 100, 342, "", "Spam5", true )

	
	
	//Config Tab
	AddSavePage( Config, "Configs" )
	
	if Namo.ActiveTab == nil then Namo.ActiveTab = 1 end
	if Namo.ActiveTab == 1 then ChangeTab( Main, 1 )
	elseif Namo.ActiveTab == 2 then ChangeTab( Aimbot, 2 )
	elseif Namo.ActiveTab == 3 then ChangeTab( ESP, 3 )
	elseif Namo.ActiveTab == 4 then ChangeTab( Ents, 4 )
	elseif Namo.ActiveTab == 5 then ChangeTab( Misc, 5 )
	elseif Namo.ActiveTab == 6 then ChangeTab( Friends, 6 )
	elseif Namo.ActiveTab == 7 then ChangeTab( Cams, 7 )
	elseif Namo.ActiveTab == 8 then ChangeTab( Bhop, 8 )
	elseif Namo.ActiveTab == 9 then ChangeTab( Spam, 9 )
	elseif Namo.ActiveTab == 10 then ChangeTab( IDK, 10 )
	elseif Namo.ActiveTab == 11 then ChangeTab( ILY, 11 )
	elseif Namo.ActiveTab == 12 then ChangeTab( Config, 12 )
	elseif Namo.ActiveTab == 13 then ChangeTab ( FriendSaves, 13 )
	elseif Namo.ActiveTab == 14 then ChangeTab ( EntitySaves, 14 )
	elseif Namo.ActiveTab == 15 then ChangeTab ( CustomCrosshair, 15 ) end

	function CloseMenu()
		MenuOpen = false
		Menu:Close()
	end
end
LoadNamo(true)

RunConsoleCommand("cl_cmdrate", "+30") 

Namo.Message ("Cheats successfully loaded")
Namo.Message ("This is not the final release of Namo Hack")