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
	There's no such thing as a bad batch, just someone who needs a little time to bake and marinate in their thoughts. Isolated in a chamber of your own ideals, you'll come out with a clear mind.",
	"Hey there, Welcome...to the team. The big man up top is excited to see what you bring to the table. Sorry he can't be here to greet you on your first day. He's...tied up at the moment. Anyways....uh          \n
	Give it your best, good or bad, I'm just sure you'll find a place to hang in our organization. But lets try for good, I'd hate to chew you out on your first day.          \n
	Stick to our medical directives and you'll be fiiine.",
	"Hey, awesome work, Doc. I've been talking to the boss. We might be throwing in an extra pudding cup for your lunch breaks. Just don't tell the others. Keep it up! I can just taste that you're going to do well here.",
	"Showing promise and kindness, yummers, thanks for lunch! Wait... you have no idea what I'm talking about. But in due time, right? I just feel so ‘full' when reviewing your results.",
	"You've been a wonderful requirement to our success here. I hope you like the brand new officeI i can truly say I'm enjoying the view, haha. It may seem like we're moving fast. But we might be considering you for a permanent senior role here.",
	"Amazing, I think it's time to meet the boss. I'll take you to him, and you'll get to see how much your work has helped us. ",
	"Isn't it magnificent? The quality of your work is just to DIE for. What do you think?",
	"I'm so happy to hear that from you. As for the boss, he's the third one on the left. So I guess in fact, you could say this place is under new management...by me and...now you...partner. Let me get some glasses and we'll have toast of the former owner. ",
	"Oh, here I thought you really believed what we were doing here. Well I understand, let me take you to the boss and he'll hear out your grievances.Let me just ... string you up next to him. I guess you could say I'm one ‘pulling' the strings? Haha. Yummers, I knew I could taste the potential in you. ",
	"What a shame... we had high hopes for you on your first day, but I got a feeling you'll turn this around. I believe you in what you have to offer.",
	"Second day no improvement. What are we paying you for? While you're out, go ahead and write down “Number One Manager,” 'cause I surely need the confidence boost. Keep to the directives.",
	"Tada! Today's gonna be the day you make it off this island cause we are going to terminate you! The boss would like to interview you for our records. Come with me.",
	"Isn't it magnificent? Can we get a you're no longer in Kansas? ... Unfortunately, there won't be any slippers in this story. As for the boss, you're looking at her. But I'll go ahead and string you up next to my predecessor. It's just like I told you on your first day, good or bad, I'm just sure you'll find a place here."
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
