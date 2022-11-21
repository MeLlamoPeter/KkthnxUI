local K, C = unpack(KkthnxUI)
local Module = K:GetModule("ActionBar")

local _G = _G
local table_insert = _G.table.insert

local CreateFrame = _G.CreateFrame
local RegisterStateDriver = _G.RegisterStateDriver
local UIParent = _G.UIParent
local NUM_STANCE_SLOTS = _G.NUM_STANCE_SLOTS or 10
local NUM_POSSESS_SLOTS = _G.NUM_POSSESS_SLOTS or 2

local cfg = C.Bars.BarStance
local margin, padding = C.Bars.BarMargin, C.Bars.BarPadding

function Module:UpdateStanceBar()
	local frame = _G["KKUI_ActionBarStance"]
	if not frame then
		return
	end

	local size = C["ActionBar"].BarStanceSize
	local fontSize = C["ActionBar"].BarStanceFont
	local perRow = C["ActionBar"].BarStancePerRow

	for i = 1, 12 do
		local button = frame.buttons[i]
		button:SetSize(size, size)
		if i < 11 then
			button:ClearAllPoints()
			if i == 1 then
				button:SetPoint("TOPLEFT", frame, padding, -padding)
			elseif mod(i - 1, perRow) == 0 then
				button:SetPoint("TOP", frame.buttons[i - perRow], "BOTTOM", 0, -margin)
			else
				button:SetPoint("LEFT", frame.buttons[i - 1], "RIGHT", margin, 0)
			end
		end
		Module:UpdateFontSize(button, fontSize)
	end

	local column = min(NUM_STANCE_SLOTS, perRow)
	local rows = ceil(NUM_STANCE_SLOTS / perRow)
	frame:SetWidth(column * size + (column - 1) * margin + 2 * padding)
	frame:SetHeight(size * rows + (rows - 1) * margin + 2 * padding)
	frame.mover:SetSize(size, size)
end

function Module:UpdateStance()
	if InCombatLockdown() then
		return
	end

	local numForms = GetNumShapeshiftForms()
	local texture, isActive, isCastable
	local icon, cooldown
	local start, duration, enable

	for i, button in pairs(self.actionButtons) do
		button:Hide()
		icon = button.icon
		if i <= numForms then
			texture, isActive, isCastable = GetShapeshiftFormInfo(i)
			icon:SetTexture(texture)

			--Cooldown stuffs
			cooldown = button.cooldown
			if texture then
				button:Show()
				cooldown:Show()
			else
				cooldown:Hide()
			end
			start, duration, enable = GetShapeshiftFormCooldown(i)
			CooldownFrame_Set(cooldown, start, duration, enable)

			if isActive then
				button:SetChecked(true)
			else
				button:SetChecked(false)
			end

			if isCastable then
				icon:SetVertexColor(1.0, 1.0, 1.0)
			else
				icon:SetVertexColor(0.4, 0.4, 0.4)
			end
		end
	end
end

function Module:StanceBarOnEvent()
	if InCombatLockdown() then
		return
	end
	Module:UpdateStanceBar()
	Module.UpdateStance(StanceBar)
end

function Module:CreateStancebar()
	if not C["ActionBar"].StanceBar then
		return
	end

	local buttonList = {}
	local frame = CreateFrame("Frame", "KKUI_ActionBarStance", UIParent, "SecureHandlerStateTemplate")
	frame.mover = K.Mover(frame, "StanceBar", "StanceBar", { "BOTTOMLEFT", _G.KKUI_ActionBar3, "TOPLEFT", 0, margin })
	Module.movers[8] = frame.mover

	-- StanceBar
	StanceBar:SetParent(frame)
	StanceBar:EnableMouse(false)
	StanceBar:UnregisterAllEvents()

	for i = 1, NUM_STANCE_SLOTS do
		local button = _G["StanceButton" .. i]
		button:SetParent(frame)
		table_insert(buttonList, button)
		table_insert(Module.buttons, button)
	end

	-- Fix stance bar updating
	K:RegisterEvent("UPDATE_SHAPESHIFT_FORMS", Module.StanceBarOnEvent)
	K:RegisterEvent("UPDATE_SHAPESHIFT_USABLE", Module.StanceBarOnEvent)
	K:RegisterEvent("UPDATE_SHAPESHIFT_COOLDOWN", Module.StanceBarOnEvent)

	-- PossessBar
	PossessActionBar:SetParent(frame)
	PossessActionBar:EnableMouse(false)

	for i = 1, NUM_POSSESS_SLOTS do
		local button = _G["PossessButton" .. i]
		table_insert(buttonList, button)
		button:ClearAllPoints()
		button:SetPoint("CENTER", buttonList[i])
	end

	frame.buttons = buttonList

	frame.frameVisibility = "[petbattle][overridebar][vehicleui][possessbar,@vehicle,exists][shapeshift] hide; show"
	RegisterStateDriver(frame, "visibility", frame.frameVisibility)

	if cfg.fader then
		Module.CreateButtonFrameFader(frame, buttonList, cfg.fader)
	end
end
