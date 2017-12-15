local K, C = unpack(select(2, ...))

C["Media"] = {
	BackdropColor = {10/255, 10/255, 10/255, 0.9},
	Blank = [[Interface\BUTTONS\WHITE8X8]],
	BlankFont = [[Interface\AddOns\KkthnxUI\Media\Fonts\Invisible.ttf]],
	Border = [[Interface\Tooltips\UI-Tooltip-Border]],
	BorderColor = {255/255, 255/255, 255/255, 1},
	BorderShadow = [[Interface\AddOns\KkthnxUI\Media\Border\Border_Shadow.tga]],
	CombatFont = [[Interface\AddOns\KkthnxUI\Media\Fonts\Damage.ttf]],
	Copy = [[Interface\AddOns\KkthnxUI\Media\Chat\Copy.tga]],
	Font = [[Interface\AddOns\KkthnxUI\Media\Fonts\Normal.ttf]],
	FontSize = 12,
	FontStyle = "OUTLINE",
	Glow = [[Interface\AddOns\KkthnxUI\Media\Textures\GlowTex.tga]],
	Logo = [[Interface\AddOns\KkthnxUI\Media\Textures\Logo.tga]],
	Proc_Sound = [[Interface\AddOns\KkthnxUI\Media\Sounds\Proc.ogg]],
	Spark = [[Interface\AddOns\KkthnxUI\Media\Textures\Spark.blp]],
	Texture = [[Interface\TargetingFrame\UI-StatusBar]],
	TextureFlat = [[Interface\AddOns\RavUI\Media\Textures\Flat.tga]],
	WarningSound = [[Interface\AddOns\KkthnxUI\Media\Sounds\Warning.ogg]],
	WhisperSound = [[Interface\AddOns\KkthnxUI\Media\Sounds\Whisper.ogg]],
}

if (K.Client == "koKR" or K.Client == "zhTW" or K.Client == "zhCN") then
	C["Media"].Font = STANDARD_TEXT_FONT
	C["Media"].CombatFont = DAMAGE_TEXT_FONT
end