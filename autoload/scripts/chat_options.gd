extends Node

var chat_options: Array[String] = [
	"How are you feeling?",
	"Does anything hurt?",
	"How can I help?",
	"Have you taken your medications?",
	"How long have you been here?",
	"How long have you been sick?",
	"Do you feel any strong pain?",
	"Do you have any issues with your senses? ",
	"Let me check your heart rate.",
	"Let me check your eyesight.",
	"Let me check your blood pressure.",
	"Let me check your breathing.",
	"Can you open your mouth and say aaaaaaah.",
	"Can you stand up and hold up your arms for me?",
	"Are you happy here?",
	"Would you like to leave?",
	"Do you trust me?",
	"Are you worried about anything?"
	]

var chat_responses: Dictionary = {
	"How are you feeling?": ["I feel fine.", "Good.", "I've been better.", "Not well. My energy is fading.", "Terrible.", "I feel like death.", "N/A."],
	"Does anything hurt?": ["No.", "Just some headaches.", "I feel a little sore.", "I have some aches and pains.", "Everything hurts.", "Everything. It's unbearable.", "N/A."],
	"How can I help?": ["Just here for a check in.", "I think I'm okay.", "I need something for my back.", "I'm not sure you can.", "I want to leave.", "Make it go away please.", "N/A."],
	"Have you taken your medications?": ["I don't have any.", "Of course.", "Sure.", "They didn't help.", "I did, but I think they are making things worse.", "What does it matter.", "N/A."],
	"How long have you been here?": ["Just got here.", "Not long.", "A little while.", "I've lost track.", "I can't remember.", "An enternity.", "N/A."],
	"How long have you been sick?": ["I feel fine.", "Seems to have just started.", "Not long...I think.", "Since I got here.", "I think you know.", "Forever...and always.", "N/A."],
	"Do you feel any strong pain?": ["No. I'm okay.", "My head hurts.", "My back hurts.", "My back, arms, legs, and I still have headaches.", "EVERYTHING.", "My soul...", "N/A."],
	"Do you have any issues with your senses? ": ["All five reporting in.", "They are okay.", "I can't smell anything.", "I can't taste anything.", "My vision is fading.", "All of them.", "N/A."],
	"Let me check your heart rate.": ["Sure.", "Okay.", "Alright.", "I'd rather not.", "I don't trust you.", "If you can find it.", "Zero..."],
	"Let me check your eyesight.": ["Lets do it.", "Alright.", "Might get some wrong.", "Has it gotten worse?", "E...", "I can't read...", "Eyes won't open."],
	"Let me check your blood pressure.": ["Alright.", "How is it?", "Is it bad?", "I don't know if I have any.", "Its high.", "Can I go home?", "No pressure..."],
	"Let me check your breathing.": ["Okay.", "Sure.", "Alright.", "Its getting harder.", "Its hard to breathe.", "...", "Patient is not breating."],
	"Can you open your mouth and say aaaaaaah.": ["Aaaaaaah.", "Aaaah", "aah", "ah", "mmm", "...", "Unresponsive."],
	"Can you stand up and hold up your arms for me?": ["Like this?", "Okay.", "Ow.", "It hurts.", "I can barely hold my own weight.", "I can't move...", "Unresponsive."],
	"Are you happy here?": ["Only time will tell.", "I think its nice.", "Its okay.", "I'm having doubts.", "No.", "I want it to end...", "N/A"],
	"Would you like to leave?": ["Just got here.", "No its okay.", "Been thinking about it.", "Yes.", "Please.", "Just end it.", "Unresponsive."],
	"Do you trust me?": ["Why not?", "Sure.", "I think so.", "I'm not sure.", "No.", "You've killed me.", "I do ;)"],
	"Are you worried about anything?": ["Should I?", "No.", "No.", "Are you a Doctor?", "Doctor Reaper.", "Judgement.", "N/A"]
	}

