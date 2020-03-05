#IfWinActive Ephinea: Phantasy Star Online Blue Burst

;   ////////////////////////////////
;   //// Default Lobby Settings ////
;   //// edit these as you need ////
;   ////////////////////////////////
;   episodes: 1, 2, 4
;   defaultGameName should not be longer than 8 characters
;   defaultGamePass should not be longer than 12 characters
;   play modes: "normal" "challenge" "one person" "battle"
;   difficulties: "normal" "hard" "very hard" "ultimate"

global defaultEpisode := 1
global defaultGameName := "gamename"
global defaultGamePass := "pass"
global defaultPlayMode := "normal"
global defaultDifficulty := "normal"

;   ///////////////////////////////////////////
;   //// Global Key Delay & Press Duration ////
;   //// You should not need to edit these ////
;   ///////////////////////////////////////////

global defaultKeyDelay := 110
global defaultKeyPress := 60
global shortKeyDelay := 30
global shortKeyPress := 30

;   ///////////////////////////////////////
;   //// Global Current Game Variables ////
;   //// do not need to edit these     ////
;   ///////////////////////////////////////

global currentEpisode := ""
global currentGameName := ""
global currentGamePass := ""
global currentPlayMode := ""
global currentDifficulty := ""


;   //// Set Normal Key Delay ////
SetKeyDelayNormal()

^r::Reload

;   ///////////////////////////
;   //// EPISODE 1 SCRIPTS ////
;   ///////////////////////////

; [Episode 1] [Multi] [Normal]
<^1::
    OrganizeParty(1,"","","normal","normal")
    return

; [Episode 1] [Solo] [Normal]
>^1::
    OrganizeParty(1,"","","one person","normal")
    return

; [Episode 1] [Multi] [Hard]
<!1::
    OrganizeParty(1,"","","normal","hard")
    return

; [Episode 1] [Solo] [Hard]
>!1::
    OrganizeParty(1,"","","one person","hard")
    return

; [Episode 1] [Multi] [Very Hard]
<^<!1::
    OrganizeParty(1,"","","normal","very hard")
    return

; [Episode 1] [Solo] [Very Hard]
>^>!1::
    OrganizeParty(1,"","","one person","very hard")
    return

; [Episode 1] [Multi] [Ultimate]
<+1::
    OrganizeParty(1,"","","normal","ultimate")
    return

; [Episode 1] [Solo] [Ultimate]
>+1::
    OrganizeParty(1,"","","one person","ultimate")
    return

;   ///////////////////////////
;   //// EPISODE 2 SCRIPTS ////
;   ///////////////////////////

; [Episode 2] [Multi] [Normal]
<^2::
    OrganizeParty(2,"","","normal","normal")
    return

; [Episode 2] [Solo] [Normal]
>^2::
    OrganizeParty(2,"","","one person","normal")
    return

; [Episode 2] [Multi] [Hard]
<!2::
    OrganizeParty(2,"","","normal","hard")
    return

; [Episode 2] [Solo] [Hard]
>!2::
    OrganizeParty(2,"","","one person","hard")
    return

; [Episode 2] [Multi] [Very Hard]
<^<!2::
    OrganizeParty(2,"","","normal","very hard")
    return

; [Episode 2] [Solo] [Very Hard]
>^>!2::
    OrganizeParty(2,"","","one person","very hard")
    return

; [Episode 2] [Multi] [Ultimate]
<+2::
    OrganizeParty(2,"","","normal","ultimate")
    return

; [Episode 2] [Solo] [Ultimate]
>+2::
    OrganizeParty(2,"","","one person","ultimate")
    return

;   ///////////////////////////
;   //// EPISODE 4 SCRIPTS ////
;   ///////////////////////////

; [Episode 4] [Multi] [Normal]
<^4::
    OrganizeParty(4,"","","normal","normal")
    return

; [Episode 4] [Solo] [Normal]
>^4::
    OrganizeParty(4,"","","one person","normal")
    return

; [Episode 4] [Multi] [Hard]
<!4::
    OrganizeParty(4,"","","normal","hard")
    return

; [Episode 4] [Solo] [Hard]
>!4::
    OrganizeParty(4,"","","one person","hard")
    return

; [Episode 4] [Multi] [Very Hard]
<^<!4::
    OrganizeParty(4,"","","normal","very hard")
    return

; [Episode 4] [Solo] [Very Hard]
>^>!4::
    OrganizeParty(4,"","","one person","very hard")
    return

; [Episode 4] [Multi] [Ultimate]
<+4::
    OrganizeParty(4,"","","normal","ultimate")
    return

; [Episode 4] [Solo] [Ultimate]
>+4::
    OrganizeParty(4,"","","one person","ultimate")
    return

;   /////////////////////////
;   //// UTILITY SCRIPTS ////
;   /////////////////////////

;   //// Exit Game, Return to Lobby ///
^x::
    ToolTip, , 0, 0, 1
    Send, {Space}
    PSOSendKeys("/lobby")
    Send, {Enter}
    return
    
;   //// Bank Toggle ///
^b::
    Send, {Space}
    PSOSendKeys("/bank")
    Send, {Enter}
    return

;   ////////////////////////////////////
;   //// SCRIPT FUNCTIONS AND LOGIC ////
;   ////////////////////////////////////

OpenCounter() {
    Send, {Enter}
}

CreatePartyEpisode(episode:=-1) {
    if (episode == -1) {
        episode := defaultEpisode
    }
    if (IsInvalidEpisode(episode)) {
        ShowErrorMessage("Episode", "Invalid Episode # -- use 1, 2 or 4")
        return
    }
    currentEpisode := episode
    Send, {Enter}
    Send, {Down}
    Send, {Enter}
    down := GetEpisodeSelect(episode)
    Loop % down
    {
        Send, {Down}
    }
    Send, {Enter}
}

