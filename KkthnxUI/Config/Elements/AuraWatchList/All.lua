local K, L = KkthnxUI[1], KkthnxUI[3]
local Module = K:GetModule("AurasTable")

local list = {
	["Enchant Aura"] = { -- 附魔及饰品组
		{ AuraID = 341260, UnitID = "player", Flash = true }, -- 学识爆发，传家宝套装
		{ AuraID = 354808, UnitID = "player" }, -- 棱彩之光，1万币的小宠物
		-- 种族天赋
		{ AuraID = 26297, UnitID = "player" }, -- 狂暴 巨魔
		{ AuraID = 20572, UnitID = "player" }, -- 血性狂怒 兽人
		{ AuraID = 33697, UnitID = "player" }, -- 血性狂怒 兽人
		{ AuraID = 292463, UnitID = "player" }, -- 帕库之拥 赞达拉
		-- 药水
		{ AuraID = 371124, UnitID = "player" }, -- 沉静西风药水
		{ AuraID = 371024, UnitID = "player" }, -- 元素强能药水
		-- 10.0 饰品
		{ AuraID = 381476, UnitID = "player" }, -- 爆发烈焰
		{ AuraID = 383941, UnitID = "player" }, -- 崩坏之力
		{ AuraID = 383781, UnitID = "player" }, -- 谜题盒
		{ AuraID = 214980, UnitID = "player", Flash = true }, -- 切割漩涡
		{ AuraID = 381954, UnitID = "player", Text = L["Crit"] }, -- 奈萨鲁斯战利品
		{ AuraID = 381955, UnitID = "player", Text = L["Haste"] }, -- 奈萨鲁斯战利品
		{ AuraID = 381956, UnitID = "player", Text = L["Mastery"] }, -- 奈萨鲁斯战利品
		{ AuraID = 381957, UnitID = "player", Text = L["Versa"] }, -- 奈萨鲁斯战利品
		{ AuraID = 382126, UnitID = "player" }, -- 威能窃取
		{ AuraID = 395175, UnitID = "player", Value = true }, -- 树木的溃烂裂木
		{ AuraID = 397399, UnitID = "player" }, -- 虚空篡改者的暗影宝石
		{ AuraID = 397400, UnitID = "player" }, -- 骨喉的大脚趾
		{ AuraID = 403380, UnitID = "player" }, -- 统御呼唤
		{ AuraID = 400986, UnitID = "player" }, -- 狱钢装甲
		{ AuraID = 408835, UnitID = "player", Flash = true }, -- 沸腾怒火
		{ AuraID = 408770, UnitID = "player", Stack = 55 }, -- 灵感闪光
		-- 盟约，TODO: 部分已被整合进天赋，待整理
		{ AuraID = 331937, UnitID = "player", Flash = true }, -- 沉醉
		{ AuraID = 354053, UnitID = "player", Flash = true, Text = L["Crit"] }, -- 致命缺陷，暴击
		{ AuraID = 354054, UnitID = "player", Flash = true, Text = L["Versa"] }, -- 致命缺陷，全能
		{ AuraID = 323546, UnitID = "player" }, -- 饕餮狂乱
		{ AuraID = 326860, UnitID = "player" }, -- 陨落僧众
		{ AuraID = 310143, UnitID = "player", Combat = true }, -- 灵魂变形
		{ AuraID = 327104, UnitID = "player" }, -- 妖魂踏
		{ AuraID = 327710, UnitID = "player" }, -- 善行法夜
		{ AuraID = 328933, UnitID = "player" }, -- 法夜输灵
		{ AuraID = 328281, UnitID = "player" }, -- 凛冬祝福
		{ AuraID = 328282, UnitID = "player" }, -- 阳春祝福
		{ AuraID = 328620, UnitID = "player" }, -- 仲夏祝福
		{ AuraID = 328622, UnitID = "player" }, -- 暮秋祝福
		{ AuraID = 324867, UnitID = "player", Value = true }, -- 血肉铸造
		{ AuraID = 328204, UnitID = "player" }, -- 征服者之锤
		{ AuraID = 391891, UnitID = "player" }, -- 激变蜂群
		{ AuraID = 315443, UnitID = "player" }, -- 憎恶附肢
		{ AuraID = 325299, UnitID = "player" }, -- 屠戮箭
		{ AuraID = 327164, UnitID = "player" }, -- 始源之潮
		{ AuraID = 325216, UnitID = "player" }, -- 骨尘酒
		{ AuraID = 343672, UnitID = "player" }, -- 征服者之狂
		{ AuraID = 324220, UnitID = "player" }, -- 死神之躯
		{ AuraID = 311648, UnitID = "player" }, -- 云集之雾
		{ AuraID = 323558, UnitID = "player" }, -- 申斥回响2
		{ AuraID = 323559, UnitID = "player" }, -- 申斥回响3
		{ AuraID = 323560, UnitID = "player" }, -- 申斥回响4
		{ AuraID = 338142, UnitID = "player" }, -- 自审强化
		{ AuraID = 310454, UnitID = "player" }, -- 精序兵戈
		{ AuraID = 325013, UnitID = "player" }, -- 晋升者之赐
		{ AuraID = 308495, UnitID = "player" }, -- 共鸣箭
		{ AuraID = 328908, UnitID = "player" }, -- 战斗冥想
		{ AuraID = 345499, UnitID = "player" }, -- 执政官的祝福
		{ AuraID = 339461, UnitID = "player" }, -- 猎手坚韧
		{ AuraID = 325381, UnitID = "player", Flash = true }, -- 争先打击
		{ AuraID = 351414, UnitID = "player", Flash = true }, -- 切肉者之眼
		{ AuraID = 342774, UnitID = "player" }, -- 繁华原野
		{ AuraID = 333218, UnitID = "player" }, -- 废土礼节
		{ AuraID = 336885, UnitID = "player" }, -- 抚慰阴影
		{ AuraID = 324156, UnitID = "player", Flash = true }, -- 劫掠射击
		{ AuraID = 333961, UnitID = "player" }, -- 行动的召唤：布隆
		{ AuraID = 333943, UnitID = "player" }, -- 源生重槌
		{ AuraID = 339928, UnitID = "player", Flash = true }, -- 残酷投射
		{ AuraID = 358404, UnitID = "player", Flash = true }, -- 疑虑试炼
		{ AuraID = 352917, UnitID = "player" }, -- 崭新决心
		{ AuraID = 356263, UnitID = "player" }, -- 灵魂追踪者之契
		{ AuraID = 352875, UnitID = "player", Flash = true }, -- 虔敬者之路
		-- WoD橙戒
		{ AuraID = 187616, UnitID = "player" }, -- 尼萨姆斯，智力
		{ AuraID = 187617, UnitID = "player" }, -- 萨克图斯，坦克
		{ AuraID = 187618, UnitID = "player" }, -- 伊瑟拉鲁斯，治疗
		{ AuraID = 187619, UnitID = "player" }, -- 索拉苏斯，力量
		{ AuraID = 187620, UnitID = "player" }, -- 玛鲁斯，敏捷
		-- 传家宝饰品
		{ AuraID = 201405, UnitID = "player" }, -- 力量
		{ AuraID = 201408, UnitID = "player" }, -- 敏捷
		{ AuraID = 201410, UnitID = "player" }, -- 智力
		{ AuraID = 202052, UnitID = "player", Value = true }, -- 坦克
	},
	["Raid Buff"] = { -- 团队增益组
		{ AuraID = 54861, UnitID = "player" }, -- 火箭靴，工程
		-- 嗜血相关
		{ AuraID = 2825, UnitID = "player" }, -- 嗜血
		{ AuraID = 32182, UnitID = "player" }, -- 英勇
		{ AuraID = 80353, UnitID = "player" }, -- 时间扭曲
		{ AuraID = 264667, UnitID = "player" }, -- 原始狂怒
		{ AuraID = 390386, UnitID = "player" }, -- 守护之怒，龙希尔
		{ AuraID = 363534, UnitID = "player" }, -- 回溯，龙希尔
		{ AuraID = 357170, UnitID = "player" }, -- 时间膨胀，龙希尔
		{ AuraID = 178207, UnitID = "player" }, -- 狂怒战鼓
		{ AuraID = 230935, UnitID = "player" }, -- 高山战鼓
		{ AuraID = 256740, UnitID = "player" }, -- 漩涡战鼓
		{ AuraID = 309658, UnitID = "player" }, -- 死亡凶蛮战鼓
		{ AuraID = 102364, UnitID = "player" }, -- 青铜龙的祝福
		{ AuraID = 292686, UnitID = "player" }, -- 制皮鼓
		{ AuraID = 381301, UnitID = "player" }, -- 野性皮革战鼓
		-- 团队增益或减伤
		{ AuraID = 1022, UnitID = "player" }, -- 保护祝福
		{ AuraID = 6940, UnitID = "player" }, -- 牺牲祝福
		{ AuraID = 1044, UnitID = "player" }, -- 自由祝福
		{ AuraID = 10060, UnitID = "player" }, -- 能量灌注
		{ AuraID = 77761, UnitID = "player" }, -- 狂奔怒吼
		{ AuraID = 77764, UnitID = "player" }, -- 狂奔怒吼
		{ AuraID = 31821, UnitID = "player" }, -- 光环掌握
		{ AuraID = 97463, UnitID = "player" }, -- 命令怒吼
		{ AuraID = 64843, UnitID = "player" }, -- 神圣赞美诗
		{ AuraID = 64901, UnitID = "player" }, -- 希望象征
		{ AuraID = 81782, UnitID = "player" }, -- 真言术：障
		{ AuraID = 29166, UnitID = "player" }, -- 激活
		{ AuraID = 47788, UnitID = "player" }, -- 守护之魂
		{ AuraID = 33206, UnitID = "player" }, -- 痛苦压制
		{ AuraID = 53563, UnitID = "player" }, -- 圣光道标
		{ AuraID = 98007, UnitID = "player" }, -- 灵魂链接图腾
		{ AuraID = 223658, UnitID = "player" }, -- 捍卫
		{ AuraID = 115310, UnitID = "player" }, -- 五气归元
		{ AuraID = 116849, UnitID = "player" }, -- 作茧缚命
		{ AuraID = 204018, UnitID = "player" }, -- 破咒祝福
		{ AuraID = 102342, UnitID = "player" }, -- 铁木树皮
		{ AuraID = 145629, UnitID = "player" }, -- 反魔法领域
		{ AuraID = 156910, UnitID = "player" }, -- 信仰道标
		{ AuraID = 192082, UnitID = "player" }, -- 狂风图腾
		{ AuraID = 201633, UnitID = "player" }, -- 大地图腾
		{ AuraID = 207498, UnitID = "player" }, -- 先祖护佑
		{ AuraID = 238698, UnitID = "player" }, -- 吸血光环
		{ AuraID = 209426, UnitID = "player" }, -- 幻影打击
		{ AuraID = 374227, UnitID = "player" }, -- 微风
		{ AuraID = 114018, UnitID = "player", Flash = true }, -- 帷幕
		{ AuraID = 115834, UnitID = "player", Flash = true },
	},
	["Raid Debuff"] = { -- 团队减益组
		-- 大幻象
		{ AuraID = 311390, UnitID = "player" }, -- 疯狂：昆虫恐惧症，幻象
		{ AuraID = 306583, UnitID = "player" }, -- 灌铅脚步
		{ AuraID = 313698, UnitID = "player", Flash = true }, -- 泰坦之赐
		-- 常驻词缀
		{ AuraID = 396364, UnitID = "player", Flash = true }, -- 狂风标记，DF S1
		{ AuraID = 396369, UnitID = "player", Flash = true }, -- 闪电标记，DF S1
		{ AuraID = 209858, UnitID = "player" }, -- 死疽溃烂
		{ AuraID = 240559, UnitID = "player" }, -- 重伤
		{ AuraID = 226512, UnitID = "player", Flash = true }, -- 血池
		{ AuraID = 240447, UnitID = "player", Flash = true }, -- 践踏
		{ AuraID = 240443, UnitID = "player", Flash = true }, -- 爆裂
		{ AuraID = 408556, UnitID = "player", Flash = true }, -- 缠绕
		-- 5人
		{ AuraID = 395035, UnitID = "player", Flash = true }, -- 粉碎灵魂，阻击战
		{ AuraID = 386881, UnitID = "player" }, -- 冰霜炸弹，碧蓝魔馆
		{ AuraID = 388777, UnitID = "player" }, -- 压制瘴气，碧蓝魔馆
		{ AuraID = 162652, UnitID = "player", Flash = true }, -- 纯净之月，影月墓地
		{ AuraID = 153692, UnitID = "player", Flash = true }, -- 死疽沥青，影月墓地
		{ AuraID = 400474, UnitID = "player" }, -- 能量湍流，阻击战
		{ AuraID = 397911, UnitID = "player" }, -- 毁灭之触，青龙寺
		{ AuraID = 397797, UnitID = "player" }, -- 腐蚀漩涡，青龙寺
		{ AuraID = 397799, UnitID = "player", Flash = true }, -- 腐蚀漩涡，青龙寺
		{ AuraID = 381862, UnitID = "player", Flash = true }, -- 地狱火之核，红玉
		{ AuraID = 376760, UnitID = "player" }, -- 狂风之力，学院
		{ AuraID = 391977, UnitID = "player" }, -- 涌动超载，学院
		{ AuraID = 386181, UnitID = "player" }, -- 法力炸弹，学院
		{ AuraID = 197996, UnitID = "player" }, -- 烙印，英灵殿
		{ AuraID = 203963, UnitID = "player" }, -- 风暴之眼，英灵殿
		-- S2
		{ AuraID = 369337, UnitID = "player", Flash = true }, -- 困难地形，奥达曼
		{ AuraID = 269838, UnitID = "player", Flash = true }, -- 邪恶污染，孢林
		{ AuraID = 273226, UnitID = "player" }, -- 腐烂孢子，孢林
		{ AuraID = 259718, UnitID = "player" }, -- 颠覆，孢林
		{ AuraID = 278789, UnitID = "player", Flash = true }, -- 腐烂波，孢林
		{ AuraID = 274507, UnitID = "player" }, -- 湿滑肥皂，自由镇
		{ AuraID = 88286, UnitID = "player", Flash = true }, -- 减速风，旋云之巅
		{ AuraID = 389179, UnitID = "player", Flash = true }, -- 能量过载，注能大厅
		{ AuraID = 215898, UnitID = "player", Flash = true }, -- 晶化大地，巢穴

		{ AuraID = 405340, UnitID = "player", Flash = true }, -- 虚无之拥，萨卡雷斯
		{ AuraID = 407576, UnitID = "player", Flash = true }, -- 星界耀斑，萨卡雷斯
	},
	["Warning"] = { -- 目标重要光环组
		{ AuraID = 355596, UnitID = "target", Flash = true }, -- 橙弓，哀痛箭
		-- 大幻象
		{ AuraID = 304975, UnitID = "target", Value = true }, -- 虚空哀嚎，吸收盾
		{ AuraID = 319643, UnitID = "target", Value = true }, -- 虚空哀嚎，吸收盾
		-- 大米
		{ AuraID = 226510, UnitID = "target" }, -- 血池回血
		{ AuraID = 343502, UnitID = "target" }, -- 鼓舞光环
		-- 5人
		{ AuraID = 376780, UnitID = "target", Value = true }, -- 岩浆护盾，奈萨鲁斯
		{ AuraID = 372988, UnitID = "target", Value = true }, -- 寒冰壁垒，红玉
		{ AuraID = 391050, UnitID = "target", Value = true }, -- 暴风骤雨之盾，红玉
		{ AuraID = 384686, UnitID = "target", Flash = true }, -- 能量涌动，狙击战
		{ AuraID = 376781, UnitID = "target", Flash = true }, -- 火焰风暴，学院
		{ AuraID = 388084, UnitID = "target", Flash = true }, -- 冰川护盾，碧蓝
		{ AuraID = 113315, UnitID = "target", Stack = 7, Flash = true }, -- 强烈，青龙寺
		{ AuraID = 113309, UnitID = "target", Flash = true }, -- 至高能量，青龙寺
		{ AuraID = 117665, UnitID = "target", Flash = true }, -- 凡尘之羁，青龙寺
		-- S2
		{ AuraID = 257458, UnitID = "target" }, -- 自由镇尾王易伤
		{ AuraID = 372600, UnitID = "target" }, -- 严酷，奥达曼
		{ AuraID = 369725, UnitID = "target" }, -- 震颤，奥达曼
		{ AuraID = 377402, UnitID = "target", Value = true }, -- 液态屏障，注能大厅
		{ AuraID = 378022, UnitID = "target", Value = true }, -- 吞噬中，蕨皮
		-- 团本
		{ AuraID = 374779, UnitID = "target", Flash = true }, -- 原始屏障，恐怖图腾
		{ AuraID = 382530, UnitID = "target", Value = true }, -- 涌动，莱萨杰斯
		{ AuraID = 388691, UnitID = "target", Value = true }, -- 风暴喷涌，莱萨杰斯
		{ AuraID = 396734, UnitID = "target", Flash = true }, -- 风暴遮罩，莱萨杰斯
		{ AuraID = 388431, UnitID = "target", Flash = true }, -- 毁灭帷幕，莱萨杰斯

		{ AuraID = 403284, UnitID = "target", Flash = true }, -- 虚空增效，萨卡雷斯
		{ AuraID = 410654, UnitID = "target", Flash = true }, -- 虚空增效，萨卡雷斯
		{ AuraID = 407617, UnitID = "target", Value = true }, -- 时空畸体，里翁苏斯
		{ AuraID = 397383, UnitID = "target", Value = true }, -- 熔火屏障，
		{ AuraID = 407036, UnitID = "target", Value = true }, -- 隐匿虚空，耐萨里奥的回响
		-- PVP
		{ AuraID = 498, UnitID = "target" }, -- 圣佑术
		{ AuraID = 642, UnitID = "target" }, -- 圣盾术
		{ AuraID = 871, UnitID = "target" }, -- 盾墙
		{ AuraID = 5277, UnitID = "target" }, -- 闪避
		{ AuraID = 1044, UnitID = "target" }, -- 自由祝福
		{ AuraID = 6940, UnitID = "target" }, -- 牺牲祝福
		{ AuraID = 1022, UnitID = "target" }, -- 保护祝福
		{ AuraID = 19574, UnitID = "target" }, -- 狂野怒火
		{ AuraID = 23920, UnitID = "target" }, -- 法术反射
		{ AuraID = 31884, UnitID = "target" }, -- 复仇之怒
		{ AuraID = 33206, UnitID = "target" }, -- 痛苦压制
		{ AuraID = 45438, UnitID = "target" }, -- 寒冰屏障
		{ AuraID = 47585, UnitID = "target" }, -- 消散
		{ AuraID = 47788, UnitID = "target" }, -- 守护之魂
		{ AuraID = 48792, UnitID = "target" }, -- 冰封之韧
		{ AuraID = 48707, UnitID = "target" }, -- 反魔法护罩
		{ AuraID = 61336, UnitID = "target" }, -- 生存本能
		{ AuraID = 197690, UnitID = "target" }, -- 防御姿态
		{ AuraID = 147833, UnitID = "target" }, -- 援护
		{ AuraID = 186265, UnitID = "target" }, -- 灵龟守护
		{ AuraID = 113862, UnitID = "target" }, -- 强化隐形术
		{ AuraID = 118038, UnitID = "target" }, -- 剑在人在
		{ AuraID = 114050, UnitID = "target" }, -- 升腾 元素
		{ AuraID = 114051, UnitID = "target" }, -- 升腾 增强
		{ AuraID = 114052, UnitID = "target" }, -- 升腾 恢复
		{ AuraID = 204018, UnitID = "target" }, -- 破咒祝福
		{ AuraID = 205191, UnitID = "target" }, -- 以眼还眼 惩戒
		{ AuraID = 104773, UnitID = "target" }, -- 不灭决心
		{ AuraID = 199754, UnitID = "target" }, -- 还击
		{ AuraID = 120954, UnitID = "target" }, -- 壮胆酒
		{ AuraID = 122278, UnitID = "target" }, -- 躯不坏
		{ AuraID = 122783, UnitID = "target" }, -- 散魔功
		{ AuraID = 188499, UnitID = "target" }, -- 刃舞
		{ AuraID = 210152, UnitID = "target" }, -- 刃舞
		{ AuraID = 247938, UnitID = "target" }, -- 混乱之刃
		{ AuraID = 212800, UnitID = "target" }, -- 疾影
		{ AuraID = 162264, UnitID = "target" }, -- 恶魔变形
		{ AuraID = 187827, UnitID = "target" }, -- 恶魔变形
		{ AuraID = 125174, UnitID = "target" }, -- 业报之触
		{ AuraID = 171607, UnitID = "target" }, -- 爱情光线
		{ AuraID = 228323, UnitID = "target", Value = true }, -- 克罗塔的护盾
	},
	["InternalCD"] = { -- 自定义内置冷却组
		{ IntID = 240447, Duration = 20 }, -- 大米，践踏
		{ IntID = 114018, Duration = 15, OnSuccess = true, UnitID = "all" }, -- 帷幕
		--{IntID = 316958, Duration = 30, OnSuccess = true, UnitID = "all"},	-- 红土
		--{IntID = 353635, Duration = 27.5, OnSuccess = true, UnitID = "all"},-- 坍缩之星自爆时间
	},
}

Module:AddNewAuraWatch("ALL", list)
