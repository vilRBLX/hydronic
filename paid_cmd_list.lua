--// GUI CREATION //--

local screen_gui = Instance.new("ScreenGui")
screen_gui.IgnoreGuiInset = false
screen_gui.ResetOnSpawn = true
screen_gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screen_gui.Parent = game.CoreGui

local commands = Instance.new("ImageLabel")
commands.Image = "rbxassetid://1316045217"
commands.ImageColor3 = Color3.new(0, 0, 0)
commands.ImageTransparency = 0.699999988079071
commands.ScaleType = Enum.ScaleType.Slice
commands.SliceCenter = Rect.new(10, 10, 118, 118)
commands.AnchorPoint = Vector2.new(0.5, 0.5)
commands.BackgroundTransparency = 1
commands.Position = UDim2.new(0.457123339, 0, 0.497010231, 2)
commands.Size = UDim2.new(0, 235, 0, 306)
commands.Visible = true
commands.Name = "Commands"
commands.Parent = screen_gui

local list_of_cmds = Instance.new("Frame")
list_of_cmds.BackgroundColor3 = Color3.new(0.0470588, 0.0470588, 0.0470588)
list_of_cmds.BorderSizePixel = 0
list_of_cmds.Position = UDim2.new(0.0187928807, 0, 0.136272654, 0)
list_of_cmds.Size = UDim2.new(0, 226, 0, 254)
list_of_cmds.Visible = true
list_of_cmds.Name = "ListOfCMDS"
list_of_cmds.Parent = commands

local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(0, 2)
uicorner.Parent = list_of_cmds

local top = Instance.new("Frame")
top.BackgroundColor3 = Color3.new(0.0470588, 0.0470588, 0.0470588)
top.BorderSizePixel = 0
top.Position = UDim2.new(-2.68877329e-07, 0, -0.129250467, 0)
top.Size = UDim2.new(0, 226, 0, 60)
top.Visible = true
top.Name = "Top"
top.Parent = list_of_cmds

local uicorner_2 = Instance.new("UICorner")
uicorner_2.CornerRadius = UDim.new(0, 5)
uicorner_2.Parent = top

local title = Instance.new("TextLabel")
title.Font = Enum.Font.Gotham
title.Text = "commands"
title.TextColor3 = Color3.new(0.831373, 0.831373, 0.831373)
title.TextSize = 11
title.TextXAlignment = Enum.TextXAlignment.Left
title.BackgroundColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Position = UDim2.new(0.0844751149, 0, 0.13333334, 0)
title.Size = UDim2.new(0, 73, 0, 24)
title.Visible = true
title.Name = "Title"
title.Parent = top

local image_label = Instance.new("ImageButton")
image_label.Image = "http://www.roblox.com/asset/?id=6031094678"
image_label.ImageColor3 = Color3.new(0.819608, 0.819608, 0.819608)
image_label.BackgroundTransparency = 1
image_label.BorderSizePixel = 0
image_label.Position = UDim2.new(0.866123974, 0, 0.166999817, 0)
image_label.Size = UDim2.new(0, 18, 0, 18)
image_label.Visible = true
image_label.Parent = top
image_label.MouseButton1Down:Connect(function()
  screen_gui:Destroy()
end)

local shadow = Instance.new("Frame")
shadow.BackgroundColor3 = Color3.new(1, 1, 1)
shadow.BorderSizePixel = 0
shadow.Position = UDim2.new(-2.68877329e-07, 0, 0.0361038558, 0)
shadow.Size = UDim2.new(0, 226, 0, 11)
shadow.Visible = true
shadow.Name = "Shadow"
shadow.Parent = list_of_cmds

local uigradient = Instance.new("UIGradient")
uigradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.0313726, 0.0313726, 0.0313726)), ColorSequenceKeypoint.new(1, Color3.new(0.0470588, 0.0470588, 0.0470588))})
uigradient.Rotation = 90
uigradient.Parent = shadow

