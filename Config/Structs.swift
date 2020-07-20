//
//  Structs.swift
//  GuestureBrick
//
//  Created by jim on 16/12/21.
//  Copyright © 2016年 Jim. All rights reserved.
//

import SpriteKit

struct BrickColor {
    static let green    = UIColor.init(rgb:0xc1f79a)
    static let blue     = UIColor.init(rgb:0x6ff5e8)
    static let purple   = UIColor.init(rgb:0xb9a3fb)
    static let violet   = UIColor.init(rgb:0xe0b0f5)
    
    static let red      = UIColor.init(rgb:0xffb3b3)
    
    static let magenta  = UIColor.init(rgb:0xffb9fd)
    static let orange   = UIColor.init(rgb:0xffcfaa)
    static let pink     = UIColor.init(rgb:0xffd4ec)
    static let yellow   = UIColor.init(rgb:0xfff4a7)
    
    static let stone    = UIColor.init(hexString: "#727b84")
    static let ltRed    = UIColor.init(hexString: "#c7665d")
    static let ltBlue   = UIColor.init(hexString: "#99a7b3")
    static let dkBlue   = UIColor.init(hexString: "#36425c")
    static let dkRed    = UIColor.init(hexString: "#971301")
    static let dkGray   = UIColor.init(hexString: "#3d221a")
    static let empty    = UIColor.clear
}

var BrickType:[UIColor] = [
    BrickColor.empty,   BrickColor.yellow,  BrickColor.pink,    BrickColor.orange,
    BrickColor.magenta, BrickColor.red,     BrickColor.violet,  BrickColor.purple,
    BrickColor.ltRed,   BrickColor.stone,   UIColor.white,      BrickColor.yellow,
    BrickColor.pink,    BrickColor.orange,  BrickColor.magenta, BrickColor.red,
    BrickColor.violet,  BrickColor.purple,  BrickColor.ltRed,   BrickColor.stone,
    UIColor.white,
    ]

struct Level {
    let id: Int
    let arr:[[Int]] // 10 columns , and of max 16 lines
}

struct PhysicsCategory {
    static let None         : UInt32 = 0
    static let All          : UInt32 = UInt32.max
    static let Ball         : UInt32 = 0b1      // primary ball
    static let Brick        : UInt32 = 0b10
    static let Buff         : UInt32 = 0b100
    static let Kongfu       : UInt32 = 0b1000
    static let KongfuMK     : UInt32 = 0b10000  // monkey - reset the ball
    static let KongfuTC     : UInt32 = 0b100000 // taichi - duplicate the ball
    static let BrickShades  : UInt32 = 0b1000000
    static let Boundary     : UInt32 = 0b100000000

}

