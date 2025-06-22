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