GetEpisodeSelect(episode) {
    if (episode == 1) {
        return 0
    } else if (episode == 2) {
        return 1
    } else {
        return 2
    }
}

SetPartyName(name:="") {
    if (name = "") {
        name := defaultGameName
        if (name = "") {
            name := AppendRandSuffix("agentbabs")
        }
    }
    currentGameName := name
    Send, {Enter}
    PSOSendKeys(name)
    Send, {Enter}
}

SetPartyNameExt(name:="") {
    if (name = "") {
        name := defaultGameName
    }
    name := AppendRandSuffix(defaultGameName)
    currentGameName := name
    Send, {Enter}
    PSOSendKeys(name)
    Send, {Enter}
}

SetPartyPassword(pass:="", default:=true) {
    Send, {Down}
    if (pass = "" && default) {
        pass := defaultGamePass
    }
    if (pass != "") {
        Send, {Enter}
        PSOSendKeys(pass)
        Send, {Enter}
    }
    currentGamePass := pass
}

SetPlayMode(mode:="") {
    Send, {Down}
    if (mode = "") {
        mode := defaultPlayMode
    }
    if (IsInvalidPlayMode(mode)) {
        ShowErrorMessage("Play Mode", "Invalid Play Mode -- use 'normal', 'challenge', 'battle' or 'one person'")
        return
    }
    if (mode != "normal") {
        down := GetPlayMode(mode)
        Send, {Enter}
        Loop % down
        {
            send, {Down}
        }
        Send, {Enter}
    }
    currentPlayMode := mode
}

GetPlayMode(mode) {
    if (mode == "normal") {
        return 0
    } else if (mode == "challenge") {
        return 1
    } else if (mode == "battle") {
        return 2
    } else if (mode == "one person") {
        return 3
    } else {
        return 0
    }
}

SetDifficulty(difficulty:="") {
    Send, {Down}
    if (difficulty = "") {
        difficulty := defaultDifficulty
    }
    if (IsInvalidDifficulty(difficulty)) {
        ShowErrorMessage("Difficulty", "Invalid difficulty -- use 'normal', 'hard', 'very hard' or 'ultimate'")
        return
    }
    if (difficulty != "normal") {
        down := GetDifficulty(difficulty)
        Send, {Enter}
        Loop % down
        {
            Send, {Down}
        }
        Send, {Enter}
    }
    currentDifficulty := difficulty
}

GetDifficulty(difficulty) {
    if (difficulty == "normal") {
        return 0
    } else if (difficulty == "hard") {
        return 1
    } else if (difficulty == "very hard") {
        return 2
    } else if (difficulty == "ultimate") {
        return 3
    } else {
        return 0
    }
}

PSOSendKeys(string) {
    SetKeyDelayShort()
    Send % string
    SetKeyDelayNormal()
}

RegisterParty() {
    Send, {Down}
    Send, {Enter}
    Send, {Enter}
    ShowPartyInfo()
}

ShowPartyInfo() {
    ToolTip % "Name: " . currentGameName . " Password: " . currentGamePass . " Episode: " . currentEpisode . " Mode: " . currentPlayMode . " Difficulty: " . currentDifficulty, 0, 0, 1
}

ShowErrorMessage(type, msg) {
    ToolTip % "ERROR: " . type . " - " . msg
}

AppendRandSuffix(str) {
    str.= "-"
    return str.= RandomStr()
}

RandomStr(l = 3, i = 48, x = 122) { ; length, lowest and highest Asc value
	Loop, %l% {
		Random, r, i, x
		s .= Chr(r)
	}
    s := RegExReplace(s, "\W", "i")
	Return, s
}

OrganizeParty(episode:=-1, name:="", pass:="", mode:="", difficulty:="", defaultPass:=true) {
    if (epsiode == -1) {
        epsiode := defaultEpisode
    }
    if IsInvalidEpisode(episode) {
        ShowErrorMessage("Episode", "Invalid Episode # -- use 1, 2 or 4")
        return
    }
    if (name == "") {
        name := defaultGameName
        if (name == "") {
            ShowErrorMessage("Game Name", "Cannot be blank, set a default name or provide one")
            return
        }
    }
    if (pass == "") {
        if (defaultPass) {
            pass := defaultGamePass
        }
    }
    if (mode == "") {
        mode := defaultPlayMode
        ToolTip % "Play Mode: " . mode, 0, 0, 5
    }
    if IsInvalidPlayMode(mode) {
        ShowErrorMessage("Play Mode", "Invalid Play Mode -- use 'normal', 'challenge', 'battle' or 'one person'")
        return
    }
    if (difficulty == "") {
        difficulty := defaultDifficulty
    }
    if IsInvalidDifficulty(difficulty) {
        ShowErrorMessage("Difficulty", "Invalid difficulty -- use 'normal', 'hard', 'very hard' or 'ultimate'")
        return
    }
    
    OpenCounter()
    CreatePartyEpisode(episode)
    SetPartyNameExt(name)
    SetPartyPassword(pass)
    SetPlayMode(mode)
    SetDifficulty(difficulty)
    RegisterParty()
}

IsInvalidEpisode(episode) {
    if episode in 1,2,4
        return false
    return true
}

IsInvalidPlayMode(mode) {
    if mode in normal,challenge,battle,one person
        return false
    return true
}

IsInvalidDifficulty(difficulty) {
    if difficulty in normal,hard,very hard,ultimate
        return false
    return true
}

SetKeyDelayShort() {
    SetKeyDelay % shortKeyDelay, shortKeyPress
}

SetKeyDelayNormal() {
    SetKeyDelay % defaultKeyDelay, defaultKeyPress
}