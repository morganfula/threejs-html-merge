// varying vec2 vUv;

varying float vNoise;
varying vec2 vUv;
uniform sampler2D oceanTexture;
uniform float time;

void main()	{
	// vec2 newUV = (vUv - vec2(0.5))*resolution.zw + vec2(0.5);
	vec3 color1 = vec3(0., 0., 1.);
	vec3 color2 = vec3(0., 1., 1.);
	vec3 finalcolor = mix(color1, color2, 0.5*(vNoise + 1.));

	vec2 newUV = vUv;

	newUV = vec2(newUV.x , newUV.y +0.01*sin(newUV.x*10. + time));

	vec4 oceanView = texture2D(oceanTexture, newUV);
		
	// gl_FragColor = vec4(finalcolor, 1.);
	gl_FragColor = vec4(vUv,0., 1.);
	// gl_FragColor = oceanView + 0.5*vec4(vNoise);
	// gl_FragColor = vec4(vNoise);
}