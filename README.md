# KeyframeSequence player

Custom Animation Player for Roblox.

## Pros

- Feels (almost) exactly like Roblox's [AnimationTrack](https://developer.roblox.com/en-us/api-reference/class/AnimationTrack) API.
- Supports any rigs.
- No more uploading in order to play animations.
- Chadness.

## Cons

- Limited to 2 animation priorities.
- Doesn't replicate. (Make your own replication system I guess.)
- Gets pretty clunky if multiple animations are played at once.

## Resources

Easing functions : 
-     https://github.com/EmmanuelOga/easing/blob/master/lib/easing.lua
-     https://github.com/behollister/blender2.8/blob/blender2.8/source/blender/blenlib/intern/easing.c

# Documentation

## Example :
```lua
--//Our Variables
local Animator = require(insert directory here)
local TargetKFS = (insert KeyframeSequence here)
local Model = (insert target model here to animate)
local HighPriority = false

--//Create a new Track and play it
local AnimationTrack = Animator.new(TargetKFS,Model,HighPriority)
AnimationTrack.Do("Play")

```

## Methods :
```lua
AnimationTrack:Do(arg1 : string, arg2 : number)
```
- "Play" = Plays the animation
- "Stop" = Stops the animation
- "SetSpeed" + number = Determines the speed of the animation (Negative values result a reverse playback) 
- "SetWeight" + number = Determines the "appeal" (don't know the right word for this) of the animation
- "SetDamp" + number = Determines how much time it takes for the animation to play (it's usually used for smooth transitions...)
```lua
AnimationTrack:Cleanup()
```
- Clears itself. (Disconnecting events and forgetting variables...)
## Events :
```lua
AnimationTrack.Listener.Event --//Returns a string
```
Similar to Roblox's "GetMarkerReachedSignal". (Useful for timing certain actions.)
