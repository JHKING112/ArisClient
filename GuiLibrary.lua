if shared.ArisExecuted then
	local VERSION = "4.10"..(shared.ArisPrivate and " PRIVATE" or "").." "..readfile("aris/commithash.txt"):sub(1, 6)
	local baseDirectory = (shared.ArisPrivate and "arisprivate/" or "aris/")
	local universalRainbowValue = 0
	local arisAssetTable = {
		["aris/assets/Aris_Icon.png"] = "rbxassetid://13721192723",
		["aris/assets/Exit_Icon.png"] = "rbxassetid://13721189794",
		["aris/assets/ArrowIndicator.png"] = "rbxassetid://13350766521",
		["aris/assets/BackIcon.png"] = "rbxassetid://13350767223",
		["aris/assets/BindBackground.png"] = "rbxassetid://13350767577",
		["aris/assets/BlatantIcon.png"] = "rbxassetid://13350767943",
		["aris/assets/CircleListBlacklist.png"] = "rbxassetid://13350768647",
		["aris/assets/CircleListWhitelist.png"] = "rbxassetid://13350769066",
		["aris/assets/ColorSlider1.png"] = "rbxassetid://13350769439",
		["aris/assets/ColorSlider2.png"] = "rbxassetid://13350769842",
		["aris/assets/CombatIcon.png"] = "rbxassetid://13350770192",
		["aris/assets/DownArrow.png"] = "rbxassetid://13350770749",
		["aris/assets/DiscordIcon.png"] = "rbxassetid://13546311177",
		["aris/assets/ExitIcon1.png"] = "rbxassetid://13350771140",
		["aris/assets/FriendsIcon.png"] = "rbxassetid://13350771464",
		["aris/assets/HoverArrow.png"] = "rbxassetid://13350772201",
		["aris/assets/HoverArrow2.png"] = "rbxassetid://13350772588",
		["aris/assets/HoverArrow3.png"] = "rbxassetid://13350773014",
		["aris/assets/HoverArrow4.png"] = "rbxassetid://13350773643",
		["aris/assets/InfoNotification.png"] = "rbxassetid://13350774006",
		["aris/assets/KeybindIcon.png"] = "rbxassetid://13350774323",
		["aris/assets/LegitModeIcon.png"] = "rbxassetid://13436400428",
		["aris/assets/MoreButton1.png"] = "rbxassetid://13350775005",
		["aris/assets/MoreButton2.png"] = "rbxassetid://13350775731",
		["aris/assets/MoreButton3.png"] = "rbxassetid://13350776241",
		["aris/assets/NotificationBackground.png"] = "rbxassetid://13350776706",
		["aris/assets/NotificationBar.png"] = "rbxassetid://13350777235",
		["aris/assets/OnlineProfilesButton.png"] = "rbxassetid://13350777717",
		["aris/assets/PencilIcon.png"] = "rbxassetid://13350778187",
		["aris/assets/PinButton.png"] = "rbxassetid://13350778654",
		["aris/assets/ProfilesIcon.png"] = "rbxassetid://13350779149",
		["aris/assets/RadarIcon1.png"] = "rbxassetid://13350779545",
		["aris/assets/RadarIcon2.png"] = "rbxassetid://13350779992",
		["aris/assets/RainbowIcon1.png"] = "rbxassetid://13350780571",
		["aris/assets/RainbowIcon2.png"] = "rbxassetid://13350780993",
		["aris/assets/RightArrow.png"] = "rbxassetid://13350781908",
		["aris/assets/SearchBarIcon.png"] = "rbxassetid://13350782420",
		["aris/assets/SettingsWheel1.png"] = "rbxassetid://13350782848",
		["aris/assets/SettingsWheel2.png"] = "rbxassetid://13350783258",
		["aris/assets/SliderArrow1.png"] = "rbxassetid://13350783794",
		["aris/assets/SliderArrowSeperator.png"] = "rbxassetid://13350784477",
		["aris/assets/SliderButton1.png"] = "rbxassetid://13350785680",
		["aris/assets/TargetIcon.png"] = "rbxassetid://13350786128",
		["aris/assets/TargetIcon1.png"] = "rbxassetid://13350786776",
		["aris/assets/TargetIcon2.png"] = "rbxassetid://13350787228",
		["aris/assets/TargetIcon3.png"] = "rbxassetid://13350787729",
		["aris/assets/TargetIcon4.png"] = "rbxassetid://13350788379",
		["aris/assets/TargetInfoIcon1.png"] = "rbxassetid://13350788860",
		["aris/assets/TargetInfoIcon2.png"] = "rbxassetid://13350789239",
		["aris/assets/TextBoxBKG.png"] = "rbxassetid://13350789732",
		["aris/assets/TextBoxBKG2.png"] = "rbxassetid://13350790229",
		["aris/assets/TextGUIIcon1.png"] = "rbxassetid://13350790634",
		["aris/assets/TextGUIIcon2.png"] = "rbxassetid://13350791175",
		["aris/assets/TextGUIIcon3.png"] = "rbxassetid://13350791758",
		["aris/assets/TextGUIIcon4.png"] = "rbxassetid://13350792279",
		["aris/assets/ToggleArrow.png"] = "rbxassetid://13350792786",
		["aris/assets/UpArrow.png"] = "rbxassetid://13350793386",
		["aris/assets/UtilityIcon.png"] = "rbxassetid://13350793918",
		["aris/assets/WarningNotification.png"] = "rbxassetid://13350794868",
		["aris/assets/WindowBlur.png"] = "rbxassetid://13350795660",
		["aris/assets/WorldIcon.png"] = "rbxassetid://13350796199",
		["aris/assets/VapeIcon.png"] = "rbxassetid://13350808582",
		["aris/assets/RenderIcon.png"] = "rbxassetid://13350832775",
		["aris/assets/VapeLogo1.png"] = "rbxassetid://13350860863",
		["aris/assets/VapeLogo3.png"] = "rbxassetid://13350872035",
		["aris/assets/VapeLogo2.png"] = "rbxassetid://13350876307",
		["aris/assets/VapeLogo4.png"] = "rbxassetid://13350877564"
	}
	local loadedsuccessfully = false
	local GuiLibrary = {
		Settings = {},
		Profiles = {
			default = {Keybind = "", Selected = true}
		},
		RainbowSpeed = 0.6,
		GUIKeybind = "RightShift",
		CurrentProfile = "default",
		KeybindCaptured = false,
		PressedKeybindKey = "",
		ToggleNotifications = false,
		Notifications = false,
		ToggleTooltips = false,
		ObjectsThatCanBeSaved = {["Gui ColorSliderColor"] = {Api = {Hue = 0.44, Sat = 1, Value = 1}}},
		MobileButtons = {}
	}
	local inputService = game:GetService("UserInputService")
	local httpService = game:GetService("HttpService")
	local tweenService = game:GetService("TweenService")
	local guiService = game:GetService("GuiService")
	local textService = game:GetService("TextService")

	local translations = shared.ArisTranslation or {}
	local translatedlogo = false

	local capturedslider = nil
	local clickgui = {["Visible"] = true}

	local function randomString()
		local randomlength = math.random(10,100)
		local array = {}

		for i = 1, randomlength do
			array[i] = string.char(math.random(32, 126))
		end

		return table.concat(array)
	end
	
	local function RelativeXY(GuiObject, location)
		local x, y = location.X - GuiObject.AbsolutePosition.X, location.Y - GuiObject.AbsolutePosition.Y
		local x2 = 0
		local xm, ym = GuiObject.AbsoluteSize.X, GuiObject.AbsoluteSize.Y
		x2 = math.clamp(x, 4, xm - 6)
		x = math.clamp(x, 0, xm)
		y = math.clamp(y, 0, ym)
		return x, y, x/xm, y/ym, x2/xm
	end

	local gui = Instance.new("ScreenGui")
	gui.Name = randomString()
	gui.DisplayOrder = 999
	gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
	gui.OnTopOfCoreBlur = true
	if gethui and (not KRNL_LOADED) then
		gui.Parent = gethui()
	elseif not is_sirhurt_closure and syn and syn.protect_gui then
		syn.protect_gui(gui)
		gui.Parent = game:GetService("CoreGui")
	else
		gui.Parent = game:GetService("CoreGui")
	end
	GuiLibrary["MainGui"] = gui

	local arisCachedAssets = {}
	local function arisGithubRequest(scripturl)
		if not isfile("aris/"..scripturl) then
			local suc, res = pcall(function() return game:HttpGet("https://raw.githubusercontent.com/JHKING112/ArisClient"..readfile("aris/commithash.txt").."/"..scripturl, true) end)
			assert(suc, res)
			assert(res ~= "404: Not Found", res)
			if scripturl:find(".lua") then res = "--This watermark is used to delete the file if its cached, remove it to make the file persist after commits.\n"..res end
			writefile("Aris/"..scripturl, res)
		end
		return readfile("Aris/"..scripturl)
	end
	
	local function downloadArisAsset(path)
		if customassetcheck then
			if not isfile(path) then
				task.spawn(function()
					local textlabel = Instance.new("TextLabel")
					textlabel.Size = UDim2.new(1, 0, 0, 36)
					textlabel.Text = "Downloading "..path
					textlabel.BackgroundTransparency = 1
					textlabel.TextStrokeTransparency = 0
					textlabel.TextSize = 30
					textlabel.Font = Enum.Font.SourceSans
					textlabel.TextColor3 = Color3.new(1, 1, 1)
					textlabel.Position = UDim2.new(0, 0, 0, -36)
					textlabel.Parent = GuiLibrary.MainGui
					repeat task.wait() until isfile(path)
					textlabel:Destroy()
				end)
				local suc, req = pcall(function() return ArisGithubRequest(path:gsub("Aris/assets", "assets")) end)
				if suc and req then
					writefile(path, req)
				else
					return ""
				end
			end
		end
		if not arisCachedAssets[path] then arisCachedAssets[path] = getcustomasset(path) end
		return arisCachedAssets[path] 
	end

	GuiLibrary["UpdateHudEvent"] = Instance.new("BindableEvent")
	GuiLibrary["SelfDestructEvent"] = Instance.new("BindableEvent")
	GuiLibrary["LoadSettingsEvent"] = Instance.new("BindableEvent")
end
downloadArisAsset("aris/assets/Aris_Icon.png")
