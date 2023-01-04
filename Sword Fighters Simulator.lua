--// Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jonatanortiz2/Jon-s-Ui-Library/main/Source.lua"))();
local Window = Library:CreateWindow("Love You <3", true);
local MainTab = Window:CreateTab("Main", true, "rbxassetid://4483362458", Vector2.new(0, 0), Vector2.new(0, 0));
local EquipTab = Window:CreateTab("Equip", false, "rbxassetid://4483362458", Vector2.new(0, 0), Vector2.new(0, 0));
local TeleportTab = Window:CreateTab("Teleports", false, "rbxassetid://4483362458", Vector2.new(0, 0), Vector2.new(0, 0));
local EggsTab = Window:CreateTab("Eggs", false, "rbxassetid://4483362458", Vector2.new(0, 0), Vector2.new(0, 0));
local SellTab = Window:CreateTab("Sell/Delete", false, "rbxassetid://4483362458", Vector2.new(0, 0), Vector2.new(0, 0));
local MiscTab = Window:CreateTab("Misc", false, "rbxassetid://4483362458", Vector2.new(0, 0), Vector2.new(0, 0));
local SettingsTab = Window:CreateTab("Settings", false, "rbxassetid://4483362458", Vector2.new(0, 0), Vector2.new(0, 0));
local Main = MainTab:CreateSection("Main");
local Equip = EquipTab:CreateSection("Equip");
local Teleport = TeleportTab:CreateSection("Teleports");
local Eggs = EggsTab:CreateSection("Eggs");
local Sell = SellTab:CreateSection("Sell/Delete");
local Misc = MiscTab:CreateSection("Misc");
local Settings = SettingsTab:CreateSection("Settings");

--// Variables
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local Character = LocalPlayer.Character;
local HumanoidRootPart = Character.HumanoidRootPart;
local PlayerGui = LocalPlayer.PlayerGui;
local MarketplaceService = game:GetService("MarketplaceService");
local Workspace = game:GetService("Workspace");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local RunService = game:GetService("RunService");
local ClickRemotes = ReplicatedStorage.Packages.Knit.Services.ClickService.RF;
local AscendRemotes = ReplicatedStorage.Packages.Knit.Services.AscendService.RF;
local PetRemotes = ReplicatedStorage.Packages.Knit.Services.PetInvService.RF;
local SwordRemotes = ReplicatedStorage.Packages.Knit.Services.WeaponInvService.RF;
local EggRemotes = ReplicatedStorage.Packages.Knit.Services.EggService.RF;
local Npcs = Workspace.Live.NPCs.Client;
local Pickups = Workspace.Live.Pickups;
local AscendProgress = PlayerGui.Ascend.Background.ImageFrame.Window.Progress.Progress;
local Ascend_Needed = AscendProgress.BG;
local Ascend_Current = AscendProgress.Container.Bar;
local StopButton = PlayerGui.EggEffect.Background.Stop;
local WeaponInv = PlayerGui.WeaponInv.Background.ImageFrame.Window.WeaponHolder.WeaponScrolling;
local PetInv = PlayerGui.PetInv.Background.ImageFrame.Window.PetHolder.PetScrolling;
local Egg_Table = {
    ["Weak Egg"] = "Egg 1",
    ["Strong Egg"] = "Egg 2",
    ["Paradise Egg"] = "Egg 3",
    ["Bamboo Egg"] = "Egg 5",
    ["Frozen Egg"] = "Egg 7",
    ["Soft Egg"] = "Egg 9",
    ["Lava Egg"] = "Egg 11",
    ["Mummified Egg"] = "Egg 13",
    ["Lost Egg"] = "Egg 15",
    ["Ore Egg"] = "Egg 17",
    ["Leaf Egg"] = "Egg 19",
    ["Aquatic Egg"] = "Egg 21",
}
local Game_Areas = {
    ["Spawn"] = CFrame.new(326, 150, -0),
    ["Skull Cove"] = CFrame.new(2234, 149, -573),
    ["Demon Hill"] = CFrame.new(3948, 150, -384),
    ["Polar Tundra"] = CFrame.new(5965, 150, -538),
    ["Aether City"] = CFrame.new(8952, 609, -515),
    ["Underworld"] = CFrame.new(13588, 154, 86),
    ["Ancient Sands"] = CFrame.new(533, 150, -2874),
    ["Enchanted Woods"] = CFrame.new(4034, 148, -4356),
    ["Mystic Mines"] = CFrame.new(7191, -113, -4646),
    ["Sacred Land"] = CFrame.new(9397, 150, -4349),
    ["Marine Castle"] = CFrame.new(13202, 167, -3421),
}

