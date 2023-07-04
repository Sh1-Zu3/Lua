local Uis = game:GetService("UserInputService")
local Player = game.Players.LocalPlayer
local Character = workspace:WaitForChild(Player.Name)
local Humanoid = Character:WaitForChild('Humanoid')
local RunAnimation = Instance.new('Animation')
local anim= 
	{
		["s"]='rbxassetid://13951114511',
		["w"]='rbxassetid://13951116649',
		["a"]='rbxassetid://13949520099',
		["d"]='rbxassetid://13951112962'
	}
RunAnimation.AnimationId = 'rbxassetid://1721906652'
Ranimation = Humanoid:LoadAnimation(RunAnimation)
local cnt = 0
Uis.InputBegan:Connect(function(key,prg) 
	if prg then return end 
	if key.KeyCode == Enum.KeyCode.LeftControl then 
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=30
		Ranimation:Play()
	elseif key.KeyCode == Enum.KeyCode.Q and tick()-cnt>.5 then
		cnt=tick()
		local bvc= Instance.new("BodyVelocity",Character.HumanoidRootPart)
		local animdash = Instance.new('Animation')
		bvc.MaxForce=Vector3.new(1,0,1)*10000
		if Uis:IsKeyDown("W") or Humanoid.MoveDirection == Vector3.zero or Uis.MouseBehavior ~=Enum.MouseBehavior.LockCenter then
			animdash.AnimationId=anim['w']
			bvc.Velocity=Character.HumanoidRootPart.CFrame.LookVector*80
		elseif Uis:IsKeyDown("A") then 
			bvc.Velocity=Character.HumanoidRootPart.CFrame.RightVector*-80
			animdash.AnimationId=anim['a']
		elseif Uis:IsKeyDown("S") then 
			bvc.Velocity=Character.HumanoidRootPart.CFrame.LookVector*-80
			animdash.AnimationId=anim['s']
		elseif Uis:IsKeyDown("D") then 
			bvc.Velocity=Character.HumanoidRootPart.CFrame.RightVector*80
			animdash.AnimationId=anim['d']
		end
		Humanoid:LoadAnimation(animdash):Play()
		game.Debris:AddItem(bvc,.2)
 	end
end)
Uis.InputEnded:Connect(function(key) 
	if key.KeyCode == Enum.KeyCode.LeftShift then
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=16
		Ranimation:Stop()
	end 
end)

