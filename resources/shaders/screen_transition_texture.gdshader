shader_type canvas_item;

uniform sampler2D foreground_texture : filter_nearest;
uniform sampler2D transition_texture : filter_nearest;
uniform float percent : hint_range(0.0, 1.0);


void fragment() {
	vec4 transition_texture_color = texture(transition_texture, UV);
	if (transition_texture_color.r > percent) {
		COLOR.a = 0.0;
	}
	else {
		COLOR.a = 1.0;
	}
}
