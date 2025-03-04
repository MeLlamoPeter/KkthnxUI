local K, C = KkthnxUI[1], KkthnxUI[2]
local select = select

local function colourPopout(self)
	local aR, aG, aB
	local glow = self:GetParent().IconBorder

	if glow:IsShown() then
		aR, aG, aB = glow:GetVertexColor()
	else
		aR, aG, aB = K.r, K.g, K.b
	end

	self.arrow:SetVertexColor(aR, aG, aB)
end

local function clearPopout(self)
	self.arrow:SetVertexColor(1, 1, 1)
end

local function UpdateAzeriteItem(self)
	if not self.styled then
		self.AzeriteTexture:SetAlpha(0)
		self.RankFrame.Texture:SetTexture("")
		self.RankFrame.Label:ClearAllPoints()
		self.RankFrame.Label:SetPoint("TOPLEFT", self, 2, -1)
		self.RankFrame.Label:SetTextColor(1, 0.5, 0)
		self.RankFrame.Label:SetFontObject(K.UIFontOutline)
		self.RankFrame.Label:SetFont(select(1, self.RankFrame.Label:GetFont()), 13, select(3, self.RankFrame.Label:GetFont()))

		self.styled = true
	end
end

local function UpdateAzeriteEmpoweredItem(self)
	self.AzeriteTexture:SetAtlas("AzeriteIconFrame")
	self.AzeriteTexture:SetAllPoints()
	self.AzeriteTexture:SetDrawLayer("BORDER", 1)
end

local function UpdateCosmetic(self)
	local itemLink = GetInventoryItemLink("player", self:GetID())
	self.IconOverlay:SetShown(itemLink and IsCosmeticItem(itemLink))
end

local function styleEquipmentSlot(slotName)
	local slot = _G[slotName]
	local icon = slot.icon
	local iconBorder = slot.IconBorder
	local cooldown = slot.Cooldown or _G[slotName .. "Cooldown"]
	local popout = slot.popoutButton

	-- Strip textures and set slot size
	slot:StripTextures()
	slot:SetSize(36, 36)

	-- Set slot icon coordinates
	icon:SetTexCoord(K.TexCoords[1], K.TexCoords[2], K.TexCoords[3], K.TexCoords[4])

	-- Hide icon border
	iconBorder:SetAlpha(0)

	-- Create border for the slot
	slot:CreateBorder()
	local border = slot.KKUI_Border

	-- Set cooldown to cover entire slot
	cooldown:SetAllPoints()

	-- Set ignore texture
	slot.ignoreTexture:SetTexture("Interface\\PaperDollInfoFrame\\UI-GearManager-LeaveItem-Transparent")

	-- Set atlas for Icon Overlay
	slot.IconOverlay:SetAtlas("CosmeticIconFrame")
	slot.IconOverlay:SetPoint("TOPLEFT", 1, -1)
	slot.IconOverlay:SetPoint("BOTTOMRIGHT", -1, 1)
	iconBorder:SetAlpha(0)

	-- Hook IconBorder to set color for slot border and handle hiding
	hooksecurefunc(iconBorder, "SetVertexColor", function(_, r, g, b)
		border:SetVertexColor(r, g, b)
	end)
	hooksecurefunc(iconBorder, "Hide", function()
		border:SetVertexColor(1, 1, 1)
	end)

	-- Set up popout button
	popout:SetNormalTexture(0)
	popout:SetHighlightTexture(0)

	-- Create arrow for popout button
	local arrow = popout:CreateTexture(nil, "OVERLAY")
	arrow:SetSize(16, 16)
	if slot.verticalFlyout then
		K.SetupArrow(arrow, "down")
		arrow:SetPoint("TOP", slot, "BOTTOM", 0, 1)
	else
		K.SetupArrow(arrow, "right")
		arrow:SetPoint("LEFT", slot, "RIGHT", -1, 0)
	end
	popout.arrow = arrow

	-- Hook scripts for popout button
	popout:HookScript("OnEnter", clearPopout)
	popout:HookScript("OnLeave", colourPopout)

	-- Hook DisplayAsAzeriteItem and DisplayAsAzeriteEmpoweredItem
	hooksecurefunc(slot, "DisplayAsAzeriteItem", UpdateAzeriteItem)
	hooksecurefunc(slot, "DisplayAsAzeriteEmpoweredItem", UpdateAzeriteEmpoweredItem)
end

