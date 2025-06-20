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
	"How are you feeling?": ["I feel fine.", "Good.", "I've been better.", "Not well. My energy is fading.", "Terrible.", "I feel like death.", "Better."],
	"Does anything hurt?": ["No.", "Just some headaches.", "I feel a little sore.", "I have some aches and pains.", "Everything hurts.", "Everything. It's unbearable.", "Less than before."],
	"How can I help?": ["Just here for a check in.", "I think I'm okay.", "I need something for my back.", "I'm not sure you can.", "I want to leave.", "Make it go away please.", "Cancel my meds."],
	"Have you taken your medications?": ["I don't have any.", "Of course.", "Sure.", "They didn't help.", "I did, but I think they are making things worse.", "What does it matter.", "No."],
	"How long have you been here?": ["Just got here.", "Not long.", "A little while.", "I've lost track.", "I can't remember.", "An enternity.", "Its coming back to me."],
	"How long have you been sick?": ["I feel fine.", "Seems to have just started.", "Not long...I think.", "Since I got here.", "I think you know.", "Forever...and always.", "How long have I been here?"],
	"Do you feel any strong pain?": ["No. I'm okay.", "My head hurts.", "My back hurts.", "My back, arms, legs, and I still have headaches.", "EVERYTHING.", "My soul...", "Its subsiding"],
	"Do you have any issues with your senses? ": ["All five reporting in.", "They are okay.", "I can't smell anything.", "I can't taste anything.", "My vision is fading.", "All of them.", "They are coming back."],
	"Let me check your heart rate.": ["Sure.", "Okay.", "Alright.", "I'd rather not.", "I don't trust you.", "If you can find it.", "Has it improved?"],
	"Let me check your eyesight.": ["Lets do it.", "Alright.", "Might get some wrong.", "Has it gotten worse?", "E...", "I can't read...", "I can see a little better."],
	"Let me check your blood pressure.": ["Alright.", "How is it?", "Is it bad?", "I don't know if I have any.", "Its high.", "Can I go home?", "Has it improved?"],
	"Let me check your breathing.": ["Okay.", "Sure.", "Alright.", "Its getting harder.", "Its hard to breathe.", "...", "Feels like someone is standing on my chest."],
	"Can you open your mouth and say aaaaaaah.": ["Aaaaaaah.", "Aaaah", "aah", "ah", "mmm", "...", "Okay."],
	"Can you stand up and hold up your arms for me?": ["Like this?", "Okay.", "Ow.", "It hurts.", "I can barely hold my own weight.", "I can't move...", "Okay."],
	"Are you happy here?": ["Only time will tell.", "I think its nice.", "Its okay.", "I'm having doubts.", "No.", "I want it to end...", "Maybe."],
	"Would you like to leave?": ["Just got here.", "No its okay.", "Been thinking about it.", "Yes.", "Please.", "Just end it.", "I would like to."],
	"Do you trust me?": ["Why not?", "Sure.", "I think so.", "I'm not sure.", "No.", "You've killed me."],
	"Are you worried about anything?": ["Should I?", "No.", "No.", "Are you a Doctor?", "Doctor Reaper.", "Judgement."]
	}
var manager_text: Array[String] = [
	"Think for a second not about the pain you caused, but about how good some sunshine would feel right now. Well, here on our island, you'll get the care you need and sunlight to bathe in. Our experienced staff is overflowing with dedication to help you get better. There's no such thing as a bad batch, just someone who needs a little time to bake and marinate in their thoughts. Isolated in a chamber of your own ideals, you'll come out with a clear mind.",
	"Hey there, Welcome to the team! The big man up top is excited to see what you bring to the table. Sorry he can't be here to greet you on your first day. He's tied up at the moment. Anyways give it your best, good or bad, I'm just sure you'll find a place to ‘hang' in our organization. But lets try for good, I'd hate to ‘chew' you out on your first day. (giggle) Just stick to our medical directives and you'll be fine.",
	"Hey, awesome work, Doc. I've been talking to the boss. We might be throwing in an extra pudding cup for your lunch breaks. Just don't tell the others. Keep it up! I can just ‘taste' that you're going to do well here.",
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