--// Functions
local Closest_NPC = function()
    local Closest = nil;
    local Distance = 9e9;
    
    for i, v in next, Npcs:GetChildren() do
        if v:IsA("Model") then
            local Magnitude = (HumanoidRootPart.Position - v:FindFirstChild("HumanoidRootPart").Position).Magnitude;

            if Magnitude < Distance then
                Closest = v;
                Distance = Magnitude;
            end
        end
    end

    return Closest;
end

local Has_Triple_Hatch = function(UserId, GamepassId)
    local Check, Owns = pcall(MarketplaceService.UserOwnsGamePassAsync, MarketplaceService, UserId, GamepassId);
    if not Check then
        Owns = false;
    end
    return Owns;
end

--// Toggles
getgenv().Efficiency = false;
getgenv().AutoPower = false;
getgenv().AutoKillNPC = false;
getgenv().AutoBestBoth = false;
getgenv().AutoBestPet = false;
getgenv().AutoBestSword = false;
getgenv().AreaToTpTo = "";
getgenv().AutoHatch = false;
getgenv().SelectedEgg = "";
getgenv().AutoDeleteSword = false;
getgenv().AutoDeletePet = false;
getgenv().AutoCoins = false;
getgenv().AutoAscend = false;
getgenv().RandomConfigNumber = math.random(1e5, 9e5);
getgenv().CreatedConfigName = "";
getgenv().NewConfigName = "Config-" .. getgenv().RandomConfigNumber;

--// The Ui Lib Stuff Ye
local Efficiency = Main:CreateToggle("Autofarm Efficiency Mode", getgenv().Efficiency, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
    getgenv().Efficiency = Value;
end)

local Power = Main:CreateToggle("Auto Power", getgenv().AutoPower, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
    getgenv().AutoPower = Value;
end)

local Kill = Main:CreateToggle("Auto Kill Closest NPC's", getgenv().AutoKillNPC, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
    getgenv().AutoKillNPC = Value;
end)

local BestBoth = Equip:CreateToggle("Auto Equip Best (Sword + Pet)", getgenv().AutoBestBoth, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
    getgenv().AutoBestBoth = Value;
end)

local BestPet = Equip:CreateToggle("Auto Equip Best (Pet)", getgenv().AutoBestPet, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
    getgenv().AutoBestPet = Value;
end)

local BestSword = Equip:CreateToggle("Auto Equip Best (Sword)", getgenv().AutoBestSword, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
    getgenv().AutoBestSword = Value;
end)

local AreaTeleports = Teleport:CreateDropdown("Selected Area To Teleport To", {"Spawn", "Skull Cove", "Demon Hill", "Polar Tundra", "Aether City", "Underworld", "Ancient Sands", "Enchanted Woods", "Mystic Mines", "Sacred Land", "Marine Castle"}, nil, 0.25, function(Value)
    getgenv().AreaToTpTo = Game_Areas[Value];
end)

Teleport:CreateButton("Teleport", function()
    LocalPlayer.Character.HumanoidRootPart.CFrame = getgenv().AreaToTpTo;
end)

local Egg_Hatcher = Eggs:CreateToggle("Auto Hatch Selected Egg", getgenv().AutoHatch, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
    getgenv().AutoHatch = Value;
end)

