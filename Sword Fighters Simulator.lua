if game.PlaceId == 11040063484 then
    --// Library
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jonatanortiz2/home/main/Roblox-Projects/Jons-Ui-Library/Source.lua"))();
    local Window = Library:CreateWindow("K", true);
    local AutofarmingTab = Window:CreateTab("Autofarming", true, "rbxassetid://4483362458", Vector2.new(0, 0), Vector2.new(0, 0));
    -- local DungeonTab = Window:CreateTab("Dungeon", false, "rbxassetid://4483362458", Vector2.new(0, 0), Vector2.new(0, 0));
    local EquipTab = Window:CreateTab("Equip", false, "rbxassetid://4483362458", Vector2.new(0, 0), Vector2.new(0, 0));
    local EggsTab = Window:CreateTab("Eggs", false, "rbxassetid://4483362458", Vector2.new(0, 0), Vector2.new(0, 0));
    local ShopTab = Window:CreateTab("Shops", false, "rbxassetid://4483362458", Vector2.new(0, 0), Vector2.new(0, 0));
    local SellTab = Window:CreateTab("Sell|Delete|Forge", false, "rbxassetid://4483362458", Vector2.new(0, 0), Vector2.new(0, 0));
    local PlayerTab = Window:CreateTab("Player", false, "rbxassetid://4483362458", Vector2.new(0, 0), Vector2.new(0, 0));
    local QuestsTab = Window:CreateTab("Quests", false, "rbxassetid://4483362458", Vector2.new(0, 0), Vector2.new(0, 0));
    local TeleportTab = Window:CreateTab("Teleports", false, "rbxassetid://4483362458", Vector2.new(0, 0), Vector2.new(0, 0));
    local MiscTab = Window:CreateTab("Misc", false, "rbxassetid://4483362458", Vector2.new(0, 0), Vector2.new(0, 0));
    local SettingsTab = Window:CreateTab("Settings", false, "rbxassetid://4483362458", Vector2.new(0, 0), Vector2.new(0, 0));
    local UIToggleTab = Window:CreateTab("UI Toggle", false, "rbxassetid://4483362458", Vector2.new(0, 0), Vector2.new(0, 0));
    local Autofarming = AutofarmingTab:CreateSection("Autofarming");
    -- local Dungeon = DungeonTab:CreateSection("Dungeon");
    local Equip = EquipTab:CreateSection("Equip");
    local Eggs = EggsTab:CreateSection("Eggs");
    local Shop = ShopTab:CreateSection("Dungeon Shop");
    local Sell = SellTab:CreateSection("Sell|Delete|Forge");
    local Player = PlayerTab:CreateSection("Player");
    local Quests = QuestsTab:CreateSection("Quests");
    local Teleport = TeleportTab:CreateSection("Teleports");
    local Misc = MiscTab:CreateSection("Misc");
    local Settings = SettingsTab:CreateSection("Settings");
    local UIToggle = UIToggleTab:CreateSection("UI Toggle");
    
    --// Variables
    local Players = game:GetService("Players");
    local LocalPlayer = Players.LocalPlayer;
    local Character = LocalPlayer.Character;
    local HumanoidRootPart = Character.HumanoidRootPart;
    local PlayerGui = LocalPlayer.PlayerGui;
    local Workspace = game:GetService("Workspace");
    local ReplicatedStorage = game:GetService("ReplicatedStorage");
    local RunService = game:GetService("RunService");
    local UserInputService = game:GetService("UserInputService");
    local ClickRemotes = ReplicatedStorage.Packages.Knit.Services.ClickService.RF;
    local AscendRemotes = ReplicatedStorage.Packages.Knit.Services.AscendService.RF;
    local PetRemotes = ReplicatedStorage.Packages.Knit.Services.PetInvService.RF;
    local SwordRemotes = ReplicatedStorage.Packages.Knit.Services.WeaponInvService.RF;
    local EggRemotes = ReplicatedStorage.Packages.Knit.Services.EggService.RF;
    local QuestRemotes = ReplicatedStorage.Packages.Knit.Services.QuestService.RF;
    local ForgeRemotes = ReplicatedStorage.Packages.Knit.Services.ForgeService.RF;
    local DismantleRemotes = ReplicatedStorage.Packages.Knit.Services.PetLevelingService.RF;
    local DungeonShopRemotes = ReplicatedStorage.Packages.Knit.Services.LimitedShopsService.RF;
    local Npcs = Workspace.Live.NPCs.Client;
    local Pickups = Workspace.Live.Pickups;
    local AscendProgress = PlayerGui.Ascend.Background.ImageFrame.Window.Progress.Progress;
    local Ascend_Needed = AscendProgress.BG;
    local Ascend_Current = AscendProgress.Container.Bar;
    local StopButton = PlayerGui.EggEffect.Background.Stop;
    local WeaponInv = PlayerGui.WeaponInv.Background.ImageFrame.Window.WeaponHolder.WeaponScrolling;
    local PetInv = PlayerGui.PetInv.Background.ImageFrame.Window.PetHolder.PetScrolling;
    local FloatingEggs = Workspace.Live.FloatingEggs;
    -- local Lobby = Workspace.Resources.Gamemodes.DungeonLobby;
    local ChatFrame = PlayerGui.Chat.Frame.ChatChannelParentFrame;
    local Chat = ChatFrame["Frame_MessageLogDisplay"].Scroller;
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
        ["Holy Egg"] = "Egg 23",
        ["Volcano Egg"] = "Egg 25",
        ["Canyon Egg"] = "Egg 26",
    
    }
    local Game_Areas = {
        ["Dark Forest"] = CFrame.new(326, 150, -0),
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
        ["High Havens"] = CFrame.new(16389, 308, -3530),
        ["Cracked Canyons"] = CFrame.new(20501, 194, -3591),
    }
    local Game_Npcs = {
        "Dark Commander",
        "Adurite Warden",
        "King Pharaoh",
        "Orc",
        "Skeleton",
        "Necromancer",
        "Blood Zombie",
        "Skye Knight",
        "Blood Knight",
        "Mummy",
        "Monk",
        "Imp",
        "Pirate Thief",
        "Purple Dragon",
        "Ninja",
        "Santa Claus",
        "Ice King",
        "Penguin",
        "Pirate Admiral",
        "Warlock",
        "Guardian",
        "Desert Beast",
        "Spirit Lord",
        "Red Devil",
        "Marine",
        "Mutant Insect",
        "Paladin",
        "Samurai Master",
        "The Grinch",
        "Angel",
        "Blood Vampire",
        "Oni",
        "Cyclops",
        "Snow Warrior",
        "Zombie Miner",
        "Demon",
        "Yeti",
        "Pirate Captain",
        "Power Force",
        "Samurai",
        "Royal Warrior",
        "Lost Soul",
        "Lava Golem",
        "Green Insect",
        "Mushy",
        "Brown Insect",
        "Malevolent Spirit",
        "Dark Knight",
        "Satyr",
        "Master Wizard",
        "Golem",
        "Zeus the God",
        "Lost Titan",
        "Elf",
        "Barbarian Pirate",
        "Treasure Chest",
        "Madman",
        "Goblin",
        "Feathered Warrior",
        "Cthulhu",
        "Centaur King",
        "Celestial Gatekeeper",
        "Skywatcher",
        "Stormbringer",
        "Vulcanus Maximus",
        "Lich Spirit",
        "Fallen Star",
        "Demonic Altar",
        "Dune Critter",
        "Reptilian Beast",
        "Sandstone Golem",
        "Scorpion Queen",
        "Haunted Witch",
        "Haunted Reaper",
        "Nightstalker",
        "Forsaken Hunter",
    }
    local DungeonShopItems = {
        ["2x Coin Boost"] = 1,
        ["Super Luck Boost"] = 2,
        ["2x Power Boost"] = 3,
        ["Raid Tickets"] = 4,
        ["2x Secret Luck Boost"] = 5,
    }
    
    --// Functions
    local hasProperty = function(a, b)
        local c = a[b];
    end
    
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
    
    local Get_Specific_Closest = function()
        local Closest = nil;
        local Distance = 9e9;
        
        for a, b in next, Npcs:GetChildren() do
            if b:IsA("Model") then
                local Npc_Name = b:WaitForChild("HumanoidRootPart"):WaitForChild("NPCTag"):WaitForChild("NameLabel");
                for c, d in next, Game_Npcs do
                    if string.match(d, Npc_Name.Text) == getgenv().NpcToFarm then
                        local Magnitude = (HumanoidRootPart.Position - b.HumanoidRootPart.Position).Magnitude;
                        if Magnitude < Distance then
                            Closest = b;
                            Distance = Magnitude;
                        end
                    end
                end
            end
        end
        return Closest;
    end
    
    --// Toggles
    getgenv().Efficiency = false;
    getgenv().AutoPower = false;
    getgenv().AutoKillNPC = false;
    getgenv().SpecificNPCEfficiency = false;
    getgenv().AutoKillSpecificNPC = false;
    getgenv().NpcToFarm = "";
    --[[
    getgenv().EasyDungeon = false;
    getgenv().HardDungeon = false;
    getgenv().BeforeDungeon = LocalPlayer.Character.HumanoidRootPart.CFrame;
    ]]--
    getgenv().AutoBestBoth = false;
    getgenv().AutoBestPet = false;
    getgenv().AutoBestSword = false;
    getgenv().AreaToTpTo = "";
    getgenv().AutoHatch = false;
    getgenv().SelectedEgg = "";
    getgenv().SelectedEgg2 = "";
    getgenv().HatchAmount = nil
    getgenv().PetDismantle = false;
    getgenv().AutoDeleteSword = false;
    getgenv().SwordForge = false;
    getgenv().AutoDeletePet = false;
    getgenv().WalkSpeed = nil;
    getgenv().InfiniteJump = false;
    getgenv().AutoCoins = false;
    getgenv().AutoAscend = false;
    getgenv().RandomConfigNumber = math.random(1e5, 9e5);
    getgenv().CreatedConfigName = "";
    getgenv().NewConfigName = "Config-" .. getgenv().RandomConfigNumber;
    getgenv().Area1 = false;
    getgenv().Area2 = false;
    getgenv().Area3 = false;
    getgenv().Area4 = false;
    getgenv().Area5 = false;
    getgenv().Area6 = false;
    getgenv().Area7 = false;
    getgenv().Area8 = false;
    getgenv().Area9 = false;
    getgenv().Area10 = false;
    getgenv().Area11 = false;
    getgenv().Area12 = false;
    getgenv().Area13 = false;
    getgenv().KeyQuest = false;
    getgenv().SwordMaster = false;
    getgenv().Executioner = false;
    getgenv().SoulTeacher = false;
    getgenv().EggMaster = false;
    getgenv().CoinBoost = false;
    getgenv().SuperLuckBoost = false;
    getgenv().PowerBoost = false;
    getgenv().RaidTickets = false;
    getgenv().SecretLuck = false;
    
    --// The Ui Lib Stuff Ye
    local Efficiency = Autofarming:CreateToggle("Autofarm Efficiency Mode (All NPC's)", getgenv().Efficiency, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().Efficiency = Value;
    end)
    
    local Power = Autofarming:CreateToggle("Auto Power", getgenv().AutoPower, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().AutoPower = Value;
    end)
    
    local Kill = Autofarming:CreateToggle("Auto Kill Closest NPC's", getgenv().AutoKillNPC, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().AutoKillNPC = Value;
    end)
    
    local Label = Autofarming:CreateLabel("Specific NPC's")
    
    local SpecificEfficiency = Autofarming:CreateToggle("Autofarm Efficiency Mode (Specific NPC's)", getgenv().SpecificNPCEfficiency, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().SpecificNPCEfficiency = Value;
    end)
    
    local SelectSpecific = Autofarming:CreateDropdown("Chose NPC Tp Auto Kill", Game_Npcs, nil, true, 0.25, function(Value)
        getgenv().NpcToFarm = Value;
    end)
    
    local KillSpecific = Autofarming:CreateToggle("Auto Kill Chosen NPC", getgenv().AutoKillSpecificNPC, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().AutoKillSpecificNPC = Value;
    end)
    --[[
    local EasyDungeon = Dungeon:CreateToggle("Auto Easy Dungeon", getgenv().EasyDungeon, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().EasyDungeon = Value;
    end)
    
    local HardDungeon = Dungeon:CreateToggle("Auto Hard Dungeon", getgenv().HardDungeon, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().HardDungeon = Value;
    end)
    ]]--
    local BestBoth = Equip:CreateToggle("Auto Equip Best (Sword + Pet)", getgenv().AutoBestBoth, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().AutoBestBoth = Value;
    end)
    
    local BestPet = Equip:CreateToggle("Auto Equip Best (Pet)", getgenv().AutoBestPet, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().AutoBestPet = Value;
    end)
    
    local BestSword = Equip:CreateToggle("Auto Equip Best (Sword)", getgenv().AutoBestSword, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().AutoBestSword = Value;
    end)
    
    Teleport:CreateButton("Teleport", function()
        local Foot = LocalPlayer.Character["RightFoot"];
        local Hrp = LocalPlayer.Character["HumanoidRootPart"];
    
        local dConnection = false;
    
        task.spawn(function()
            task.wait(1);
            getgenv().Connection = Foot.Touched:Connect(function()
                dConnection = true;
            end)
        end)
    
        repeat task.wait(); Hrp.CFrame = getgenv().AreaToTpTo until dConnection == true;
        getgenv().Connection:Disconnect();
    end)
    
    local Egg_Hatcher = Eggs:CreateToggle("Auto Hatch Selected Egg", getgenv().AutoHatch, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().AutoHatch = Value;
    end)
    
    local Egg_Selector = Eggs:CreateDropdown("Select Egg", {"Weak Egg - $500", "Strong Egg - $50K", "Paradise Egg - $3.75M", "Bamboo Egg - $6.75B", "Frozen Egg - $20.25Qa", "Soft Egg - $52.49Qi", "Lava Egg - $240Sx", "Mummified Egg - $780Sp", "Lost Egg - $2.24No", "Ore Egg - $3Dc", "Leaf Egg - $11.24Ud", "Aquatic Egg - $40.5Dd", "Holy Egg - $168Td", "Volcano Egg - $10Qad", "Canyon Egg - $Qad"}, nil, true, 0.25, function(Value)
        getgenv().SelectedEgg = string.match(Value, "(%D+)%s%-%s");
        getgenv().SelectedEgg2 = Egg_Table[getgenv().SelectedEgg];
    end)
    
    local Amount_Selector = Eggs:CreateDropdown("Select Egg Amount", {1, 2, 3, 4}, 1, true, 0.25, function(Value)
        getgenv().HatchAmount = Value;
    end)
    
    local DungeonShop1 = Shop:CreateToggle("Auto Buy 2x Coin Boost", getgenv().CoinBoost, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().CoinBoost = Value;
    end)
    
    local DungeonShop2 = Shop:CreateToggle("Auto Buy Super Luck Boost", getgenv().SuperLuckBoost, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().SuperLuckBoost = Value;
    end)
    
    local DungeonShop3 = Shop:CreateToggle("Auto Buy 2x Power Boost", getgenv().PowerBoost, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().PowerBoost = Value;
    end)
    
    local DungeonShop4 = Shop:CreateToggle("Auto Buy Raid Tickets", getgenv().RaidTickets, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().RaidTickets = Value;
    end)
    
    local DungeonShop5 = Shop:CreateToggle("Auto Buy 2x Secret Luck Boost", getgenv().SecretLuck, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().SecretLuck = Value;
    end)
    
    local SwordForge = Sell:CreateToggle("Auto Forge Swords", getgenv().SwordForge, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().SwordForge = Value;
    end)
    
    local SwordDelete = Sell:CreateToggle("Auto Sell Unequipped/Unlocked Swords", getgenv().AutoDeleteSword, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().AutoDeleteSword = Value;
    end)
    
    local PetDelete = Sell:CreateToggle("Auto Delete Unequipped/Unlocked Pets", getgenv().AutoDeletePet, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().AutoDeletePet = Value;
    end)
    
    local WalkSpeed = Player:CreateSlider("Walk Speed", 1, 500, Character.Humanoid.WalkSpeed, false, Color3.fromRGB(0, 146, 214), function(Value)
        getgenv().WalkSpeed = Value;
    end)
    
    local InfiniteJump = Player:CreateToggle("Infinite Jump", getgenv().InfiniteJump, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().InfiniteJump = Value;
    end)
    
    local Executioner = Quests:CreateToggle("Auto Executioner Quests", getgenv().Executioner, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().Executioner = Value;
    end)
    
    local SwordMaster = Quests:CreateToggle("Auto Sword Master Quests", getgenv().SwordMaster, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().SwordMaster = Value;
    end)
    
    local EggMaster = Quests:CreateToggle("Auto Egg Master Quests", getgenv().EggMaster, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().EggMaster = Value;
    end)
    
    local SoulTeacher = Quests:CreateToggle("Auto Soul Teacher Quests", getgenv().SoulTeacher, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().SoulTeacher = Value;
    end)
    
    local KeyQuest = Quests:CreateToggle("Auto Key Quest Quests", getgenv().KeyQuest, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().KeyQuest = Value;
    end)
    
    local Area_1 = Quests:CreateToggle("Auto Dark Forest Quests", getgenv().Area1, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().Area1 = Value;
    end)
    
    local Area_2 = Quests:CreateToggle("Auto Skull Cove Quests", getgenv().Area2, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().Area2 = Value;
    end)
    
    local Area_3 = Quests:CreateToggle("Auto Demon Hill Quests", getgenv().Area3, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().Area3 = Value;
    end)
    
    local Area_4 = Quests:CreateToggle("Auto Polar Tundra Quests", getgenv().Area4, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().Area4 = Value;
    end)
    
    local Area_5 = Quests:CreateToggle("Auto Aether City Quests", getgenv().Area5, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().Area5 = Value;
    end)
    
    local Area_6 = Quests:CreateToggle("Auto Underworld Quests", getgenv().Area6, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().Area6 = Value;
    end)
    
    local Area_7 = Quests:CreateToggle("Auto Ancient Sands Quests", getgenv().Area7, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().Area7 = Value;
    end)
    
    local Area_8 = Quests:CreateToggle("Auto Enchanted Woods Quests", getgenv().Area8, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().Area8 = Value;
    end)
    
    local Area_9 = Quests:CreateToggle("Auto Mystic Mines Quests", getgenv().Area9, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().Area9 = Value;
    end)
    
    local Area_10 = Quests:CreateToggle("Auto Sacred Land Quests", getgenv().Area10, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().Area10 = Value;
    end)
    
    local Area_11 = Quests:CreateToggle("Auto Marine Castle Quests", getgenv().Area11, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().Area11 = Value;
    end)
    
    local Area_12 = Quests:CreateToggle("Auto High Havens Quests", getgenv().Area12, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().Area12 = Value;
    end)
    
    local Area_13 = Quests:CreateToggle("Auto Cracked Canyons Quests", getgenv().Area13, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().Area13 = Value;
    end)
    
    local AreaTeleports = Teleport:CreateDropdown("Selected Area To Teleport To", {"Dark Forest", "Skull Cove", "Demon Hill", "Polar Tundra", "Aether City", "Underworld", "Ancient Sands", "Enchanted Woods", "Mystic Mines", "Sacred Land", "Marine Castle", "High Havens", "Cracked Canyons"}, nil, true, 0.25, function(Value)
        getgenv().AreaToTpTo = Game_Areas[Value];
    end)
    
    local Coins = Misc:CreateToggle("Auto Coin Pickup", getgenv().AutoCoins, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().AutoCoins = Value;
    end)
    
    local Ascend = Misc:CreateToggle("Auto Ascend", getgenv().AutoAscend, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().AutoAscend = Value;
    end)
    
    local PetDismantle = Misc:CreateToggle("Auto Dismantle Unequipped/Unlocked Pets", getgenv().PetDismantle, Color3.fromRGB(138, 43, 226), 0.25, function(Value)
        getgenv().PetDismantle = Value;
    end)
    
    local Configs = Settings:CreateDropdown("Created Configs", Library:GetConfigs(), nil, true, 0.25, function(Value)
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
    
    local LibraryToggle = UIToggle:CreateKeybind("Keybind", "LeftControl", function()
        Library:ToggleUI()
    end)
    
    --// The Main Stuff Ye
    task.spawn(function()
        game:GetService("UserInputService").JumpRequest:connect(function()
            if getgenv().InfiniteJump == true then
                LocalPlayer.Character.Humanoid:ChangeState("Jumping")
            end
        end)
    end)
    --[[
    task.spawn(function()
        local Door_1 = Lobby.Doors["Dungeon 1"];
        local Door_2 = Lobby.Doors["Dungeon 2"];
        
        local Dungeon1 = false;
        local Dungeon2 = false;
        local Dungeon3 = false;
    
        task.spawn(function()
            RunService.Stepped:Connect(function()
                if (getgenv().EasyDungeon == true or getgenv().HardDungeon == true) and Dungeon1 == false then
                    coroutine.wrap(function()
                        Dungeon1 = true;
                        repeat task.wait() until (Door_1.Position.Y < 0 or Door_2.Position.Y < 0)
                        task.wait(5)
                        if Door_1.Position.Y < 0 then
                            if getgenv().EasyDungeon == true then
                                repeat task.wait(); HumanoidRootPart.CFrame = Lobby.JoinParts["Dungeon 1"].CFrame until Door_1.Position.Y > 0
                            end
                        elseif Door_2.Position.Y < 0 then
                            if getgenv().HardDungeon == true then
                                repeat task.wait(); HumanoidRootPart.CFrame = Lobby.JoinParts["Dungeon 2"].CFrame until Door_1.Position.Y > 0
                            end
                        end
                        Dungeon1 = false;
                    end)()
                end
            end)
        end)
        
        task.spawn(function()
            RunService.Stepped:Connect(function()
                if (getgenv().EasyDungeon == true or getgenv().HardDungeon == true) and Dungeon2 == false then
                    local Button = game:GetService("Workspace").Live.Dungeons:FindFirstChild("ContinueButton", true);
                    if Button then
                        coroutine.wrap(function()
                            Dungeon2 = true;
                            task.wait(.2);
                            HumanoidRootPart.CFrame = Button.CFrame * CFrame.new(0, 5.75, 0);
                            task.wait(.2);
                            firesignal(LocalPlayer.PlayerGui.DungeoNContinueButton.Frame.Button.Button.MouseButton1Click);
                            task.wait(.2);
                            Dungeon2 = false;
                        end)()
                    end
                end
            end)
        end)
        
        task.spawn(function()
            RunService.Stepped:Connect(function()
                if (getgenv().EasyDungeon == true or getgenv().HardDungeon == true) and Dungeon3 == false then
                    coroutine.wrap(function()
                        Dungeon3 = true;
                        repeat task.wait() until PlayerGui.DungeonResult.Background.AbsolutePosition == Vector2.new(0, -36)
                        task.wait(5);
                        firesignal(PlayerGui.DungeonResult.Background.Frame.Continue.Button.MouseButton1Click);
                        task.wait(3)
                        local Foot = LocalPlayer.Character["RightFoot"];
                        local Hrp = LocalPlayer.Character["HumanoidRootPart"];
    
                        local dConnection = false;
    
                        task.spawn(function()
                            task.wait(1);
                            getgenv().Connection = Foot.Touched:Connect(function()
                                dConnection = true;
                            end)
                        end)
    
                        repeat task.wait(); Hrp.CFrame = getgenv().BeforeDungeon until dConnection == true;
                        getgenv().Connection:Disconnect();
                        Dungeon3 = false;
                    end)()
                end
            end)
        end)
    
        task.spawn(function()
            Chat.DescendantAdded:Connect(function(Descendant)
                if Descendant.ClassName ~= "TextButton" then
                    local Check = pcall(function() hasProperty(Descendant, "Text") end);
                    if Check then
                        if Descendant.Text == "A dungeon door has opened..." then
                            getgenv().BeforeDungeon = LocalPlayer.Character.HumanoidRootPart.CFrame
                        end
                    end
                end
            end)
        end)
    end)
    ]]--
    
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
                if (getgenv().AutoKillNPC == true or getgenv().AutoKillSpecificNPC == true or getgenv().AutoHatch == true) then
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
    
    local One = false;
    
    task.spawn(function()
        RunService.Heartbeat:Connect(function()
            if One == false then
                coroutine.wrap(function()
                    One = true;
                    --// Auto Quests
                    if getgenv().Executioner == true then
                        QuestRemotes.ActionQuest:InvokeServer("Executioner");
                    end
                    if getgenv().SwordMaster == true then
                        QuestRemotes.ActionQuest:InvokeServer("Sword Master");
                    end
                    if getgenv().EggMaster == true then
                        QuestRemotes.ActionQuest:InvokeServer("Egg Master");
                    end
                    if getgenv().SoulTeacher == true then
                        QuestRemotes.ActionQuest:InvokeServer("Soul Teacher");
                    end
                    if getgenv().KeyQuest == true then
                        QuestRemotes.ActionQuest:InvokeServer("Key Quest 1");
                    end
                    if getgenv().Area1 == true then
                        QuestRemotes.ActionQuest:InvokeServer("Area 1");
                    end
                    if getgenv().Area2 == true then
                        QuestRemotes.ActionQuest:InvokeServer("Area 2");
                    end
                    if getgenv().Area3 == true then
                        QuestRemotes.ActionQuest:InvokeServer("Area 3");
                    end
                    if getgenv().Area4 == true then
                        QuestRemotes.ActionQuest:InvokeServer("Area 4");
                    end
                    if getgenv().Area5 == true then
                        QuestRemotes.ActionQuest:InvokeServer("Area 5");
                    end
                    if getgenv().Area6 == true then
                        QuestRemotes.ActionQuest:InvokeServer("Area 6");
                    end
                    if getgenv().Area7 == true then
                        QuestRemotes.ActionQuest:InvokeServer("Area 7");
                    end
                    if getgenv().Area8 == true then
                        QuestRemotes.ActionQuest:InvokeServer("Area 8");
                    end
                    if getgenv().Area9 == true then
                        QuestRemotes.ActionQuest:InvokeServer("Area 9");
                    end
                    if getgenv().Area10 == true then
                        QuestRemotes.ActionQuest:InvokeServer("Area 10");
                    end
                    if getgenv().Area11 == true then
                        QuestRemotes.ActionQuest:InvokeServer("Area 11");
                    end
                    if getgenv().Area12 == true then
                        QuestRemotes.ActionQuest:InvokeServer("Area 12");
                    end
                    if getgenv().Area13 == true then
                        QuestRemotes.ActionQuest:InvokeServer("Area 13");
                    end
                    --// Auto Forge Swords
                    if getgenv().SwordForge == true then
                        for i, v in next, WeaponInv:GetChildren() do
                            if v:IsA("Frame") and v.Parent == WeaponInv then
                                ForgeRemotes.Forge:InvokeServer(v.Name);
                            end
                        end
                    end
                    --// Dungeon Shop
                    if getgenv().CoinBoost == true then
                        DungeonShopRemotes.BuyItem:InvokeServer("DungeonShop", DungeonShopItems["2x Coin Boost"]);
                    end
                    if getgenv().SuperLuckBoost == true then
                        DungeonShopRemotes.BuyItem:InvokeServer("DungeonShop", DungeonShopItems["Super Luck Boost"]);
                    end
                    if getgenv().PowerBoost == true then
                        DungeonShopRemotes.BuyItem:InvokeServer("DungeonShop", DungeonShopItems["2x Power Boost"]);
                    end
                    if getgenv().RaidTickets == true then
                        DungeonShopRemotes.BuyItem:InvokeServer("DungeonShop", DungeonShopItems["Raid Tickets"]);
                    end
                    if getgenv().SecretLuck == true then
                        DungeonShopRemotes.BuyItem:InvokeServer("DungeonShop", DungeonShopItems["2x Secret Luck Boost"]);
                    end
                    --// Teleport To Egg
                    if getgenv().AutoHatch == true then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = FloatingEggs[getgenv().SelectedEgg].HumanoidRootPart.CFrame * CFrame.new(0, -5.675, 7.5)
                    end
                    task.wait(1);
                    One = false;
                end)()
            end
        end)
    end)
    
    task.spawn(function()
        RunService.Heartbeat:Connect(function()
            --// Auto Power
            if getgenv().AutoPower == true then
                ClickRemotes.Click:InvokeServer();
            end
            --// Closest NPC Kill Aura
            if getgenv().AutoKillNPC == true and Closest_NPC() ~= nil then
                ClickRemotes.Click:InvokeServer(Closest_NPC().Name);
            end
            --// Specific NPC Kill Aura
            if getgenv().AutoKillSpecificNPC == true and Get_Specific_Closest() ~= nil then
                ClickRemotes.Click:InvokeServer(Get_Specific_Closest().Name);
            end
        end)
    end)
    
    local Two = false;
    
    task.spawn(function()
        RunService.Heartbeat:Connect(function()
            if Two == false then
                coroutine.wrap(function()
                    Two = true
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
                        EggRemotes.BuyEgg:InvokeServer({["eggName"] = getgenv().SelectedEgg2, ["auto"] = false, ["amount"] = getgenv().HatchAmount});
                    end
                    --// Auto Delete Sword + Pet
                    if getgenv().AutoDeleteSword == true then
                        local SwordFound = false;
                        local Swords = {};
    
                        for i, v in next, WeaponInv:GetDescendants() do
                            if v:IsA("Frame") and v.Parent == WeaponInv then
                                if v:FindFirstChild("Equipped", true).Visible == false then
                                    if v:FindFirstChild("Lock", true).Visible == false then
                                        if v then
                                            SwordFound = true;
                                            Swords[tostring(v.Name)] = true;
                                        end
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
                            if v:IsA("Frame") and v.Parent == PetInv then
                                if v:FindFirstChild("Equipped", true).Visible == false then
                                    if v:FindFirstChild("Lock", true).Visible == false then
                                        if v then
                                            PetFound = true;
                                            Pets[tostring(v.Name)] = true;
                                        end
                                    end
                                end
                            end
                        end
                        if PetFound == true then
                            PetRemotes.MultiDelete:InvokeServer(Pets);
                            PetFound = false;
                        end
                    end
                    if getgenv().PetDismantle == true then
                        local dPetFound = false;
                        local dPets = {};
    
                        for i, v in next, PetInv:GetDescendants() do
                            if v:IsA("Frame") and v.Parent == PetInv then
                                if v:FindFirstChild("Equipped", true).Visible == false then
                                    if v:FindFirstChild("Lock", true).Visible == false then
                                        if v then
                                            dPetFound = true;
                                            table.insert(dPets, v.Name);
                                        end
                                    end
                                end
                            end
                        end
                        if dPetFound == true then
                            DismantleRemotes.Dismantle:InvokeServer(dPets);
                            dPetFound = false;
                        end
                    end
                    --// Auto Ascend
                    if getgenv().AutoAscend == true then
                        if Ascend_Needed.AbsoluteSize == Ascend_Current.AbsoluteSize then
                            AscendRemotes.Ascend:InvokeServer();
                        end
                    end
                    --// Auto Pickup Coins
                    if getgenv().AutoCoins == true and Pickups:GetChildren()[1] ~= nil then
                        Pickups:GetChildren()[1].CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame;
                    end
                    task.wait();
                    Two = false;
                end)()
            end
        end)
    end)
    
    task.spawn(function()
        RunService.Heartbeat:Connect(function()
            --// Closest NPC's Teleport
            if getgenv().AutoKillNPC == true then
                if Closest_NPC() ~= nil then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = Closest_NPC().HumanoidRootPart.CFrame * CFrame.new(0, 6, -2.5);
                end
            end
            --// Specific NPC's Teleport
            if getgenv().AutoKillSpecificNPC == true then
                if Get_Specific_Closest() ~= nil then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = Get_Specific_Closest().HumanoidRootPart.CFrame * CFrame.new(0, 6, -2.5);
                end
            end
            --// Walk Speed + Jump Power
            LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().WalkSpeed
        end)
    end)
    
    local Three = false;
    
    task.spawn(function()
        RunService.Heartbeat:Connect(function()
            if Three == false then
                coroutine.wrap(function()
                    Three = true
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
                    --// Set Power + Specific NPC Kill + Efficiency
                    if (getgenv().SpecificNPCEfficiency == true and Get_Specific_Closest() ~= nil) then
                        getgenv().AutoPower = false;
                        getgenv().AutoKillSpecificNPC = true
                        KillSpecific:Set(getgenv().AutoKillSpecificNPC);
                        Power:Set(getgenv().AutoPower);
                    end
                    if (getgenv().SpecificNPCEfficiency == true and Get_Specific_Closest() == nil) then
                        getgenv().AutoPower = true;
                        getgenv().AutoKillSpecificNPC = false
                        KillSpecific:Set(getgenv().AutoKillSpecificNPC);
                        Power:Set(getgenv().AutoPower);
                    end
                    if getgenv().SpecificNPCEfficiency == false then
                        if (getgenv().AutoKillSpecificNPC == true and getgenv().AutoPower == true) then
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
                    task.wait(.05)
                    Three = false
                end)()
            end
        end)
    end)
    --[[
    local Four = false;
    
    task.spawn(function()
        RunService.Heartbeat:Connect(function()
            if Four == false then
                coroutine.wrap(function()
                    Four = true
                    --// Dungeons
                    local Door_1 = Lobby.Doors["Dungeon 1"];
                    local Door_2 = Lobby.Doors["Dungeon 2"];
                    if (getgenv().EasyDungeon == true or getgenv().HardDungeon == true) then
                        if (Door_1.Position.Y < 0 or Door_2.Position.Y < 0) then
                            local e = getgenv().Efficiency;
                            local se = getgenv().SpecificNPCEfficiency;
                            local a = getgenv().AutoKillNPC;
                            local ae = getgenv().AutoKillSpecificNPC;
                            local egg = getgenv().AutoHatch;
                            local p = getgenv().AutoPower;
                            getgenv().Efficiency = false;
                            getgenv().SpecificNPCEfficiency = false;
                            getgenv().AutoKillNPC = false;
                            getgenv().AutoKillSpecificNPC = false;
                            getgenv().AutoHatch = false;
                            getgenv().AutoPower = true;
                            Kill:Set(getgenv().AutoKillNPC);
                            KillSpecific:Set(getgenv().AutoKillSpecificNPC);
                            Efficiency:Set(getgenv().Efficiency);
                            SpecificEfficiency:Set(getgenv().SpecificNPCEfficiency);
                            Egg_Hatcher:Set(getgenv().AutoHatch);
                            Power:Set(getgenv().AutoPower);
                            repeat task.wait() until (Door_1.Position.Y > 0 or Door_2.Position.Y > 0)
                            getgenv().Efficiency = true;
                            Efficiency:Set(getgenv().Efficiency);
                            repeat task.wait() until PlayerGui.DungeonResult.Background.AbsolutePosition == Vector2.new(0, -36)
                            getgenv().Efficiency = e;
                            getgenv().SpecificNPCEfficiency = se;
                            getgenv().AutoKillNPC = a;
                            getgenv().AutoKillSpecificNPC = ae;
                            getgenv().AutoHatch = egg;
                            getgenv().AutoPower = p;
                            Kill:Set(a);
                            KillSpecific:Set(se);
                            Efficiency:Set(e);
                            SpecificEfficiency:Set(se);
                            Egg_Hatcher:Set(egg);
                            Power:Set(p);
                        end
                    end
                    task.wait(.05)
                    Four = false
                end)()
            end
        end)
    end)
    ]]--
end