local cmdlist = Instance.new("ScrollingFrame")
cmdlist.ScrollBarImageColor3 = Color3.new(0, 0, 0)
cmdlist.ScrollBarThickness = 2
cmdlist.Active = true
cmdlist.BackgroundColor3 = Color3.new(1, 1, 1)
cmdlist.BackgroundTransparency = 1
cmdlist.BorderColor3 = Color3.new(0, 0, 0)
cmdlist.BorderSizePixel = 0
cmdlist.Position = UDim2.new(0.0844750851, 0, 0.0794110671, 0)
cmdlist.Size = UDim2.new(0, 197, 0, 222)
cmdlist.CanvasSize = UDim2.new(0, 0, 3, 0)
cmdlist.Visible = true
cmdlist.Name = "CMDList"
cmdlist.Parent = list_of_cmds

local uilist_layout = Instance.new("UIListLayout")
uilist_layout.Padding = UDim.new(0, 8)
uilist_layout.SortOrder = Enum.SortOrder.LayoutOrder
uilist_layout.Parent = cmdlist

local cmdname = Instance.new("TextLabel")
cmdname.Font = Enum.Font.Gotham
cmdname.Text = "cmdname"
cmdname.TextColor3 = Color3.new(0.517647, 0.517647, 0.517647)
cmdname.TextScaled = true
cmdname.TextSize = 14
cmdname.TextWrapped = true
cmdname.TextXAlignment = Enum.TextXAlignment.Left
cmdname.BackgroundColor3 = Color3.new(1, 1, 1)
cmdname.BackgroundTransparency = 1
cmdname.BorderColor3 = Color3.new(0, 0, 0)
cmdname.BorderSizePixel = 0
cmdname.Size = UDim2.new(0, 195, 0, 13)
cmdname.Visible = false
cmdname.Name = "cmdname"
cmdname.Parent = cmdlist

local dragify = Instance.new("LocalScript")
dragify.Name = "Dragify"
dragify.Parent = commands

-- // MODULES // --

local modules = {}

-- // DRAG SCRIPT // --

task.spawn(function()
	local script = dragify

	local oldreq = require
	local function require(target)
		if modules[target] then
			return modules[target]()
		end
		return oldreq(target)
	end

	local UIS = game:GetService("UserInputService")
	function dragify(Frame)
	    dragToggle = nil
	    local dragSpeed = 0.50
	    dragInput = nil
	    dragStart = nil
	    local dragPos = nil
	    function updateInput(input)
	        local Delta = input.Position - dragStart
	        local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
	        game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.30), {Position = Position}):Play()
	    end
	    Frame.InputBegan:Connect(function(input)
	        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
	            dragToggle = true
	            dragStart = input.Position
	            startPos = Frame.Position
	            input.Changed:Connect(function()
	                if input.UserInputState == Enum.UserInputState.End then
	                    dragToggle = false
	                end
	            end)
	        end
	    end)
	    Frame.InputChanged:Connect(function(input)
	        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
	            dragInput = input
	        end
	    end)
	    game:GetService("UserInputService").InputChanged:Connect(function(input)
	        if input == dragInput and dragToggle then
	            updateInput(input)
	        end
	    end)
	end
	
	dragify(script.Parent)
end)

-- // GAMES //--

--[Berry Avenue]--

if game.placeId == 8481844229 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hey loser tag"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rainbow avatar"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "skydive"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "wear accessory {id}"
newcmd.Visible = true

end

--[Escape Crazy Grimace Shake Obby]--

if game.placeId == 13550863794 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "announce {text}"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "grapple hook"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "green gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "random tool"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "set stage {number}"
newcmd.Visible = true

end

--[Escape Evil Bae Obby]--

if game.placeId == 8528477351 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "boombox"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "boxing glove launcher"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "morph crush"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "flamethrower"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "freezeray"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "grapple hook"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "gravity coil"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "jetpack"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "key esp"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "key"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "knife"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "laser gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "magic carpet"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "minigun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "saber"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "shrink ray"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "skip stage"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "speed coil"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "teleport gun"
newcmd.Visible = true

