// Based on Inigo Quilez's distance functions: https://iquilezles.org/articles/distfunctions2d/

float getSdfRectangle(vec2 p, vec2 xy, vec2 b) {
    vec2 d = abs(p - xy) - b;
    return length(max(d, 0.0)) + min(max(d.x, d.y), 0.0);
}

float seg(vec2 p, vec2 a, vec2 b, inout float s, float d) {
    vec2 e = b - a;
    vec2 w = p - a;
    vec2 proj = a + e * clamp(dot(w, e) / dot(e, e), 0.0, 1.0);
    float segd = dot(p - proj, p - proj);
    d = min(d, segd);

    float c0 = step(0.0, p.y - a.y);
    float c1 = 1.0 - step(0.0, p.y - b.y);
    float c2 = 1.0 - step(0.0, e.x * w.y - e.y * w.x);
    float allCond = c0 * c1 * c2;
    float noneCond = (1.0 - c0) * (1.0 - c1) * (1.0 - c2);
    float flip = mix(1.0, -1.0, step(0.5, allCond + noneCond));
    s *= flip;
    return d;
}

float getSdfParallelogram(vec2 p, vec2 v0, vec2 v1, vec2 v2, vec2 v3) {
    float s = 1.0;
    float d = dot(p - v0, p - v0);

    d = seg(p, v0, v3, s, d);
    d = seg(p, v1, v0, s, d);
    d = seg(p, v2, v1, s, d);
    d = seg(p, v3, v2, s, d);

    return s * sqrt(d);
}

vec2 normalizePos(vec2 value, float isPosition) {
    return (value * 2.0 - (iResolution.xy * isPosition)) / iResolution.y;
}

float antialias(float distance) {
    return 1.0 - smoothstep(0.0, normalizePos(vec2(2.0, 2.0), 0.0).x, distance);
}

float easeOutCubic(float t) {
    return 1.0 - pow(1.0 - t, 3.0);
}

vec4 saturate(vec4 color, float factor) {
    float gray = dot(color, vec4(0.299, 0.587, 0.114, 0.0));
    return mix(vec4(gray), color, factor);
}

vec2 getRectangleCenter(vec4 rect) {
    return vec2(rect.x + (rect.z / 2.0), rect.y - (rect.w / 2.0));
}

float determineStartVertexFactor(vec2 a, vec2 b) {
    float condition1 = step(b.x, a.x) * step(a.y, b.y);
    float condition2 = step(a.x, b.x) * step(b.y, a.y);
    return 1.0 - max(condition1, condition2);
}

vec4 TRAIL_COLOR = iCurrentCursorColor;
const float TRAIL_OPACITY = 0.15;   // Lower opacity for the trail
const float CURSOR_OPACITY = 0.25;  // Very transparent cursor
const float DURATION = 0.3;

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    // Background (text or UI)
    vec4 bg = texture(iChannel0, fragCoord.xy / iResolution.xy);

    // Normalize positions
    vec2 uv = normalizePos(fragCoord, 1.0);
    vec4 currentCursor = vec4(normalizePos(iCurrentCursor.xy, 1.0), normalizePos(iCurrentCursor.zw, 0.0));
    vec4 previousCursor = vec4(normalizePos(iPreviousCursor.xy, 1.0), normalizePos(iPreviousCursor.zw, 0.0));

    // Animation progress
    float progress = clamp((iTime - iTimeCursorChange) / DURATION, 0.0, 1.0);
    float easedProgress = easeOutCubic(progress);

    // Determine parallelogram vertices
    float vertexFactor = determineStartVertexFactor(currentCursor.xy, previousCursor.xy);
    float invFactor = 1.0 - vertexFactor;

    vec2 v0 = vec2(currentCursor.x + currentCursor.z * vertexFactor, currentCursor.y - currentCursor.w);
    vec2 v1 = vec2(currentCursor.x + currentCursor.z * invFactor, currentCursor.y);
    vec2 v2 = vec2(mix(previousCursor.x, currentCursor.x, easedProgress) + currentCursor.z * invFactor,
                   mix(previousCursor.y, currentCursor.y, easedProgress));
    vec2 v3 = vec2(mix(previousCursor.x, currentCursor.x, easedProgress) + currentCursor.z * vertexFactor,
                   mix(previousCursor.y - previousCursor.w, currentCursor.y - currentCursor.w, easedProgress));

    // SDF calculations
    float sdfTrail = getSdfParallelogram(uv, v0, v1, v2, v3);
    float sdfCursor = getSdfRectangle(uv, currentCursor.xy - (currentCursor.zw * vec2(-0.5, 0.5)), currentCursor.zw * 0.5);

    // Colors
    vec4 trailColor = saturate(TRAIL_COLOR, 2.5) * TRAIL_OPACITY;
    vec4 cursorColor = TRAIL_COLOR * CURSOR_OPACITY;

    // Blending with AA
    float trailAlpha = antialias(sdfTrail) * (1.0 - easedProgress);
    float cursorAlpha = antialias(sdfCursor);

    vec4 finalColor = bg;
    finalColor.rgb += trailColor.rgb * trailAlpha;  // Additive blending for trail
    finalColor.rgb += cursorColor.rgb * cursorAlpha; // Additive blending for cursor
    finalColor.a = 1.0;

    fragColor = finalColor;
}
