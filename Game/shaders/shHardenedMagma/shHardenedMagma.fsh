//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform sampler2D u_Magma;
uniform vec4	u_MagmaUV;
uniform vec4	u_SpriteUV;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec2 pos = (v_vTexcoord - u_SpriteUV.xy) / (u_SpriteUV.zw - u_SpriteUV.xy);
	vec2 magmaCoord = mix(u_MagmaUV.xy, u_MagmaUV.zw, pos);
	vec4 magmaColor = texture2D(u_Magma, magmaCoord);
	gl_FragColor.rgb *= (1.0 - magmaColor.a);
	gl_FragColor.rgb += magmaColor.rgb * magmaColor.a;
}
