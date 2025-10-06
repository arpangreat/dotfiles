void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 uv = fragCoord / iResolution.xy;
    float t = 0.5 + 0.5 * sin(iTime);
    fragColor = vec4(uv.x, uv.y, t, 1.0);
}
