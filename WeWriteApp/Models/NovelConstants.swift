import Foundation

enum NovelCategory: String, CaseIterable, Codable {
    case pureLove = "纯爱"
    case derivative = "衍生"
    case tvMovies = "综影视"
    case cyberpunk = "赛博朋克"
    case romanticSuspense = "悬疑恋爱"
    case suspense = "悬疑"
    case cthulhu = "克苏鲁"
    case urbanFantasy = "都市异能"
    case apocalypse = "末日求生"
    case spiritualRevival = "灵气复苏"
    case highMartialWorld = "高武世界"
    case otherWorld = "异世大陆"
    case orientalFantasy = "东方玄幻"
    case spy = "谍战"
    case qingDynasty = "清朝"
    case songDynasty = "宋朝"
    case breakPoint = "断层"
    case generals = "武将"
    case nationalLuck = "国运"
    case workplace = "职场商战"
    case longTimeLove = "日久生情"
    case richFamily = "豪门世家"
    case anime = "综漫"
    case crossWorld = "异世穿越"
    case onlyLove = "独宠"
    case opening = "开局"
    case alternateHistory = "架空"
    case fantasyXianxia = "奇幻仙侠"
    case city = "都市"
    case modernRomance = "现代言情"
    case ancientRomance = "古代言情"
    case xuanhuan = "玄幻"
    case history = "历史"
    case sports = "体育"
    case wuxia = "武侠"
    case fantasyRomance = "幻想言情"
}

struct NovelConstants {
    static let allTargets = ["全部", "男生", "女生"]
    static let allThemes = ["纯爱","衍生","综影视","赛博朋克","悬疑恋爱","悬疑","克苏鲁","都市异能","末日求生","灵气复苏","高武世界","异世大陆","东方玄幻","谍战","清朝","宋朝","断层","武将","国运","职场商战","日久生情","豪门世家","综漫","异世穿越","独宠","开局","架空","奇幻仙侠","都市","现代言情","古代言情","玄幻","历史","体育","武侠","幻想言情"]
    static let allRoles = ["总裁","多女主","赘婿","作精","大佬","大小姐","特工","游戏主播","神探","宫廷侯爵","皇帝","将军","毒医","厨娘","律师","医生","明星","替身","双面","冰山","古灵精怪","天作之合","可盐可甜","无CP","单女主","校花","无女主","病娇","女帝","特种兵","反派","萌宝","神医","宠妻","奶爸","学霸","公主","皇后","王妃","女强","皇叔","嫡女","精灵","天才","腹黑","扮猪吃虎","团宠"]
    static let allPlots = ["女频悬疑","西方奇幻","东方仙侠","古风世情","科幻末世","男频衍生","女频衍生","民国言情","都市高武","悬疑灵异","悬疑脑洞","抗战谍战","青春甜宠","双男主","古言脑洞","历史古代","历史脑洞","现言脑洞","都市种田","都市脑洞","都市日常","玄幻脑洞","玄幻言情","宫斗宅斗","豪门总裁","战神赘婿","动漫衍生","星光璀璨","游戏体育","职场婚恋","双女主","传统玄幻","都市修真","年代","种田","快穿","西游衍生","公版衍生","红楼衍生","甄嬛衍生","如懿衍生","斩神衍生","十日衍生","四合院","电竞","双重生","前世今生","乡村","逃荒","同人","打脸","破案","囤物资","钓鱼","HE","相爱相杀","暗恋","逃婚","带球跑","强强","一见钟情","双向奔赴","破镜重圆","契约婚姻","隐婚","闪婚","今穿古","古穿今","群穿","护短","虐渣","情有独钟","马甲","医术","网游","奥特同人","求生","女扮男装","青梅竹马","无敌","民国","九叔","穿书","聊天群","大秦","龙珠","漫威","神奇宝贝","海贼","火影","职场","明朝","家庭","三国","末世","直播","无限流","诸天万界","兽世","大唐","宠物","外卖","清穿","星际","美食","剑道","盗墓","虐文","甜宠","灵异","校园","鉴宝","系统","神豪","重生","穿越","二次元","海岛","娱乐圈","空间","推理","洪荒"]
}
