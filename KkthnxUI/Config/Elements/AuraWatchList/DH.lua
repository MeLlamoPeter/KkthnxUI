local K = KkthnxUI[1]
local Module = K:GetModule("AurasTable")

if K.Class ~= "DEMONHUNTER" then
	return
end

local list = {
	["Player Aura"] = {
		{ AuraID = 207693, UnitID = "player" },
	},
	["Target Aura"] = {
		{ AuraID = 198813, UnitID = "target", Caster = "player" },
		{ AuraID = 179057, UnitID = "target", Caster = "player" },
		{ AuraID = 207690, UnitID = "target", Caster = "player" },
		{ AuraID = 206491, UnitID = "target", Caster = "player" },
		{ AuraID = 213405, UnitID = "target", Caster = "player" },
		{ AuraID = 185245, UnitID = "target", Caster = "player" },
		{ AuraID = 204490, UnitID = "target", Caster = "player" },
		{ AuraID = 204598, UnitID = "target", Caster = "player" },
		{ AuraID = 204843, UnitID = "target", Caster = "player" },
		{ AuraID = 207407, UnitID = "target", Caster = "player" },
		{ AuraID = 207744, UnitID = "target", Caster = "player" },
		{ AuraID = 207771, UnitID = "target", Caster = "player" },
		{ AuraID = 224509, UnitID = "target", Caster = "player" },
		{ AuraID = 210003, UnitID = "target", Caster = "player" },
		{ AuraID = 207685, UnitID = "target", Caster = "player" },
		{ AuraID = 211881, UnitID = "target", Caster = "player" },
		{ AuraID = 247456, UnitID = "target", Caster = "player" },
		{ AuraID = 258860, UnitID = "target", Caster = "player" },
		{ AuraID = 268178, UnitID = "target", Caster = "player" },
		{ AuraID = 323802, UnitID = "target", Caster = "player" },
		{ AuraID = 317009, UnitID = "target", Caster = "player" },
	},
	["Special Aura"] = {
		{ AuraID = 162264, UnitID = "player" },
		{ AuraID = 187827, UnitID = "player" },
		{ AuraID = 188501, UnitID = "player" },
		{ AuraID = 212800, UnitID = "player" },
		{ AuraID = 203650, UnitID = "player" },
		{ AuraID = 196555, UnitID = "player" },
		{ AuraID = 208628, UnitID = "player" },
		{ AuraID = 247938, UnitID = "player" },
		{ AuraID = 188499, UnitID = "player" },
		{ AuraID = 210152, UnitID = "player" },
		{ AuraID = 207693, UnitID = "player" },
		{ AuraID = 203819, UnitID = "player" },
		{ AuraID = 212988, UnitID = "player" },
		{ AuraID = 208579, UnitID = "player" },
		{ AuraID = 208605, UnitID = "player" },
		{ AuraID = 208607, UnitID = "player" },
		{ AuraID = 208608, UnitID = "player" },
		{ AuraID = 208609, UnitID = "player" },
		{ AuraID = 208610, UnitID = "player" },
		{ AuraID = 208611, UnitID = "player" },
		{ AuraID = 208612, UnitID = "player" },
		{ AuraID = 208613, UnitID = "player" },
		{ AuraID = 208614, UnitID = "player" },
		{ AuraID = 247253, UnitID = "player" },
		{ AuraID = 252165, UnitID = "player" },
		{ AuraID = 216758, UnitID = "player" },
		{ AuraID = 263648, UnitID = "player", Value = true },
		{ AuraID = 218561, UnitID = "player", Value = true },
		{ AuraID = 258920, UnitID = "player" },
		{ AuraID = 343312, UnitID = "player" },
		{ AuraID = 203981, UnitID = "player", Combat = true },
	},
	["Focus Aura"] = {},
	["Spell Cooldown"] = {
		{ SlotID = 13 },
		{ SlotID = 14 },
		{ SpellID = 191427 },
		{ SpellID = 187827 },
	},
}

Module:AddNewAuraWatch("DEMONHUNTER", list)