local Egg_Selector = Eggs:CreateDropdown("Select Egg", {"Weak Egg - $500", "Strong Egg - $50K", "Paradise Egg - $3.75M", "Bamboo Egg - $6.75B", "Frozen Egg - $20.25Qa", "Soft Egg - $52.49Qi", "Lava Egg - $240Sx", "Mummified Egg - $780Sp", "Lost Egg - $2.24No", "Ore Egg - $3Dc", "Leaf Egg - $11.24Ud", "Aquatic Egg - $40.5Dd"}, nil, 0.25, function(Value)
    getgenv().SelectedEgg = Egg_Table[string.match(Value, "(%D+)%s%-%s")];
end)

local SwordDelete = Sell:CreateToggle("Auto Sell/Delete Unequiped Swords", getgenv().AutoDeleteSword, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
    getgenv().AutoDeleteSword = Value;
end)

local PetDelete = Sell:CreateToggle("Auto Sell/Delete Unequiped Pets", getgenv().AutoDeletePet, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
    getgenv().AutoDeletePet = Value;
end)

local Coins = Misc:CreateToggle("Auto Coin Pickup", getgenv().AutoCoins, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
    getgenv().AutoCoins = Value;
end)

local Ascend = Misc:CreateToggle("Auto Ascend", getgenv().AutoAscend, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
    getgenv().AutoAscend = Value;
end)

local Configs = Settings:CreateDropdown("Created Configs", Library:GetConfigs(), nil, 0.25, function(Value)
    getgenv().CreatedConfigName = Value;
end)

Settings:CreateTextbox("Config Name", "Config-" .. getgenv().RandomConfigNumber, function(Value)
    getgenv().NewConfigName = Value;
end)

Settings:CreateButton("Save Config", function()
    Library:SaveConfig(getgenv().NewConfigName);
    Configs:UpdateDropdown(Library:GetConfigs());
end)

Settings:CreateButton("Delete Selected Config", function()
    Library:DeleteConfig(getgenv().CreatedConfigName);
    task.wait(2);
    Configs:UpdateDropdown(Library:GetConfigs());
end)

Settings:CreateButton("Load Selected Config", function()
    Library:LoadConfig(getgenv().CreatedConfigName);
end)

--// The Main Stuff Ye
task.spawn(function()
    local Connection;
    local Force;
    local function GetMass(Model)
        for i,v in next, Model:GetDescendants() do
            if v:IsA("BasePart") then
                return tonumber(v:GetMass());
            end
        end
    end
    local function Float(Character)
        if Connection then
            Connection:Disconnect();
            Connection = nil;
        end
        if not Force then
            Force = Instance.new("BodyForce");
        end
        local Root = Character:WaitForChild("HumanoidRootPart");
        Force.Parent = Root;
        Connection = game:GetService("RunService").Stepped:Connect(function()
            if getgenv().AutoKillNPC == true then
                Root.Velocity = Vector3.new(Root.Velocity.X, 0, Root.Velocity.Z);
                Force.Force = Vector3.new(0, GetMass(Character) * workspace.Gravity, 0);
            else
                Force.Force = Vector3.zero;
            end
        end)
    end
    if Character then Float(Character) end
    LocalPlayer.CharacterAdded:Connect(Float);
end)