end

--[Happy Land]--

if game.placeId == 6717367660 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "get money"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rainbow avatar"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "role changer"
newcmd.Visible = true

end

--[Happy Land]--

if game.placeId == 6717367660 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "get money"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rainbow avatar"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "role changer"
newcmd.Visible = true

end

--[Hospital Life]--

if game.placeId == 6717367660 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "morph squid game contestant"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "morph squid game master"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "morph squid game worker"
newcmd.Visible = true

end

--[Magic Fighting Tycoon]--

if game.placeId == 9858430725 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "gravity coil"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "lava water powers"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "magic carpet"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "overseer"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "sharks"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "speed coil"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "swords"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "zombie infection"
newcmd.Visible = true

end

--[Paradise Roleplay]--

if game.placeId == 5407245333 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "morph adult"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "morph kid"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "morph teen"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hacker tag"
newcmd.Visible = true

end

--[South Roleplay]--

if game.placeId == 6452092557 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hacker tag"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "music {id}"
newcmd.Visible = true

end

--[Barry's Prison Run]--

if game.placeId == 8712817601 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "cop clothes"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "easy badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "energy drink"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "give vip tools"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "god blaster"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "god mode"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "grapple gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hard badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hidden gem badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "jetpack"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "jump drink"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "lava mode badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "set stage {number}"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "taser"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "telekenesis"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "winners badge"
newcmd.Visible = true

end

--[Escape Mr Funny's Toyshop]--

if game.placeId == 7839281987 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "bomberang"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "boss badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "butterfly"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "clone"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "color gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dinosaur"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "disco bomb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "double jump"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dragon"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "duck"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire path"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire sword"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "giant"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "headphones"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hoverboard"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "icethrower"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "jeep"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "lightning blade"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet cat"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet dog"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "police gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "punch glove"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rainbow cloud"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "raining ducks"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rocket launcher"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "secret badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "set stage {number}"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "speed boots"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "spiderweb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "splat"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "super cap"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "torch"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "tornado"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "unicorn"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "winners badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "zombie"
newcmd.Visible = true

end

--[Escape Ms Ani-tron's Detention]--

if game.placeId == 7167638464 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "bomberang"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "butterfly"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "clone"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "color gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dinosaur"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "disco bomb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "double jump"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dragon"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "duck"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire path"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire sword"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "giant"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "headphones"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hoverboard"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "icethrower"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "jeep"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "lightning blade"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet cat"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet dog"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "police gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "punch glove"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rainbow cloud"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "raining ducks"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rocket launcher"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "secret badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "set stage {number}"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "speed boots"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "spiderweb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "super cap"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "tornado"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "winners badge"
newcmd.Visible = true

end

--[Escape Papa Pizza's Pizzeria]--

if game.placeId == 6939111033 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "bomberang"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "butterfly"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "clone"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "color gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dinosaur"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "disco bomb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "double jump"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dragon"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "duck"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire path"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire sword"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "giant"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "headphones"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hoverboard"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "icethrower"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "jeep"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "lightning blade"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet cat"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet dog"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "police gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "punch glove"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rainbow cloud"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "raining ducks"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rocket launcher"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "set stage {number}"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "speed boots"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "spiderweb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "super cap"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "tornado"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "unicorn"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "zombie"
newcmd.Visible = true

end

--[Escape School Obby]--

if game.placeId == 7027306580 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "clone"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "color gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dinosaur"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "double jump"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dragon"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire path"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "giant"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "headphones"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hoverboard"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "icethrower"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "lightning blade"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet cat"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet dog"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rocket launcher"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "set stage {number}"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "speed boots"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "tornado"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "unicorn"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "zombie"
newcmd.Visible = true

end

--[Escape The Alien Base]--

if game.placeId == 8988284244 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "bomberang"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "butterfly"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "clone"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "color gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dinosaur"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "disco bomb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "double jump"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dragon"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "duck"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire path"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire sword"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "giant"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "headphones"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hoverboard"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "icethrower"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "jeep"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "lightning blade"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet cat"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet dog"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "police gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "punch glove"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rainbow cloud"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "raining ducks"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rocket launcher"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "speed boots"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "spiderweb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "super cap"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "tornado"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "unicorn"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "win badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "zombie"
newcmd.Visible = true

end

--[Escape The Bowling Alley Obby]--

if game.placeId == 7839281987 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "clone"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "color gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dinosaur"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "double jump"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dragon"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire path"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "giant"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "headphones"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hoverboard"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "icethrower"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "lightning blade"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet cat"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet dog"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "police gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rocket launcher"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "speed boots"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "tornado"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "unicorn"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "zombie"
newcmd.Visible = true

end

--[Escape The Carnival Of Terror Obby]--

if game.placeId == 6153766069 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "bomberang"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "butterfly"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "clone"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "color gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dinosaur"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "disco bomb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "double jump"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dragon"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "duck"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire path"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire sword"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "giant"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "headphones"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hoverboard"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "icethrower"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "jeep"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "lightning blade"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet cat"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet dog"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "police gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "punch glove"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rainbow cloud"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "raining ducks"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rocket launcher"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "speed boots"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "spiderweb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "super cap"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "tornado"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "unicorn"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "zombie"
newcmd.Visible = true

end

--[Escape The Castle Fortress Obby]--

if game.placeId == 195845601 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "bomberang"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "butterfly"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "clone"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "color gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dinosaur"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "disco bomb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "double jump"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dragon"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "duck"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire path"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire sword"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "giant"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "headphones"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hoverboard"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "icethrower"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "jeep"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "lightning blade"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet cat"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet dog"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "police gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "punch glove"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rainbow cloud"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "raining ducks controller"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "raining ducks"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rocket launcher"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "speed boots"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "spiderweb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "super cap"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "tornado"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "unicorn"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "zombie"
newcmd.Visible = true

end

--[Escape The Dentist Obby]--

if game.placeId == 5908747512 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "double jump"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dragon"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet cat"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet dog"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "teleport to end"
newcmd.Visible = true

end

--[Escape The Dungeon Obby]--

if game.placeId == 2028593804 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "bomberang"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "butterfly"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "clone"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "color gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dinosaur"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "disco bomb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "double jump"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dragon"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "duck"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire path"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire sword"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "giant"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "headphones"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hoverboard"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "icethrower"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "jeep"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "lightning blade"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet cat"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet dog"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "police gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "punch glove"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rainbow cloud"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "raining ducks"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rocket launcher"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "speed boots"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "spiderweb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "super cap"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "tornado"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "unicorn"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "zombie"
newcmd.Visible = true

end

--[Escape The Hotel Obby]--

if game.placeId == 2028026021 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "clone"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "color gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dinosaur"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "double jump"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dragon"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire path"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "giant"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "headphones"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hoverboard"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "icethrower"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "lightning blade"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet cat"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet dog"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rocket launcher"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "shopper badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "speed boots"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "tornado"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "unicorn"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "winners badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "zombie"
newcmd.Visible = true

end

--[Escape The Wild West Obby]--

if game.placeId == 195845601 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "bomberang"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "butterfly"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "clone"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "color gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dinosaur"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "disco bomb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "double jump"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dragon"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "duck"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire path"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire sword"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "giant"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "headphones"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hoverboard"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "icethrower"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "jeep"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "lightning blade"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet cat"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet dog"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "police gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "punch glove"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rainbow cloud"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "raining ducks"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rocket launcher"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "set stage {number}"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "speed boots"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "spiderweb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "super cap"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "tornado"
newcmd.Visible = true

end

--[Get To The Top]--

if game.placeId == 6902912928 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "win the game"
newcmd.Visible = true

end

--[Great School Breakout]--

if game.placeId == 9099326192 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "defeated boss badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "give vip tools"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "god blaster"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "grapple gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "jetpack"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "jump boost boots"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "no death badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "platinum badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "secret easy badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "secret hard badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "set stage {number}"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "speed boost boots"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "taser"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "telekenesis"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "teleport to end"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "win easy badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "win hard badge"
newcmd.Visible = true

end

--[Grumpy Gran]--

if game.placeId == 9372570969 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "disco bomb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "double jump"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "duck"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "easy time"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire path"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire sword"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hard time"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "headphones"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hoverboard"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "icethrower"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "jeep"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "lightning blade"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "police gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "punch glove"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rainbow cloud"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "raining ducks"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rocket launcher"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "scooter race champion badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "set stage {number}"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "speed boots"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "spiderweb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "super cap"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "tornado"
newcmd.Visible = true

end

--[Ninja Training Obby]--

if game.placeId == 7045161344 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "blue man"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "bomberang"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "butterfly"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "clone"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "color gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dinosaur"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "disco bomb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "double jump"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dragon"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "duck"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire path"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire sword"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "giant"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "headphones"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hoverboard"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "icethrower"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "jeep"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "lightning blade"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "mario lucky star"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet cat"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet dog"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "police gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "punch glove"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rainbow cloud"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "raining ducks"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rocket launcher"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "speed boots"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "spiderweb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "super cap"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "tornado"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "unicorn"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "zombie"
newcmd.Visible = true

end

--[Rob A Jewellery Store]--

if game.placeId == 11087359821 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "bomberang"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "butterfly"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "bux badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "clone"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "color gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dinosaur"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "disco bomb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "double jump"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dragon"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "duck"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire path"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire sword"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "giant"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "headphones"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hoverboard"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "icethrower"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "jeep"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "lightning blade"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet cat"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet dog"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "police gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "punch glove"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rainbow cloud"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "raining ducks"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rocket launcher"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "scooter race champion badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "speed boots"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "spiderweb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "super cap"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "tornado"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "winner badge"
newcmd.Visible = true

end

--[Rob Mr Rich's Mansion]--

if game.placeId == 6846406540 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "bomberang"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "clone"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "color gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dinosaur"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "disco bomb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "double jump"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dragon"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "duck"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire path"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "ghost badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "giant"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "headphones"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hoverboard"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "icethrower"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "lightning blade"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "monster badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet cat"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet dog"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "police gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "punch glove"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rainbow cloud"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "raining ducks controller"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "raining ducks"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rocket launcher"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "ship fly badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "shopper badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "speed boots"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "spiderweb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "super cap"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "tornado"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "unicorn"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "winner badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "zombie"
newcmd.Visible = true

end

--[Rob The Casino Obby]--

if game.placeId == 901720264 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "clone"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "double jump"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dragon"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "guards badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet cat"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet dog"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "shopper badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "tokens badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "winners badge"
newcmd.Visible = true

end

--[Siren Cops Prison Obby]--

if game.placeId == 7167649916 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "bomberang"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "butterfly"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "clone"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "color gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dinosaur"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "disco bomb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "double jump"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "dragon"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "duck"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire path"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "fire sword"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "giant"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "headphones"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "hoverboard"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "icethrower"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "jeep"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "lightning blade"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet cat"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pet dog"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "police gun"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "pumpking badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "punch glove"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rainbow cloud"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "raining ducks"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "rocket launcher"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "secret badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "set stage {number}"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "speed boots"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "spiderweb"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "super cap"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "tornado"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "unicorn"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "winners badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "zombie"
newcmd.Visible = true

end

--[Super Fun Obby 200 Stages]--

if game.placeId == 7737198267 then

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "set stage {number}"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "teleport to end"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "time badge"
newcmd.Visible = true

local newcmd = cmdname:Clone()
newcmd.Parent = cmdlist
newcmd.Text = "win badge"
newcmd.Visible = true

end
