repeat task.wait() until game:IsLoaded()
local GuiLibrary
local baseDirectory = (shared.ArisPrivate and "arisprivate/" or "aris/")
local arisInjected = true
local oldRainbow = false
local errorPopupShown = false
local redownloadedAssets = false
local profilesLoaded = false
local teleportedServers = false
local gameCamera = workspace.CurrentCamera
local textService = game:GetService("TextService")
local playersService = game:GetService("Players")
local inputService = game:GetService("UserInputService")
local isfile = isfile or function(file)
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end
local setidentity = syn and syn.set_thread_identity or set_thread_identity or setidentity or setthreadidentity or function() end
local getidentity = syn and syn.get_thread_identity or get_thread_identity or getidentity or getthreadidentity or function() return 0 end
local arisAssetTable = {
	["aris/assets/.png"] = "rbxassetid://",
	["aris/assets/.png"] = "rbxassetid://"
}
--mobile fix
if inputService:GetPlatform() ~= Enum.Platform.Windows then 
	getgenv().getsynasset = nil
	getgenv().getcustomasset = nil
end
-- end line
local getcustomasset = getsynasset or getcustomasset or function(location) return arisAssetTable[location] or "" end
local customassetcheck = (getsynasset or getcustomasset) and true
local queueonteleport = syn and syn.queue_on_teleport or queue_on_teleport or function() end
local delfile = delfile or function(file) writefile(file, "") end

local function arisGithubRequest(scripturl)
	if not isfile("aris/"..scripturl) then
		local suc, res
		task.delay(15, function()
			if not res and not errorPopupShown then 
				errorPopupShown = true
				displayErrorPopup("The connection to github is taking a while, Please be patient.")
			end
		end)
		suc, res = pcall(function() return game:HttpGet("https://raw.githubusercontent.com/JHKING112/ArisClient/"..readfile("aris/commithash.txt").."/"..scripturl, true) end)
		if not suc or res == "404: Not Found" then
			displayErrorPopup("Failed to connect to github : aris/"..scripturl.." : "..res)
			error(res)
		end
		if scripturl:find(".lua") then res = "--This watermark is used to delete the file if its cached, remove it to make the file persist after commits.\n"..res end
		writefile("aris/"..scripturl, res)
	end
	return readfile("aris/"..scripturl)
end
-- 미완성
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
			local suc, req = pcall(function() return arisGithubRequest(path:gsub("aris/assets", "assets")) end)
			if suc and req then
				writefile(path, req)
			else
				return ""
			end
		end
	end
	return getcustomasset(path) 
end

assert(not shared.VapeExecuted, "Vape Already Injected")
shared.VapeExecuted = true

for i,v in pairs({baseDirectory:gsub("/", ""), "aris", "aris/Libraries", "aris/CustomModules", "aris/Profiles", baseDirectory.."Profiles", "aris/assets"}) do 
	if not isfolder(v) then makefolder(v) end
end

task.spawn(function()
	local success, assetver = pcall(function() return arisGithubRequest("assetsversion.txt") end)
	if not isfile("aris/assetsversion.txt") then writefile("aris/assetsversion.txt", "0") end
	if success and assetver > readfile("aris/assetsversion.txt") then
		redownloadedAssets = true
		if isfolder("aris/assets") and not shared.ArisDeveloper then
			if delfolder then
				delfolder("aris/assets")
				makefolder("aris/assets")
			end
		end
		writefile("aris/assetsversion.txt", assetver)
	end
end)
