game.workspace.ChildAdded:Connect(function(hourglass)
    if hourglass.Name == "Hourglass" then
		wait(0.1)
        for _, part in pairs(hourglass:GetChildren()) do
            if part.Name == "PrimaryPart" then
				      part.Transparency = 1
				      part.CanCollide = false
                part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            elseif part:IsA("BasePart") or part:IsA("Mesh") then
				      part.Transparency = 1
				      part.CanCollide = false
			      end
        end
    end
end)
