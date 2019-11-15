#version 430

#define RADIUS 1.
#define ROTSPEED .01
#define PI 3.1415927

uniform vec2 resolution;
uniform float time;
uniform sampler1D samples;
uniform sampler1D fft;
uniform int nosound;
uniform sampler2D image;
uniform sampler2D nextimage;
uniform float imageprogress;

out vec4 color;

void main()
{
    vec2 uv = 2.5*(gl_FragCoord.xy-.5*resolution.xy)/resolution.y;
        
    vec3 R = vec3(uv, sqrt(RADIUS - dot(uv,uv)));
	
    vec2 longLat = vec2(
        (atan(R.x, R.z) / PI + 1.0) * 0.5,
        (asin(R.y) / PI + 0.5)
    );
    
    vec4 surface = 
        sqrt(R.z) * // sphere
        (imageprogress * texture(nextimage, longLat + ROTSPEED * vec2(time, 0.)) + 
         (1. - imageprogress) * texture(image, longLat + ROTSPEED * vec2(time, 0.))) * // sphere mapped texture
        max(.2, ((R.x + .5) + (R.y + .5) + R.z) / 2.); // sun direction
        
    color.rgb = surface.rgb;
    color.a = 1.;
}

