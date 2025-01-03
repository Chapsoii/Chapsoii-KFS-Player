--//by xGeenx (ChapSoii)

local b = {}
local m = {}

--//MathStuff
do
	local clamp = math.clamp
	local min = math.min
	local asin = math.asin
	local acos = math.acos
	local cos = math.cos
	local sin = math.sin	
	local abs = math.abs
	local rad = math.rad
	local deg = math.deg
	local sign = math.sign
	local sqrt = math.sqrt
	local tan = math.tan
	local atan = math.atan
	local atan2 = math.atan2	
	local floor = math.floor
	local ceil = math.ceil
	local max = math.max
	local pi = math.pi
	local exp = math.exp
	local pow = math.pow
	
	local v3 = Vector3.new
	local v2 = Vector2.new
	local cf = CFrame.new
	local cfa = CFrame.Angles
	local cffm = CFrame.fromMatrix
	local cfo = CFrame.fromOrientation
	
	--//Ease Library (some of them aren't used tho)
	local Ease = {}
	do 
		-- linear --
		local function linear(t, b, c, d)
			return c * t / d + b
		end

		Ease.Linear = function(val)
			return linear(val, 0, 1, 1)
		end
		------------

		-- constant --
		local function constant(t, b, c, d)
			return (t > d or t < d) and 1 or 0
		end

		Ease.Constant = function(val)
			return constant(val, 0, 1, 1)
		end
		--------------

		-- sine --
		local function inSine(t, b, c, d)
			return -c * cos(t / d * (pi / 2)) + c + b
		end
		local function outSine(t, b, c, d)
			return c * sin(t / d * (pi / 2)) + b
		end
		local function inOutSine(t, b, c, d)
			return -c / 2 * (cos(pi * t / d) - 1) + b
		end
		local function outInSine(t, b, c, d)
			if t < d / 2 then
				return outSine(t * 2, b, c / 2, d)
			else
				return inSine((t * 2) -d, b + c / 2, c / 2, d)
			end
		end

		Ease.SineIn = function(val)
			return inSine(val, 0, 1, 1)
		end
		Ease.SineOut = function(val)
			return outSine(val, 0, 1, 1)
		end
		Ease.SineInOut = function(val)
			return inOutSine(val, 0, 1, 1)
		end
		Ease.SineOutIn = function(val)
			return outInSine(val, 0, 1, 1)
		end
		----------

		-- quad --
		local function inQuad(t, b, c, d)
			t = t / d
			return c * pow(t, 2) + b
		end
		local function outQuad(t, b, c, d)
			t = t / d
			return -c * t * (t - 2) + b
		end
		local function inOutQuad(t, b, c, d)
			t = t / d * 2
			if t < 1 then
				return c / 2 * pow(t, 2) + b
			else
				return -c / 2 * ((t - 1) * (t - 3) - 1) + b
			end
		end
		local function outInQuad(t, b, c, d)
			if t < d / 2 then
				return outQuad(t * 2, b, c / 2, d)
			else
				return inQuad((t * 2) - d, b + c / 2, c / 2, d)
			end
		end

		Ease.QuadIn = function(val)
			return inQuad(val, 0, 1, 1)
		end
		Ease.QuadOut = function(val)
			return outQuad(val, 0, 1, 1)
		end
		Ease.QuadInOut = function(val)
			return inOutQuad(val, 0, 1, 1)
		end
		Ease.QuadOutIn = function(val)
			return outInQuad(val, 0, 1, 1)
		end
		----------

		-- cubic --
		local function inCubic(t, b, c, d)
			t = t / d
			return c * pow(t, 3) + b
		end
		local function outCubic(t, b, c, d)
			t = t / d - 1
			return c * (pow(t, 3) + 1) + b
		end
		local function inOutCubic(t, b, c, d)
			t = t / d * 2
			if t < 1 then
				return c / 2 * t * t * t + b
			else
				t = t - 2
				return c / 2 * (t * t * t + 2) + b
			end
		end
		local function outInCubic(t, b, c, d)
			if t < d / 2 then
				return outCubic(t * 2, b, c / 2, d)
			else
				return inCubic((t * 2) - d, b + c / 2, c / 2, d)
			end
		end

		Ease.CubicIn = function(val)
			return inCubic(val, 0, 1, 1)
		end
		Ease.CubicOut = function(val)
			return outCubic(val, 0, 1, 1)
		end
		Ease.CubicInOut = function(val)
			return inOutCubic(val, 0, 1, 1)
		end
		Ease.CubicOutIn = function(val)
			return outInCubic(val, 0, 1, 1)
		end
		-----------

		-- quart --
		local function inQuart(t, b, c, d)
			t = t / d
			return c * pow(t, 4) + b
		end
		local function outQuart(t, b, c, d)
			t = t / d - 1
			return -c * (pow(t, 4) - 1) + b
		end
		local function inOutQuart(t, b, c, d)
			t = t / d * 2
			if t < 1 then
				return c / 2 * pow(t, 4) + b
			else
				t = t - 2
				return -c / 2 * (pow(t, 4) - 2) + b
			end
		end
		local function outInQuart(t, b, c, d)
			if t < d / 2 then
				return outQuart(t * 2, b, c / 2, d)
			else
				return inQuart((t * 2) - d, b + c / 2, c / 2, d)
			end
		end

		Ease.QuartIn = function(val)
			return inQuart(val, 0, 1, 1)
		end
		Ease.QuartOut = function(val)
			return outQuart(val, 0, 1, 1)
		end
		Ease.QuartInOut = function(val)
			return inOutQuart(val, 0, 1, 1)
		end
		Ease.QuartOutIn = function(val)
			return outInQuart(val, 0, 1, 1)
		end
		-----------

		-- quint --
		local function inQuint(t, b, c, d)
			t = t / d
			return c * pow(t, 5) + b
		end
		local function outQuint(t, b, c, d)
			t = t / d - 1
			return c * (pow(t, 5) + 1) + b
		end
		local function inOutQuint(t, b, c, d)
			t = t / d * 2
			if t < 1 then
				return c / 2 * pow(t, 5) + b
			else
				t = t - 2
				return c / 2 * (pow(t, 5) + 2) + b
			end
		end
		local function outInQuint(t, b, c, d)
			if t < d / 2 then
				return outQuint(t * 2, b, c / 2, d)
			else
				return inQuint((t * 2) - d, b + c / 2, c / 2, d)
			end
		end

		Ease.QuintIn = function(val)
			return inQuint(val, 0, 1, 1)
		end
		Ease.QuintOut = function(val)
			return outQuint(val, 0, 1, 1)
		end
		Ease.QuintInOut = function(val)
			return inOutQuint(val, 0, 1, 1)
		end
		Ease.QuintOutIn = function(val)
			return outInQuint(val, 0, 1, 1)
		end
		-----------

		-- Hytic --
		local function inHytic(t, b, c, d)
			t = t / d
			return c * pow(t, 6) + b
		end
		local function outHytic(t, b, c, d)
			t = t / d - 1
			return -c * (pow(t, 6) - 1) + b
		end
		local function inOutHytic(t, b, c, d)
			t = t / d * 2
			if t < 1 then
				return c / 2 * pow(t, 6) + b
			else
				t = t - 2
				return -c / 2 * (pow(t, 6) - 2) + b
			end
		end
		local function outInHytic(t, b, c, d)
			if t < d / 2 then
				return outHytic(t * 2, b, c / 2, d)
			else
				return inHytic((t * 2) - d, b + c / 2, c / 2, d)
			end
		end

		Ease.HyticIn = function(val)
			return inHytic(val, 0, 1, 1)
		end
		Ease.HyticOut = function(val)
			return outHytic(val, 0, 1, 1)
		end
		Ease.HyticInOut = function(val)
			return inOutHytic(val, 0, 1, 1)
		end
		Ease.HyticOutIn = function(val)
			return outInHytic(val, 0, 1, 1)
		end
		------------

		-- expo --
		local function inExpo(t, b, c, d)
			if t == 0 then
				return b
			else
				return c * pow(2, 10 * (t / d - 1)) + b - c * 0.001
			end
		end
		local function outExpo(t, b, c, d)
			if t == d then
				return b + c
			else
				return c * 1.001 * (-pow(2, -10 * t / d) + 1) + b
			end
		end
		local function inOutExpo(t, b, c, d)
			if t == 0 then return b end
			if t == d then return b + c end
			t = t / d * 2
			if t < 1 then
				return c / 2 * pow(2, 10 * (t - 1)) + b - c * 0.0005
			else
				t = t - 1
				return c / 2 * 1.0005 * (-pow(2, -10 * t) + 2) + b
			end
		end
		local function outInExpo(t, b, c, d)
			if t < d / 2 then
				return outExpo(t * 2, b, c / 2, d)
			else
				return inExpo((t * 2) - d, b + c / 2, c / 2, d)
			end
		end

		Ease.ExpoIn = function(val)
			return inExpo(val, 0, 1, 1)
		end
		Ease.ExpoOut = function(val)
			return outExpo(val, 0, 1, 1)
		end
		Ease.ExpoInOut = function(val)
			return inOutExpo(val, 0, 1, 1)
		end
		Ease.ExpoOutIn = function(val)
			return outInExpo(val, 0, 1, 1)
		end
		----------

		-- circ --
		local function inCirc(t, b, c, d)
			t = t / d
			return(-c * (sqrt(1 - pow(t, 2)) - 1) + b)
		end
		local function outCirc(t, b, c, d)
			t = t / d - 1
			return(c * sqrt(1 - pow(t, 2)) + b)
		end
		local function inOutCirc(t, b, c, d)
			t = t / d * 2
			if t < 1 then
				return -c / 2 * (sqrt(1 - t * t) - 1) + b
			else
				t = t - 2
				return c / 2 * (sqrt(1 - t * t) + 1) + b
			end
		end
		local function outInCirc(t, b, c, d)
			if t < d / 2 then
				return outCirc(t * 2, b, c / 2, d)
			else
				return inCirc((t * 2) - d, b + c / 2, c / 2, d)
			end
		end

		Ease.CircIn = function(val)
			return inCirc(val, 0, 1, 1)
		end
		Ease.CircOut = function(val)
			return outCirc(val, 0, 1, 1)
		end
		Ease.CircInOut = function(val)
			return inOutCirc(val, 0, 1, 1)
		end
		Ease.CircOutIn = function(val)
			return outInCirc(val, 0, 1, 1)
		end
		----------

		-- back --
		local function inBack(t, b, c, d, s)
			if not s then s = 1.70158 end
			t = t / d
			return c * t * t * ((s + 1) * t - s) + b
		end
		local function outBack(t, b, c, d, s)
			if not s then s = 1.70158 end
			t = t / d - 1
			return c * (t * t * ((s + 1) * t + s) + 1) + b
		end
		local function inOutBack(t, b, c, d, s)
			if not s then s = 1.70158 end
			s = s * 1.525
			t = t / d * 2
			if t < 1 then
				return c / 2 * (t * t * ((s + 1) * t - s)) + b
			else
				t = t - 2
				return c / 2 * (t * t * ((s + 1) * t + s) + 2) + b
			end
		end
		local function outInBack(t, b, c, d, s)
			if t < d / 2 then
				return outBack(t * 2, b, c / 2, d, s)
			else
				return inBack((t * 2) - d, b + c / 2, c / 2, d, s)
			end
		end

		Ease.BackIn = function(val, s)
			return inBack(val, 0, 1, 1, s)
		end
		Ease.BackOut = function(val, s)
			return outBack(val, 0, 1, 1, s)
		end
		Ease.BackInOut = function(val, s)
			return inOutBack(val, 0, 1, 1, s)
		end
		Ease.BackOutIn = function(val, s)
			return outInBack(val, 0, 1, 1, s)
		end
		----------

		-- bounce --
		local function outBounce(t, b, c, d)
			t = t / d
			if t < 1 / 2.75 then
				return c * (7.5625 * t * t) + b
			elseif t < 2 / 2.75 then
				t = t - (1.5 / 2.75)
				return c * (7.5625 * t * t + 0.75) + b
			elseif t < 2.5 / 2.75 then
				t = t - (2.25 / 2.75)
				return c * (7.5625 * t * t + 0.9375) + b
			else
				t = t - (2.625 / 2.75)
				return c * (7.5625 * t * t + 0.984375) + b
			end
		end
		local function inBounce(t, b, c, d)
			return c - outBounce(d - t, 0, c, d) + b
		end
		local function inOutBounce(t, b, c, d)
			if t < d / 2 then
				return inBounce(t * 2, 0, c, d) * 0.5 + b
			else
				return outBounce(t * 2 - d, 0, c, d) * 0.5 + c * .5 + b
			end
		end
		local function outInBounce(t, b, c, d)
			if t < d / 2 then
				return outBounce(t * 2, b, c / 2, d)
			else
				return inBounce((t * 2) - d, b + c / 2, c / 2, d)
			end
		end

		Ease.BounceIn = function(val)
			return inBounce(val, 0, 1, 1)
		end
		Ease.BounceOut = function(val)
			return outBounce(val, 0, 1, 1)
		end
		Ease.BounceInOut = function(val)
			return inOutBounce(val, 0, 1, 1)
		end
		Ease.BounceOutIn = function(val)
			return outInBounce(val, 0, 1, 1)
		end
		------------

		-- elastic --
		local function elastic_blend(t, c, d, a, s, f)
			if c ~= 0 then
				local t_ = abs(s)
				if a ~= 0 then
					f = f * (a / abs(c))
				else
					f = 0
				end
				if abs(t * d) < t_ then
					local l = abs(t * d) / t_
					f = (f * l) + (1 - l)
				end
			end
			return f
		end
		local function inElastic(t, b, c, d, a, p)
			local s
			local f = 1

			if t == 0 then return b end
			t = t / d
			if t == 1 then return b + c end
			t = t - 1
			if not p or p == 0 then p = d * 0.3 end
			if not a or a < abs(c) then
				s = p / 4
				f = elastic_blend(t, c, d, a, s, f)
				a = c
			else
				s = p / (2 * pi) * asin(c/a)
			end

			return (-f * (a * pow(2, 10 * t) * sin((t * d - s) * (2 * pi) / p))) + b
		end
		local function outElastic(t, b, c, d, a, p)
			local s
			local f = 1

			if t == 0 then return b end
			t = t / d
			if t == 1 then return b + c end
			t = -t
			if not p or p == 0 then p = d * 0.3 end
			if not a or a < abs(c) then
				s = p / 4
				f = elastic_blend(t, c, d, a, s, f)
				a = c
			else
				s = p / (2 * pi) * asin(c/a)
			end
			return (f * (a * pow(2, 10 * t) * sin((t * d - s) * (2 * pi) / p))) + c + b
		end
		local function inOutElastic(t, b, c, d, a, p)
			local s
			local f = 1

			if t == 0 then return b end
			t = t / (d / 2)
			if t == 2 then return b + c end
			t = t - 1
			if not p or p == 0 then p = d * (0.3 * 1.5) end
			if not a or a < abs(c) then
				s = p / 4
				f = elastic_blend(t, c, d, a, s, f)
				a = c
			else
				s = p / (2 * pi) * asin(c / a)
			end
			if t < 0 then
				f = f * -0.5
				return (f * (a * pow(2, 10 * t) * sin((t * d - s) * (2 * pi) / p))) + b
			else
				t = -t
				f = f * 0.5
				return (f * (a * pow(2, 10 * t) * sin((t * d - s) * (2 * pi) / p))) + c + b
			end
		end
		local function outInElastic(t, b, c, d, a, p)
			if t < d / 2 then
				return outElastic(t * 2, b, c / 2, d, a, p)
			else
				return inElastic((t * 2) - d, b + c / 2, c / 2, d, a, p)
			end
		end

		Ease.ElasticIn = function(val, a, p)
			return inElastic(val, 0, 1, 1, a, p)
		end
		Ease.ElasticOut = function(val, a, p)
			return outElastic(val, 0, 1, 1, a, p)
		end
		Ease.ElasticInOut = function(val, a, p)
			return inOutElastic(val, 0, 1, 1, a, p)
		end
		Ease.ElasticOutIn = function(val, a, p)
			return outInElastic(val, 0, 1, 1, a, p)
		end
		-------------
	end

	local function lerp(a,b,t)
		--assert(typeof(a)=="number","[1] Input a number please")
		--assert(typeof(b)=="number","[2] Input a number please")
		--assert(typeof(t)=="number","[3] Input a number please")
		return a+(b-a)*clamp(t,0,1)
	end


	local function invlerp(c,a,b)
		return clamp((c-a)/(b-a),-5,5)
	end

	local function lerpEase(a,b,t,easeType)
		--assert(typeof(a)=="number","[1] Input a number please")
		--assert(typeof(b)=="number","[2] Input a number please")
		--assert(typeof(t)=="number","[3] Input a number please")
		--assert(Ease[easeType]~=nil,"[4] "..tostring(easeType).." does not exist lol.")
		if Ease[easeType]~=nil then
			return a+(b-a)*Ease[easeType](t)
		else
			return a+(b-a)*Ease["Linear"](t)
		end
	end

	local function IsInBetween(Number,Min,Max)
		return Number > Min and Number < Max
	end

	--//MathFuncs
	b.min = min
	b.acos = acos
	b.deg = deg
	b.cos = cos
	b.asin = asin
	b.sin = sin
	b.abs = abs
	b.cf = cf
	b.cffm =cffm
	b.cfa = cfa
	b.cfo = cfo
	b.v3 = v3
	b.v2 = v2
	b.rad = rad
	b.exp = exp
	b.sign = sign
	b.pi = pi
	b.sqrt = sqrt
	b.tan = tan
	b.atan = atan
	b.atan2 = atan2
	b.clamp = clamp
	b.floor = floor
	b.ceil = ceil
	b.max = max
	--//OtherFuncs
	b.lerp = lerp
	b.invlerp = invlerp
	b.lerpEase = lerpEase
	b.IsBetween = IsInBetween
	--//Modules
	b.Ease = Ease
