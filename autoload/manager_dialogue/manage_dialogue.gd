extends Node

@onready var ad_monika: AudioStreamPlayer = $AdMonika
@onready var agree_monika: AudioStreamPlayer = $AgreeMonika
@onready var disagree_monika: AudioStreamPlayer = $DisagreeMonika
@onready var intro_monika: AudioStreamPlayer = $IntroMonika
@onready var pill_1_monika: AudioStreamPlayer = $Pill1Monika
@onready var pill_2_monika: AudioStreamPlayer = $Pill2Monika
@onready var pill_3_monika: AudioStreamPlayer = $Pill3Monika
@onready var pill_4_monika: AudioStreamPlayer = $Pill4Monika
@onready var pill_5_monika: AudioStreamPlayer = $Pill5Monika
@onready var saving_1_monika: AudioStreamPlayer = $Saving1Monika
@onready var saving_2_monika: AudioStreamPlayer = $Saving2Monika
@onready var saving_3_monika: AudioStreamPlayer = $Saving3Monika
@onready var saving_4_monika: AudioStreamPlayer = $Saving4Monika

var manager_text: Array[String] = [
	"Think for a second not about the pain you caused, but about how good some sunshine would feel right now.
	Well, here on our island.          \n
	You'll get the care you need and sunlight to bathe in. Our experienced staff is overflowing with dedication to help YOU get better.   \n
	There's no such thing as a bad batch, just someone who needs a little time to bake and marinate in their thoughts. Isolated in a chamber of your own ideas, you'll come out with a clear mind.",
	#1
	"Oh. Hey there, Welcome...to the team. The big man up...top is excited to see what you bring to the table. Sorry he couldn't be here to greet you on your first day. He's...tied up at the moment. Anyways....        \n
	Uh. Give it your best, good or bad, I'm just sure you'll find a place to hang in our organization. But lets try for good, I'd hate to chew you out on your first day.          \n
	Stick to our medical directives and you'll be fiiine.",
	#2
	"Heyy awesome work, Doc. I've been talking to the boss. We might be throwing in an extra pudding cup for your lunch breaks. Don't tell the others though. Keep it up! I can... taste that you're going to do well here.",
	#3
	"Showing kindness and promise, yummers, thanks for lunch! Wait... you have no idea what I'm talking about. In due time, right? I just feel so... full.. when reviewing your results.",
	#4
	"You've been a wonderful requirement to our success here. I hope you like the brand new office. I can say... I'm... truly enjoying the view, haha. It may seem like we're moving fast. Buut we might be considering you for a permanent senior role.",
	#5
	"Amazing, It's time to see the boss. I'll take you to him, and you'll get to see how much your work has helped us.",
	#6
	"Isn't it magnificent? The quality of your work is to DIIEEE for. What do you think?",
	#7
	"I'm so happy to hear that from you. As for the boss, he's the third one on the left. Sooo I guess in fact, you could say this place is under.....new management by me          \n
	and now you...partner. Lets... get some glasses and we'll toast to the former owner.",
	#8
	"Oh... here I thought you really believed what we were doing here. Well... I understand... Let me take you to the boss and... he'll hear out your... grievances. Let me...          \n
	String you up next to him. I guess you could say....I'm the one ‘pulling' the strings. Haha. Yummers. I knew I could taste the potential in you.",
	#9
	"What a shame. We had high hopes for you on your first day but... I got a feeling you'll turn this around. I believe you... in what YOU have to offer.",
	#10
	"Hhh Second day? No improvement? What are we paying you for? While you're out, go ahead and write down 'Number One Manager.' ’Cause I surely need the confidence boost... Keep.. to the.. Directives.",
	#11
	"Tadaa! Today's the day you make it off this island cause we are going to terminate you! The boss would like to interview you for our records.",
	#12
	"Isn't it magnificent? Can we get aaa...... You're no longer in Kansas?               \n
	Unfortunately, there won't be any slippers in this story. As for the boss, you’re looking at her. But I'll go ahead and string you up next to my predecessor. It’s just like I told you on your first day, good or bad.         \n
	I'm sure you'll find a place here.",
	]

func play_ad_monika() -> void:
	ad_monika.play()
func play_agree_monika() -> void:
	agree_monika.play()
func play_disagree_monika() -> void:
	disagree_monika.play()
func play_intro_monika() -> void:
	intro_monika.play()
func play_pill_1_monika() -> void:
	pill_1_monika.play()
func play_pill_2_monika() -> void:
	pill_2_monika.play()
func play_pill_3_monika() -> void:
	pill_3_monika.play()
func play_pill_4_monika() -> void:
	pill_4_monika.play()
func play_pill_5_monika() -> void:
	pill_5_monika.play()
func play_saving_1_monika() -> void:
	saving_1_monika.play()
func play_saving_2_monika() -> void:
	saving_2_monika.play()
func play_saving_3_monika() -> void:
	saving_3_monika.play()
func play_saving_4_monika() -> void:
	saving_4_monika.play()