var key_dialogue_act_one: Dictionary = {
	"Zbychu Nowak" : {
		"question_1" : "Your sheet tells me you're a biter-nothing about being a shark, haha.",
		"response_1" : "Ok.",
		"question_2" : "How are you feeling today?",
		"response_2" : "Ok.",
		"question_3" : "Anything but ok?",
		"response_3" : "...Ya..",
		"question_4" : "I'll note that you're being very unresponsive, and we'll offer...[Select a treatment]",
		"response_4" : "mhm"
	},
	"Nathan Dedrick" : {
		"question_1" : "Have you had time to go outside? I've been hearing you're indoors all day, locked up in your room.",
		"response_1" : "Did you know one time we had a guy with red eyes who would only come in at night?" +
			"He was the boss. I was the chief manager, so I had it good never having to meet him at night.",
		"question_2" : "Did you know going outside, stretching your legs, and walking around the yard is good for your mental health?",
		"response_2" : "Well, I happen to be handed a super secret project." +
			"We tend to grow a wide supply of things out here, and I'm in charge of obtaining us some land." +
			"Boss man really trusts me.",
		"question_3" : "What about a lunch break outside?",
		"response_3" : "No, I can't leave until the work is done.",
		"question_4" : "Well, I can leave you with this...[Select a treatment]",
		"response_4" : "Thanks Doc"
	}
}

var key_dialogue_act_two: Dictionary = {
	"Zbychu Nowak" : {
		"question_1" : "Well you speak today or well have to assigned you as not responsive the treatment well get more uncomfortable.",
		"response_1" : "What the hell?",
		"question_2" : "Better response. Although not the choice words I would choose. " +
			"Now want know why you fight us we not bad people honestly. " +
			"Our staff is the best you will find on this island...and the only staff on the island",
		"response_2" : "Right...",
		"question_3" : "Mow we are back to zero. Would you prefer simpler subject like the weather?",
		"response_3" : "mmmm",
		"question_4" : "Okay well, I think we'll mark todays session as done. I'm leaving you with...[Select a treatment]",
		"response_4" : "Ya"
	},
	"Nathan Dedrick" : {
		"question_1" : "How did you rest?",
		"response_1" :
			"Funny enough, not much. Last night I dreamed the bossman was around. " +
			"We had a conversation not in my office, the highlight of my utopia! But in my room. " +
			"You’d think if I could pick the location, it wouldn't have been that.",
			#"Simplest way I could put it, Doc unwelcomed. All night I was dreaming I was working. " +
			#"Someone was trying to get my attention. I didn't open the door. Can't walk into another scandal... not again",
		"question_2" :
			"Interesting. Would it be too far a stretch to say your boss is what caused this overworked version of yourself?",
			#"What are you even talking about?",#
		"response_2" :
			"What do you mean?",
			#"Doc, I've been nothing but cooperative. Even before I got here, " +
			#"people had a hard time understanding me. I don't always get to the point."
			#],
		"question_3" : #[
			"Maybe you're not actually good at your job, just making up numbers to stay in his favor?",
			#"We'll have to review my notes, but I will say, don't underestimate your wit. I've seen your file."
			#],
		"response_3" : #[
			"You’re funny, Doc. You should be a comedian. But ask yourself, " +
			"as much as I ask myself if that were the case, how do you think I ended up here? " +
			"He told me this was supposed to be my vacation. I won it for being Employee of the Year.",
			#"It's not like I'm a sly fox, I promise. My intentions are pure."
			#],
		"question_4" : #[
			"Interesting. We're recovering some sense of truth, no matter how twisted it is. " +
			"I think that marks the end of today's session...",
			#"I think that marks the end of today's session...[Select a treatment]"
			#],
		"response_4" : "Thanks Doc"
	},
	"Sarah Queen" : {
		"question_1" : "We’ve got a star locked and loaded boom! Stardust we wield, and stand your power! " +
		"What a song, Sarah! How are you enjoying yourself? I know we're no 5‑star hotel, but I'm hoping you make a recovery.",
		"response_1" : "Give me a break, Doc. We all know this isn’t right. " +
		"I'm 100 percent sane in the head. And, hell, when have I ever fought you guys on " +
		"anything besides letting me sleep until night? It's an odd request, I admit, but it's just sleep.",
		"question_2" : "Why night? What’s the reason? Is there a deeper meaning attached to such an odd time of day?",
		"response_2" : "For me it’s not odd, it's a haunting reminder, an echo. "+
		"I lost my parents while we were all asleep during the night. " +
		"It’s a mistake to think the dead sleep at night; when an old bag of bones wants to walk, " +
		"why not during the hours the mortals sleep?",
		"question_3" : "Sarah, I’m going to suggest you take these...[Select a treatment]",
		"response_3" : "What are they?",
		"question_4" : #[
			"Sleeping pills, they will help you rest.",
			#"Melatonin, it's a placebo that tricks your body its time to sleep.",
			#"Vitamins, it'll help you balance your energy so you get better rest when its time to sleep.",
			#"Medicine, it'll help with you with your illness. You'll be sleeping right in no time."
			#],
		"response_4" :  #[
			"I hope it's the good stuff. Thanks Doc.",
			#"You prescribe melatonin? I can get this off the shelf...Good day Doc.",
			#"Hmmm, I have been eat less thhings with nutrition, I'll give it a try. Later Doc.",
			#"Medicine? Right...Have a Good day Doc."
			#]
	},
}

