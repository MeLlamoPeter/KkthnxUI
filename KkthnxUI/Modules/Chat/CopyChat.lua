local K, C, L = unpack(select(2, ...))
local CopyChat = K:NewModule("CopyChat", "AceHook-3.0")

-- Lua API
local _G = _G
local string_format = string.format
local string_gsub = string.gsub
local string_lower = string.lower
local table_concat = table.concat
local table_insert = table.insert

-- Wow API
local CreateFrame, UIParent = _G.CreateFrame, _G.UIParent
local FCF_GetChatWindowInfo = _G.FCF_GetChatWindowInfo
local FCF_SetChatWindowFontSize = _G.FCF_SetChatWindowFontSize
local InCombatLockdown = _G.InCombatLockdown
local NUM_CHAT_WINDOWS = _G.NUM_CHAT_WINDOWS
local ScrollFrameTemplate_OnMouseWheel = _G.ScrollFrameTemplate_OnMouseWheel
local ToggleFrame = _G.ToggleFrame

-- GLOBALS: CopyChatFrameEditBox, UISpecialFrames, ChatFontNormal, CopyChatScrollFrameScrollBar
-- GLOBALS: CopyChatScrollFrame, CopyChatFrame, ChatMenu

local Lines = {}
local CopyFrame

local function RemoveIconFromLine(text)
	for i= 1, 8 do
		text = string_gsub(text, "|TInterface\\TargetingFrame\\UI%-RaidTargetingIcon_"..i..":0|t", "{"..string_lower(_G["RAID_TARGET_"..i]).."}")
	end
	text = string_gsub(text, "|TInterface(.-)|t", "")
	return text
end

local function ColorizeLine(text, r, g, b)
	local HexCode = K.RGBToHex(r, g, b)
	local HexReplacement = string_format("|r%s", HexCode)

	text = string_gsub(text, "|r", HexReplacement) -- If the message contains color strings then we need to add message color hex code after every "|r"
	text = string_format("%s%s|r", HexCode, text) -- Add message color

	return text
end

function CopyChat:GetLines(frame)
	local Index = 1

	for i = 1, frame:GetNumMessages() do
		local Message, R, G, B = frame:GetMessageInfo(i)

		--Set fallback color values
		R = R or 1
		G = G or 1
		B = B or 1

		--Remove icons
		Message = RemoveIconFromLine(Message)

		--Add text color
		Message = ColorizeLine(Message, R, G, B)

		Lines[Index] = Message
		Index = Index + 1
	end

	return Index - 1
end

function CopyChat:CopyText(frame)
	if not CopyChatFrame:IsShown() then
		local _, Size = FCF_GetChatWindowInfo(frame:GetID())

		if Size < 10 then
			Size = 12
		end

		FCF_SetChatWindowFontSize(frame, frame, 0.01)

		CopyChatFrame:Show()

		local LineCount = self:GetLines(frame)
		local Text = table_concat(Lines, "\n", 1, LineCount)

		FCF_SetChatWindowFontSize(frame, frame, Size)

		CopyChatFrameEditBox:SetText(Text)
	else
		CopyChatFrame:Hide()
	end
end

local OnEnter = function(self)
	self:SetAlpha(1)
end

local OnLeave = function(self)
	self:SetAlpha(0.25)
end

local OnMouseUp = function(self)
	if InCombatLockdown() then
		return
	end

	CopyChat:CopyText(self.ChatFrame)
end

