local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Jonatanortiz2/home/main/Roblox-Projects/Jons-Ui-Library/Source.lua'))();
local Window = Library:CreateWindow("By Awukiru", true);
local MainTab = Window:CreateTab("Main", true, "rbxassetid://4483362458", Vector2.new(0, 0), Vector2.new(0, 0));
local Main = MainTab:CreateSection("Main");

getgenv().Knife = nil;

local m = require(game:GetService("ReplicatedStorage").Modules.Items)
local All_Knives = {};
local Applicable_Knives = {};

for i, v in next, m.GetAllKnives() do
    table.insert(All_Knives, i);
end

for i = 1, #All_Knives do
    if string.match(m.GetInfo(All_Knives[i])[1], "rbxassetid://") then
        table.insert(Applicable_Knives, All_Knives[i]);
    end
end

local Knivess = Main:CreateDropdown("Chose Knife To Use", Applicable_Knives, nil, 0.25, function(Value)
    getgenv().Knife = Value;
end)

local Knife = function(Name)
    local k = Name
    local i = m.GetInfo(k)
    local t = i[1];
    local e = i[4];
    local s = i[5];
    local o = i[6];
    local r = m.GetOrientation(k);
    local p = game:GetService("Players").LocalPlayer.Character:WaitForChild("KnifeHandle"):WaitForChild("KnifeDecorationHandle"):WaitForChild("Mesh");
    p.TextureId = t;
    p.MeshId = e;
    p.Scale = s;
    p.Offset = o;
    p.Parent.Parent:WaitForChild("Weld").C0 = r;
    
    repeat task.wait() until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Knife", true)
    local k = game:GetService("Players").LocalPlayer.Backpack.Knife;
    local p = k.Handle.KnifeDecorationHandle.Mesh;
    
    p.TextureId = t;
    p.MeshId = e;
    p.Scale = s;
    p.Offset = o;
end

task.spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        Knife(getgenv().Knife);
        game:GetService("CoreGui").RobloxGui.Backpack.Hotbar["1"].Icon.Image = "rbxgameasset://Images/" .. getgenv().Knife;
    end)
end)

task.spawn(function()
    workspace.KnifeHost.ChildAdded:Connect(function(v)
        local k = getgenv().Knife;
        local m = require(game:GetService("ReplicatedStorage").Modules.Items);
        local i = m.GetInfo(k);
        local t = i[1];
        local e = i[4];
        local s = i[5];
        local o = i[6];
        repeat task.wait() until v:FindFirstChild("KnifeDecorationHandle", true)
        local sh = v.KnifeDecorationHandle.Mesh;
        
        sh.TextureId = t;
        sh.MeshId = e;
        sh.Scale = s;
        sh.Offset = o;
    end)
end)