public struct FontAwesome {
    static let fiveHundredPixels = "\u{f26e}"
    static let adjust = "\u{f042}"
    static let adn = "\u{f170}"
    static let alignCenter = "\u{f037}"
    static let alignJustify = "\u{f039}"
    static let alignLeft = "\u{f036}"
    static let alignRight = "\u{f038}"
    static let amazon = "\u{f270}"
    static let ambulance = "\u{f0f9}"
    static let americanSignLanguageInterpreting = "\u{f2a3}"
    static let anchor = "\u{f13d}"
    static let android = "\u{f17b}"
    static let angellist = "\u{f209}"
    static let angleDoubleDown = "\u{f103}"
    static let angleDoubleLeft = "\u{f100}"
    static let angleDoubleRight = "\u{f101}"
    static let angleDoubleUp = "\u{f102}"
    static let angleDown = "\u{f107}"
    static let angleLeft = "\u{f104}"
    static let angleRight = "\u{f105}"
    static let angleUp = "\u{f106}"
    static let apple = "\u{f179}"
    static let archive = "\u{f187}"
    static let areaChart = "\u{f1fe}"
    static let arrowCircleDown = "\u{f0ab}"
    static let arrowCircleLeft = "\u{f0a8}"
    static let arrowCircleODown = "\u{f01a}"
    static let arrowCircleOLeft = "\u{f190}"
    static let arrowCircleORight = "\u{f18e}"
    static let arrowCircleOUp = "\u{f01b}"
    static let arrowCircleRight = "\u{f0a9}"
    static let arrowCircleUp = "\u{f0aa}"
    static let arrowDown = "\u{f063}"
    static let arrowLeft = "\u{f060}"
    static let arrowRight = "\u{f061}"
    static let arrowUp = "\u{f062}"
    static let arrows = "\u{f047}"
    static let arrowsAlt = "\u{f0b2}"
    static let arrowsH = "\u{f07e}"
    static let arrowsV = "\u{f07d}"
    static let aslInterpreting = "\u{f2a3}A"
    static let assistiveListeningSystems = "\u{f2a2}"
    static let asterisk = "\u{f069}"
    static let at = "\u{f1fa}"
    static let audioDescription = "\u{f29e}"
    static let automobile = "\u{f1b9}A"
    static let backward = "\u{f04a}"
    static let balanceScale = "\u{f24e}"
    static let ban = "\u{f05e}"
    static let bank = "\u{f19c}A"
    static let barChart = "\u{f080}"
    static let barChartO = "\u{f080}A"
    static let barcode = "\u{f02a}"
    static let bars = "\u{f0c9}"
    static let battery0 = "\u{f244}A"
    static let battery1 = "\u{f243}A"
    static let battery2 = "\u{f242}A"
    static let battery3 = "\u{f241}A"
    static let battery4 = "\u{f240}A"
    static let batteryEmpty = "\u{f244}"
    static let batteryFull = "\u{f240}"
    static let batteryHalf = "\u{f242}"
    static let batteryQuarter = "\u{f243}"
    static let batteryThreeQuarters = "\u{f241}"
    static let bed = "\u{f236}"
    static let beer = "\u{f0fc}"
    static let behance = "\u{f1b4}"
    static let behanceSquare = "\u{f1b5}"
    static let bell = "\u{f0f3}"
    static let bellO = "\u{f0a2}"
    static let bellSlash = "\u{f1f6}"
    static let bellSlashO = "\u{f1f7}"
    static let bicycle = "\u{f206}"
    static let binoculars = "\u{f1e5}"
    static let birthdayCake = "\u{f1fd}"
    static let bitbucket = "\u{f171}"
    static let bitbucketSquare = "\u{f172}"
    static let bitcoin = "\u{f15a}A"
    static let blackTie = "\u{f27e}"
    static let blind = "\u{f29d}"
    static let bluetooth = "\u{f293}"
    static let bluetoothB = "\u{f294}"
    static let bold = "\u{f032}"
    static let bolt = "\u{f0e7}"
    static let bomb = "\u{f1e2}"
    static let book = "\u{f02d}"
    static let bookmark = "\u{f02e}"
    static let bookmarkO = "\u{f097}"
    static let braille = "\u{f2a1}"
    static let briefcase = "\u{f0b1}"
    static let btc = "\u{f15a}"
    static let bug = "\u{f188}"
    static let building = "\u{f1ad}"
    static let buildingO = "\u{f0f7}"
    static let bullhorn = "\u{f0a1}"
    static let bullseye = "\u{f140}"
    static let bus = "\u{f207}"
    static let buysellads = "\u{f20d}"
    static let cab = "\u{f1ba}A"
    static let calculator = "\u{f1ec}"
    static let calendar = "\u{f073}"
    static let calendarCheckO = "\u{f274}"
    static let calendarMinusO = "\u{f272}"
    static let calendarO = "\u{f133}"
    static let calendarPlusO = "\u{f271}"
    static let calendarTimesO = "\u{f273}"
    static let camera = "\u{f030}"
    static let cameraRetro = "\u{f083}"
    static let car = "\u{f1b9}"
    static let caretDown = "\u{f0d7}"
    static let caretLeft = "\u{f0d9}"
    static let caretRight = "\u{f0da}"
    static let caretSquareODown = "\u{f150}"
    static let caretSquareOLeft = "\u{f191}"
    static let caretSquareORight = "\u{f152}"
    static let caretSquareOUp = "\u{f151}"
    static let caretUp = "\u{f0d8}"
    static let cartArrowDown = "\u{f218}"
    static let cartPlus = "\u{f217}"
    static let cc = "\u{f20a}"
    static let ccAmex = "\u{f1f3}"
    static let ccDinersClub = "\u{f24c}"
    static let ccDiscover = "\u{f1f2}"
    static let ccJCB = "\u{f24b}"
    static let ccMasterCard = "\u{f1f1}"
    static let ccPaypal = "\u{f1f4}"
    static let ccStripe = "\u{f1f5}"
    static let ccVisa = "\u{f1f0}"
    static let certificate = "\u{f0a3}"
    static let chain = "\u{f0c1}A"
    static let chainBroken = "\u{f127}"
    static let check = "\u{f00c}"
    static let checkCircle = "\u{f058}"
    static let checkCircleO = "\u{f05d}"
    static let checkSquare = "\u{f14a}"
    static let checkSquareO = "\u{f046}"
    static let chevronCircleDown = "\u{f13a}"
    static let chevronCircleLeft = "\u{f137}"
    static let chevronCircleRight = "\u{f138}"
    static let chevronCircleUp = "\u{f139}"
    static let chevronDown = "\u{f078}"
    static let chevronLeft = "\u{f053}"
    static let chevronRight = "\u{f054}"
    static let chevronUp = "\u{f077}"
    static let child = "\u{f1ae}"
    static let chrome = "\u{f268}"
    static let circle = "\u{f111}"
    static let circleO = "\u{f10c}"
    static let circleONotch = "\u{f1ce}"
    static let circleThin = "\u{f1db}"
    static let clipboard = "\u{f0ea}"
    static let clockO = "\u{f017}"
    static let clone = "\u{f24d}"
    static let close = "\u{f00d}A"
    static let cloud = "\u{f0c2}"
    static let cloudDownload = "\u{f0ed}"
    static let cloudUpload = "\u{f0ee}"
    static let cny = "\u{f157}A"
    static let code = "\u{f121}"
    static let codeFork = "\u{f126}"
    static let codepen = "\u{f1cb}"
    static let codiepie = "\u{f284}"
    static let coffee = "\u{f0f4}"
    static let cog = "\u{f013}"
    static let cogs = "\u{f085}"
    static let columns = "\u{f0db}"
    static let comment = "\u{f075}"
    static let commentO = "\u{f0e5}"
    static let commenting = "\u{f27a}"
    static let commentingO = "\u{f27b}"
    static let comments = "\u{f086}"
    static let commentsO = "\u{f0e6}"
    static let compass = "\u{f14e}"
    static let compress = "\u{f066}"
    static let connectdevelop = "\u{f20e}"
    static let contao = "\u{f26d}"
    static let copy = "\u{f0c5}A"
    static let copyright = "\u{f1f9}"
    static let creativeCommons = "\u{f25e}"
    static let creditCard = "\u{f09d}"
    static let creditCardAlt = "\u{f283}"
    static let crop = "\u{f125}"
    static let crosshairs = "\u{f05b}"
    static let css3 = "\u{f13c}"
    static let cube = "\u{f1b2}"
    static let cubes = "\u{f1b3}"
    static let cut = "\u{f0c4}A"
    static let cutlery = "\u{f0f5}"
    static let dashboard = "\u{f0e4}A"
    static let dashcube = "\u{f210}"
    static let database = "\u{f1c0}"
    static let deaf = "\u{f2a4}"
    static let deafness = "\u{f2a4}A"
    static let dedent = "\u{f03b}A"
    static let delicious = "\u{f1a5}"
    static let desktop = "\u{f108}"
    static let deviantart = "\u{f1bd}"
    static let diamond = "\u{f219}"
    static let digg = "\u{f1a6}"
    static let dollar = "\u{f155}A"
    static let dotCircleO = "\u{f192}"
    static let download = "\u{f019}"
    static let dribbble = "\u{f17d}"
    static let dropbox = "\u{f16b}"
    static let drupal = "\u{f1a9}"
    static let edge = "\u{f282}"
    static let edit = "\u{f044}A"
    static let eject = "\u{f052}"
    static let ellipsisH = "\u{f141}"
    static let ellipsisV = "\u{f142}"
    static let empire = "\u{f1d1}"
    static let envelope = "\u{f0e0}"
    static let envelopeO = "\u{f003}"
    static let envelopeSquare = "\u{f199}"
    static let envira = "\u{f299}"
    static let eraser = "\u{f12d}"
    static let eur = "\u{f153}"
    static let euro = "\u{f153}A"
    static let exchange = "\u{f0ec}"
    static let exclamation = "\u{f12a}"
    static let exclamationCircle = "\u{f06a}"
    static let exclamationTriangle = "\u{f071}"
    static let expand = "\u{f065}"
    static let expeditedSSL = "\u{f23e}"
    static let externalLink = "\u{f08e}"
    static let externalLinkSquare = "\u{f14c}"
    static let eye = "\u{f06e}"
    static let eyeSlash = "\u{f070}"
    static let eyedropper = "\u{f1fb}"
    static let fa = "\u{f2b4}A"
    static let facebook = "\u{f09a}"
    static let facebookF = "\u{f09a}A"
    static let facebookOfficial = "\u{f230}"
    static let facebookSquare = "\u{f082}"
    static let fastBackward = "\u{f049}"
    static let fastForward = "\u{f050}"
    static let fax = "\u{f1ac}"
    static let feed = "\u{f09e}A"
    static let female = "\u{f182}"
    static let fighterJet = "\u{f0fb}"
    static let file = "\u{f15b}"
    static let fileArchiveO = "\u{f1c6}"
    static let fileAudioO = "\u{f1c7}"
    static let fileCodeO = "\u{f1c9}"
    static let fileExcelO = "\u{f1c3}"
    static let fileImageO = "\u{f1c5}"
    static let fileMovieO = "\u{f1c8}A"
    static let fileO = "\u{f016}"
    static let filePdfO = "\u{f1c1}"
    static let filePhotoO = "\u{f1c5}A"
    static let filePictureO = "\u{f1c5}B"
    static let filePowerpointO = "\u{f1c4}"
    static let fileSoundO = "\u{f1c7}A"
    static let fileText = "\u{f15c}"
    static let fileTextO = "\u{f0f6}"
    static let fileVideoO = "\u{f1c8}"
    static let fileWordO = "\u{f1c2}"
    static let fileZipO = "\u{f1c6}A"
    static let filesO = "\u{f0c5}"
    static let film = "\u{f008}"
    static let filter = "\u{f0b0}"
    static let fire = "\u{f06d}"
    static let fireExtinguisher = "\u{f134}"
    static let firefox = "\u{f269}"
    static let firstOrder = "\u{f2b0}"
    static let flag = "\u{f024}"
    static let flagCheckered = "\u{f11e}"
    static let flagO = "\u{f11d}"
    static let flash = "\u{f0e7}A"
    static let flask = "\u{f0c3}"
    static let flickr = "\u{f16e}"
    static let floppyO = "\u{f0c7}"
    static let folder = "\u{f07b}"
    static let folderO = "\u{f114}"
    static let folderOpen = "\u{f07c}"
    static let folderOpenO = "\u{f115}"
    static let font = "\u{f031}"
    static let fontAwesome = "\u{f2b4}"
    static let fonticons = "\u{f280}"
    static let fortAwesome = "\u{f286}"
    static let forumbee = "\u{f211}"
    static let forward = "\u{f04e}"
    static let foursquare = "\u{f180}"
    static let frownO = "\u{f119}"
    static let futbolO = "\u{f1e3}"
    static let gamepad = "\u{f11b}"
    static let gavel = "\u{f0e3}"
    static let gbp = "\u{f154}"
    static let ge = "\u{f1d1}A"
    static let gear = "\u{f013}A"
    static let gears = "\u{f085}A"
    static let genderless = "\u{f22d}"
    static let getPocket = "\u{f265}"
    static let gg = "\u{f260}"
    static let ggCircle = "\u{f261}"
    static let gift = "\u{f06b}"
    static let git = "\u{f1d3}"
    static let gitSquare = "\u{f1d2}"
    static let github = "\u{f09b}"
    static let githubAlt = "\u{f113}"
    static let githubSquare = "\u{f092}"
    static let gitlab = "\u{f296}"
    static let gittip = "\u{f184}A"
    static let glass = "\u{f000}"
    static let glide = "\u{f2a5}"
    static let glideG = "\u{f2a6}"
    static let globe = "\u{f0ac}"
    static let google = "\u{f1a0}"
    static let googlePlus = "\u{f0d5}"
    static let googlePlusCircle = "\u{f2b3}A"
    static let googlePlusOfficial = "\u{f2b3}"
    static let googlePlusSquare = "\u{f0d4}"
    static let googleWallet = "\u{f1ee}"
    static let graduationCap = "\u{f19d}"
    static let gratipay = "\u{f184}"
    static let group = "\u{f0c0}A"
    static let hSquare = "\u{f0fd}"
    static let hackerNews = "\u{f1d4}"
    static let handGrabO = "\u{f255}A"
    static let handLizardO = "\u{f258}"
    static let handODown = "\u{f0a7}"
    static let handOLeft = "\u{f0a5}"
    static let handORight = "\u{f0a4}"
    static let handOUp = "\u{f0a6}"
    static let handPaperO = "\u{f256}"
    static let handPeaceO = "\u{f25b}"
    static let handPointerO = "\u{f25a}"
    static let handRockO = "\u{f255}"
    static let handScissorsO = "\u{f257}"
    static let handSpockO = "\u{f259}"
    static let handStopO = "\u{f256}A"
    static let hardOfHearing = "\u{f2a4}B"
    static let hashtag = "\u{f292}"
    static let hddO = "\u{f0a0}"
    static let header = "\u{f1dc}"
    static let headphones = "\u{f025}"
    static let heart = "\u{f004}"
    static let heartO = "\u{f08a}"
    static let heartbeat = "\u{f21e}"
    static let history = "\u{f1da}"
    static let home = "\u{f015}"
    static let hospitalO = "\u{f0f8}"
    static let hotel = "\u{f236}A"
    static let hourglass = "\u{f254}"
    static let hourglass1 = "\u{f251}A"
    static let hourglass2 = "\u{f252}A"
    static let hourglass3 = "\u{f253}A"
    static let hourglassEnd = "\u{f253}"
    static let hourglassHalf = "\u{f252}"
    static let hourglassO = "\u{f250}"
    static let hourglassStart = "\u{f251}"
    static let houzz = "\u{f27c}"
    static let html5 = "\u{f13b}"
    static let iCursor = "\u{f246}"
    static let ils = "\u{f20b}"
    static let image = "\u{f03e}A"
    static let inbox = "\u{f01c}"
    static let indent = "\u{f03c}"
    static let industry = "\u{f275}"
    static let info = "\u{f129}"
    static let infoCircle = "\u{f05a}"
    static let inr = "\u{f156}"
    static let instagram = "\u{f16d}"
    static let institution = "\u{f19c}B"
    static let internetExplorer = "\u{f26b}"
    static let intersex = "\u{f224}A"
    static let ioxhost = "\u{f208}"
    static let italic = "\u{f033}"
    static let joomla = "\u{f1aa}"
    static let jpy = "\u{f157}"
    static let jsfiddle = "\u{f1cc}"
    static let key = "\u{f084}"
    static let keyboardO = "\u{f11c}"
    static let krw = "\u{f159}"
    static let language = "\u{f1ab}"
    static let laptop = "\u{f109}"
    static let lastFM = "\u{f202}"
    static let lastFMSquare = "\u{f203}"
    static let leaf = "\u{f06c}"
    static let leanpub = "\u{f212}"
    static let legal = "\u{f0e3}A"
    static let lemonO = "\u{f094}"
    static let levelDown = "\u{f149}"
    static let levelUp = "\u{f148}"
    static let lifeBouy = "\u{f1cd}A"
    static let lifeBuoy = "\u{f1cd}B"
    static let lifeRing = "\u{f1cd}"
    static let lifeSaver = "\u{f1cd}C"
    static let lightbulbO = "\u{f0eb}"
    static let lineChart = "\u{f201}"
    static let link = "\u{f0c1}"
    static let linkedIn = "\u{f0e1}"
    static let linkedInSquare = "\u{f08c}"
    static let linux = "\u{f17c}"
    static let list = "\u{f03a}"
    static let listAlt = "\u{f022}"
    static let listOL = "\u{f0cb}"
    static let listUL = "\u{f0ca}"
    static let locationArrow = "\u{f124}"
    static let lock = "\u{f023}"
    static let longArrowDown = "\u{f175}"
    static let longArrowLeft = "\u{f177}"
    static let longArrowRight = "\u{f178}"
    static let longArrowUp = "\u{f176}"
    static let lowVision = "\u{f2a8}"
    static let magic = "\u{f0d0}"
    static let magnet = "\u{f076}"
    static let mailForward = "\u{f064}A"
    static let mailReply = "\u{f112}A"
    static let mailReplyAll = "\u{f122}A"
    static let male = "\u{f183}"
    static let map = "\u{f279}"
    static let mapMarker = "\u{f041}"
    static let mapO = "\u{f278}"
    static let mapPin = "\u{f276}"
    static let mapSigns = "\u{f277}"
    static let mars = "\u{f222}"
    static let marsDouble = "\u{f227}"
    static let marsStroke = "\u{f229}"
    static let marsStrokeH = "\u{f22b}"
    static let marsStrokeV = "\u{f22a}"
    static let maxcdn = "\u{f136}"
    static let meanpath = "\u{f20c}"
    static let medium = "\u{f23a}"
    static let medkit = "\u{f0fa}"
    static let mehO = "\u{f11a}"
    static let mercury = "\u{f223}"
    static let microphone = "\u{f130}"
    static let microphoneSlash = "\u{f131}"
    static let minus = "\u{f068}"
    static let minusCircle = "\u{f056}"
    static let minusSquare = "\u{f146}"
    static let minusSquareO = "\u{f147}"
    static let mixcloud = "\u{f289}"
    static let mobile = "\u{f10b}"
    static let mobilePhone = "\u{f10b}A"
    static let modx = "\u{f285}"
    static let money = "\u{f0d6}"
    static let moonO = "\u{f186}"
    static let mortarBoard = "\u{f19d}A"
    static let motorcycle = "\u{f21c}"
    static let mousePointer = "\u{f245}"
    static let music = "\u{f001}"
    static let navicon = "\u{f0c9}A"
    static let neuter = "\u{f22c}"
    static let newspaperO = "\u{f1ea}"
    static let objectGroup = "\u{f247}"
    static let objectUngroup = "\u{f248}"
    static let odnoklassniki = "\u{f263}"
    static let odnoklassnikiSquare = "\u{f264}"
    static let openCart = "\u{f23d}"
    static let openID = "\u{f19b}"
    static let opera = "\u{f26a}"
    static let optinMonster = "\u{f23c}"
    static let outdent = "\u{f03b}"
    static let pagelines = "\u{f18c}"
    static let paintBrush = "\u{f1fc}"
    static let paperPlane = "\u{f1d8}"
    static let paperPlaneO = "\u{f1d9}"
    static let paperclip = "\u{f0c6}"
    static let paragraph = "\u{f1dd}"
    static let paste = "\u{f0ea}A"
    static let pause = "\u{f04c}"
    static let pauseCircle = "\u{f28b}"
    static let pauseCircleO = "\u{f28c}"
    static let paw = "\u{f1b0}"
    static let paypal = "\u{f1ed}"
    static let pencil = "\u{f040}"
    static let pencilSquare = "\u{f14b}"
    static let pencilSquareO = "\u{f044}"
    static let percent = "\u{f295}"
    static let phone = "\u{f095}"
    static let phoneSquare = "\u{f098}"
    static let photo = "\u{f03e}B"
    static let pictureO = "\u{f03e}"
    static let pieChart = "\u{f200}"
    static let piedPiper = "\u{f2ae}"
    static let piedPiperAlt = "\u{f1a8}"
    static let piedPiperPp = "\u{f1a7}"
    static let pinterest = "\u{f0d2}"
    static let pinterestP = "\u{f231}"
    static let pinterestSquare = "\u{f0d3}"
    static let plane = "\u{f072}"
    static let play = "\u{f04b}"
    static let playCircle = "\u{f144}"
    static let playCircleO = "\u{f01d}"
    static let plug = "\u{f1e6}"
    static let plus = "\u{f067}"
    static let plusCircle = "\u{f055}"
    static let plusSquare = "\u{f0fe}"
    static let plusSquareO = "\u{f196}"
    static let powerOff = "\u{f011}"
    static let print = "\u{f02f}"
    static let productHunt = "\u{f288}"
    static let puzzlePiece = "\u{f12e}"
    static let qq = "\u{f1d6}"
    static let qrcode = "\u{f029}"
    static let question = "\u{f128}"
    static let questionCircle = "\u{f059}"
    static let questionCircleO = "\u{f29c}"
    static let quoteLeft = "\u{f10d}"
    static let quoteRight = "\u{f10e}"
    static let ra = "\u{f1d0}A"
    static let random = "\u{f074}"
    static let rebel = "\u{f1d0}"
    static let recycle = "\u{f1b8}"
    static let reddit = "\u{f1a1}"
    static let redditAlien = "\u{f281}"
    static let redditSquare = "\u{f1a2}"
    static let refresh = "\u{f021}"
    static let registered = "\u{f25d}"
    static let remove = "\u{f00d}B"
    static let renren = "\u{f18b}"
    static let reorder = "\u{f0c9}B"
    static let `repeat` = "\u{f01e}"
    static let reply = "\u{f112}"
    static let replyAll = "\u{f122}"
    static let resistance = "\u{f1d0}B"
    static let retweet = "\u{f079}"
    static let rmb = "\u{f157}B"
    static let road = "\u{f018}"
    static let rocket = "\u{f135}"
    static let rotateLeft = "\u{f0e2}A"
    static let rotateRight = "\u{f01e}A"
    static let rouble = "\u{f158}A"
    static let rss = "\u{f09e}"
    static let rssSquare = "\u{f143}"
    static let rub = "\u{f158}"
    static let ruble = "\u{f158}B"
    static let rupee = "\u{f156}A"
    static let safari = "\u{f267}"
    static let save = "\u{f0c7}A"
    static let scissors = "\u{f0c4}"
    static let scribd = "\u{f28a}"
    static let search = "\u{f002}"
    static let searchMinus = "\u{f010}"
    static let searchPlus = "\u{f00e}"
    static let sellsy = "\u{f213}"
    static let send = "\u{f1d8}A"
    static let sendO = "\u{f1d9}A"
    static let server = "\u{f233}"
    static let share = "\u{f064}"
    static let shareAlt = "\u{f1e0}"
    static let shareAltSquare = "\u{f1e1}"
    static let shareSquare = "\u{f14d}"
    static let shareSquareO = "\u{f045}"
    static let shekel = "\u{f20b}A"
    static let sheqel = "\u{f20b}B"
    static let shield = "\u{f132}"
    static let ship = "\u{f21a}"
    static let shirtsinbulk = "\u{f214}"
    static let shoppingBag = "\u{f290}"
    static let shoppingBasket = "\u{f291}"
    static let shoppingCart = "\u{f07a}"
    static let signIn = "\u{f090}"
    static let signLanguage = "\u{f2a7}"
    static let signOut = "\u{f08b}"
    static let signal = "\u{f012}"
    static let signing = "\u{f2a7}A"
    static let simplybuilt = "\u{f215}"
    static let sitemap = "\u{f0e8}"
    static let skyatlas = "\u{f216}"
    static let skype = "\u{f17e}"
    static let slack = "\u{f198}"
    static let sliders = "\u{f1de}"
    static let slideshare = "\u{f1e7}"
    static let smileO = "\u{f118}"
    static let snapchat = "\u{f2ab}"
    static let snapchatGhost = "\u{f2ac}"
    static let snapchatSquare = "\u{f2ad}"
    static let soccerBallO = "\u{f1e3}A"
    static let sort = "\u{f0dc}"
    static let sortAlphaAsc = "\u{f15d}"
    static let sortAlphaDesc = "\u{f15e}"
    static let sortAmountAsc = "\u{f160}"
    static let sortAmountDesc = "\u{f161}"
    static let sortAsc = "\u{f0de}"
    static let sortDesc = "\u{f0dd}"
    static let sortDown = "\u{f0dd}A"
    static let sortNumericAsc = "\u{f162}"
    static let sortNumericDesc = "\u{f163}"
    static let sortUp = "\u{f0de}A"
    static let soundCloud = "\u{f1be}"
    static let spaceShuttle = "\u{f197}"
    static let spinner = "\u{f110}"
    static let spoon = "\u{f1b1}"
    static let spotify = "\u{f1bc}"
    static let square = "\u{f0c8}"
    static let squareO = "\u{f096}"
    static let stackExchange = "\u{f18d}"
    static let stackOverflow = "\u{f16c}"
    static let star = "\u{f005}"
    static let starHalf = "\u{f089}"
    static let starHalfEmpty = "\u{f123}A"
    static let starHalfFull = "\u{f123}B"
    static let starHalfO = "\u{f123}"
    static let starO = "\u{f006}"
    static let steam = "\u{f1b6}"
    static let steamSquare = "\u{f1b7}"
    static let stepBackward = "\u{f048}"
    static let stepForward = "\u{f051}"
    static let stethoscope = "\u{f0f1}"
    static let stickyNote = "\u{f249}"
    static let stickyNoteO = "\u{f24a}"
    static let stop = "\u{f04d}"
    static let stopCircle = "\u{f28d}"
    static let stopCircleO = "\u{f28e}"
    static let streetView = "\u{f21d}"
    static let strikethrough = "\u{f0cc}"
    static let stumbleUpon = "\u{f1a4}"
    static let stumbleUponCircle = "\u{f1a3}"
    static let `subscript` = "\u{f12c}"
    static let subway = "\u{f239}"
    static let suitcase = "\u{f0f2}"
    static let sunO = "\u{f185}"
    static let superscript = "\u{f12b}"
    static let support = "\u{f1cd}D"
    static let table = "\u{f0ce}"
    static let tablet = "\u{f10a}"
    static let tachometer = "\u{f0e4}"
    static let tag = "\u{f02b}"
    static let tags = "\u{f02c}"
    static let tasks = "\u{f0ae}"
    static let taxi = "\u{f1ba}"
    static let television = "\u{f26c}"
    static let tencentWeibo = "\u{f1d5}"
    static let terminal = "\u{f120}"
    static let textHeight = "\u{f034}"
    static let textWidth = "\u{f035}"
    static let th = "\u{f00a}"
    static let thLarge = "\u{f009}"
    static let thList = "\u{f00b}"
    static let themeisle = "\u{f2b2}"
    static let thumbTack = "\u{f08d}"
    static let thumbsDown = "\u{f165}"
    static let thumbsODown = "\u{f088}"
    static let thumbsOUp = "\u{f087}"
    static let thumbsUp = "\u{f164}"
    static let ticket = "\u{f145}"
    static let times = "\u{f00d}"
    static let timesCircle = "\u{f057}"
    static let timesCircleO = "\u{f05c}"
    static let tint = "\u{f043}"
    static let toggleDown = "\u{f150}A"
    static let toggleLeft = "\u{f191}A"
    static let toggleOff = "\u{f204}"
    static let toggleOn = "\u{f205}"
    static let toggleRight = "\u{f152}A"
    static let toggleUp = "\u{f151}A"
    static let trademark = "\u{f25c}"
    static let train = "\u{f238}"
    static let transgender = "\u{f224}"
    static let transgenderAlt = "\u{f225}"
    static let trash = "\u{f1f8}"
    static let trashO = "\u{f014}"
    static let tree = "\u{f1bb}"
    static let trello = "\u{f181}"
    static let tripAdvisor = "\u{f262}"
    static let trophy = "\u{f091}"
    static let truck = "\u{f0d1}"
    static let `try` = "\u{f195}"
    static let tty = "\u{f1e4}"
    static let tumblr = "\u{f173}"
    static let tumblrSquare = "\u{f174}"
    static let turkishLira = "\u{f195}A"
    static let tv = "\u{f26c}A"
    static let twitch = "\u{f1e8}"
    static let twitter = "\u{f099}"
    static let twitterSquare = "\u{f081}"
    static let umbrella = "\u{f0e9}"
    static let underline = "\u{f0cd}"
    static let undo = "\u{f0e2}"
    static let universalAccess = "\u{f29a}"
    static let university = "\u{f19c}"
    static let unlink = "\u{f127}A"
    static let unlock = "\u{f09c}"
    static let unlockAlt = "\u{f13e}"
    static let unsorted = "\u{f0dc}A"
    static let upload = "\u{f093}"
    static let usb = "\u{f287}"
    static let usd = "\u{f155}"
    static let user = "\u{f007}"
    static let userMd = "\u{f0f0}"
    static let userPlus = "\u{f234}"
    static let userSecret = "\u{f21b}"
    static let userTimes = "\u{f235}"
    static let users = "\u{f0c0}"
    static let venus = "\u{f221}"
    static let venusDouble = "\u{f226}"
    static let venusMars = "\u{f228}"
    static let viacoin = "\u{f237}"
    static let viadeo = "\u{f2a9}"
    static let viadeoSquare = "\u{f2aa}"
    static let videoCamera = "\u{f03d}"
    static let vimeo = "\u{f27d}"
    static let vimeoSquare = "\u{f194}"
    static let vine = "\u{f1ca}"
    static let vk = "\u{f189}"
    static let volumeControlPhone = "\u{f2a0}"
    static let volumeDown = "\u{f027}"
    static let volumeOff = "\u{f026}"
    static let volumeUp = "\u{f028}"
    static let warning = "\u{f071}A"
    static let wechat = "\u{f1d7}A"
    static let weibo = "\u{f18a}"
    static let weixin = "\u{f1d7}"
    static let whatsapp = "\u{f232}"
    static let wheelchair = "\u{f193}"
    static let wheelchairAlt = "\u{f29b}"
    static let wifi = "\u{f1eb}"
    static let wikipediaW = "\u{f266}"
    static let windows = "\u{f17a}"
    static let won = "\u{f159}A"
    static let wordpress = "\u{f19a}"
    static let wpbeginner = "\u{f297}"
    static let wpforms = "\u{f298}"
    static let wrench = "\u{f0ad}"
    static let xing = "\u{f168}"
    static let xingSquare = "\u{f169}"
    static let yCombinator = "\u{f23b}"
    static let yCombinatorSquare = "\u{f1d4}A"
    static let yahoo = "\u{f19e}"
    static let yc = "\u{f23b}A"
    static let ycSquare = "\u{f1d4}B"
    static let yelp = "\u{f1e9}"
    static let yen = "\u{f157}C"
    static let yoast = "\u{f2b1}"
    static let youTube = "\u{f167}"
    static let youTubePlay = "\u{f16a}"
    static let youTubeSquare = "\u{f166}"
}


