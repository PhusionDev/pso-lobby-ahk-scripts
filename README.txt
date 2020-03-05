Typically, you will need to run this script as an administrator for anything to happen inside of PSO Blue Burst as long as the game itself required administrator priviledges.
These scripts were written with the private server Ephinea in mind, but may work on other private servers.

Ctrl+X		Return to Lobby	(can be used any time in a party afaik)
Ctrl+R		Reload Script	(reloads the hotkey script itself. Not necessary unless modifying the script)
Ctrl+B		Toggle Bank [Character/Shared]	(can be used any time in a party afaik)

The following organize party hotkeys must be pressed while standing at the counter in the lobby (with no menus open) as if you were about to talk to the NPC yourself.
 
Normal/Multiplayer Hotkeys
LCtrl+1		Episode: 1, Play Mode: Normal, Difficulty: Normal
LAlt+1		Episode: 1, Play Mode: Normal, Difficulty: Hard
LCtrl+LAlt+1	Episode: 1, Play Mode: Normal, Difficulty: Very Hard
LShift+1	Episode: 1, Play Mode: Normal, Difficulty: Ultimate
LCtrl+2		Episode: 2, Play Mode: Normal, Difficulty: Normal
LAlt+2		Episode: 2, Play Mode: Normal, Difficulty: Hard
LCtrl+LAlt+2	Episode: 2, Play Mode: Normal, Difficulty: Very Hard
LShift+2	Episode: 2, Play Mode: Normal, Difficulty: Ultimate
LCtrl+4		Episode: 4, Play Mode: Normal, Difficulty: Normal
LAlt+4		Episode: 4, Play Mode: Normal, Difficulty: Hard
LCtrl+LAlt+4	Episode: 4, Play Mode: Normal, Difficulty: Very Hard
LShift+4	Episode: 4, Play Mode: Normal, Difficulty: Ultimate

Solo/Single Player Hotkeys
RCtrl+1		Episode: 1, Play Mode: One Person, Difficulty: Normal
RAlt+1		Episode: 1, Play Mode: One Person, Difficulty: Hard
RCtrl+RAlt+1	Episode: 1, Play Mode: One Person, Difficulty: Very Hard
RShift+1	Episode: 1, Play Mode: One Person, Difficulty: Ultimate
RCtrl+2		Episode: 2, Play Mode: One Person, Difficulty: Normal
RAlt+2		Episode: 2, Play Mode: One Person, Difficulty: Hard
RCtrl+RAlt+2	Episode: 2, Play Mode: One Person, Difficulty: Very Hard
RShift+2	Episode: 2, Play Mode: One Person, Difficulty: Ultimate
RCtrl+4		Episode: 4, Play Mode: One Person, Difficulty: Normal
RAlt+4		Episode: 4, Play Mode: One Person, Difficulty: Hard
RCtrl+RAlt+4	Episode: 4, Play Mode: One Person, Difficulty: Very Hard
RShift+4	Episode: 4, Play Mode: One Person, Difficulty: Ultimate

-- Custom Functions --
OrganizeParty(episode:=-1,name:="",pass:="",mode:="",difficulty:="",defaultPass:=true)
  This is a convenience function that bundles the following functions together: OpenCounter(), CreatePartyEpisode(), SetPartyNameExt(), SetPartyPassword(), SetPlayMode(), SetDifficulty() and will use the defaults that you set in the global defaults if you do not provide values to this function. Be aware that you must provide the following either to this function or in the global defaults for function to be successful:
	episode (1,2,4)
	name (any name max of 8 characters)
	mode ("normal", "challenge", "battle", "one person")
	difficulty ("normal", "hard", "very hard", "ultimate")
  You can provide blank values to the arguments to use defaults.
  In most cases, you will want to use this function to create a party.
  examples:
	OrganizeParty(2,"myParty","pass","one person","very hard")
	-- Episode 2, Name: myParty-xyz, Pass: pass, Mode: Single Player, Difficulty: Very Hard
	OrganizeParty(4,"coolgame","","normal","ultimate",false)
	-- Episode 4, Name: coolgame-xyz, No Password, Mode: Multiplayer, Difficulty: Ultimate [does not use default pass]

The following functions organize a party from start to finish in the given order (This order is important and all functions must be ran to successfully create party.

OpenCounter()
	Sends keystrokes to open the lobby counter (must be standing at the counter)

CreatePartyEpisode(episode:=-1)
	If no argument is provided, the defaultEpisode will be used. If no default exists as well then the function will return an error.

SetPartyName(name:="") / SetPartyNameExt(name:="")
	SetPartyName() can be a max of 12 characters, but not append a random suffix to the end of name
	SetPartyNameExt() max of 8 characters and appends a hypen and 3 random characters to name

SetPartyPassword(pass:="", default:=true)
	This can be blank. If you don't want a password you can set the default global password to "" or provide false to the default argument here. ex SetPartyPassword("",false)

SetPlayMode(mode:="")
	If no argument is provided, the defaultPlayMode will be used. If no default exists as well then the function will return an error.

SetDifficulty(difficulty:="")
	If no argument is provided, the defaultDifficulty will be used. If no default exists as well then the function will return an error.

RegisterParty()
	Final function in the organize party function chain. This sends keystrokes to register the party.

PSOSendKeys(string)
	This function adjusts the key delay and press duration and sends a sequence of characters into the chat.
	ex: PSOSendKeys("Hello Everybody!") -- will open chat and quickly type Hello Everybody! and then send the message, and then set the scripts key delay and press duration back to its defaults. These durations can be adjusted at the top of the script, but it is recommended not to modify them unless you are absolutely sure you know what you are doing.
	This function is useful for sending commands or chat messages that you use regularly. If playing on Ephinea you can take advantage of the "/lobby" and "/bank" hotkeys already provided in this script, which utilize PSOSendKeys()