tinsert(C.defaultThemes, function()
	if not C["Skins"].BlizzardFrames then
		return
	end

	-- Character model scene
	CharacterModelScene:DisableDrawLayer("BACKGROUND")
	CharacterModelScene:DisableDrawLayer("BORDER")
	CharacterModelScene:DisableDrawLayer("OVERLAY")
	CharacterModelScene:StripTextures(true)

	local equipmentSlots = {
		"CharacterBackSlot",
		"CharacterChestSlot",
		"CharacterFeetSlot",
		"CharacterFinger0Slot",
		"CharacterFinger1Slot",
		"CharacterHandsSlot",
		"CharacterHeadSlot",
		"CharacterLegsSlot",
		"CharacterMainHandSlot",
		"CharacterNeckSlot",
		"CharacterSecondaryHandSlot",
		"CharacterShirtSlot",
		"CharacterShoulderSlot",
		"CharacterTabardSlot",
		"CharacterTrinket0Slot",
		"CharacterTrinket1Slot",
		"CharacterWaistSlot",
		"CharacterWristSlot",
	}

	for _, slotName in ipairs(equipmentSlots) do
		styleEquipmentSlot(slotName)
	end

	hooksecurefunc("PaperDollItemSlotButton_Update", function(button)
		if button.popoutButton then
			colourPopout(button.popoutButton)
		end
		UpdateCosmetic(button)
	end)

	CharacterHeadSlot:ClearAllPoints()
	CharacterHandsSlot:ClearAllPoints()
	CharacterMainHandSlot:ClearAllPoints()
	CharacterSecondaryHandSlot:ClearAllPoints()
	CharacterModelScene:ClearAllPoints()

	-- Character slots
	CharacterHeadSlot:SetPoint("TOPLEFT", CharacterFrame.Inset, "TOPLEFT", 6, -6)
	CharacterHandsSlot:SetPoint("TOPRIGHT", CharacterFrame.Inset, "TOPRIGHT", -6, -6)
	CharacterMainHandSlot:SetPoint("BOTTOMLEFT", CharacterFrame.Inset, "BOTTOMLEFT", 176, 5)
	CharacterSecondaryHandSlot:SetPoint("BOTTOMRIGHT", CharacterFrame.Inset, "BOTTOMRIGHT", -176, 5)

	-- Character model scene
	CharacterModelScene:SetPoint("TOPLEFT", CharacterFrame.Inset, 4, -4)
	CharacterModelScene:SetPoint("BOTTOMRIGHT", CharacterFrame.Inset, -4, 4)

	local function UpdateCharacterFrameLayout(isExpanded)
		local frameWidth, frameHeight = 640, 431
		local insetOffset = 432
		local texturePath = "Interface\\AddOns\\KkthnxUI\\Media\\Skins\\DressingRoom" .. K.Class

		if not isExpanded then
			frameWidth = 338
			frameHeight = 424
			insetOffset = 332
			texturePath = "Interface\\FrameGeneral\\UI-Background-Marble"
		end

		CharacterFrame:SetSize(frameWidth, frameHeight)
		CharacterFrame.Inset:SetPoint("BOTTOMRIGHT", CharacterFrame, "BOTTOMLEFT", insetOffset, 4)

		CharacterFrame.Inset.Bg:SetTexture(texturePath)
		CharacterFrame.Inset.Bg:SetTexCoord(0, isExpanded and 0.935547 or 1, 0, 1)
		CharacterFrame.Inset.Bg:SetHorizTile(isExpanded)
		CharacterFrame.Inset.Bg:SetVertTile(isExpanded)
	end

	-- Expand/collapse hooks
	hooksecurefunc("CharacterFrame_Expand", function()
		UpdateCharacterFrameLayout(true)
	end)

	hooksecurefunc("CharacterFrame_Collapse", function()
		UpdateCharacterFrameLayout(false)
	end)

	-- Fonts
	if CharacterLevelText then
		CharacterLevelText:SetFontObject(K.UIFont)
	end

	local CharItemLvLValue = CharacterStatsPane.ItemLevelFrame.Value
	CharItemLvLValue:SetFontObject(K.UIFont)
	CharItemLvLValue:SetFont(select(1, CharItemLvLValue:GetFont()), 18, select(3, CharItemLvLValue:GetFont()))

	-- Class background
	CharacterStatsPane.ClassBackground:ClearAllPoints()
	CharacterStatsPane.ClassBackground:SetHeight(CharacterStatsPane.ClassBackground:GetHeight() + 6)
	CharacterStatsPane.ClassBackground:SetParent(CharacterFrameInsetRight)
	CharacterStatsPane.ClassBackground:SetPoint("CENTER")

	local function styleSidebarTab(tab)
		if not tab.bg then
			tab.bg = CreateFrame("Frame", nil, tab)
			tab.bg:SetFrameLevel(tab:GetFrameLevel())
			tab.bg:SetAllPoints(tab)
			tab.bg:CreateBorder(nil, nil, nil, nil, nil, { 255 / 255, 223 / 255, 0 / 255 })

			tab.Icon:SetAllPoints(tab.bg)
			tab.Hider:SetAllPoints(tab.bg)
			tab.Highlight:SetPoint("TOPLEFT", tab.bg, "TOPLEFT", 1, -1)
			tab.Highlight:SetPoint("BOTTOMRIGHT", tab.bg, "BOTTOMRIGHT", -1, 1)
			tab.Highlight:SetColorTexture(1, 1, 1, 0.25)
			tab.Hider:SetColorTexture(0.3, 0.3, 0.3, 0.4)
			tab.TabBg:SetAlpha(0)
		end

		local region = select(1, tab:GetRegions())
		if region and not tab.regionStyled then
			region:SetTexCoord(0.16, 0.86, 0.16, 0.86)
			region.SetTexCoord = nil
			tab.regionStyled = true
		end
	end

	-- PaperDoll sidebar tab hook
	for i = 1, #PAPERDOLL_SIDEBARS do
		styleSidebarTab(_G["PaperDollSidebarTab" .. i])
	end

	-- Hide paperdoll equipment manager scrollbar background
	hooksecurefunc(PaperDollFrame.TitleManagerPane.ScrollBox, "Update", function(self)
		for i = 1, self.ScrollTarget:GetNumChildren() do
			local child = select(i, self.ScrollTarget:GetChildren())
			if not child.styled then
				child:DisableDrawLayer("BACKGROUND")
				child.styled = true
			end
		end
	end)
end)
