#version 300 es
precision highp float;

in vec2 v_texcoord;
out vec4 fragColor;

uniform sampler2D tex;

// Per-channel multiplier to vibrance strength
const vec3 Balance = vec3(1.0, 1.0, 1.0);  // Replace with actual values or uniforms if needed
const float Strength = 0.15;              // Replace with actual value or uniform

const vec3 VIB_coeffVibrance = Balance * -Strength;

void main() {
    vec4 pixColor = texture(tex, v_texcoord);
    vec3 color = pixColor.rgb;

    vec3 VIB_coefLuma = vec3(0.212656, 0.715158, 0.072186);
    float luma = dot(VIB_coefLuma, color);

    float max_color = max(color.r, max(color.g, color.b));
    float min_color = min(color.r, min(color.g, color.b));
    float color_saturation = max_color - min_color;

    vec3 p_col = (sign(VIB_coeffVibrance) * color_saturation - 1.0) * VIB_coeffVibrance + 1.0;

    color.r = mix(luma, color.r, p_col.r);
    color.g = mix(luma, color.g, p_col.g);
    color.b = mix(luma, color.b, p_col.b);

    fragColor = vec4(color, pixColor.a);
}
