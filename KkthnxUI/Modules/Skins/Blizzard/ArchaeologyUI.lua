local K, C = KkthnxUI[1], KkthnxUI[2]

C.themes["Blizzard_ArchaeologyUI"] = function()
	local archaeologyBar = ArcheologyDigsiteProgressBar

	-- Remove any existing textures from the bar
	archaeologyBar:StripTextures()

	-- Customize the fill bar
	local fillBar = archaeologyBar.FillBar
	fillBar:SetHeight(12)
	fillBar:SetStatusBarTexture(K.GetTexture(C["General"].Texture))
	fillBar:SetStatusBarColor(0.7, 0.3, 0.2)
	fillBar:CreateBorder()

	-- Add a spark texture to the fill bar
	local sparkTexture = C["Media"].Textures.Spark16Texture
	local spark = fillBar:CreateTexture(nil, "OVERLAY")
	spark:SetTexture(sparkTexture)
	spark:SetHeight(archaeologyBar:GetHeight())
	spark:SetBlendMode("ADD")
	spark:SetPoint("CENTER", fillBar:GetStatusBarTexture(), "RIGHT", 0, 0)

	-- Reposition the bar title and set its font
	local barTitle = archaeologyBar.BarTitle
	if barTitle then
		barTitle:ClearAllPoints()
		barTitle:SetPoint("BOTTOM", archaeologyBar, "TOP", 0, -2)
		barTitle:SetFontObject(K.UIFont)
	end
end
