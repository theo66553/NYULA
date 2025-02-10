-- variables
local Lib = {};
local coregui = game:GetService("CoreGui");
local userin  = game:GetService("UserInputService");
local tween   = game:GetService("TweenService");

-- etc variables
local draggin = nil;
local start   = nil;
local pos     = nil;

-- drag function
local function updatedrag(input, frame)
	local delta = input.Position - start;
	local position = UDim2.new(pos.X.Scale, pos.X.Offset + delta.X, pos.Y.Scale, pos.Y.Offset + delta.Y);
	game:GetService('TweenService'):Create(frame, TweenInfo.new(0.25), {Position = position}):Play();
end

function Lib:Create(options)
	if not options then
		options = {
			accent = Color3.fromRGB(244, 105, 129);
		};
	end;
	options.func = function(...) end;
	options.name = "";
	options.selc = nil;
	--
	Lib["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
	Lib["1"]["Name"] = [[Loader]];
	Lib["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

	Lib["2"] = Instance.new("Frame", Lib["1"]);
	Lib["2"]["ZIndex"] = 5;
	Lib["2"]["BorderSizePixel"] = 0;
	Lib["2"]["BackgroundColor3"] = Color3.fromRGB(11, 11, 11);
	Lib["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	Lib["2"]["Size"] = UDim2.new(0, 300, 0, 325);
	Lib["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	Lib["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	Lib["2"]["Name"] = [[Main]];

	do -- drag control
		Lib["2"].InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
				draggin = true; start = input.Position; pos = Lib["2"].Position;
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						draggin = false;
					end
				end)
			end
		end)

		userin.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if draggin then
					updatedrag(input, Lib["2"]);
				end
			end
		end)
	end

	Lib["3"] = Instance.new("ImageLabel", Lib["2"]);
	Lib["3"]["ZIndex"] = -1;
	Lib["3"]["BorderSizePixel"] = 0;
	Lib["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	Lib["3"]["ImageColor3"] = options.accent;
	Lib["3"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	Lib["3"]["Image"] = [[rbxassetid://4996891970]];
	Lib["3"]["Size"] = UDim2.new(1.11, 0, 1.11, 0);
	Lib["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	Lib["3"]["BackgroundTransparency"] = 1;
	Lib["3"]["Name"] = [[Shadow]];
	Lib["3"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

	Lib["4"] = Instance.new("Frame", Lib["2"]);
	Lib["4"]["BorderSizePixel"] = 0;
	Lib["4"]["BackgroundColor3"] = Color3.fromRGB(244, 105, 129);
	Lib["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	Lib["4"]["Size"] = UDim2.new(0.95, 0, 0.95, 0);
	Lib["4"]["Position"] = UDim2.new(0.5, 0, 0.49846, 0);
	Lib["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	Lib["4"]["Name"] = [[Holder]];

	Lib["5"] = Instance.new("UIStroke", Lib["4"]);

	Lib["6"] = Instance.new("Frame", Lib["4"]);
	Lib["6"]["BorderSizePixel"] = 0;
	Lib["6"]["BackgroundColor3"] = Color3.fromRGB(14, 14, 14);
	Lib["6"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	Lib["6"]["Size"] = UDim2.new(0.95, 0, 0.45344, 100);
	Lib["6"]["Position"] = UDim2.new(0.49825, 0, 0.42105, 0);
	Lib["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	Lib["6"]["Name"] = [[Games]];

	Lib["7"] = Instance.new("UIStroke", Lib["6"]);
	Lib["7"]["Color"] = Color3.fromRGB(21, 21, 21);

	Lib["11"] = Instance.new("UIListLayout", Lib["6"]);
	Lib["11"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
	Lib["11"]["Padding"] = UDim.new(0, 5);
	Lib["11"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

	Lib["12"] = Instance.new("UICorner", Lib["6"]);
	Lib["12"]["CornerRadius"] = UDim.new(0, 2);

	Lib["13"] = Instance.new("UIPadding", Lib["6"]);
	Lib["13"]["PaddingTop"] = UDim.new(0, 2);

	Lib["14"] = Instance.new("TextButton", Lib["4"]);
	Lib["14"]["BorderSizePixel"] = 0;
	Lib["14"]["TextSize"] = 17;
	Lib["14"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	Lib["14"]["BackgroundColor3"] = Color3.fromRGB(14, 14, 14);
	Lib["14"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	Lib["14"]["Size"] = UDim2.new(0.95, 0, -0.01943, 50);
	Lib["14"]["Name"] = [[Load]];
	Lib["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	Lib["14"]["Text"] = [[Load]];
	Lib["14"]["Position"] = UDim2.new(0.02105, 0, 0.83563, 0);
	Lib["14"].MouseButton1Down:Connect(function()
		options.func(options.name)
	end)

	Lib["15"] = Instance.new("UICorner", Lib["14"]);
	Lib["15"]["CornerRadius"] = UDim.new(0, 2);

	Lib["16"] = Instance.new("UIStroke", Lib["14"]);
	Lib["16"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
	Lib["16"]["Color"] = Color3.fromRGB(21, 21, 21);

	Lib["17"] = Instance.new("UICorner", Lib["4"]);
	Lib["17"]["CornerRadius"] = UDim.new(0, 2);

	Lib["18"] = Instance.new("UICorner", Lib["2"]);
	Lib["18"]["CornerRadius"] = UDim.new(0, 2);

	function options:creategame(opt)
		if not opt then
			opt = {
				name  = "fallen";
				image = "rbxassetid://133689243432559";
                status= "undtected";
				call  = function(...) end;
			};
		end;
		--
		Lib["8"] = Instance.new("TextButton", Lib["6"]);
		Lib["8"]["BorderSizePixel"] = 0;
		Lib["8"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		Lib["8"]["TextSize"] = 16;
		Lib["8"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		Lib["8"]["BackgroundColor3"] = Color3.fromRGB(16, 16, 16);
		Lib["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		Lib["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Lib["8"]["Size"] = UDim2.new(0.98, 0, 0, 51);
		Lib["8"]["Name"] = opt.name;
		Lib["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Lib["8"]["Text"] = opt.name;
		Lib["8"]["Position"] = UDim2.new(0.49861, 0, 0.10417, 0);

		Lib["9"] = Instance.new("UIPadding", Lib["8"]);
		Lib["9"]["PaddingLeft"] = UDim.new(0, 54);

		Lib["a"] = Instance.new("UIStroke", Lib["8"]);
		Lib["a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
		Lib["a"]["Color"] = Color3.fromRGB(26, 26, 26);
		
		Lib["8"].MouseButton1Down:Connect(function()
			options.name = opt.name;
			options.func = opt.call;
			--
			for _,v in pairs(Lib["6"]:GetChildren()) do
				if v:IsA("TextButton") then
					if options.name ~= v.Text then
						tween:Create(v:FindFirstChildOfClass("UIStroke"), TweenInfo.new(0.2), {Color = Color3.fromRGB(26, 26, 26)}):Play();
					else
						tween:Create(v:FindFirstChildOfClass("UIStroke"), TweenInfo.new(0.2), {Color = options.accent}):Play();
					end
				end
			end
		end)

		Lib["8"].MouseEnter:Connect(function()
			if options.name == Lib["8"].Text then
				return;
			end;
			tween:Create(Lib["a"], TweenInfo.new(0.2), {Color = Color3.fromRGB(34, 34, 34)}):Play();
		end)
		Lib["8"].MouseLeave:Connect(function()
			if options.name == Lib["8"].Text then
				return;
			end;
			tween:Create(Lib["a"], TweenInfo.new(0.2), {Color = Color3.fromRGB(26, 26, 26)}):Play();
		end)

		Lib["b"] = Instance.new("UICorner", Lib["8"]);
		Lib["b"]["CornerRadius"] = UDim.new(0, 2);

		Lib["c"] = Instance.new("ImageLabel", Lib["8"]);
		Lib["c"]["BorderSizePixel"] = 0;
		Lib["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Lib["c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Lib["c"]["Image"] = opt.image;
		Lib["c"]["Size"] = UDim2.new(0, 40, 0, 40);
		Lib["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Lib["c"]["Name"] = [[GameImage]];
		Lib["c"]["Position"] = UDim2.new(0, -28, 0.5, 0);

		Lib["d"] = Instance.new("UICorner", Lib["c"]);
		Lib["d"]["CornerRadius"] = UDim.new(0, 2);

		Lib["e"] = Instance.new("UIStroke", Lib["c"]);
		Lib["e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
		Lib["e"]["Color"] = Color3.fromRGB(39, 39, 39);

		Lib["f"] = Instance.new("TextLabel", Lib["8"]);
		Lib["f"]["BorderSizePixel"] = 0;
		Lib["f"]["TextXAlignment"] = Enum.TextXAlignment.Right;
		Lib["f"]["TextTransparency"] = 0.59;
		Lib["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Lib["f"]["TextSize"] = 14;
		Lib["f"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		Lib["f"]["TextColor3"] = Color3.new(0.000000, 1.000000, 0.082353);
		Lib["f"]["BackgroundTransparency"] = 1;
		Lib["f"]["Size"] = UDim2.new(0.47477, 0, 0.47059, 0);
		Lib["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Lib["f"]["Text"] = "status: "..opt.status;
		Lib["f"]["Name"] = [[Status]];
		Lib["f"]["Position"] = UDim2.new(0.52523, 0, 0.52941, 0);

		Lib["10"] = Instance.new("UIPadding", Lib["f"]);
		Lib["10"]["PaddingRight"] = UDim.new(0, 5);

		return opt;
	end;
	--
	return options;
end;

local Loader = Lib:Create({ accent = Color3.fromRGB(255, 119, 119) })

Loader:creategame({
    name = "Fallen Survival",
    image = "rbxassetid://133689243432559",
    status = "undetected",
    call = function(v)
        repeat task.wait() until game:IsLoaded()
        
        local NYULA = ([[
            script_key = "%s"
            loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2e2579a0a77d8b5d06182e046ff22249.lua"))()
        ]]):format(script_key)
        
        queue_on_teleport(NYULA)
        
        local message_response = messagebox('Join Server After Pressing Ok!', 'NYULA.WTF', 1)
        
        if message_response == 1 then
            for _ = 1, 1 do
                if injection_finish then break end
                
                for _, text in ipairs(texts) do
                    InjectButton.Text = text
                    task.wait(0.5)
                end
            end
            
            if not injection_finish then
                for _, v in pairs(Loader:GetDescendants()) do
                    v:Remove()
                end
                
                Cursor:Remove()
                CursorOutline:Remove()
                UserInputService.MouseIconEnabled = true
            end
        end
    end
})