var key_dialogue_act_three: Dictionary = {
	"Zbychu Nowak" : {
		"question_1" : "I’m at a loss for words here. Seems communication isn’t our strong suit. " +
		"I'm not a fighter...and I'm sorry if, as your doctor, I've failed you.",
		"response_1" : "No.",
		"question_2" : "Wait.. you understand me?",
		"response_2" : "Ya.",
		"question_3" : "How limited are your words? And how much can you understand?",
		"response_3" : "Mhm...ya",
		"question_4" : "Okay...well, I recommend you go see the medical director...or you let them out",
		"response_4" : "Ya..."
	},
	"Nathan Dedrick" : {
		"question_1" : #[
			"I've gotten some concerning reports about you.",
			#"Listen, Nathan, it's been a long day. We've yet to find any basis for your claims."
			#],
		"response_1" : #[
			"False.",
			#"I swear my boss has come by and visited me while I've been here. I have no idea how. " +
			#"And the work assignments...they've been the oddest requests I’ve ever heard."
			#],
		"question_2" : #[
			"I’ve always given you the benefit of the doubt I keep seeing light for you, " +
			"but then you fall back into the darkness! What do I have to do to get you to understand we’re here for your benefit?",
			#"We'll move you to a different part of the facility. I think you'll be more comfortable there. " +
			#"And if your boss shows up, we'll know."
			#],
		"response_2" : #[
			"Then, if it's for my benefit, can I leave? There's a constant feeling I’m being watched. " +
			"There’s no escape from the day staff to the night staff.",
			#"Doc, you’re treating me like I’ve lost it. I swear I’m all here as sane as one can be. " +
			#"What happened to giving your patients the benefit of the doubt?"
			#],
		"question_3" : #[
			"What staff? There’s only one person on the night shift.",
			#"Even the most lost patients, believe they are still in complete control."
			#],
		"response_3" : #[
			"I heard someone being dragged out of their room.",
			#"I hope you don’t regret this."
			#],
		"question_4" : #[
			#"I’ve put in a request for you to leave the island while we investigate this occurrence. " +
			#"I’ve had a feeling for a while that there’s more to this job than just me being a doc. " +
			#"I raised cattle on my family farm it seems we’re repeating a lot of the same tasks.",
			"We’ve been waiting for you to get up to speed with the real world. " +
			"And we’re continuing to give you the same care we’re just moving you into some...better care.",
			#],
		"response_4" : #[
			#"Stay safe, Doc.",
			"I hope you don’t regret this."
			#]
	},
	"Sarah Queen" : {
		"question_1" : "Your patterns are odd. We’ve received compliments from those in our care, " +
			"but none have come from the staff themselves.",
		"response_1" : "What can I say? Maybe I’m getting the VIP treatment. " +
			"Or maybe the others just don’t like me. Could be that my nighttime activities leave " +
			"no room for us to talk so to everyone else, I’m just a ghost. " +
			"You know how scary it’d be to see a ghost outside your door?",
		"question_2" : "Ghosts and goblins don’t scare me. I’m more afraid of real obstacles, " +
			"the ones we can see right in front of us. Right now, it’s your habits that are leaving " +
			"you in an unwelcoming environment among your community.",
		"response_2" : "There you go again, Doc leaving yourself wide open to my wit. " +
			"You take so long to choose your words carefully and in the end—boom! " +
			"The queen makes you bite the dust!",
		"question_3" : "Is there something bothering?",
		"response_3" : "It's not getting better. Everything we do makes it worse.",
		"question_4" : "We’ll see how you’re feeling after...your treatment.]",
		"response_4" : "I don't have high hopes.",
	},
}
