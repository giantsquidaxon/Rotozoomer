//
//  Shader.fsh
//  Rotozoomer
//
//  Created by Richard Smith on 16/05/2013.
//  Copyright (c) 2013 Richard Smith. All rights reserved.
//


uniform sampler2D tex;
varying highp vec2 TexCoord;
uniform highp float a;
uniform highp float z;
uniform highp float offset;


highp mat2 rotationMatrix(highp float angle)
{
    highp float s = sin(angle);
    highp float c = cos(angle);
    
    return highp mat2(c,-s,s,c);
}


void main()
{
    //gl_FragColor = vec4(1,0,0,0);
    highp mat2 rot = rotationMatrix(a)/z;
    highp vec2 offsetv = vec2(offset,0);
	gl_FragColor = texture2D(tex, offsetv+TexCoord.xy * rot);
}
