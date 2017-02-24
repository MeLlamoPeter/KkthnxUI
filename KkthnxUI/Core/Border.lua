local K, C, L = unpack(select(2, ...))

-- Lua API
local pairs = pairs
local type = type
local unpack = unpack

-- Mine
local sections = {"TOPLEFT", "TOPRIGHT", "BOTTOMLEFT", "BOTTOMRIGHT", "TOP", "BOTTOM", "LEFT", "RIGHT"}

local SetBorderColor = function(self, r, g, b, a)
	local t = self.borderTextures
	if not t then return end

	for _, tex in pairs(t) do
		tex:SetVertexColor(r or 1, g or 1, b or 1, a or 1)
	end
end

local SetBackdropBorderColor = function(self, r, g, b, a)
	local t = self.borderTextures
	if not t then return end

	for _, tex in pairs(t) do
		tex:SetVertexColor(r or 1, g or 1, b or 1, a or 1)
	end
end

local GetBorderColor = function(self)
	return self.borderTextures and self.borderTextures.TOPLEFT:GetVertexColor()
end

K.CreateBorder = function(object, offset)
	if type(object) ~= "table" or not object.CreateTexture or object.borderTextures then return end

	local t = {}
	offset = offset or 0

	for i = 1, #sections do
		local x = object:CreateTexture(nil, "OVERLAY", nil, 1)
		x:SetTexture("Interface\\AddOns\\KkthnxUI\\Media\\Border\\border-"..sections[i])
		t[sections[i]] = x
	end

	t.TOPLEFT:SetSize(8, 8)
	t.TOPLEFT:SetPoint("BOTTOMRIGHT", object, "TOPLEFT", 4 + offset, -4 - offset)

	t.TOPRIGHT:SetSize(8, 8)
	t.TOPRIGHT:SetPoint("BOTTOMLEFT", object, "TOPRIGHT", -4 - offset, -4 - offset)

	t.BOTTOMLEFT:SetSize(8, 8)
	t.BOTTOMLEFT:SetPoint("TOPRIGHT", object, "BOTTOMLEFT", 4 + offset, 4 + offset)

	t.BOTTOMRIGHT:SetSize(8, 8)
	t.BOTTOMRIGHT:SetPoint("TOPLEFT", object, "BOTTOMRIGHT", -4 - offset, 4 + offset)

	t.TOP:SetHeight(8)
	t.TOP:SetPoint("TOPLEFT", t.TOPLEFT, "TOPRIGHT", 0, 0)
	t.TOP:SetPoint("TOPRIGHT", t.TOPRIGHT, "TOPLEFT", 0, 0)

	t.BOTTOM:SetHeight(8)
	t.BOTTOM:SetPoint("BOTTOMLEFT", t.BOTTOMLEFT, "BOTTOMRIGHT", 0, 0)
	t.BOTTOM:SetPoint("BOTTOMRIGHT", t.BOTTOMRIGHT, "BOTTOMLEFT", 0, 0)

	t.LEFT:SetWidth(8)
	t.LEFT:SetPoint("TOPLEFT", t.TOPLEFT, "BOTTOMLEFT", 0, 0)
	t.LEFT:SetPoint("BOTTOMLEFT", t.BOTTOMLEFT, "TOPLEFT", 0, 0)

	t.RIGHT:SetWidth(8)
	t.RIGHT:SetPoint("TOPRIGHT", t.TOPRIGHT, "BOTTOMRIGHT", 0, 0)
	t.RIGHT:SetPoint("BOTTOMRIGHT", t.BOTTOMRIGHT, "TOPRIGHT", 0, 0)

	object.borderTextures = t
	object.SetBorderColor = SetBorderColor
	object.SetBackdropBorderColor = SetBackdropBorderColor
	object.GetBorderColor = GetBorderColor
end

-- Small bar below of frames
K.CreateOutsideBar = function(parent, onTop, r, g, b)
	local StatusBar = K.CreateStatusBar(parent, "OutsideBar")

	StatusBar:SetSize(98, 10)
	StatusBar:SetStatusBarColor(r or 1, g or 0, b or 0)

	local point, anchor, point2, x, y, step
	point, anchor, point2, x, y = "TOP", parent.Power, "BOTTOM", 0, -2
	step = -2
	StatusBar:SetPoint(point, anchor, point2, x, y)

	StatusBar.Texture = StatusBar:CreateTexture(nil, "ARTWORK")
	StatusBar.Texture:SetSize(104, 32)
	StatusBar.Texture:SetTexture("Interface\\AddOns\\KkthnxUI\\Media\\Unitframes\\FrameBarBot")
	StatusBar.Texture:SetPoint("BOTTOM", 0, -12)

	if C.Blizzard.ColorTextures == true then
		StatusBar.Texture:SetVertexColor(C.Blizzard.TexturesColor[1], C.Blizzard.TexturesColor[2], C.Blizzard.TexturesColor[3]) -- This is faster.
	end

	return StatusBar
end