RunService.Stepped:Connect(function()
    local LocalPlayer = game:GetService("Players").LocalPlayer;
    local HumanoidRootPart = LocalPlayer.Character.HumanoidRootPart;
    --// Auto Power
    if getgenv().AutoPower == true then
        ClickRemotes.Click:InvokeServer();
    end
    --// Auto Kill NPC's
    if getgenv().AutoKillNPC == true then
        if Closest_NPC() ~= nil then
            HumanoidRootPart.CFrame = Closest_NPC().HumanoidRootPart.CFrame * CFrame.new(0, 10, 0);
            ClickRemotes.Click:InvokeServer(Closest_NPC().Name);
        end
    end
    --// Auto Equip Best Pet + Sword
    if getgenv().AutoBestBoth == true then
        PetRemotes.EquipBest:InvokeServer();
        SwordRemotes.EquipBest:InvokeServer();
    end
    --// Auto Equip Best Pet
    if getgenv().AutoBestPet == true then
        PetRemotes.EquipBest:InvokeServer();
    end
    --// Auto Equip Best Sword
    if getgenv().AutoBestSword == true then
        SwordRemotes.EquipBest:InvokeServer();
    end
    --// Auto Hatch Egg
    if getgenv().AutoHatch == true then
        if Has_Triple_Hatch(LocalPlayer.UserId, 93513159) == true then
            EggRemotes.BuyEgg:InvokeServer({["eggName"] = getgenv().SelectedEgg, ["auto"] = false, ["amount"] = 3});
        else
            EggRemotes.BuyEgg:InvokeServer({["eggName"] = getgenv().SelectedEgg, ["auto"] = false, ["amount"] = 1});
        end
    end
    --// Auto Delete Sword + Pet
    if getgenv().AutoDeleteSword == true then
        local SwordFound = false;
        local Swords = {};

        for i, v in next, WeaponInv:GetDescendants() do
            if v:IsA("Frame") and v.Name == "Equipped" then
                if v.Visible == false then
                    if v then
                        SwordFound = true;
                        Swords[tostring(v.Parent.Parent.Name)] = true;
                    end
                end
            end
        end
        if SwordFound == true then
            SwordRemotes.MultiSell:InvokeServer(Swords);
            SwordFound = false;
        end
    end
    if getgenv().AutoDeletePet == true then
        local PetFound = false;
        local Pets = {};

        for i, v in next, PetInv:GetDescendants() do
            if v:IsA("Frame") and v.Name == "Equipped" then
                if v.Visible == false then
                    if v then
                        PetFound = true;
                        Pets[tostring(v.Parent.Parent.Name)] = true;
                    end
                end
            end
        end
        if PetFound == true then
            PetRemotes.MultiDelete:InvokeServer(Pets);
            PetFound = false;
        end
    end
    --// Auto Coin Pickup
    if getgenv().AutoCoins == true then
        if not Pickups:GetChildren()[1] then
            repeat
                task.wait();
            until
                Pickups:GetChildren()[1];
        end
        Pickups:GetChildren()[1].Position = HumanoidRootPart.Position;
    end
    --// Auto Ascend
    if getgenv().AutoAscend == true then
        if Ascend_Needed.AbsoluteSize == Ascend_Current.AbsoluteSize then
            AscendRemotes.Ascend:InvokeServer();
        end
    end
end)

while task.wait(.05) do
    --// Set Power + NPC Kill + Efficiency
    if (getgenv().Efficiency == true and Closest_NPC() ~= nil) then
        getgenv().AutoPower = false;
        getgenv().AutoKillNPC = true
        Kill:Set(getgenv().AutoKillNPC);
        Power:Set(getgenv().AutoPower);
    end
    if (getgenv().Efficiency == true and Closest_NPC() == nil) then
        getgenv().AutoPower = true;
        getgenv().AutoKillNPC = false
        Kill:Set(getgenv().AutoKillNPC);
        Power:Set(getgenv().AutoPower);
    end
    if getgenv().Efficiency == false then
        if (getgenv().AutoKillNPC == true and getgenv().AutoPower == true) then
            getgenv().AutoPower = false;
            Power:Set(getgenv().AutoPower);
        end
    end
    --// Set Equips
    if (getgenv().AutoBestPet == true and getgenv().AutoBestSword == true) then
        getgenv().AutoBestPet = false;
        getgenv().AutoBestSword = false;
        getgenv().AutoBestBoth = true;
        BestPet:Set(getgenv().AutoBestPet);
        BestSword:Set(getgenv().AutoBestSword);
        BestBoth:Set(getgenv().AutoBestBoth);
    end
    if (getgenv().AutoBestPet == true and getgenv().AutoBestBoth == true) or (getgenv().AutoBestSword == true and getgenv().AutoBestBoth == true) then
        getgenv().AutoBestPet = false;
        getgenv().AutoBestSword = false;
        getgenv().AutoBestBoth = true;
        BestPet:Set(getgenv().AutoBestPet);
        BestSword:Set(getgenv().AutoBestSword);
        BestBoth:Set(getgenv().AutoBestBoth);
    end
end
