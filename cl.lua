local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Shitty GUI, scripts made by plezdonthurtme", "Synapse")

--VARIABLES
local a1 = 0
local playern = game.Players.LocalPlayer.Name
local base = game:GetService("Workspace").Arsenals["Initus Bay"].Base
local basec = base.CFrame
getgenv().autoOrb = true;
getgenv().autoMats = true;
getgenv().GodMode = true;
getgenv().AutoMeteorite = true;
getgenv().AutoBlackMarketESP = true;

--FUNCTIONS


-- MAIN FOR TABS
local Main = Window:NewTab("Main")
local AnyGame = Window:NewTab("Misc")

--TABS FOR ANY GAME

if game.PlaceId == 8619263259 then
    -- TABS FOR THE CURRENT GAME
    local AutoSection = Main:NewSection("Auto and Toggles(Risky)")
    local TeleportSection = Main:NewSection("Teleports")
    local ClassSection = Main:NewSection("Classes(Use in Private Servers for saftey)")
    local ZoneSection = Main:NewSection("Zones(Mostly Spawns)")
    local QuestSection = Main:NewSection("Quests")
    local EnemiesSection = Main:NewSection("Bosses(Use In Private Servers for saftey)")

    --TOGGLES

    AutoSection:NewToggle("Some stuff can get buggy if you die", "This Does Nothing", function(state) --Edited by Me from another edited code by Hamstir on v3rmillion

    end)

    AutoSection:NewToggle("Auto Orbs", "Auto teleports Orbs to you(Buggy).", function(state) --Edited by Me from another edited code by Hamstir on v3rmillion
       getgenv().autoOrb = state
       if state then
       TouchOrb();
       workspace.ChildAdded:Connect(function(child)
            if string.match(child.Name, 'CombatFolder') then
                TouchOrb();
            end
        end)
       end
    end)
