#OpenGL ES 2.0 Rotozoomer for iOS

A slightly crap bit of tutorial code by Ritchie Smith ( [@narrenschiff](https://twitter.com/Narrenschiff) )

##Introduction
This project implements a rotozoomerfor iOS as an OpenGL Shader Language fragment shader. It's based heavily on the default apple "OpenGL Game" template, but with most of the GLKit code removed so it's mostly just plain old OpenGL ES 2.0.

##Requirements
Requires Xcode and the iOS 6 developer stuff. Will run fine in the simulator.

##How it works
###viewController
viewController is a subclass of GLKViewController. The desired frame rate defaults to 30 fps, and should be achievable on most recent hardware.

* `- (void)viewDidLoad` sets up the coordinates of a quad filling the whole screen, sets up an orthographic projection matrix that accounts for aspect ratio, then calls setupGL

* `- (void)setupGL` loads in shaders and sets up vertex buffers and other bits of state for OpenGL

* `- (void)update` is called once per frame, and increments the `_offset`, `_z`, and `_a` ivars to animate the effect.

* `- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect` draws the frame and passes in the value of `_offset`, `_z`, and `_a` as Uniforms for the shader.

###shader.fsh
This fragment shader uses `_offset` to compute horizontal roll, `_z` to compute zoom, and `_a` to compute angle for drawing texture `tex`.

##Bugs
* It isn't the 90s anymore.