end

--//Animator
do
	local rs = game:GetService("RunService")
	
	local f = {}
	f.Sort = function (KFSWHATLOL)
		local Sorted = KFSWHATLOL:GetChildren()
		for i,v in pairs(Sorted) do if not v:IsA("Keyframe") then table.remove(Sorted,i) end end
		table.sort(Sorted,function(a,b)
			if a.Time < b.Time then return a end
		end)
		return Sorted
	end
	
	m.__index = m
	m.ClassName = "KeyframeHandler"

	m.new = function (KFS,Model,HighPriority)
		local self = setmetatable({
			PlaybackState = "Neutral",
			AnimationIsLooped = KFS.Loop,
			Listener = Instance.new("BindableEvent"),
			stateChanged = Instance.new("BindableEvent"),
			M6D = {},
			SecondaryM6D = {},
			Rcs = {}, --//RenderConnections
			Decoded = {},
			Do = nil,
			ClipDuration = 0,
			Speed = 1,
			Weight = 1,
			Damp = "Nah",
			DidDamp = false,
			dampstart = false,
			HighPriority = HighPriority,
			NumberOfKeyframes = 0,
		}, m)

		--//Decode
		local Sorted = f.Sort(KFS)	
		self.NumberOfKeyframes = #Sorted
		local LastKeyframe = nil
		for Number,Keyframe in pairs(Sorted) do

			local Poses = {}
			local IsEvent = tostring(Keyframe)~="Keyframe"

			if IsEvent then
				if not self.Decoded["Events"] then
					self.Decoded["Events"] = {}
				end
				self.Decoded["Events"][Number] = {
					["Time"] = Keyframe.Time,
					["Event"] = (IsEvent) and tostring(Keyframe) or nil
				}

			end

			for _,Pose in pairs(Keyframe:GetDescendants()) do
				if Pose:IsA("Pose") then
					if not self.Decoded[tostring(Pose)] then
						self.Decoded[tostring(Pose)] = {}
					end
					local prev = nil
					local c = 0
					local max = self.NumberOfKeyframes
					for i=1,max do
						if i%60==0 then
							rs.Heartbeat:Wait()
						end
						c = i
						prev = self.Decoded[tostring(Pose)][Number-i]
						if prev~=nil then break end
					end
					--print(prev)
					self.Decoded[tostring(Pose)][Number] = {
						["CFrame"] = Pose.CFrame,
						["EasingStyleDirection"] = tostring((Pose.EasingStyle.Name~="Linear" and Pose.EasingStyle.Name~="Constant") and Pose.EasingStyle.Name..Pose.EasingDirection.Name or Pose.EasingStyle.Name), 
						["Start"] = (prev) and prev.End or 0, --self.Decoded[tostring(Pose)][Number-1].End or 0,
						["End"] = Keyframe.Time
					}
				end	
			end

			LastKeyframe = Keyframe
		end

		--//getMotor6Ds
		local m6dAmount = 0
		local Processed = {}
		local ClonedM6ds = {}

		for i,v in pairs(Model:GetDescendants()) do
			if v:IsA("Motor6D") then
				local IsCloned = string.find(tostring(v),"//2")~=nil
				local Subbed = string.gsub(tostring(v),"//2","")
				Subbed = string.gsub(Subbed, "^%s+", "")
				Subbed = string.gsub(Subbed, "%s+$", "")
				if IsCloned then
					ClonedM6ds[Subbed] = true
				end
				m6dAmount+=1
				Processed[i] = v
			elseif v:IsA("Animator") then
				local tracks = v:GetPlayingAnimationTracks()
				for i = 1,#tracks do
					tracks[i]:Stop()
				end
				v:Destroy()
				
			end
		end
		
		for i,v in pairs(Processed) do
			local IsCloned = string.find(tostring(v),"//2")~=nil
			local Subbed = string.gsub(tostring(v),"//2","")
			Subbed = string.gsub(Subbed, "^%s+", "")
			Subbed = string.gsub(Subbed, "%s+$", "")
			local Similarity = ClonedM6ds[Subbed]~=nil

			if self.Decoded[tostring(v.Part1)] and not self.M6D[tostring(v)] then
				local IsUtilized = false
				for i=1,120 do
					if self.Decoded[tostring(v.Part1)][i] then
						IsUtilized = self.Decoded[tostring(v.Part1)][i].CFrame~=b.cf( 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
					end
					if IsUtilized or not self.Decoded[tostring(v.Part1)][i] then break end
					if i%60==0 then
						rs.Heartbeat:Wait()
					end
				end
				if IsUtilized then
					if self.HighPriority then	
						local OutCome = nil
						if not Similarity then
							OutCome = v:Clone()
							OutCome.Enabled = false
							OutCome.Name = tostring(v).." //2"
							OutCome.Parent = v.Parent
							self.M6D[tostring(v)] = OutCome
						elseif Similarity then
							OutCome = v
							self.M6D[Subbed] = OutCome
						end
					elseif not IsCloned then
						self.M6D[tostring(v)] = v
					end
				end
			end
		end

		self.ClipDuration = LastKeyframe.Time

		function self:Do(what,value)
			if what=="Play" and self.PlaybackState~="Play" then
				self.PlaybackState = "Play"
				self.stateChanged:Fire("Play")
				
				if self.HighPriority then
					for i,v in pairs(self.M6D) do
						local OriginalName = string.gsub(tostring(v),"//2","")
						OriginalName = string.gsub(OriginalName, "^%s+", "")
						OriginalName = string.gsub(OriginalName, "%s+$", "")

						local FindOG = v.Parent:FindFirstChild(OriginalName)

						v.Enabled = true
						rs.RenderStepped:Wait()
					end
				end

				for _,SelectedM6D in pairs(self.M6D) do
					local elapsed = 0
					local StartCF = self.Decoded[tostring(SelectedM6D.Part1)][1].CFrame
					local TargetCF = self.Decoded[tostring(SelectedM6D.Part1)][1].CFrame
					local TargetEasing = ""
					
					local StartTime = 0
					local TargetTime = 0

					local SelectedPos = 0

					if self.Rcs[tostring(SelectedM6D)]~=nil then
						self.Rcs[tostring(SelectedM6D)]:Disconnect()
						self.Rcs[tostring(SelectedM6D)] = nil
					end
					
					self.Rcs[tostring(SelectedM6D)] = rs.Heartbeat:Connect(function(dt)
						local Speed = (not self.DidDamp and self.Damp~="Nah" and self.dampstart~=false) and self.Speed*((tick()-self.dampstart)/self.Damp) or self.Speed

						local forward = b.sign(self.Speed)==1	
						elapsed = elapsed+b.abs(dt*Speed)
						
						if not forward then
							warn(self.ClipDuration-elapsed)
						end
						
						if (elapsed > self.ClipDuration) and not self.AnimationIsLooped or self.PlaybackState~="Play" then --//Bye bye
							if self.Rcs[tostring(SelectedM6D)] then
								self.Rcs[tostring(SelectedM6D)]:Disconnect()
								self.Rcs[tostring(SelectedM6D)] = nil
							end
						elseif (elapsed > self.ClipDuration) and self.AnimationIsLooped  then --//repeat...
							elapsed = 0+b.abs(dt*Speed)
							self.stateChanged:Fire("Looped")
						end	
						
						for i,v in pairs(self.Decoded[tostring(SelectedM6D.Part1)]) do
							local timecondition = nil
							if forward then
								timecondition = b.IsBetween(elapsed,v.Start,v.End)
							else
								timecondition = b.IsBetween(self.ClipDuration-elapsed,v.Start,v.End)
							end
							if typeof(v)~="Instance" and timecondition and SelectedPos~=i then
								SelectedPos = i
								StartCF = SelectedM6D.Transform
								TargetCF = v.CFrame

								if forward then
									StartTime = v.Start
									TargetTime = v.End
								else
									StartTime = v.End
									TargetTime = v.Start
								end

								TargetEasing = v.EasingStyleDirection
								break
							end
						end
					
						--//and this is where the magic happens
						local transform = nil
						if forward then
							transform = StartCF:lerp(TargetCF,b.lerpEase(0,1*self.Weight,b.invlerp(elapsed,StartTime,TargetTime),TargetEasing))
						else
							transform = StartCF:lerp(TargetCF,b.lerpEase(0,1*self.Weight,b.invlerp(self.ClipDuration-elapsed,StartTime,TargetTime),TargetEasing))
						end
						SelectedM6D.Transform = transform
					end)

				end

				local elapsed = 0
				local firedEvents = {}	

				if self.Rcs["timer"] then
					self.Rcs["timer"]:Disconnect()
					self.Rcs["timer"] = nil
					self.DidDamp = false
					self.dampstart = false
				end	

				self.Rcs["timer"] = rs.Heartbeat:Connect(function(dt)
					if not self.DidDamp and self.Damp~="Nah" and self.PlaybackState=="Play" then
						self.dampstart = (self.dampstart==false) and tick() or self.dampstart
						if ((tick()-self.dampstart)/self.Damp > 1) then
							self.DidDamp = true
						end
						return
					end
					
					local Speed = (not self.DidDamp and self.Damp~="Nah" and self.dampstart~=false) and self.Speed*((tick()-self.dampstart)/self.Damp) or self.Speed
					local forward = b.sign(Speed)==1	
					elapsed = elapsed+b.abs(dt*Speed)
					
					if self.Decoded["Events"] then
						for i,v in pairs(self.Decoded["Events"]) do
							if forward then
								if (elapsed > v["Time"]) and not firedEvents[v["Event"]] then
									self.Listener:Fire(v["Event"])
									firedEvents[v["Event"]] = true
								end
							else
								if (self.ClipDuration-elapsed < v["Time"]) and not firedEvents[v["Event"]] then
									self.Listener:Fire(v["Event"])
									firedEvents[v["Event"]] = true
								end
							end
						end
					end
					if (elapsed > self.ClipDuration) and not self.AnimationIsLooped or self.PlaybackState~="Play" then
						table.clear(firedEvents)
						self.Rcs["timer"]:Disconnect()
						self.Rcs["timer"] = nil
						self.PlaybackState = "Neutral"
						self.stateChanged:Fire("Neutral")
						self.DidDamp = false
						self.dampstart = false
						if self.HighPriority then
							for i,v in pairs(self.M6D) do
								v.Enabled = false
							end
						end
					elseif (elapsed > self.ClipDuration) and self.AnimationIsLooped then --//repeat...
						table.clear(firedEvents)
						elapsed = 0+(dt*self.Speed)
					end

				end)	

			elseif what=="Stop" then
				if self.PlaybackState~="Stop" then
					self.PlaybackState = "Neutral"
					self.stateChanged:Fire("Neutral")
					self.DidDamp = false
					self.dampstart = false
					for i,v in pairs(self.Rcs) do
						if v then
							v:Disconnect()
							self.Rcs[i] = nil
						end
					end
					if self.HighPriority then
						for i,v in pairs(self.M6D) do
							v.Enabled = false
						end
					end
				end
			elseif what=="SetSpeed" then	
				--assert(typeof(value)=="number","Must be a number dude.")
				self.Speed = b.clamp(value,-5,5)
			elseif what=="SetWeight" then
				--assert(typeof(value)=="number","Must be a number dude.")
				self.Weight = b.clamp(value,0,1)
			elseif what=="SetDamp" then
				--assert(typeof(value)=="number","Must be a number dude.")
				if value~="Nah" then
					self.Damp = b.max(0,value)
				else
					self.Damp = "Nah"
				end
			end
		end

		function self:Cleanup()
			for i,v in pairs(self) do
				if typeof(v)=="table" then
					if i=="Rcs" then
						for k2,k in pairs(v) do
							if k then
								k:Disconnect()
								self.Rcs[k2]=nil
							end
						end
						table.clear(v)
					else
						table.clear(v)
					end
				end
			end
			table.clear(self)
			return nil
		end

		return self
	end
end

return m