local aa3 = 0
local aa4 = 0
    AutoSection:NewToggle("Auto BM ESP", "Puts an ESP on BM when spawned", function(state) --Edited by Me from another edited code by Hamstir on v3rmillion
        getgenv().AutoBlackMarketESP = state
        if state then
        BMesp();
        workspace.Stalls["Black Market"].ChildAdded:Connect(function(child)
             if string.match(child.Name, 'Grani') then
                BMesp();

                if aa3 == 0 then
                    aa3 = 1
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "Black Market Dealer", -- Required
                        Text = "Press f9 to see the items.", -- Required
                    })
                    
                    wait(1)

                    for i,v in pairs(game:GetService("Workspace").Stalls["Black Market"].Grani.Shop:GetDescendants()) do
                        if v:IsA("MeshPart") then
                            print(v)
                        end
                    end

                    wait(5)
                    aa3 = 0
                else

                end
             end
         end)
         workspace.Stalls["Black Market"].ChildRemoved:Connect(function(child)
            a1 = 0
        end)
        end
     end)

    AutoSection:NewToggle("God Mode(Read Description, 3 dots ----->)", "Activate when in battles, disable after(Very Buggy).", function(state) --Edited by Me from another edited code by Hamstir on v3rmillion
        getgenv().GodMode = state
        if state then
        GodMode();
        workspace.ChildAdded:Connect(function(child)
             if string.match(child.Name, 'CombatFolder') then
                 GodMode();
             end
         end)
        end
     end)

    AutoSection:NewToggle("Auto Materials", "Teleports all Materials to you.", function(state)
        getgenv().autoMats = state
        if state then
        TouchMats();
        end
    end)

    function TouchMats()
        local Player = game.Players.LocalPlayer
        spawn(function()
            while getgenv().autoMats == true do
                for i,v in pairs(game:GetService("Workspace").MaterialGivers:GetDescendants()) do
                    if v.Name == "Giver" then
                        local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart
                        v.CFrame = HRP.CFrame
                    end
                end
                wait(0.1)
            end
        end)
    end

    function TouchOrb()
        local Player = game.Players.LocalPlayer
        spawn(function()
            while getgenv().autoOrb == true do
                if game.Workspace.CombatFolder:FindFirstChild(Player.Name) then
                    for i,v in pairs(game.Workspace.CombatFolder[Player.Name]:GetDescendants()) do
                        if v:IsA("Model") then
                            local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart
                            v.HitBox.CFrame = HRP.CFrame
                        else
    
                        end
                    end
                    else return
                end
            wait()    
            end
        end)
    end

    function GodMode()
        local Player = game.Players.LocalPlayer
        spawn(function()
            while getgenv().GodMode == true do
                if game.Workspace.CombatFolder then
                    for i,v in pairs(game.Workspace.CombatFolder:GetChildren()) do
                        if v:IsA("Folder") then
                            
                        else
                            v:Destroy()
                        end
                    end
                    else return
                end
            wait()    
            end
        end)
    end

    function BMesp()
        local Player = game.Players.LocalPlayer
        spawn(function()
            while getgenv().AutoBlackMarketESP == true do
                if game:GetService("Workspace").Stalls["Black Market"].Grani then
                        for i,v in pairs(game:GetService("Workspace").Stalls["Black Market"]:GetDescendants()) do
                            if v.ClassName == "Part" and v.Name == "booth"  then -- change
                                    
                                    local esp = Instance.new("BillboardGui")
                                    local esp1 = Instance.new("TextLabel")
                                
                                    esp.Parent = v
                                    esp.Name = "BM"
                                    esp.AlwaysOnTop = true
                                    esp.LightInfluence = 1
                                    esp.Size = UDim2.new(0, 50, 0, 50)
                                    esp.StudsOffset = Vector3.new(0, 2, 0)
                            
                                    esp1.Parent = esp
                                    esp1.BackgroundColor3 = Color3.new(1, 1, 1)
                                    esp1.BackgroundTransparency = 1
                                    esp1.Size = UDim2.new(1, 0, 1, 0)
                                    esp1.Text = "Black Market Dealer"
                                    esp1.TextColor3 = Color3.new(0, 1, 0)
                                    esp1.TextScaled = true

                                    for i,v in pairs(game:GetService("Workspace").Stalls["Black Market"].Grani.Shop:GetDescendants()) do
                                        if v:IsA("MeshPart") then
                                            print(v)
                                        end
                                    end

                                    game:GetService("StarterGui"):SetCore("SendNotification",{
                                        Title = "Black Market Dealer", -- Required
                                        Text = "I'm here still, if you need me of course.", -- Required
                                    })

                                    wait(240)

                                    esp:Destroy()


                           end
                        end
                    else return
                end
            wait(0.5)    
            end
        end)
    end
    

    --BUTTONS
    TeleportSection:NewButton("Meteorite TP", "Teleports you to Meteorite.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart

        HRP.CFrame = game:GetService("Workspace").WorldMap["Sonus Cave"].Meteorite.prox.CFrame
    end)

    TeleportSection:NewButton("Black Market TP", "Teleports you to BM.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart

        HRP.CFrame = game:GetService("Workspace").Stalls["Black Market"].Grani.Shop.booth.CFrame
    end)
    
    TeleportSection:NewButton("Arsenal TP", "Teleports you to trading arsenal.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart

        HRP.CFrame = game:GetService("Workspace").Arsenals["Trading Sky"].Base.CFrame
    end)
    
    TeleportSection:NewButton("Teleport Chests", "Teleports chests TouchInterests to you.", function()
        for i,v in pairs(game:GetService("Workspace").Chests:GetChildren()) do
            if v:IsA("Model") then
               v.Giver.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
            end
        end
    end)

    ClassSection:NewButton("Archer Class", "Archer, yay!", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart

        HRP.CFrame = game:GetService("Workspace").Statues.StatueOfArcher.Orb.CFrame

    end)

    ClassSection:NewButton("Boxer Class", "Fold some kids. Night Night.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Statues.StatueOfBoxer.Orb.CFrame

    end)

    ClassSection:NewButton("Elementalist Class", "Don't do drugs kids.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Statues.StatueOfElementalist.Orb.CFrame

    end)

    ClassSection:NewButton("Defender Class", "Statue name said Knight tho...", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Statues.StatueOfKnight.Orb.CFrame

    end)

    ClassSection:NewButton("Reaper Class", "You're near death's door...", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Statues.StatueOfReaper.Orb.CFrame

    end)

    ClassSection:NewButton("Samurai Class", "Katana Zero?", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Statues.StatueOfSamurai.Union.CFrame

    end)

    ClassSection:NewButton("Wizard Class", "Nerd user, wear glasses.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Statues.StatueOfWizard.Orb.CFrame

    end)

    ClassSection:NewButton("Combo Sword Class", "Back to the start, huh..?", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Statues.StatueOfWarrior.Orb.CFrame

    end)

    ClassSection:NewButton("Valkyrie Class", "Not fixing teleport, nerd.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Statues.StatueOfValkyrie.Union.CFrame

    end)

    ClassSection:NewButton("Healer Class", "This is easy to find...", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Statues.StatueOfHealer.Orb.CFrame

    end)

    ClassSection:NewButton("Gunner Class", "It's highhh noooon.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Statues.StatueOfGunner.Orb.CFrame

    end)

    ClassSection:NewButton("SpellBook Class", "Worst Hybrid Class.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Statues.StatueOfSpellBook.Wedge.CFrame + Vector3.new(0,12,0)

    end)

    ClassSection:NewButton("Skypian Class", "Not a One Piece reference.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Statues.StatueOfSkypian.Wedge.CFrame + Vector3.new(0,12,0)

    end)

    ZoneSection:NewButton("Crystal Caves", "Spooky.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = CFrame.new(5305.93262, 362.807343, 1764.76599, 0.875960052, -5.81703796e-09, -0.482383668, -4.24379154e-09, 1, -1.97652419e-08, 0.482383668, 1.93606979e-08, 0.875960052)

    end)

    ZoneSection:NewButton("Samurai Island", "Where's Zoro?", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Spawns.Thirteen.CFrame
    end)


    ZoneSection:NewButton("The Void", "Hope Gaster isn't here.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Spawns.Eight.CFrame
    end)


    ZoneSection:NewButton("Sky Island", "Will kill if not required level", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = CFrame.new(-1045.73132, 2698.11499, 19561.4844, -1, -1.95300798e-09, 4.51066379e-16, -1.95300798e-09, 1, -5.91611098e-08, -3.35524256e-16, -5.91611098e-08, -1)

    end)


    ZoneSection:NewButton("Abyss of Enis", "Where Challenger is...", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Spawns.Eleven.CFrame
    end)


    ZoneSection:NewButton("Blubb's Kingdom", "Rocks n stuff, idk.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Spawns.Nine.CFrame
    end)


    ZoneSection:NewButton("Evergreen", "There's a virus nearby.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Spawns.Seven.CFrame
    end)


    ZoneSection:NewButton("Heat Lovers Seaside", "What kind of name is that?", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Spawns.Five.CFrame
    end)


    ZoneSection:NewButton("Element Door", "For Element Ticket", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = CFrame.new(178.406723, 131.09996, -86.001091, 0.999368429, 4.07311553e-08, 0.0355354212, -4.13028935e-08, 1, 1.53551039e-08, -0.0355354212, -1.68131216e-08, 0.999368429)

    end)

    ZoneSection:NewButton("Punky Sky", "Yea, seems a lot like....", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Spawns.Three.CFrame
    end)

    ZoneSection:NewButton("Beginner Spawn", "Forgorr", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Spawns.Two.CFrame
    end)

    QuestSection:NewButton("Challenging the Challenger Quest", "", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").QuestNPCs["Challenging the Challenger"].Head.CFrame
    end)

    QuestSection:NewButton("Foxes Saga Quest", "", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").QuestNPCs["Foxes Saga"].Head.CFrame
    end)

    QuestSection:NewButton("Foxes and Slimes Quest", "5M Gold Coins???", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").QuestNPCs["Foxes and Slimes"].Head.CFrame
    end)

    QuestSection:NewButton("Get down here! Quest", "No, I don't think I will.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").QuestNPCs["Get down here!"].Head.CFrame
    end)

    QuestSection:NewButton("Hell so Hot Quest", "Heaven so Cold", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").QuestNPCs["Hell so Hot"].Head.CFrame
    end)

    QuestSection:NewButton("Honey Collector Quest", "Be careful of killer bees", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").QuestNPCs["Honey Collector"].Head.CFrame
    end)

    QuestSection:NewButton("Monster Hunter Quest", "Monster Hunter Rise", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").QuestNPCs["Monster Hunter"].Head.CFrame
    end)

    QuestSection:NewButton("Rageblade Quest", "L + Ratio + Stay Mad + Fatherless", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").QuestNPCs.Rageblade.Main.CFrame
    end)

    QuestSection:NewButton("Samurai Island Quest", "don't know", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").QuestNPCs["Samurai Island Quest"].Head.CFrame
    end)

    QuestSection:NewButton("Slimy Situation Quest", "U-ummm...", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").QuestNPCs["Slimy Situation"].Head.CFrame
    end)

    QuestSection:NewButton("Tusk's Revenge Quest", "Vengeful spirit", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").QuestNPCs["Tusk's Revenge"].Head.CFrame
    end)

    QuestSection:NewButton("Voidvorn Drills Quest", "Gurren Lagann", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").QuestNPCs["Voidborn Drills"].Main.CFrame
    end)

    EnemiesSection:NewButton("Oni", "God He's Scary.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Enemies["Samurai Island Oni"].Enemy.EnemyLocation.CFrame
    end)

    EnemiesSection:NewButton("Shogun", "Cory?", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Enemies["Samurai Island Boss"].Enemy.EnemyLocation.CFrame
    end)

    EnemiesSection:NewButton("Sky Dragon", "Rawr~~ :3", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Enemies["Sky 4 Boss Room"].Enemy.EnemyLocation.CFrame
    end)

    EnemiesSection:NewButton("Talented Student", "Not so talented when ya' dead.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Enemies["Talented Student Boss"].Enemy.EnemyLocation.CFrame
    end)

    EnemiesSection:NewButton("Winged Mother Pig", "This is a mini boss, lol.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Enemies["Sky 3 Miniboss"].Enemy.EnemyLocation.CFrame
    end)

    EnemiesSection:NewButton("Purple Dude", "Venom, Venom, Venom, Venommmm", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = CFrame.new(5278.44336, 356.807343, 2133.15967, -0.999843419, -4.46200588e-08, 0.0176954623, -4.43306014e-08, 1, 1.67498282e-08, -0.0176954623, 1.59627547e-08, -0.999843419)
    end)

    EnemiesSection:NewButton("Red Dude", "Cherry Drop", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = CFrame.new(5333.23389, 359.807343, 1547.22266, 0.999957979, 4.28678959e-08, 0.00917041954, -4.31411209e-08, 1, 2.95964284e-08, -0.00917041954, -2.99908081e-08, 0.999957979)
    end)

    EnemiesSection:NewButton("Orange Dude", "Orange Juice Boss", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = CFrame.new(5037.33154, 346.807343, 1777.70483, -0.0577176027, -7.74749864e-08, 0.998332977, 3.45293607e-08, 1, 7.96006319e-08, -0.998332977, 3.90661583e-08, -0.0577176027)
    end)

    EnemiesSection:NewButton("Tree Dude", "Grute?", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = CFrame.new(5608.50488, 358.807343, 1755.62134, 0.00102415122, 8.25704483e-09, -0.999999464, 1.49770649e-08, 1, 8.27238811e-09, 0.999999464, -1.49855293e-08, 0.00102415122)
    end)

    EnemiesSection:NewButton("Queen Bee", "Ya' like jazz?", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Enemies["Flora Field Boss"].Enemy.EnemyLocation.CFrame
    end)

    EnemiesSection:NewButton("Hell Bat", "Terraria flashbacks...", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Enemies["Hell Boss"].Enemy.EnemyLocation.CFrame
    end)

    EnemiesSection:NewButton("Snowman", "Frosty the snowman~", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Enemies["Snowy Caps Boss"].Enemy.EnemyLocation.CFrame
    end)

    EnemiesSection:NewButton("King Slime", "N-not th-there~~~ ;3", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Enemies["Ensis Pond Boss"].Enemy.EnemyLocation.CFrame
    end)

    EnemiesSection:NewButton("Duke Fishron", "If you know, you know.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Enemies["Heat Lovers Seaside Boss"].Enemy.EnemyLocation.CFrame
    end)

    EnemiesSection:NewButton("Luna", "Ok, go to sleep?", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Enemies["Luna Boss"].Enemy.EnemyLocation.CFrame
    end)

    EnemiesSection:NewButton("Virus", "Happy, Happy, smiley, smiley", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Enemies["Virus Boss"].Enemy.EnemyLocation.CFrame
    end)

    EnemiesSection:NewButton("Void Eye", "Need some eye drops.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Enemies["Void Boss"].Enemy.EnemyLocation.CFrame
    end)

    EnemiesSection:NewButton("Skeleton King", "Spooky scary skeletons.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Enemies["Skeleton King"].Enemy.EnemyLocation.CFrame
    end)

    EnemiesSection:NewButton("Challenger", "No, not the car.", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Enemies.Challenger.Enemy.EnemyLocation.CFrame
    end)

    EnemiesSection:NewButton("Heart", "Everytime we touch I get this feeling~", function()
        local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        HRP.CFrame = game:GetService("Workspace").Enemies["Heart Crystal"].Enemy.EnemyLocation.CFrame
    end)


