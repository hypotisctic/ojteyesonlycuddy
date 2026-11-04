loadstring(game:HttpGet('https://raw.githubusercontent.com/sametcetinkaya1447/planecrazy2/refs/heads/main/folder/pcutils.lua'))()

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local mouse = player:GetMouse()
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

local SETTINGS = {
	-- RU: длина сегментов ноги / EN: leg segment lengths / TR: bacak segment uzunlukları
	UpperLegLen = 7.5,
	LowerLegLen = 7.5,
	-- RU: высота тела над землёй / EN: body height above ground / TR: gövdenin yerden yüksekliği
	BodyHeight = 10,
	-- RU: на какое расстояние нога тянется от бедра в состоянии покоя / EN: how far a leg reaches from the hip at rest / TR: bacağın dinlenme halinde kalçadan ne kadar uzandığı
	LegRestLength = 5,

	-- RU: скорость ходьбы / EN: walking speed / TR: yürüme hızı
	WalkSpeed = 44,
	-- RU: скорость бега (Shift) / EN: running speed (Shift) / TR: koşma hızı (Shift)
	RunSpeed = 122,
	-- RU: скорость разворота корпуса к курсору / EN: body turn speed toward cursor / TR: gövdenin imleç yönüne dönme hızı
	RotationSpeed = 5,
	-- RU: скорость набора/сброса скорости / EN: speed up/slow down rate / TR: hızlanma/yavaşlama oranı
	Acceleration = 4,

	-- RU: минимальная/максимальная высота корпуса (Q/E) / EN: min/max body height (Q/E) / TR: min/maks gövde yüksekliği (Q/E)
	MinHeight = 2,
	MaxHeight = 10,
	-- RU: скорость изменения высоты по Q/E / EN: height change speed via Q/E / TR: Q/E ile yükseklik değişim hızı
	HeightChangeSpeed = 6,

	-- RU: максимальный наклон тела вверх/вниз при прицеливании / EN: max body tilt up/down while aiming / TR: nişan alırken maksimum yukarı/aşağı eğim
	MaxPitch = math.rad(20),
	-- RU: максимальный крен тела в стороны / EN: max body roll sideways / TR: maksimum yana yatış
	MaxRoll = math.rad(12),
	-- RU: скорость подстройки наклона/крена / EN: tilt/roll adjustment speed / TR: eğim/yatış ayarlanma hızı
	TiltSpeed = 3,

	-- RU: с какой дистанции нога начинает новый шаг / EN: distance that triggers a new step / TR: yeni bir adımı tetikleyen mesafe
	StepDistance = 5,
	-- RU: высота подъёма ноги при шаге / EN: leg lift height during a step / TR: adım sırasında bacak kaldırma yüksekliği
	StepHeight = 2.5,
	-- RU: длительность одного шага (сек) / EN: duration of one step (sec) / TR: bir adımın süresi (sn)
	StepDuration = 0.22,
	-- RU: насколько нога "перелетает" целевую точку шага / EN: how far the leg overshoots its step target / TR: bacağın hedef noktayı ne kadar aşacağı
	StepOvershoot = 1.4,

	-- RU: "характер" походки меха / EN: mech gait feel / TR: mekanik yürüyüş hissi
	-- RU: насколько ноги учитывают разворот корпуса при выборе точки шага / EN: how much legs account for body rotation when picking a step target / TR: bacakların adım hedefini seçerken gövde dönüşünü ne kadar hesaba katacağı
	TurnLeadStrength = 0.6,
	-- RU: доп. наклон корпуса (банкинг) при повороте / EN: extra body lean (banking) while turning / TR: dönerken ekstra gövde eğimi (banking)
	BodyTurnLean     = math.rad(6),
	-- RU: скорость подстройки наклона под уклон / EN: slope-tilt adjustment speed / TR: eğime uyum hızı
	SlopeTiltSpeed   = 6,
	-- RU: максимальный наклон корпуса под уклон / EN: maximum body tilt on a slope / TR: eğimde maksimum gövde eğimi
	MaxSlopeTilt     = math.rad(35),
	-- RU: насколько близко ноги подтянуты к корпусу в воздухе (0=под хипом, 1=как на земле) / EN: how close legs pull toward the body mid-air (0=under hip, 1=like on ground) / TR: havadayken bacakların gövdeye ne kadar yaklaştığı (0=kalça altı, 1=yerdeki gibi)
	LegFoldInward    = 0.35,
	-- RU: на сколько студов ноги опущены вниз в воздухе (прыжок/парашют) / EN: how many studs the legs drop down mid-air (jump/parachute) / TR: havadayken bacakların kaç stud aşağı ineceği (zıplama/paraşüt)
	LegFoldDrop      = 4.5,
	-- RU: глубина "стука" стопы при касании земли / EN: depth of the foot "thud" on landing / TR: ayağın yere değince yaptığı "vuruş" derinliği
	FootSettleBounce = 0.18,
	-- RU: время отскока стопы после шага / EN: foot bounce recovery time after a step / TR: adımdan sonra ayağın toparlanma süresi
	FootSettleTime   = 0.12,

	-- RU: голова / попа — крепление относительно центра тела, локальные координаты
	-- EN: head / butt — mounting relative to the body center, local coordinates
	-- TR: kafa / kuyruk — gövde merkezine göre bağlantı, yerel koordinatlar
	-- RU: вперёд и чуть выше центра / EN: forward and slightly above center / TR: merkezin önünde ve biraz yukarısında
	HeadMountOffset = Vector3.new(0, 2, -6),
	-- RU: назад от центра / EN: backward from center / TR: merkezin arkasında
	ButtMountOffset = Vector3.new(0, 1, 6),
	-- RU: покачивание "попы" при повороте корпуса / EN: butt sway while the body turns / TR: gövde dönerken kuyruğun sallanması
	TailSwaySpeed   = 0.04,

	-- RU: ракеты — запуск как у ЗРК: резкий выброс из тубуса → доворот на цель → полёт по дуге
	-- EN: rockets — SAM-style launch: sharp ejection from tube → turn toward target → arc flight
	-- TR: roketler — SAM tarzı fırlatma: tüpten sert çıkış → hedefe dönüş → yay şeklinde uçuş
	-- RU: маленький размер ракеты / EN: small rocket size / TR: küçük roket boyutu
	MissileSize       = Vector3.new(0.6, 0.6, 2.2),
	-- RU: на сколько студов ракета "выстреливается" из тубуса перед стартом / EN: how many studs the rocket ejects from the tube before launch / TR: fırlatmadan önce roketin tüpten kaç stud çıkacağı
	MissileBoostRise  = 30,
	-- RU: длительность фазы выброса (резкий вертикальный пуск) / EN: ejection phase duration (sharp vertical launch) / TR: çıkış aşamasının süresi (sert dikey fırlatma)
	MissileBoostTime  = 0.01,
	-- RU: время полёта до точки клика (быстрый полёт) / EN: flight time to the clicked point (fast flight) / TR: tıklanan noktaya uçuş süresi (hızlı uçuş)
	MissileFlightTime = 0.01,
	-- RU: высота дуги полёта (мин/макс клампится от дистанции) / EN: flight arc height (min/max clamped by distance) / TR: uçuş yayının yüksekliği (mesafeye göre min/maks sınırlı)
	MissileArcHeight  = 50,
	-- RU: задержка между пусками / EN: delay between launches / TR: fırlatmalar arası bekleme
	MissileCooldown   = 0.35,
	-- RU: на сколько паук клюёт вперёд/назад при выстреле / EN: how much the spider pitches on fire / TR: ateş ederken örümceğin ne kadar öne/arkaya eğileceği
	RecoilPitch       = math.rad(10),
	-- RU: сила отталкивания назад при выстреле / EN: backward push force on fire / TR: ateş ederken geriye itilme kuvveti
	RecoilPushBack    = 50,
	-- RU: скорость восстановления после отдачи / EN: recovery speed after recoil / TR: geri tepmeden sonra toparlanma hızı
	RecoilRecoverSpeed= 20,

	-- RU: рывок в сторону (двойное нажатие A/D) / EN: sideways dash (double-tap A/D) / TR: yana atılma (çift A/D)
	-- RU: сила бокового импульса рывка / EN: dash sideways impulse force / TR: atılma yan itki gücü
	DashPower          = 150,
	-- RU: окно двойного нажатия (сек) / EN: double-tap window (sec) / TR: çift tıklama penceresi (sn)
	DashDoubleTapWindow= 0.28,
	-- RU: задержка между рывками / EN: delay between dashes / TR: atılmalar arası bekleme
	DashCooldown       = 0.5,

	-- RU: танец (V) / EN: dance (V) / TR: dans (V)
	DanceEnabled = true,
	-- RU: крепление точки пуска относительно центра тела (у "попы") / EN: launch point mount relative to body center (near the butt) / TR: fırlatma noktasının gövde merkezine göre konumu (kuyruk tarafı)
	LaunchMountOffset = Vector3.new(0, 3, 7),

	-- RU: время удержания F для полной зарядки прыжка / EN: time holding F for a full jump charge / TR: tam zıplama şarjı için F'ye basılı tutma süresi
	JumpChargeTime = 0.5,
	-- RU: мин./макс. сила прыжка / EN: min/max jump power / TR: min/maks zıplama gücü
	JumpMinPower   = 90,
	JumpMaxPower   = 260,
	-- RU: горизонтальный импульс прыжка при полной зарядке / EN: horizontal jump impulse at full charge / TR: tam şarjda yatay zıplama itkisi
	JumpForward    = 700,
	-- RU: сила гравитации / EN: gravity strength / TR: yerçekimi gücü
	Gravity        = 180,
	-- RU: глубина "просадки" тела при приземлении / EN: body dip depth on landing / TR: yere inişte gövde çöküş derinliği
	LandSmashDip   = 1.5,
	-- RU: длительность просадки при приземлении / EN: landing dip duration / TR: iniş çöküş süresi
	LandSmashTime  = 0.25,

	-- RU: полёт (Z) / EN: flight (Z) / TR: uçuş (Z)
	-- RU: скорость горизонтального полёта / EN: horizontal flight speed / TR: yatay uçuş hızı
	FlySpeed         = 90,
	-- RU: скорость подъёма/спуска в полёте (Space/Shift) / EN: vertical flight speed (Space/Shift) / TR: uçuşta dikey hız (Space/Shift)
	FlyVerticalSpeed = 60,
	-- RU: скорость набора скорости в полёте / EN: flight acceleration rate / TR: uçuş hızlanma oranı
	FlyAcceleration  = 6,
	-- RU: максимальный запас топлива полёта / EN: max flight fuel / TR: maksimum uçuş yakıtı
	FlyFuelMax       = 100,
	-- RU: расход топлива/сек в полёте / EN: fuel drain per second while flying / TR: uçarken saniyede yakıt tüketimi
	FlyFuelDrain     = 12,
	-- RU: восстановление топлива/сек на земле / EN: fuel regen per second on the ground / TR: yerdeyken saniyede yakıt yenilenmesi
	FlyFuelRegen     = 8,

	-- RU: парашют (X) / EN: parachute (X) / TR: paraşüt (X)
	-- RU: макс. скорость падения с раскрытым куполом / EN: max fall speed with the canopy open / TR: kanopi açıkken maksimum düşüş hızı
	ParachuteFallSpeed = 12,
	-- RU: время "раскрытия" купола / EN: canopy deployment time / TR: kanopi açılma süresi
	ParachuteOpenTime  = 0.4,
	-- RU: горизонтальная скорость под куполом (как скоростной полёт) / EN: horizontal speed under the canopy (fast, flight-like) / TR: kanopi altında yatay hız (uçuş gibi hızlı)
	ParachuteDrift     = 220,
	-- RU: на сколько студов прятать купол под землю, когда не используется / EN: how deep to hide the canopy underground when unused / TR: kullanılmadığında kanopinin yer altına ne kadar gizleneceği
	ChuteHideDepth     = 30,

	-- (лазание по стенам убрано)

	-- RU: паутина (T) / EN: web (T) / TR: ağ (T)
	WebMaxRange       = 800,   -- RU: максимальная дальность паутины / EN: max web range / TR: maksimum ağ menzili
	WebSegmentLength  = 4,     -- RU: обычное расстояние между сегментами паутины / EN: normal spacing between web segments / TR: ağ segmentleri arası normal mesafe
	WebSize           = Vector3.new(0.3, 0.3, 2.4), -- RU: размер одного сегмента паутины / EN: size of one web segment / TR: bir ağ segmentinin boyutu
	WebReelSpeed      = 22,    -- RU: скорость подтягивания (E) / стравливания (Q) паутины / EN: reel-in (E) / let-out (Q) speed / TR: içeri (E) / dışarı (Q) sarma hızı
	WebMinLength      = 6,     -- RU: минимальная длина паутины (нельзя подтянуться ближе) / EN: minimum web length (can't reel in closer) / TR: minimum ağ uzunluğu (daha yakına çekilemez)
	WebDeploySpeed    = 260,   -- RU: скорость, с которой паутина "долетает" до точки зацепа / EN: speed at which the web line extends to the anchor / TR: ağın hedefe ulaşma hızı
	HeadShakeDuration = 0.6,   -- RU: длительность помахивания головой при неудачном пуске / EN: head-shake duration on a failed shot / TR: başarısız atışta baş sallama süresi
	HeadShakeSpeed    = 16,    -- RU: скорость помахивания головой / EN: head-shake speed / TR: baş sallama hızı
}

-- RU: если ниже этой скорости — "волновая" походка (по одной ноге, тяжело и солидно),
--     выше — трипод (по 3 ноги разом, быстрый бег)
-- EN: below this speed — "wave" gait (one leg at a time, heavy and deliberate),
--     above it — tripod gait (3 legs at once, fast run)
-- TR: bu hızın altında — "dalga" yürüyüşü (tek tek bacak, ağır ve kararlı),
--     üstünde — tripod yürüyüşü (aynı anda 3 bacak, hızlı koşu)
SETTINGS.GaitWaveThreshold = SETTINGS.WalkSpeed * 0.55

-- RU: если паук крутится на месте быстрее этого порога (рад/сек) — ноги переступают вслед за разворотом;
--     мелкое прицеливание мышью медленнее этого порога ноги игнорируют (остаются на месте)
-- EN: if the spider turns in place faster than this threshold (rad/sec) — legs step to follow the turn;
--     slow mouse-aim rotation below this threshold is ignored by the legs (they stay put)
-- TR: örümcek yerinde bu eşikten (rad/sn) daha hızlı dönerse — bacaklar dönüşü takip eder;
--     bu eşiğin altındaki yavaş fare nişan alma dönüşünü bacaklar yok sayar (yerinde kalır)
SETTINGS.TurnStepThreshold = 0.9



-- ── AIRCRAFT PARTS ──────────────────────────────────────────────
local characterName = player.Name
local myAircraft = workspace:FindFirstChild(characterName .. " Aircraft")
if not myAircraft then
	warn("Aircraft not found: " .. characterName .. " Aircraft")
end

-- Collect parts by your naming convention
-- fingerparts1 (black Posts)       → upper legs  (6 needed)
-- fingerparts2 (blue Posts)        → lower legs  (6 needed)
-- fingerparts3 (black SmallParts)  → feet        (6 needed)
-- torsopart (black BlockStd)       → body

local fingerparts1 = {} -- upper legs
local fingerparts2 = {} -- lower legs
local fingerparts3 = {} -- feet
local torsopart    = nil
local chutepart    = nil -- parachute canopy part (found by color)
local headpart     = nil -- голова (found by color)
local buttpart     = nil -- "попа"/хвост (found by color)
local launchpart   = nil -- точка вылета ракет (found by color)
local missileparts = {}  -- пул деталей-ракет (found by color)
local webparts     = {}  -- пул деталей-паутинок (found by color)

-- RU: цвета деталей в твоей сборке — поменяй под свои, если другие
-- EN: colors of the parts in your build — change these to match yours if different
-- TR: yapındaki parçaların renkleri — farklıysa kendi renklerinle değiştir
local CHUTE_COLOR   = Color3.fromRGB(1, 0, 0) -- RU: например красный / EN: e.g. red / TR: örn. kırmızı
local HEAD_COLOR    = Color3.fromRGB(0, 1, 0) -- RU: например зелёный / EN: e.g. green / TR: örn. yeşil
local BUTT_COLOR    = Color3.fromRGB(1, 1, 0) -- RU: например жёлтый / EN: e.g. yellow / TR: örn. sarı
local LAUNCH_COLOR  = Color3.fromRGB(2, 0, 2) -- RU: точка вылета ракет / EN: missile launch point / TR: füze fırlatma noktası
local MISSILE_COLOR = Color3.fromRGB(0, 2, 2) -- RU: сами детали-ракеты / EN: the missile parts themselves / TR: füze parçalarının kendisi
local WEB_COLOR     = Color3.fromRGB(235, 212, 228) -- RU: сами детали-паутинки / EN: the web segment parts / TR: ağ segmenti parçaları

if myAircraft then
	for _, v in pairs(myAircraft:GetDescendants()) do
		if v.Name == "Post" and v.Parent.Name == "Post" then
			if v.Color == Color3.fromRGB(0, 0, 0) then
				table.insert(fingerparts1, v)
			elseif v.Color == Color3.fromRGB(0, 0, 1) then
				table.insert(fingerparts2, v)
			end
		elseif v.Name == "Part" and v.Parent.Name == "SmallPart" and v.Color == Color3.fromRGB(0, 0, 0) then
			table.insert(fingerparts3, v)
		elseif v.Name == "BlockStd" and v.Parent.Name == "BlockStd" and v.Color == Color3.fromRGB(0, 0, 0) then
			if not torsopart then
				torsopart = v
			end
		elseif v:IsA("BasePart") and v.Color == CHUTE_COLOR then
			if not chutepart then
				chutepart = v
			end
		elseif v:IsA("BasePart") and v.Color == HEAD_COLOR then
			if not headpart then
				headpart = v
			end
		elseif v:IsA("BasePart") and v.Color == BUTT_COLOR then
			if not buttpart then
				buttpart = v
			end
		elseif v:IsA("BasePart") and v.Color == LAUNCH_COLOR then
			if not launchpart then
				launchpart = v
			end
		elseif v:IsA("BasePart") and v.Color == MISSILE_COLOR then
			table.insert(missileparts, v)
		elseif v:IsA("BasePart") and v.Color == WEB_COLOR then
			table.insert(webparts, v)
		end
	end
end

if not chutepart then
	warn("Parachute part not found (color " .. tostring(CHUTE_COLOR) .. ") — добавь деталь нужного цвета в сборку")
end
if not headpart then
	warn("Head part not found (color " .. tostring(HEAD_COLOR) .. ") — добавь деталь нужного цвета в сборку")
end
if not buttpart then
	warn("Butt part not found (color " .. tostring(BUTT_COLOR) .. ") — добавь деталь нужного цвета в сборку")
end
if not launchpart then
	warn("Launch part not found (color " .. tostring(LAUNCH_COLOR) .. ") — добавь деталь нужного цвета в сборку")
end
if #missileparts == 0 then
	warn("No missile parts found (color " .. tostring(MISSILE_COLOR) .. ") — добавь детали-ракеты нужного цвета в сборку")
end
if #webparts == 0 then
	warn("No web parts found (color " .. tostring(WEB_COLOR) .. ") — добавь детали-паутинки нужного цвета в сборку")
end

-- сжимаем ракеты до маленького размера
for _, mp in ipairs(missileparts) do
	mp.Size = SETTINGS.MissileSize
end

-- сжимаем паутинки, запоминаем их "родные" позиции в сборке и анкорим,
-- пока не используются — не будут находиться внутри паука, ждут своего часа на месте
local webPartOriginalCF = {}
for _, wp in ipairs(webparts) do
	wp.Size = SETTINGS.WebSize
	wp.CanCollide = false
	wp.CanQuery = false
	webPartOriginalCF[wp] = wp.CFrame
	wp.Anchored = true
end


-- Make all aircraft parts non-collide and zero gravity
if myAircraft then
	for _, part in pairs(myAircraft:GetDescendants()) do
		if part:IsA("BasePart") then
			part.CanCollide = false
			part.Anchored = false
			part.CanQuery = false
		end
	end
end

-- Ракеты остаются заанкорены на своих местах в сборке, пока не выстрелят —
-- не двигаются каждый кадр, переносятся к точке пуска только в момент выстрела
for _, mp in ipairs(missileparts) do
	mp.Anchored = true
end

-- Паутинки — та же история: общий цикл выше снял анкор со всех деталей сборки,
-- возвращаем его паутинкам, иначе они падают под гравитацией и reserveWebParts не находит ни одной
for _, wp in ipairs(webparts) do
	wp.Anchored = true
end

-- ── MOVER CACHE ──────────────────────────────────────────────────
local cachedMovers = {}

local function getMovers(part)
	if cachedMovers[part] then
		return cachedMovers[part].pos, cachedMovers[part].gyro
	end

	-- Zero-gravity counterforce
	local bf = Instance.new("BodyForce")
	bf.Name = "AntiGrav"
	bf.Force = Vector3.new(0, part:GetMass() * workspace.Gravity, 0)
	bf.Parent = part

	local bPos = Instance.new("BodyPosition")
	bPos.MaxForce = Vector3.new(1e6, 1e6, 1e6)
	bPos.P = 50000
	bPos.D = 800
	bPos.Parent = part

	local bGyro = Instance.new("BodyGyro")
	bGyro.MaxTorque = Vector3.new(1e6, 1e6, 1e6)
	bGyro.P = 30000
	bGyro.D = 500
	bGyro.Parent = part

	cachedMovers[part] = { pos = bPos, gyro = bGyro }
	return bPos, bGyro
end

local function updateMover(part, targetCF, offsetCF)
	if not part then return end
	local final = offsetCF and (targetCF * offsetCF) or targetCF
	local bPos, bGyro = getMovers(part)
	bPos.Position = final.Position
	bGyro.CFrame   = final
end

-- ── INVISIBLE PROXY MODEL ────────────────────────────────────────
local mechName = "Urgot_Mech"
if workspace:FindFirstChild(mechName) then workspace[mechName]:Destroy() end
local mechModel = Instance.new("Model")
mechModel.Name = mechName
mechModel.Parent = workspace

local function createPart(size, name)
	local p = Instance.new("Part")
	p.Size = size
	p.Anchored = true
	p.CanCollide = false
	p.CanQuery = false
	p.CastShadow = false
	p.Transparency = 1       -- invisible proxy
	p.Name = name
	p.Parent = mechModel
	return p
end

-- Body proxy (drives torsopart)
local Body = createPart(Vector3.new(8, 4, 9), "Body")

-- 6 leg proxies each: upper, lower, foot
local LEG_DATA = {
	{name="L_Front", group=0, hipOffset=Vector3.new(-5, -1.5, -6.5),  restDir=Vector3.new(-0.6, 0, -0.8).Unit},
	{name="L_Mid",   group=1, hipOffset=Vector3.new(-7, -1.5,  0),    restDir=Vector3.new(-1,   0,  0)},
	{name="L_Back",  group=0, hipOffset=Vector3.new(-5, -1.5,  6.5),  restDir=Vector3.new(-0.6, 0,  0.8).Unit},
	{name="R_Front", group=1, hipOffset=Vector3.new( 5, -1.5, -6.5),  restDir=Vector3.new( 0.6, 0, -0.8).Unit},
	{name="R_Mid",   group=0, hipOffset=Vector3.new( 7, -1.5,  0),    restDir=Vector3.new( 1,   0,  0)},
	{name="R_Back",  group=1, hipOffset=Vector3.new( 5, -1.5,  6.5),  restDir=Vector3.new( 0.6, 0,  0.8).Unit},
}

local legs = {}
for i, data in ipairs(LEG_DATA) do
	table.insert(legs, {
		data      = data,
		upper     = createPart(Vector3.new(1.4, SETTINGS.UpperLegLen, 1.4), data.name.."_Upper"),
		lower     = createPart(Vector3.new(1.0, SETTINGS.LowerLegLen, 1.0), data.name.."_Lower"),
		foot      = createPart(Vector3.new(1.8, 0.4, 2.2),                  data.name.."_Foot"),
		footPos   = Vector3.new(),
		idealPos  = Vector3.new(),
		stepStart = Vector3.new(),
		stepEnd   = Vector3.new(),
		stepAlpha = 1,
		stepping  = false,
		settling    = false,
		settleTimer = 0,
	})
end

-- ── TOOL ────────────────────────────────────────────────────────
local tool = Instance.new("Tool")
tool.Name = "Urgot Controller"
tool.RequiresHandle = false
tool.CanBeDropped = false
tool.Parent = player.Backpack

local isEquipped = false
tool.Equipped:Connect(function()
	isEquipped = true
	missileCounterLabel.Visible = true
end)
tool.Unequipped:Connect(function()
	isEquipped = false
	missileCounterLabel.Visible = false
end)

-- ── UI: счётчик ракет (следует за курсором, показывается справа от него) ──
local missileGui = Instance.new("ScreenGui")
missileGui.Name = "UrgotMissileCounter"
missileGui.ResetOnSpawn = false
missileGui.IgnoreGuiInset = false
missileGui.Parent = player:WaitForChild("PlayerGui")

local missileCounterLabel = Instance.new("TextLabel")
missileCounterLabel.Name = "MissileCounter"
missileCounterLabel.AnchorPoint = Vector2.new(0, 0.5)
missileCounterLabel.Position = UDim2.new(0, mouse.X + 26, 0, mouse.Y)
missileCounterLabel.Size = UDim2.new(0, 130, 0, 44)
missileCounterLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
missileCounterLabel.BackgroundTransparency = 0.35
missileCounterLabel.BorderSizePixel = 0
missileCounterLabel.Font = Enum.Font.GothamBold
missileCounterLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
missileCounterLabel.TextScaled = true
missileCounterLabel.Text = "🚀 0 / 0"
missileCounterLabel.Visible = false

local missileCounterCorner = Instance.new("UICorner")
missileCounterCorner.CornerRadius = UDim.new(0, 10)
missileCounterCorner.Parent = missileCounterLabel

missileCounterLabel.Parent = missileGui

local missileTotalCount = #missileparts

-- ── UI: подсказки по управлению (H — показать/скрыть, кнопка — сменить язык) ──
local helpTexts = {
	RU = {
		langLabel = "RU",
		title = "Управление",
		lines = {
			"WASD — движение",
			"Shift — бег (на парашюте: снижение)",
			"Q / E — высота корпуса (на паутине: вниз/вверх)",
			"F (удержать) — зарядка прыжка",
			"Z — переключить полёт",
			"X (в воздухе) — переключить парашют",
			"Ctrl (на парашюте) — подъём",
			"ЛКМ — выстрел ракетой",
			"Двойное A / D — рывок влево/вправо",
			"T (зажать) — прицелиться паутиной, (отпустить) — выстрел",
			"T на паутине — отпустить паутину",
			"V — танец",
			"H — показать/скрыть подсказку",
		},
	},
	EN = {
		langLabel = "EN",
		title = "Controls",
		lines = {
			"WASD — move",
			"Shift — run (while parachuting: descend)",
			"Q / E — body height (while on web: down/up)",
			"F (hold) — charge jump",
			"Z — toggle flight",
			"X (mid-air) — toggle parachute",
			"Ctrl (while parachuting) — ascend",
			"LMB — fire missile",
			"Double-tap A / D — dash left/right",
			"T (hold) — aim web, (release) — fire",
			"T while swinging — release web",
			"V — dance",
			"H — show/hide this help",
		},
	},
	TR = {
		langLabel = "TR",
		title = "Kontroller",
		lines = {
			"WASD — hareket",
			"Shift — koşu (paraşütteyken: iniş)",
			"Q / E — gövde yüksekliği (ağdayken: aşağı/yukarı)",
			"F (basılı tut) — zıplama doldur",
			"Z — uçuşu aç/kapat",
			"X (havadayken) — paraşütü aç/kapat",
			"Ctrl (paraşütteyken) — yükselme",
			"Sol tık — füze ateşle",
			"Çift A / D — sola/sağa atılma",
			"T (basılı tut) — ağ nişan al, (bırak) — ateşle",
			"Ağdayken T — ağı bırak",
			"V — dans",
			"H — bu yardımı göster/gizle",
		},
	},
}
local helpLangOrder = {"RU", "EN", "TR"}
local helpLangIndex = 1
local helpVisible = false

local helpGui = Instance.new("ScreenGui")
helpGui.Name = "UrgotHelpGui"
helpGui.ResetOnSpawn = false
helpGui.IgnoreGuiInset = false
helpGui.Parent = player:WaitForChild("PlayerGui")

local helpFrame = Instance.new("Frame")
helpFrame.Name = "HelpFrame"
helpFrame.AnchorPoint = Vector2.new(0, 0)
helpFrame.Position = UDim2.new(0, 20, 0, 20)
helpFrame.Size = UDim2.new(0, 340, 0, 430)
helpFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
helpFrame.BackgroundTransparency = 0.25
helpFrame.BorderSizePixel = 0
helpFrame.Visible = false
helpFrame.Parent = helpGui

local helpFrameCorner = Instance.new("UICorner")
helpFrameCorner.CornerRadius = UDim.new(0, 12)
helpFrameCorner.Parent = helpFrame

local helpTitle = Instance.new("TextLabel")
helpTitle.Name = "Title"
helpTitle.BackgroundTransparency = 1
helpTitle.Position = UDim2.new(0, 14, 0, 8)
helpTitle.Size = UDim2.new(1, -80, 0, 28)
helpTitle.Font = Enum.Font.GothamBold
helpTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
helpTitle.TextScaled = true
helpTitle.TextXAlignment = Enum.TextXAlignment.Left
helpTitle.Text = helpTexts.RU.title
helpTitle.Parent = helpFrame

local helpLangButton = Instance.new("TextButton")
helpLangButton.Name = "LangButton"
helpLangButton.AnchorPoint = Vector2.new(1, 0)
helpLangButton.Position = UDim2.new(1, -10, 0, 8)
helpLangButton.Size = UDim2.new(0, 56, 0, 28)
helpLangButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
helpLangButton.Font = Enum.Font.GothamBold
helpLangButton.TextColor3 = Color3.fromRGB(255, 255, 255)
helpLangButton.TextScaled = true
helpLangButton.Text = helpTexts.RU.langLabel
helpLangButton.AutoButtonColor = true
helpLangButton.Parent = helpFrame

local helpLangButtonCorner = Instance.new("UICorner")
helpLangButtonCorner.CornerRadius = UDim.new(0, 8)
helpLangButtonCorner.Parent = helpLangButton

local helpBody = Instance.new("TextLabel")
helpBody.Name = "Body"
helpBody.BackgroundTransparency = 1
helpBody.Position = UDim2.new(0, 14, 0, 44)
helpBody.Size = UDim2.new(1, -28, 1, -54)
helpBody.Font = Enum.Font.Gotham
helpBody.TextColor3 = Color3.fromRGB(230, 230, 230)
helpBody.TextSize = 14
helpBody.TextWrapped = true
helpBody.TextXAlignment = Enum.TextXAlignment.Left
helpBody.TextYAlignment = Enum.TextYAlignment.Top
helpBody.Text = table.concat(helpTexts.RU.lines, "\n")
helpBody.Parent = helpFrame

local function refreshHelpText()
	local lang = helpTexts[helpLangOrder[helpLangIndex]]
	helpTitle.Text = lang.title
	helpLangButton.Text = lang.langLabel
	helpBody.Text = table.concat(lang.lines, "\n")
end

helpLangButton.MouseButton1Click:Connect(function()
	helpLangIndex = helpLangIndex % #helpLangOrder + 1
	refreshHelpText()
end)

-- ── GROUP STEPPING ───────────────────────────────────────────────
local GROUP        = { [0]={1,5,3}, [1]={4,2,6} }
local groupActive  = { [0]=false, [1]=false }

-- ── STATE ────────────────────────────────────────────────────────
local spawnOffset   = rootPart.CFrame.RightVector * 12
local targetHeight  = SETTINGS.BodyHeight
local currentHeight = SETTINGS.BodyHeight
local mechPos       = rootPart.Position + spawnOffset + Vector3.new(0, currentHeight, 0)
local mechRot       = 0
local currentPitch  = 0
local currentRoll   = 0
local velocity      = Vector3.new()
local headYaw       = 0
local headPitch     = 0
local groundY       = mechPos.Y - currentHeight
local smoothGroundY = groundY
local isAirborne    = false
local vertVel       = 0
local jumpCharge    = 0
local isCharging    = false
local landDipTimer  = 0
local chargeCrouch  = 0

-- flight / parachute state
local isFlying       = false
local flightFuel     = SETTINGS.FlyFuelMax
local isParachuting  = false
local isDancing       = false -- режим танца (C)
local chuteOpenAlpha = 0
local chuteHidePos   = nil -- последняя известная позиция купола под землёй

-- gait state
local prevMechRot = mechRot
local slopePitch = 0 -- наклон корпуса вперёд/назад от уклона поверхности
local slopeRoll  = 0 -- наклон корпуса влево/вправо от уклона поверхности
local turnRate    = 0
local waveOrder = {1, 4, 2, 5, 3, 6} -- L_Front, R_Front, L_Mid, R_Mid, L_Back, R_Back — порядок волновой походки
local waveIdx   = 1
local moveInputHeld = false -- держит ли игрок WASD (для фиксации ног при простом осмотре)

-- recoil / dash state
local recoilPulse = 0 -- 1 сразу после выстрела, плавно затухает к 0
local dashCooldownTimer = 0
local lastTapTime = {A = 0, D = 0}

-- web-swing state
local isWebSwinging   = false
local isAimingWeb     = false -- RU: паук поднял попу и целится, ждём отпускания T / EN: butt raised and aiming, waiting for T release / TR: kuyruk kalktı, T bırakılması bekleniyor
local webAimCurlAlpha = 0 -- RU: 0..1, плавность "поджатия" попы перед броском паутины / EN: 0..1, smoothness of the butt curling in before a web throw / TR: 0..1, ağ atmadan önce kuyruğun büzülme yumuşaklığı
local webAnchor       = Vector3.new()
local webAnchorPart       = nil -- RU: деталь, за которую зацепилась паутина (если есть) / EN: the part the web is attached to (if any) / TR: ağın bağlandığı parça (varsa)
local webAnchorLocalOffset = Vector3.new() -- RU: точка зацепа в локальных координатах этой детали / EN: anchor point in that part's local space / TR: bu parçanın yerel koordinatlarında bağlanma noktası
local webLength       = 0
local webVelocity     = Vector3.new() -- полная 3D-скорость во время качания (объединяет velocity+vertVel)
local webActiveParts  = {} -- какие детали-паутинки сейчас используются для текущей линии
local webSwingTimer   = 0  -- RU: защита от мгновенного авто-приземления сразу после зацепа / EN: guard against instant auto-land right after attaching / TR: bağlandıktan hemen sonra anlık iniş algılamasına karşı koruma
local webLeftGround   = false -- RU: паук реально успел оторваться от земли после зацепа / EN: the spider has actually left the ground since attaching / TR: örümcek bağlandıktan sonra gerçekten yerden ayrıldı
local headShakeTimer  = 0

-- missile state
local missileState = {} -- missileState[part] = {status="idle"/"boost"/"fly", t, startPos, startCF, controlPos, targetPos, flightStart}
for _, mp in ipairs(missileparts) do
	missileState[mp] = {status = "idle"}
end
local missileCooldownTimer = 0
local launchWorldCF = CFrame.new(mechPos)

local function getIdleMissile()
	local idle = {}
	for _, mp in ipairs(missileparts) do
		if missileState[mp].status == "idle" then
			table.insert(idle, mp)
		end
	end
	if #idle == 0 then return nil end
	return idle[math.random(1, #idle)]
end

local function playMissileSound()
	if not launchpart then return end
	local snd = Instance.new("Sound")
	snd.SoundId = SETTINGS.MissileSoundId
	snd.Volume = 1
	snd.Parent = launchpart
	snd:Play()
	game:GetService("Debris"):AddItem(snd, 5)
end

local function fireMissile(targetPos)
	if not launchpart then return end
	if missileCooldownTimer > 0 then return end
	local mp = getIdleMissile()
	if not mp then return end

	-- переносим ракету из места её стоянки в сборке к точке пуска у "попы" и снимаем анкор,
	-- дальше ей управляют BodyPosition/BodyGyro как обычно
	mp.Anchored = false
	mp.CFrame = launchWorldCF

	local st = missileState[mp]
	st.status    = "boost"
	st.t         = 0
	st.startCF   = launchWorldCF
	st.startPos  = launchWorldCF.Position
	st.targetPos = targetPos

	-- контрольная точка дуги (апекс) — как у ЗРК, ракета набирает высоту перед пикированием на цель
	local dist  = (targetPos - st.startPos).Magnitude
	local arcH  = math.clamp(dist * 0.18, 4, SETTINGS.MissileArcHeight)
	st.controlPos = (st.startPos + targetPos) / 2 + Vector3.new(0, arcH, 0)

	-- отдача: паук клюёт корпусом и его толкает назад
	recoilPulse = 1
	local fwd = CFrame.Angles(0, mechRot, 0).LookVector
	velocity = velocity - fwd * SETTINGS.RecoilPushBack

	playMissileSound()
	missileCooldownTimer = SETTINGS.MissileCooldown
end

-- ── HELPERS ──────────────────────────────────────────────────────
local rayParams = RaycastParams.new()
rayParams.FilterDescendantsInstances = {character, mechModel, myAircraft}

local function groundRaycast(pos)
	local res = workspace:Raycast(Vector3.new(pos.X, pos.Y + 20, pos.Z), Vector3.new(0, -200, 0), rayParams)
	return res and res.Position.Y or (pos.Y - 50)
end

-- то же самое, но без фолбэка: nil, если земли реально нет под пауком
local function rawGroundY(pos)
	local res = workspace:Raycast(Vector3.new(pos.X, pos.Y + 20, pos.Z), Vector3.new(0, -500, 0), rayParams)
	return res and res.Position.Y or nil
end

local function floorRaycast(pos)
	local res = workspace:Raycast(pos + Vector3.new(0, 10, 0), Vector3.new(0, -35, 0), rayParams)
	return res and res.Position or Vector3.new(pos.X, groundY, pos.Z)
end

-- нормаль поверхности под пауком (для наклона корпуса под уклон)
local function groundNormal(pos)
	local res = workspace:Raycast(Vector3.new(pos.X, pos.Y + 20, pos.Z), Vector3.new(0, -200, 0), rayParams)
	return res and res.Normal or Vector3.new(0, 1, 0)
end

-- рейкаст в произвольном направлении на заданную дистанцию (для паутины)
local function raycastDir(origin, dir, maxDist)
	if dir.Magnitude < 0.001 then return nil end
	return workspace:Raycast(origin, dir.Unit * maxDist, rayParams)
end

local function positionLimbProxy(part, p0, p1)
	local dir = p1 - p0
	local safeUp = Vector3.new(0, 1, 0)
	if dir.Magnitude > 0.001 and math.abs(dir.Unit:Dot(safeUp)) > 0.99 then
		safeUp = Vector3.new(1, 0, 0)
	end
	part.CFrame = CFrame.lookAt((p0 + p1) / 2, p1, safeUp) * CFrame.Angles(math.pi/2, 0, 0)
end

local function lerpAngle(a, b, t)
	return a + math.atan2(math.sin(b - a), math.cos(b - a)) * t
end

local function solveIK(hip, foot, l1, l2, forwardVec)
	local dist  = math.clamp((foot - hip).Magnitude, 0.1, l1 + l2 - 0.01)
	local alpha = math.acos(math.clamp((l1^2 + dist^2 - l2^2) / (2*l1*dist), -1, 1))
	local linePos  = hip + (foot - hip).Unit * (math.cos(alpha) * l1)
	local legAxis  = (foot - hip).Unit
	local rightAxis = legAxis:Cross(forwardVec)
	if rightAxis.Magnitude < 0.001 then rightAxis = Vector3.new(1,0,0) end
	rightAxis = rightAxis.Unit
	return linePos + rightAxis:Cross(legAxis).Unit * (math.sin(alpha) * l1)
end

-- Init feet positions
mechPos = Vector3.new(mechPos.X, groundRaycast(mechPos) + currentHeight, mechPos.Z)
groundY = mechPos.Y - currentHeight
smoothGroundY = groundY
for _, leg in ipairs(legs) do
	leg.footPos = mechPos + leg.data.restDir * SETTINGS.LegRestLength
	leg.footPos = floorRaycast(leg.footPos)
end

-- Прячем купол парашюта под землю сразу при старте
do
	local startGY = rawGroundY(mechPos)
	if startGY and chutepart then
		chuteHidePos = Vector3.new(mechPos.X, startGY - SETTINGS.ChuteHideDepth, mechPos.Z)
		updateMover(chutepart, CFrame.new(chuteHidePos) * CFrame.Angles(0, mechRot, 0))
	end
end

-- ── OFFSETS for aircraft parts ───────────────────────────────────
-- RU: подстрой эти значения, если твои детали смещены от центра прокси
-- EN: tweak these if your parts are offset from the proxy center
-- TR: parçaların proxy merkezine göre kaymışsa bunları ayarla
local BODY_OFFSET  = CFrame.new(0, 0, 0)
local UPPER_OFFSET = CFrame.new(0, 0, 0)
local LOWER_OFFSET = CFrame.new(0, 0, 0)
local FOOT_OFFSET  = CFrame.new(0, 0, 0)
local CHUTE_OFFSET = CFrame.new(0, 0, 0) -- RU: смещение купола относительно центра паука над телом / EN: canopy offset relative to spider center above the body / TR: kanopinin gövde üstündeki örümcek merkezine göre kayması
local HEAD_OFFSET  = CFrame.new(0, 0, 0) -- RU: поправь, если деталь головы смещена от своего "нуля" / EN: adjust if the head part is offset from its own "zero" / TR: kafa parçası kendi "sıfır" noktasından kaymışsa düzelt
local BUTT_OFFSET  = CFrame.new(0, 0, 0) -- RU: поправь, если деталь попы смещена от своего "нуля" / EN: adjust if the butt part is offset from its own "zero" / TR: kuyruk parçası kendi "sıfır" noktasından kaymışsa düzelt
local LAUNCH_OFFSET = CFrame.new(0, 0, 0) -- RU: поправь, если точка вылета смещена от своего "нуля" / EN: adjust if the launch point is offset from its own "zero" / TR: fırlatma noktası kendi "sıfır" noktasından kaymışsa düzelt

-- RU: рывок влево/вправо (двойное нажатие A/D) / EN: sideways dash (double-tap A/D) / TR: yana atılma (çift A/D)
local function tryDash(dir) -- RU: dir = -1 (влево) или 1 (вправо) / EN: dir = -1 (left) or 1 (right) / TR: dir = -1 (sol) veya 1 (sağ)
	if not isEquipped or isAirborne or isFlying or isParachuting or isDancing then return end
	if dashCooldownTimer > 0 then return end
	local rightVec = CFrame.Angles(0, mechRot, 0).RightVector
	velocity = velocity + rightVec * dir * SETTINGS.DashPower
	dashCooldownTimer = SETTINGS.DashCooldown
end

-- ── WEB SWING ───────────────────────────────────────────────────
local function triggerHeadShake()
	headShakeTimer = SETTINGS.HeadShakeDuration
end

-- возвращает все задействованные паутинки на их "родные" места в сборке
local function clearWebLine()
	for _, wp in ipairs(webActiveParts) do
		local orig = webPartOriginalCF[wp]
		if orig then
			wp.CFrame = orig
		end
		wp.Anchored = true
	end
	webActiveParts = {}
end

-- забираем нужное количество свободных паутинок из пула (они пока стояли на своих местах)
local function reserveWebParts(desiredCount)
	local picked = {}
	for _, wp in ipairs(webparts) do
		if wp.Anchored then
			table.insert(picked, wp)
			if #picked >= desiredCount then break end
		end
	end
	for _, wp in ipairs(picked) do
		wp.Anchored = false
	end
	return picked
end

-- каждый кадр расставляет уже занятые паутинки вдоль текущей линии паук → точка зацепа;
-- если партов не хватает на всю длину — расстояние между ними просто увеличивается
local function updateWebLineVisual(originPos, anchorPos)
	local n = #webActiveParts
	if n == 0 then return end
	local diff = anchorPos - originPos
	local dist = diff.Magnitude
	if dist < 0.01 then return end
	local dir = diff / dist

	-- безопасный "верх" для CFrame.lookAt: если паутина почти вертикальна,
	-- дефолтный up (0,1,0) даёт сингулярность (крен сегмента дёргается/ломается)
	local safeUp = Vector3.new(0, 1, 0)
	if math.abs(dir:Dot(safeUp)) > 0.99 then
		safeUp = Vector3.new(1, 0, 0)
	end

	local spacing = dist / n
	for i, wp in ipairs(webActiveParts) do
		local segPos = originPos + dir * (spacing * (i - 0.5))
		updateMover(wp, CFrame.lookAt(segPos, segPos + dir, safeUp))
	end
end

local function releaseWeb()
	if not isWebSwinging then return end
	isWebSwinging = false
	-- переносим накопленную скорость качания обратно в обычную физику падения (инерция сохраняется)
	velocity = Vector3.new(webVelocity.X, 0, webVelocity.Z)
	vertVel  = webVelocity.Y
	isAirborne = true
	webAnchorPart = nil
	clearWebLine()
end

-- RU: T — выстрел паутиной в точку targetPos (или отпустить, если уже качаемся)
-- EN: T — shoot a web at targetPos (or release, if already swinging)
-- TR: T — targetPos'a ağ at (zaten sallanıyorsa bırak)
local function fireWeb(targetPos)
	if isWebSwinging then
		releaseWeb()
		return
	end
	if not launchpart then return end

	-- цель должна быть выше паука — нельзя пульнуть в землю и притянуться к ней
	if targetPos.Y <= mechPos.Y + 1 then
		triggerHeadShake()
		return
	end

	-- разворачиваем корпус лицом к цели, даже если цель сзади
	local dirFlat = Vector3.new(targetPos.X - mechPos.X, 0, targetPos.Z - mechPos.Z)
	if dirFlat.Magnitude > 0.01 then
		mechRot = math.atan2(-dirFlat.X, -dirFlat.Z)
	end

	local origin = launchWorldCF.Position
	local dir = targetPos - origin
	if dir.Magnitude < 0.01 then
		triggerHeadShake()
		return
	end

	local hit = raycastDir(origin, dir, SETTINGS.WebMaxRange)
	if not hit or hit.Position.Y <= mechPos.Y + 1 then
		triggerHeadShake()
		return
	end

	-- зацепились!
	webAnchor = hit.Position
	webLength = math.max((webAnchor - origin).Magnitude, SETTINGS.WebMinLength)

	-- если зацепились за реальную деталь (не Terrain) — запоминаем локальную точку на ней,
	-- чтобы каждый кадр пересчитывать точку крепления и паутина тянула паука вслед за движением этой детали
	if hit.Instance and hit.Instance:IsA("BasePart") then
		webAnchorPart = hit.Instance
		webAnchorLocalOffset = webAnchorPart.CFrame:PointToObjectSpace(hit.Position)
	else
		webAnchorPart = nil
	end

	-- сохраняем текущую скорость как импульс качания — если паук был в прыжке/полёте,
	-- эта инерция даст естественное покачивание на натянутой паутине
	webVelocity = Vector3.new(velocity.X, vertVel, velocity.Z)

	local desiredCount = math.max(2, math.floor(webLength / SETTINGS.WebSegmentLength))
	webActiveParts = reserveWebParts(desiredCount)

	isWebSwinging  = true
	webSwingTimer  = 0
	webLeftGround  = false
	isAirborne     = false
	isFlying       = false
	isParachuting  = false
	isDancing      = false
end

-- ── INPUT: flight / parachute toggles ─────────────────────────────
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed or not isEquipped then return end

	if input.KeyCode == Enum.KeyCode.Z then
		if isParachuting then return end
		isFlying = not isFlying
		if isFlying then
			isAirborne = true
			vertVel = 0
		end

	elseif input.KeyCode == Enum.KeyCode.X then
		if isFlying then return end
		if isAirborne then
			isParachuting = not isParachuting
			if isParachuting then
				chuteOpenAlpha = 0
				vertVel = math.min(vertVel, 0) -- гасим остаточный взлётный импульс вверх
			end
		elseif isParachuting then
			isParachuting = false
		end

	elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
		fireMissile(mouse.Hit.Position)

	elseif input.KeyCode == Enum.KeyCode.T then
		if isWebSwinging then
			releaseWeb()
		else
			isAimingWeb = true
		end

	elseif input.KeyCode == Enum.KeyCode.A then
		local now = tick()
		if now - lastTapTime.A < SETTINGS.DashDoubleTapWindow then
			tryDash(-1)
			lastTapTime.A = 0
		else
			lastTapTime.A = now
		end

	elseif input.KeyCode == Enum.KeyCode.D then
		local now = tick()
		if now - lastTapTime.D < SETTINGS.DashDoubleTapWindow then
			tryDash(1)
			lastTapTime.D = 0
		else
			lastTapTime.D = now
		end

	elseif input.KeyCode == Enum.KeyCode.V then
		if SETTINGS.DanceEnabled and not isAirborne and not isFlying and not isParachuting then
			isDancing = not isDancing
			if isDancing then
				velocity = Vector3.new()
			end
		end

	elseif input.KeyCode == Enum.KeyCode.H then
		helpVisible = not helpVisible
		helpFrame.Visible = helpVisible
	end
end)

-- RU: отпустили T во время прицеливания — стреляем паутиной по текущей точке под курсором
-- EN: released T while aiming — fire the web at the current point under the cursor
-- TR: nişan alırken T bırakıldı — imlecin altındaki noktaya ağ fırlat
UserInputService.InputEnded:Connect(function(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.T and isAimingWeb then
		isAimingWeb = false
		fireWeb(mouse.Hit.Position)
	end
end)

-- ── MAIN LOOP ────────────────────────────────────────────────────
RunService.RenderStepped:Connect(function(dt)
	local targetVel    = Vector3.new()
	local currentSpeed = SETTINGS.WalkSpeed
	moveInputHeld = false

	if dashCooldownTimer > 0 then
		dashCooldownTimer = math.max(dashCooldownTimer - dt, 0)
	end

	-- INPUT
	local fHeld = isEquipped and UserInputService:IsKeyDown(Enum.KeyCode.F)

	if isEquipped then
		if not isAirborne and not isDancing and not isWebSwinging then
			if UserInputService:IsKeyDown(Enum.KeyCode.Q) then
				targetHeight = math.max(SETTINGS.MinHeight, targetHeight - SETTINGS.HeightChangeSpeed * dt)
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.E) then
				targetHeight = math.min(SETTINGS.MaxHeight, targetHeight + SETTINGS.HeightChangeSpeed * dt)
			end
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
			currentSpeed = SETTINGS.RunSpeed
		end

		if not isDancing then
			local dirToMouse = mouse.Hit.Position - mechPos
			mechRot = lerpAngle(mechRot, math.atan2(-dirToMouse.X, -dirToMouse.Z), dt * SETTINGS.RotationSpeed)
			local hDist = Vector2.new(dirToMouse.X, dirToMouse.Z).Magnitude
			currentPitch = lerpAngle(currentPitch,
				math.clamp(math.atan2(dirToMouse.Y, hDist), -SETTINGS.MaxPitch, SETTINGS.MaxPitch),
				dt * SETTINGS.TiltSpeed)

			local bodyCFFlat = CFrame.new(mechPos) * CFrame.Angles(0, mechRot, 0)
			local localDir = bodyCFFlat:VectorToObjectSpace(dirToMouse)
			headYaw   = lerpAngle(headYaw,   math.atan2(-localDir.X, -localDir.Z), dt * 8)
			headPitch = lerpAngle(headPitch,
				math.clamp(math.atan2(localDir.Y, Vector2.new(localDir.X, localDir.Z).Magnitude), math.rad(-40), math.rad(40)),
				dt * 8)
		end

		-- RU: помахивание головой при неудачном пуске паутины (перекрывает обычное прицеливание)
		-- EN: head shake on a failed web shot (overrides normal aim tracking)
		-- TR: başarısız ağ atışında baş sallama (normal nişan takibini geçersiz kılar)
		if headShakeTimer > 0 then
			headShakeTimer = math.max(headShakeTimer - dt, 0)
			headYaw = math.sin(tick() * SETTINGS.HeadShakeSpeed) * math.rad(35)
		end

		if not isAirborne and not isFlying and not isParachuting and not isDancing and not isWebSwinging then
			local fwd   = CFrame.Angles(0, mechRot, 0).LookVector
			local right = CFrame.Angles(0, mechRot, 0).RightVector
			local inputDir = Vector3.new()
			if UserInputService:IsKeyDown(Enum.KeyCode.W) then inputDir += fwd   end
			if UserInputService:IsKeyDown(Enum.KeyCode.S) then inputDir -= fwd   end
			if UserInputService:IsKeyDown(Enum.KeyCode.A) then inputDir -= right end
			if UserInputService:IsKeyDown(Enum.KeyCode.D) then inputDir += right end
			if inputDir.Magnitude > 0 then
				targetVel = inputDir.Unit * currentSpeed
				moveInputHeld = true
			end
		end

		-- Jump charge (disabled while flying/parachuting/dancing/climbing/swinging)
		if not isFlying and not isParachuting and not isDancing and not isWebSwinging then
			if fHeld and not isAirborne then
				isCharging = true
				jumpCharge = math.min(jumpCharge + dt / SETTINGS.JumpChargeTime, 1)
			elseif isCharging and not fHeld and not isAirborne then
				isCharging = false
				isAirborne = true
				local power = SETTINGS.JumpMinPower + (SETTINGS.JumpMaxPower - SETTINGS.JumpMinPower) * jumpCharge
				vertVel = power
				local fwd = CFrame.Angles(0, mechRot, 0).LookVector
				velocity = velocity + fwd * (SETTINGS.JumpForward * jumpCharge)
				jumpCharge = 0
			elseif not fHeld then
				isCharging = false
				jumpCharge = math.max(jumpCharge - dt * 3, 0)
			end
		end
	else
		currentPitch = lerpAngle(currentPitch, 0, dt * SETTINGS.TiltSpeed)
		currentRoll  = lerpAngle(currentRoll,  0, dt * SETTINGS.TiltSpeed)
		headYaw      = lerpAngle(headYaw,   0, dt * 4)
		headPitch    = lerpAngle(headPitch, 0, dt * 4)
		isCharging   = false
		jumpCharge   = math.max(jumpCharge - dt * 3, 0)
	end

	-- сглаженная скорость поворота корпуса (для банкинга и turn-aware шага ног)
	do
		local rawDelta = math.atan2(math.sin(mechRot - prevMechRot), math.cos(mechRot - prevMechRot))
		local instantTurnRate = dt > 0 and (rawDelta / dt) or 0
		turnRate = turnRate + (instantTurnRate - turnRate) * math.min(dt * 8, 1)
		prevMechRot = mechRot
	end

	chargeCrouch = chargeCrouch + (jumpCharge - chargeCrouch) * math.min(dt * 6, 1)

	-- PHYSICS
	if isFlying then
		flightFuel = math.max(flightFuel - SETTINGS.FlyFuelDrain * dt, 0)
		if flightFuel <= 0 then
			isFlying = false
		else
			local fwd   = CFrame.Angles(0, mechRot, 0).LookVector
			local right = CFrame.Angles(0, mechRot, 0).RightVector
			local inputDir = Vector3.new()
			if UserInputService:IsKeyDown(Enum.KeyCode.W) then inputDir += fwd   end
			if UserInputService:IsKeyDown(Enum.KeyCode.S) then inputDir -= fwd   end
			if UserInputService:IsKeyDown(Enum.KeyCode.A) then inputDir -= right end
			if UserInputService:IsKeyDown(Enum.KeyCode.D) then inputDir += right end

			local vertInput = 0
			if UserInputService:IsKeyDown(Enum.KeyCode.Space)     then vertInput += 1 end
			if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then vertInput -= 1 end

			local desiredVel = (inputDir.Magnitude > 0 and inputDir.Unit * SETTINGS.FlySpeed or Vector3.new())
				+ Vector3.new(0, vertInput * SETTINGS.FlyVerticalSpeed, 0)

			velocity = velocity:Lerp(desiredVel, math.min(SETTINGS.FlyAcceleration * dt, 1))
			mechPos  = mechPos + velocity * dt
			vertVel  = 0
			isAirborne = true
		end

	elseif isParachuting then
		chuteOpenAlpha = math.min(chuteOpenAlpha + dt / SETTINGS.ParachuteOpenTime, 1)

		local fwd   = CFrame.Angles(0, mechRot, 0).LookVector
		local right = CFrame.Angles(0, mechRot, 0).RightVector
		local inputDir = Vector3.new()
		if UserInputService:IsKeyDown(Enum.KeyCode.W) then inputDir += fwd   end
		if UserInputService:IsKeyDown(Enum.KeyCode.S) then inputDir -= fwd   end
		if UserInputService:IsKeyDown(Enum.KeyCode.A) then inputDir -= right end
		if UserInputService:IsKeyDown(Enum.KeyCode.D) then inputDir += right end

		local vertInput = 0
		if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then vertInput += 1 end
		if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)   then vertInput -= 1 end

		-- базовое плавное снижение под куполом + ручная коррекция высоты как во флае
		local baseFall = -SETTINGS.ParachuteFallSpeed * chuteOpenAlpha
		local desiredVel = (inputDir.Magnitude > 0 and inputDir.Unit * SETTINGS.ParachuteDrift or Vector3.new())
			+ Vector3.new(0, baseFall + vertInput * SETTINGS.FlyVerticalSpeed, 0)

		velocity = velocity:Lerp(desiredVel, math.min(SETTINGS.FlyAcceleration * dt, 1))
		mechPos  = mechPos + velocity * dt
		vertVel  = 0

		local gY = groundRaycast(mechPos)
		if mechPos.Y - currentHeight <= gY then
			mechPos = Vector3.new(mechPos.X, gY + currentHeight, mechPos.Z)
			groundY = gY
			smoothGroundY = gY
			vertVel = 0
			isAirborne = false
			isParachuting = false
			chuteOpenAlpha = 0
			velocity = Vector3.new(velocity.X * 0.3, 0, velocity.Z * 0.3)
			landDipTimer = SETTINGS.LandSmashTime
			for _, leg in ipairs(legs) do
				leg.stepping = false
				leg.footPos = floorRaycast(leg.footPos)
			end
			groupActive[0] = false
			groupActive[1] = false
		end

	elseif isWebSwinging then
		-- если паутина зацепилась за подвижную деталь — тянем точку крепления вслед за ней каждый кадр
		if webAnchorPart then
			if webAnchorPart.Parent then
				webAnchor = webAnchorPart.CFrame:PointToWorldSpace(webAnchorLocalOffset)
			else
				webAnchorPart = nil -- деталь удалена — точка крепления замирает на последнем месте
			end
		end

		-- гравитация тянет вниз, натяжение паутины держит паука на сфере вокруг точки зацепа
		webVelocity = webVelocity + Vector3.new(0, -SETTINGS.Gravity, 0) * dt

		-- раскачивание WASD: толчок именно по касательной к канату (перпендикулярно направлению на точку зацепа),
		-- иначе часть импульса просто гасится натяжением и раскачка не "накапливается"
		local toAnchorNow = mechPos - webAnchor
		if toAnchorNow.Magnitude > 0.01 then
			local dirOut = toAnchorNow.Unit
			local fwd   = CFrame.Angles(0, mechRot, 0).LookVector
			local right = CFrame.Angles(0, mechRot, 0).RightVector
			local fwdTangent   = fwd - dirOut * fwd:Dot(dirOut)
			local rightTangent = right - dirOut * right:Dot(dirOut)

			local steer = Vector3.new()
			if UserInputService:IsKeyDown(Enum.KeyCode.W) then steer += fwdTangent end
			if UserInputService:IsKeyDown(Enum.KeyCode.S) then steer -= fwdTangent end
			if UserInputService:IsKeyDown(Enum.KeyCode.A) then steer -= rightTangent end
			if UserInputService:IsKeyDown(Enum.KeyCode.D) then steer += rightTangent end
			if steer.Magnitude > 0.001 then
				webVelocity = webVelocity + steer.Unit * SETTINGS.WebSwingControl * dt
			end
		end

		-- подтягивание/стравливание паутины: Q — вниз (длиннее), E — вверх (короче)
		if UserInputService:IsKeyDown(Enum.KeyCode.Q) then
			webLength = webLength + SETTINGS.WebReelSpeed * dt
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.E) then
			webLength = math.max(webLength - SETTINGS.WebReelSpeed * dt, SETTINGS.WebMinLength)
		end

		mechPos = mechPos + webVelocity * dt

		-- натяжение паутины: не даём улететь дальше длины паутины от точки зацепа
		-- (а если опора подвижная и утащила точку зацепа дальше — паука тоже утянет следом)
		local toAnchor = mechPos - webAnchor
		local dist = toAnchor.Magnitude
		if dist > 0.01 then
			local dirOut = toAnchor / dist
			if dist > webLength then
				mechPos = webAnchor + dirOut * webLength
				-- гасим радиальную составляющую скорости (рывок каната), сохраняем тангенциальную (раскачивание)
				local radialSpeed = webVelocity:Dot(dirOut)
				if radialSpeed > 0 then
					webVelocity = webVelocity - dirOut * radialSpeed
				end
			end
		end

		velocity = Vector3.new(webVelocity.X, 0, webVelocity.Z)
		vertVel  = webVelocity.Y

		webSwingTimer = webSwingTimer + dt

		-- если паук подтянулся прямо до земли — аккуратно отпускаем паутину и приземляемся.
		-- ВАЖНО: сначала паук должен реально оторваться от земли хотя бы раз — иначе если он
		-- стрелял стоя на месте (самый частый случай), "мы и так на земле" срабатывало бы
		-- мгновенно на первом же кадре, и паутина отцеплялась, толком не начав раскачивать
		local webGY = groundRaycast(mechPos)
		if not webLeftGround and mechPos.Y - currentHeight > webGY + 1.5 then
			webLeftGround = true
		end

		if webLeftGround and webSwingTimer > 0.25 and mechPos.Y - currentHeight <= webGY and webVelocity.Y <= 0 then
			mechPos = Vector3.new(mechPos.X, webGY + currentHeight, mechPos.Z)
			groundY = webGY
			smoothGroundY = webGY
			releaseWeb()
			vertVel = 0
			velocity = Vector3.new(velocity.X * 0.3, 0, velocity.Z * 0.3)
			landDipTimer = SETTINGS.LandSmashTime
			for _, leg in ipairs(legs) do
				leg.stepping = false
				leg.footPos = floorRaycast(leg.footPos)
			end
			groupActive[0] = false
			groupActive[1] = false
		end

	elseif isAirborne then
		vertVel = vertVel - SETTINGS.Gravity * dt
		velocity = velocity:Lerp(targetVel * 0.3, math.min(SETTINGS.Acceleration * 0.3 * dt, 1))
		mechPos = mechPos + velocity * dt + Vector3.new(0, vertVel * dt, 0)

		local gY = groundRaycast(mechPos)
		if mechPos.Y - currentHeight <= gY then
			mechPos = Vector3.new(mechPos.X, gY + currentHeight, mechPos.Z)
			groundY = gY
			smoothGroundY = gY
			vertVel = 0
			isAirborne = false
			velocity = Vector3.new(velocity.X * 0.3, 0, velocity.Z * 0.3)
			landDipTimer = SETTINGS.LandSmashTime
			for _, leg in ipairs(legs) do
				leg.stepping = false
				leg.footPos = floorRaycast(leg.footPos)
			end
			groupActive[0] = false
			groupActive[1] = false
		end
	else
		velocity = velocity:Lerp(targetVel, math.min(SETTINGS.Acceleration * dt, 1))
		mechPos = mechPos + velocity * dt

		local rawGroundY = groundRaycast(mechPos)
		local groundLerpSpeed = rawGroundY > smoothGroundY and 6 or 3
		smoothGroundY = smoothGroundY + (rawGroundY - smoothGroundY) * math.min(groundLerpSpeed * dt, 1)

		local dipAmount = 0
		if landDipTimer > 0 then
			landDipTimer = landDipTimer - dt
			local t = 1 - math.max(landDipTimer / SETTINGS.LandSmashTime, 0)
			dipAmount = math.sin(t * math.pi) * SETTINGS.LandSmashDip
		end

		local effectiveHeight = (targetHeight - chargeCrouch * targetHeight * 0.45) - dipAmount
		currentHeight = currentHeight + (effectiveHeight - currentHeight) * math.min(dt * 5, 1)
		mechPos = Vector3.new(mechPos.X, smoothGroundY + currentHeight, mechPos.Z)

		flightFuel = math.min(flightFuel + SETTINGS.FlyFuelRegen * dt, SETTINGS.FlyFuelMax)
	end

	-- Наклон корпуса под уклон поверхности (только когда паук реально стоит на земле)
	do
		local targetSlopePitch, targetSlopeRoll = 0, 0
		if not isAirborne and not isDancing and not isWebSwinging then
			local n = groundNormal(mechPos)
			local flatCF = CFrame.Angles(0, mechRot, 0)
			local localNormal = flatCF:VectorToObjectSpace(n)
			targetSlopePitch = math.clamp(math.atan2(localNormal.Z, localNormal.Y), -SETTINGS.MaxSlopeTilt, SETTINGS.MaxSlopeTilt)
			targetSlopeRoll  = math.clamp(-math.atan2(localNormal.X, localNormal.Y), -SETTINGS.MaxSlopeTilt, SETTINGS.MaxSlopeTilt)
		end
		slopePitch = slopePitch + (targetSlopePitch - slopePitch) * math.min(dt * SETTINGS.SlopeTiltSpeed, 1)
		slopeRoll  = slopeRoll  + (targetSlopeRoll  - slopeRoll)  * math.min(dt * SETTINGS.SlopeTiltSpeed, 1)
	end

	local rightVec = CFrame.Angles(0, mechRot, 0).RightVector
	local turnLeanTarget = -math.clamp(turnRate / 4, -1, 1) * SETTINGS.BodyTurnLean
	local rollTarget = math.clamp(velocity:Dot(rightVec) / SETTINGS.RunSpeed * SETTINGS.MaxRoll, -SETTINGS.MaxRoll, SETTINGS.MaxRoll)
		+ turnLeanTarget
	currentRoll = lerpAngle(currentRoll, rollTarget, dt * SETTINGS.TiltSpeed)

	-- затухание импульса отдачи от выстрела
	recoilPulse = math.max(recoilPulse - dt * SETTINGS.RecoilRecoverSpeed, 0)

	local chargePitchLean = chargeCrouch * math.rad(12)
	local recoilLean = recoilPulse * SETTINGS.RecoilPitch
	local mechCF = CFrame.new(mechPos)
		* CFrame.Angles(0, mechRot, 0)
		* CFrame.Angles(currentPitch + chargePitchLean - recoilLean + slopePitch, 0, currentRoll + slopeRoll)

	local bob = 0
	if not isAirborne and not isCharging and velocity.Magnitude > 0.5 then
		bob = math.abs(math.sin(tick() * (velocity.Magnitude > SETTINGS.WalkSpeed and 14 or 10))) * 0.35
	end
	local visualCF = mechCF - Vector3.new(0, bob, 0)

	-- Танец (C): процедурный "робо-грув" поверх обычной позы тела
	if isDancing then
		local dphase = tick() * 3.2
		local danceBob  = math.abs(math.sin(dphase)) * 1.4
		local danceSway = math.sin(dphase * 0.5) * math.rad(10)
		local danceSpin = math.sin(dphase * 0.25) * math.rad(18)
		visualCF = CFrame.new(mechPos + Vector3.new(0, danceBob, 0))
			* CFrame.Angles(0, mechRot + danceSpin, 0)
			* CFrame.Angles(math.rad(5), 0, danceSway)
	end

	-- Move proxy body and push to aircraft torso
	Body.CFrame = visualCF
	updateMover(torsopart, visualCF, BODY_OFFSET)

	-- Голова: следует за телом, но с независимым взглядом (headYaw/headPitch уже считаются выше по коду)
	if headpart then
		local headCF = visualCF * CFrame.new(SETTINGS.HeadMountOffset) * CFrame.Angles(headPitch, headYaw, 0)
		updateMover(headpart, headCF, HEAD_OFFSET)
	end

	-- Попа/хвост: следует за телом с лёгким покачиванием при повороте (для живости),
	-- а во время прицеливания паутиной (T зажат) — плавно поджимается ближе к телу, приподнимается
	-- и целится в точку под курсором (с лёгким "напряжённым" подрагиванием), а не просто дёргается вверх
	if buttpart then
		local targetCurl = isAimingWeb and 1 or 0
		webAimCurlAlpha = webAimCurlAlpha + (targetCurl - webAimCurlAlpha) * math.min(dt * 8, 1)

		local tailSway = CFrame.Angles(0, -turnRate * SETTINGS.TailSwaySpeed, 0)
		local restCF = visualCF * CFrame.new(SETTINGS.ButtMountOffset) * tailSway

		if webAimCurlAlpha > 0.001 then
			local aimDir = mouse.Hit.Position - mechPos
			local localAimDir = visualCF:VectorToObjectSpace(aimDir)
			local aimYaw = math.atan2(-localAimDir.X, -localAimDir.Z)
			local horizDist = Vector2.new(localAimDir.X, localAimDir.Z).Magnitude
			local aimPitch = math.clamp(math.atan2(localAimDir.Y, horizDist), math.rad(-75), math.rad(80))
			local tension = math.sin(tick() * 7) * math.rad(2.5)

			-- поджимаемся ближе к телу и повыше, будто накапливаем/поджимаем паутину перед броском
			local curledOffset = Vector3.new(SETTINGS.ButtMountOffset.X, SETTINGS.ButtMountOffset.Y + 3.5, SETTINGS.ButtMountOffset.Z * 0.3)
			local aimCF = visualCF * CFrame.new(curledOffset) * CFrame.Angles(0, aimYaw, 0) * CFrame.Angles(-aimPitch + tension, 0, 0)

			updateMover(buttpart, restCF:Lerp(aimCF, webAimCurlAlpha), BUTT_OFFSET)
		else
			updateMover(buttpart, restCF, BUTT_OFFSET)
		end
	end

	-- Точка вылета ракет: крепится к телу у "попы", двигается вместе с пауком
	-- (двигай SETTINGS.LaunchMountOffset / LAUNCH_OFFSET, если нужно сместить саму деталь)
	launchWorldCF = visualCF * CFrame.new(SETTINGS.LaunchMountOffset)
	if launchpart then
		updateMover(launchpart, launchWorldCF, LAUNCH_OFFSET)
	end

	-- Кулдаун пуска ракет
	if missileCooldownTimer > 0 then
		missileCooldownTimer = math.max(missileCooldownTimer - dt, 0)
	end

	-- Обновляем счётчик доступных ракет в UI и его позицию (следует за курсором)
	do
		local availableCount = 0
		for _, mp in ipairs(missileparts) do
			if missileState[mp].status == "idle" then
				availableCount = availableCount + 1
			end
		end
		missileCounterLabel.Text = "🚀 " .. availableCount .. " / " .. missileTotalCount

		if isEquipped then
			missileCounterLabel.Position = UDim2.new(0, mouse.X + 26, 0, mouse.Y)
		end
	end

	-- ── ROCKETS ──────────────────────────────────────────────────
	for _, mp in ipairs(missileparts) do
		local st = missileState[mp]

		if st.status == "idle" then
			-- ракета ждёт своей очереди прямо на месте в сборке, ничего не двигаем

		elseif st.status == "boost" then
			-- фаза выброса из тубуса: резкий подъём вертикально вверх (имитация ЗРК)
			st.t = st.t + dt
			local alpha = math.clamp(st.t / SETTINGS.MissileBoostTime, 0, 1)
			local pos = st.startPos + Vector3.new(0, SETTINGS.MissileBoostRise * alpha, 0)
			updateMover(mp, CFrame.lookAt(pos, pos + Vector3.new(0, 1, 0)))

			if alpha >= 1 then
				st.status = "fly"
				st.t = 0
				st.flightStartPos = pos
			end

		elseif st.status == "fly" then
			-- фаза полёта: доворот на цель и полёт по дуге к точке клика
			st.t = st.t + dt
			local alpha = math.clamp(st.t / SETTINGS.MissileFlightTime, 0, 1)

			-- квадратичная кривая Безье: старт (после буста) → апекс → цель
			local a = st.flightStartPos:Lerp(st.controlPos, alpha)
			local b = st.controlPos:Lerp(st.targetPos, alpha)
			local pos = a:Lerp(b, alpha)

			-- направление носа ракеты — точная касательная кривой Безье (работает и в самом конце пути)
			local lookDir = (st.controlPos - st.flightStartPos) * (2 * (1 - alpha)) + (st.targetPos - st.controlPos) * (2 * alpha)

			local cf
			if lookDir.Magnitude > 0.01 then
				cf = CFrame.lookAt(pos, pos + lookDir)
			else
				cf = CFrame.new(pos)
			end
			updateMover(mp, cf)

			if alpha >= 1 then
				-- удар по цели — ракета остаётся там, где приземлилась, в пул больше не возвращается
				st.status = "spent"
			end
		end
	end

	-- Линия паутины: пока качаемся, расставляем задействованные паутинки вдоль каната
	if isWebSwinging then
		updateWebLineVisual(launchWorldCF.Position, webAnchor)
	end

	-- Parachute canopy: в использовании — над пауком, иначе — спрятан под землёй
	if isParachuting and chutepart then
		local chuteCF = CFrame.new(mechPos + Vector3.new(0, 8, 0)) * CFrame.Angles(0, mechRot, 0)
		updateMover(chutepart, chuteCF, CHUTE_OFFSET)
	elseif chutepart then
		local gY = rawGroundY(mechPos)
		if gY then
			chuteHidePos = Vector3.new(mechPos.X, gY - SETTINGS.ChuteHideDepth, mechPos.Z)
		end
		-- если земли под пауком сейчас нет — оставляем купол в последней известной точке под землёй
		if chuteHidePos then
			updateMover(chutepart, CFrame.new(chuteHidePos) * CFrame.Angles(0, mechRot, 0), CHUTE_OFFSET)
		end
	end

	-- ── LEGS ─────────────────────────────────────────────────────
	if isDancing then
		-- пляшущие ноги: задние/средние топают в такт, передние отдельно машут как "руки"
		local dphase = tick() * 3.2
		for i, leg in ipairs(legs) do
			local hipWorld = visualCF:PointToWorldSpace(leg.data.hipOffset)
			local outDir   = visualCF:VectorToWorldSpace(Vector3.new(leg.data.hipOffset.X, 0, leg.data.hipOffset.Z).Unit)
			local isFrontLeg = leg.data.name:find("Front") ~= nil

			local footPos
			if isFrontLeg then
				-- передние лапы: высокий мах в сторону и вверх, левая/правая в противофазе — как приветственный жест
				local sideSign  = (leg.data.hipOffset.X > 0) and 1 or -1
				local frontPhase = dphase * 1.4 + (sideSign > 0 and 0 or math.pi)
				local rise      = (math.sin(frontPhase) * 0.5 + 0.5) * 5.5   -- 0..5.5 студов вверх
				local swingOut  = math.sin(frontPhase * 0.5) * 2.5           -- боковой мах наружу/внутрь
				local rightVec  = visualCF.RightVector
				local basePos   = hipWorld + outDir * (SETTINGS.LegRestLength * 0.5) + rightVec * (swingOut * sideSign)
				local groundPos = floorRaycast(basePos)
				footPos = Vector3.new(basePos.X, groundPos.Y + rise, basePos.Z)
			else
				-- средние/задние лапы: ритмичный топот для устойчивости
				local groupPhase = (leg.data.group == 0) and 0 or math.pi
				local kick = math.max(math.sin(dphase + groupPhase), 0) * 3.2
				local basePos = hipWorld + outDir * (SETTINGS.LegRestLength * 0.65)
				local groundPos = floorRaycast(basePos)
				footPos = Vector3.new(groundPos.X, groundPos.Y + kick, groundPos.Z)
			end

			leg.footPos = footPos
			leg.stepping = false

			local knee = solveIK(hipWorld, leg.footPos, SETTINGS.UpperLegLen, SETTINGS.LowerLegLen, outDir)
			positionLimbProxy(leg.upper, hipWorld, knee)
			positionLimbProxy(leg.lower, knee, leg.footPos)
			leg.foot.CFrame = CFrame.new(leg.footPos) * CFrame.Angles(0, mechRot, 0) * CFrame.new(0, 0.2, 0)

			updateMover(fingerparts1[i], leg.upper.CFrame, UPPER_OFFSET)
			updateMover(fingerparts2[i], leg.lower.CFrame, LOWER_OFFSET)
			updateMover(fingerparts3[i], leg.foot.CFrame,  FOOT_OFFSET)
		end
	elseif isWebSwinging then
		-- то же поджатое положение ног, что и в прыжке/парашюте — паук висит на паутине
		for i, leg in ipairs(legs) do
			local hipWorld = visualCF:PointToWorldSpace(leg.data.hipOffset)
			local idealDir = visualCF:VectorToWorldSpace(leg.data.restDir)
			local foldedTarget = hipWorld
				+ idealDir * (SETTINGS.LegRestLength * SETTINGS.LegFoldInward)
				- Vector3.new(0, SETTINGS.LegFoldDrop, 0)
			leg.footPos = leg.footPos:Lerp(foldedTarget, math.min(dt * 8, 1))
			leg.stepping = false

			local outDir = visualCF:VectorToWorldSpace(Vector3.new(leg.data.hipOffset.X, 0, leg.data.hipOffset.Z).Unit)
			local knee   = solveIK(hipWorld, leg.footPos, SETTINGS.UpperLegLen, SETTINGS.LowerLegLen, outDir)

			positionLimbProxy(leg.upper, hipWorld, knee)
			positionLimbProxy(leg.lower, knee, leg.footPos)
			leg.foot.CFrame = CFrame.new(leg.footPos) * CFrame.Angles(0, mechRot, 0) * CFrame.new(0, 0.2, 0)

			updateMover(fingerparts1[i], leg.upper.CFrame, UPPER_OFFSET)
			updateMover(fingerparts2[i], leg.lower.CFrame, LOWER_OFFSET)
			updateMover(fingerparts3[i], leg.foot.CFrame,  FOOT_OFFSET)
		end
	elseif isAirborne then
		-- ноги поджаты близко к корпусу и опущены вниз (как на эскизе) — и в прыжке, и на парашюте
		for i, leg in ipairs(legs) do
			local hipWorld = visualCF:PointToWorldSpace(leg.data.hipOffset)
			local idealDir = visualCF:VectorToWorldSpace(leg.data.restDir)
			local foldedTarget = hipWorld
				+ idealDir * (SETTINGS.LegRestLength * SETTINGS.LegFoldInward)
				- Vector3.new(0, SETTINGS.LegFoldDrop, 0)
			leg.footPos = leg.footPos:Lerp(foldedTarget, math.min(dt * 8, 1))
			leg.stepping = false

			local outDir = visualCF:VectorToWorldSpace(Vector3.new(leg.data.hipOffset.X, 0, leg.data.hipOffset.Z).Unit)
			local knee   = solveIK(hipWorld, leg.footPos, SETTINGS.UpperLegLen, SETTINGS.LowerLegLen, outDir)

			positionLimbProxy(leg.upper, hipWorld, knee)
			positionLimbProxy(leg.lower, knee, leg.footPos)
			leg.foot.CFrame = CFrame.new(leg.footPos) * CFrame.Angles(0, mechRot, 0) * CFrame.new(0, 0.2, 0)

			-- Push to aircraft parts (index i = 1..6)
			updateMover(fingerparts1[i], leg.upper.CFrame, UPPER_OFFSET)
			updateMover(fingerparts2[i], leg.lower.CFrame, LOWER_OFFSET)
			updateMover(fingerparts3[i], leg.foot.CFrame,  FOOT_OFFSET)
		end
	else
		-- обычная ходьба по земле
		local upAxis = Vector3.new(0, 1, 0)
		local lead = velocity * 0.35
		for _, leg in ipairs(legs) do
			local hipWorld = visualCF:PointToWorldSpace(leg.data.hipOffset)
			local idealDir = visualCF:VectorToWorldSpace(leg.data.restDir)
			-- ведём ногу в сторону, куда разворачивается корпус (работает и при повороте на месте)
			local radius   = hipWorld - mechPos
			local turnLead = radius:Cross(upAxis) * turnRate * SETTINGS.TurnLeadStrength
			leg.idealPos   = floorRaycast(hipWorld + idealDir * SETTINGS.LegRestLength + lead + turnLead)
		end

		local isWaveGait = velocity.Magnitude < SETTINGS.GaitWaveThreshold

		-- Release finished tripod groups
		for g = 0, 1 do
			if groupActive[g] then
				local allDone = true
				for _, idx in ipairs(GROUP[g]) do
					if legs[idx].stepping then allDone = false; break end
				end
				if allDone then groupActive[g] = false end
			end
		end

		local anyStepping = false
		for _, leg in ipairs(legs) do
			if leg.stepping then anyStepping = true; break end
		end

		-- быстрый разворот на месте тоже должен заставлять ноги переступать (не только ходьба)
		local isTurningFast = math.abs(turnRate) > SETTINGS.TurnStepThreshold

		if isWaveGait then
			-- ВОЛНОВАЯ походка: тяжёлый, солидный шаг — по одной ноге за раз, по кругу
			if not anyStepping and (velocity.Magnitude > 0.5 or isTurningFast) then
				local idx = waveOrder[waveIdx]
				local leg = legs[idx]
				local d = (leg.footPos - leg.idealPos).Magnitude
				if d > SETTINGS.StepDistance * 0.5 then
					leg.stepping  = true
					leg.stepAlpha = 0
					leg.stepStart = leg.footPos
					local sv = leg.idealPos - leg.footPos
					leg.stepEnd = leg.idealPos + (sv.Magnitude > 0.01 and sv.Unit or Vector3.new()) * SETTINGS.StepOvershoot
				end
				waveIdx = waveIdx % #waveOrder + 1
			end
		else
			-- ТРИПОД походка: по три ноги разом — быстрый бег
			if not groupActive[0] and not groupActive[1] and (velocity.Magnitude > 0.5 or isTurningFast) then
				local bestGroup = -1
				local bestDrift = SETTINGS.StepDistance
				for g = 0, 1 do
					local maxDrift = 0
					for _, idx in ipairs(GROUP[g]) do
						local d = (legs[idx].footPos - legs[idx].idealPos).Magnitude
						if d > maxDrift then maxDrift = d end
					end
					if maxDrift > bestDrift then bestDrift = maxDrift; bestGroup = g end
				end

				if bestGroup >= 0 then
					groupActive[bestGroup] = true
					for _, idx in ipairs(GROUP[bestGroup]) do
						local leg = legs[idx]
						leg.stepping  = true
						leg.stepAlpha = 0
						leg.stepStart = leg.footPos
						local sv = leg.idealPos - leg.footPos
						leg.stepEnd = leg.idealPos + (sv.Magnitude > 0.01 and sv.Unit or Vector3.new()) * SETTINGS.StepOvershoot
					end
				end
			end
		end

		-- Advance arcs
		for _, leg in ipairs(legs) do
			if leg.stepping then
				leg.stepAlpha += dt / SETTINGS.StepDuration
				if leg.stepAlpha >= 1 then
					leg.stepping = false
					leg.footPos  = floorRaycast(leg.stepEnd)
					leg.settling    = true
					leg.settleTimer = SETTINGS.FootSettleTime
				else
					leg.footPos = leg.stepStart:Lerp(leg.stepEnd, leg.stepAlpha)
						+ upAxis * (math.sin(leg.stepAlpha * math.pi) * SETTINGS.StepHeight)
				end
			else
				leg.footPos = leg.footPos:Lerp(floorRaycast(leg.footPos), 8 * dt)
			end
		end

		-- IK render + push to aircraft
		for i, leg in ipairs(legs) do
			local hipWorld = visualCF:PointToWorldSpace(leg.data.hipOffset)
			local outDir   = visualCF:VectorToWorldSpace(Vector3.new(leg.data.hipOffset.X, 0, leg.data.hipOffset.Z).Unit)
			local knee     = solveIK(hipWorld, leg.footPos, SETTINGS.UpperLegLen, SETTINGS.LowerLegLen, outDir)

			-- лёгкий механический "стук" стопы после приземления шага
			local settleY = 0
			if leg.settling then
				leg.settleTimer = leg.settleTimer - dt
				local t = 1 - math.max(leg.settleTimer / SETTINGS.FootSettleTime, 0)
				settleY = -math.sin(math.min(t, 1) * math.pi) * SETTINGS.FootSettleBounce * (1 - t)
				if leg.settleTimer <= 0 then leg.settling = false end
			end

			positionLimbProxy(leg.upper, hipWorld, knee)
			positionLimbProxy(leg.lower, knee, leg.footPos)
			-- ориентация стопы берётся из текущего базиса тела (visualCF), а не всегда мирового Y —
			-- поэтому стопа лежит вровень с полом, стеной или потолком, смотря где паук сейчас
			leg.foot.CFrame = CFrame.new(leg.footPos + upAxis * settleY) * visualCF.Rotation

			-- Push to aircraft parts
			updateMover(fingerparts1[i], leg.upper.CFrame, UPPER_OFFSET)
			updateMover(fingerparts2[i], leg.lower.CFrame, LOWER_OFFSET)
			updateMover(fingerparts3[i], leg.foot.CFrame,  FOOT_OFFSET)
		end
	end
end)