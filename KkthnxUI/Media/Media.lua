local K, C = unpack(KkthnxUI)

C["Media"] = {
	["Sounds"] = {
		KillingBlow = [[Interface\AddOns\KkthnxUI\Media\Sounds\KillingBlow.ogg]],
	},

	["Backdrops"] = {
		ColorBackdrop = { 0.04, 0.04, 0.04, 0.9 },
	},

	["Borders"] = {
		AzeriteUIBorder = [[Interface\AddOns\KkthnxUI\Media\Border\AzeriteUI\Border.tga]],
		AzeriteUITooltipBorder = [[Interface\AddOns\KkthnxUI\Media\Border\AzeriteUI\Border_Tooltip.tga]],
		ColorBorder = { 1, 1, 1 },
		GlowBorder = [[Interface\AddOns\KkthnxUI\Media\Border\Border_Glow_Overlay.tga]],
		KkthnxUIBorder = [[Interface\AddOns\KkthnxUI\Media\Border\KkthnxUI\Border.tga]],
		KkthnxUITooltipBorder = [[Interface\AddOns\KkthnxUI\Media\Border\KkthnxUI\Border_Tooltip.tga]],
	},

	["Textures"] = {
		ArrowTexture = [[Interface\AddOns\KkthnxUI\Media\Textures\Arrow.tga]],
		BlankTexture = [[Interface\BUTTONS\WHITE8X8]],
		CopyChatTexture = [[Interface\AddOns\KkthnxUI\Media\Chat\Copy.tga]],
		GlowTexture = [[Interface\AddOns\KkthnxUI\Media\Textures\GlowTex.tga]],
		LogoSmallTexture = [[Interface\AddOns\KkthnxUI\Media\Textures\LogoSmall.tga]],
		LogoTexture = [[Interface\AddOns\KkthnxUI\Media\Textures\Logo.tga]],
		MouseoverTexture = [[Interface\AddOns\KkthnxUI\Media\Textures\Mouseover.tga]],
		NewClassIconsTexture = [[Interface\AddOns\KkthnxUI\Media\Unitframes\NEW-ICONS-CLASSES.blp]],
		Spark128Texture = [[Interface\AddOns\KkthnxUI\Media\Textures\Spark_128]],
		Spark16Texture = [[Interface\AddOns\KkthnxUI\Media\Textures\Spark_16]],
		TargetIndicatorTexture = [[Interface\AddOns\KkthnxUI\Media\Nameplates\TargetIndicatorArrow.blp]],
	},

	["Fonts"] = {
		BlankFont = [[Interface\AddOns\KkthnxUI\Media\Fonts\Invisible.ttf]],
	},

	["Statusbars"] = {
		AltzUIStatusbar = [[Interface\AddOns\KkthnxUI\Media\Textures\AltzUI.tga]],
		AsphyxiaUIStatusbar = [[Interface\AddOns\KkthnxUI\Media\Textures\AsphyxiaUI.tga]],
		AzeriteUIStatusbar = [[Interface\AddOns\KkthnxUI\Media\Textures\AzeriteUI.tga]],
		CleanStatusbar = [[Interface\AddOns\KkthnxUI\Media\Textures\Clean.tga]],
		FlatStatusbar = [[Interface\AddOns\KkthnxUI\Media\Textures\Flat.tga]],
		GoldpawUIStatusbar = [[Interface\AddOns\KkthnxUI\Media\Textures\GoldpawUI.tga]],
		KkthnxUIStatusbar = [[Interface\AddOns\KkthnxUI\Media\Textures\Statusbar]],
		PaloozaStatusbar = [[Interface\AddOns\KkthnxUI\Media\Textures\Palooza.tga]],
		PinkGradientStatusbar = [[Interface\AddOns\KkthnxUI\Media\Textures\PinkGradient.tga]],
		RainStatusbar = [[Interface\AddOns\KkthnxUI\Media\Textures\Rain.tga]],
		SkullFlowerUIStatusbar = [[Interface\AddOns\KkthnxUI\Media\Textures\SkullFlowerUI.tga]],
		TukuiStatusbar = [[Interface\AddOns\KkthnxUI\Media\Textures\ElvTukUI.tga]],
		WaterStatusbar = [[Interface\AddOns\KkthnxUI\Media\Textures\Water.tga]],
		ZorkUIStatusbar = [[Interface\AddOns\KkthnxUI\Media\Textures\ZorkUI.tga]],
	},
}

-- Register Borders
if K.SharedMedia then
	for name, path in pairs(C["Media"].Borders) do
		K.SharedMedia:Register("border", name, path)
	end

	-- Register Statusbars
	for name, path in pairs(C["Media"].Statusbars) do
		K.SharedMedia:Register("statusbar", name, path)
	end

	-- Register Sounds
	for name, path in pairs(C["Media"].Sounds) do
		K.SharedMedia:Register("sound", name, path)
	end

	-- Register Fonts
	for name, path in pairs(C["Media"].Fonts) do
		K.SharedMedia:Register("font", name, path)
	end
end