else
    -- IF THIS ISN'T THE GAME THEN IT WON'T LOAD THESE TOGGLES, BUTTONS, ETC.
end

--BUTTONS FOR ANY GAME
local positionSection = AnyGame:NewSection("Positions")

positionSection:NewButton("Save Position", "Saves your position.", function()
        
    if game:GetService("Workspace"):FindFirstChild("TP") then
        
        game:GetService("Workspace"):FindFirstChild("TP"):Destroy()
        
        local part = Instance.new("Part")
        part.Name = "TP"
        part.Parent = game:GetService("Workspace")
        part.CanCollide = false
        part.CFrame = HRP.CFrame
        part.Anchored = true
        part.Size = Vector3.new(1,1,1)
        part.Transparency = 1
    else
        local part = Instance.new("Part")
        part.Name = "TP"
        part.Parent = game:GetService("Workspace")
        part.CanCollide = false
        part.CFrame = HRP.CFrame
        part.Anchored = true
        part.Size = Vector3.new(1,1,1)
        part.Transparency = 1 
    end
end)

positionSection:NewButton("Load Position", "Loads Saved Position.", function()
    local tp = game:GetService("Workspace"):FindFirstChild("TP")
        
    HRP.CFrame = tp.CFrame
end)


positionSection:NewButton("Save Position 2", "Saves your position.", function()
        
    if game:GetService("Workspace"):FindFirstChild("TP2") then
        
        game:GetService("Workspace"):FindFirstChild("TP2"):Destroy()
        
        local part = Instance.new("Part")
        part.Name = "TP2"
        part.Parent = game:GetService("Workspace")
        part.CanCollide = false
        part.CFrame = HRP.CFrame
        part.Anchored = true
        part.Size = Vector3.new(1,1,1)
        part.Transparency = 1
    else
        local part = Instance.new("Part")
        part.Name = "TP2"
        part.Parent = game:GetService("Workspace")
        part.CanCollide = false
        part.CFrame = HRP.CFrame
        part.Anchored = true
        part.Size = Vector3.new(1,1,1)
        part.Transparency = 1 
    end
end)

positionSection:NewButton("Load Position 2", "Loads Saved Position.", function()
    local tp = game:GetService("Workspace"):FindFirstChild("TP2")
        
    HRP.CFrame = tp.CFrame
end)


positionSection:NewButton("Save Position 3", "Saves your position.", function()
        
    if game:GetService("Workspace"):FindFirstChild("TP3") then
        
        game:GetService("Workspace"):FindFirstChild("TP3"):Destroy()
        
        local part = Instance.new("Part")
        part.Name = "TP3"
        part.Parent = game:GetService("Workspace")
        part.CanCollide = false
        part.CFrame = HRP.CFrame
        part.Anchored = true
        part.Size = Vector3.new(1,1,1)
        part.Transparency = 1
    else
        local part = Instance.new("Part")
        part.Name = "TP3"
        part.Parent = game:GetService("Workspace")
        part.CanCollide = false
        part.CFrame = HRP.CFrame
        part.Anchored = true
        part.Size = Vector3.new(1,1,1)
        part.Transparency = 1 
    end
end)

positionSection:NewButton("Load Position 3", "Loads Saved Position.", function()
    local tp = game:GetService("Workspace"):FindFirstChild("TP3")
        
    HRP.CFrame = tp.CFrame
end)