function CopyChat:OnEnable()
	CopyFrame = CreateFrame("Frame", "CopyChatFrame", UIParent)
	table_insert(UISpecialFrames, "CopyChatFrame")
	CopyFrame:SetTemplate("Transparent")
	CopyFrame:SetSize(700, 200)
	CopyFrame:SetPoint("BOTTOM", UIParent, 0, 4)
	CopyFrame:Hide()
	CopyFrame:SetMovable(true)
	CopyFrame:EnableMouse(true)
	CopyFrame:SetResizable(true)
	CopyFrame:SetMinResize(350, 100)
	CopyFrame:SetScript("OnMouseDown", function(self, button)
		if button == "LeftButton" and not self.isMoving then
			self:StartMoving()
			self.isMoving = true
		elseif button == "RightButton" and not self.isSizing then
			self:StartSizing()
			self.isSizing = true
		end
	end)
	CopyFrame:SetScript("OnMouseUp", function(self, button)
		if button == "LeftButton" and self.isMoving then
			self:StopMovingOrSizing()
			self.isMoving = false
		elseif button == "RightButton" and self.isSizing then
			self:StopMovingOrSizing()
			self.isSizing = false
		end
	end)
	CopyFrame:SetScript("OnHide", function(self)
		if (self.isMoving or self.isSizing) then
			self:StopMovingOrSizing()
			self.isMoving = false
			self.isSizing = false
		end
	end)
	CopyFrame:SetFrameStrata("DIALOG")
	CopyFrame.Minimized = true

	local ScrollArea = CreateFrame("ScrollFrame", "CopyChatScrollFrame", CopyFrame, "UIPanelScrollFrameTemplate")
	ScrollArea:SetPoint("TOPLEFT", CopyFrame, "TOPLEFT", 8, -30)
	ScrollArea:SetPoint("BOTTOMRIGHT", CopyFrame, "BOTTOMRIGHT", -30, 8)
	ScrollArea:SetScript("OnSizeChanged", function(self)
		CopyChatFrameEditBox:SetWidth(self:GetWidth())
		CopyChatFrameEditBox:SetHeight(self:GetHeight())
	end)
	ScrollArea:HookScript("OnVerticalScroll", function(self, offset)
		CopyChatFrameEditBox:SetHitRectInsets(0, 0, offset, (CopyChatFrameEditBox:GetHeight() - offset - self:GetHeight()))
	end)

	local EditBox = CreateFrame("EditBox", "CopyChatFrameEditBox", CopyFrame)
	EditBox:SetMultiLine(true)
	EditBox:SetMaxLetters(99999)
	EditBox:EnableMouse(true)
	EditBox:SetAutoFocus(false)
	EditBox:SetFontObject(ChatFontNormal)
	EditBox:SetWidth(ScrollArea:GetWidth())
	EditBox:SetHeight(200)
	EditBox:SetScript("OnEscapePressed", function()
		CopyFrame:Hide()
	end)
	ScrollArea:SetScrollChild(EditBox)
	CopyChatFrameEditBox:SetScript("OnTextChanged", function(self, userInput)
		if userInput then return end
		local _, max = CopyChatScrollFrameScrollBar:GetMinMaxValues()
		for i = 1, max do
			ScrollFrameTemplate_OnMouseWheel(CopyChatScrollFrame, -1)
		end
	end)

	local Close = CreateFrame("Button", "CopyChatFrameCloseButton", CopyFrame, "UIPanelCloseButton")
	Close:SetPoint("TOPRIGHT")
	Close:SetFrameLevel(Close:GetFrameLevel() + 1)
	Close:SetScript("OnClick", function()
		CopyFrame:Hide()
	end)

	-- Create copy button
	for i = 1, NUM_CHAT_WINDOWS do
		local frame = _G["ChatFrame"..i]
		local id = frame:GetID()

		local CopyButton = CreateFrame("Button", string_format("CopyChatButton%d", id), frame)
		CopyButton:EnableMouse(true)
		CopyButton:SetSize(22, 24)
		CopyButton:SetPoint("TOPRIGHT")
		CopyButton:SetNormalTexture(C["Media"].Copy)
		CopyButton:SetAlpha(0.25)
		CopyButton:SetFrameLevel(frame:GetFrameLevel() + 5)

		CopyButton:SetScript("OnMouseUp", function(self, button)
			if button == "RightButton" and id == 1 and not InCombatLockdown() then
				ToggleFrame(ChatMenu)
			else
				CopyChat:CopyText(self.ChatFrame)
			end
		end)

		CopyButton:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
		CopyButton:SetScript("OnLeave", function(self)
			if _G[self:GetParent():GetName().."TabText"]:IsShown() then
				self:SetAlpha(0.25)
			else
				self:SetAlpha(0)
			end
		end)

		CopyButton.ChatFrame = frame
	end
end