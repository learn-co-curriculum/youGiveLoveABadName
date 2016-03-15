# You Give Love A Bad Name

`[UIView animateWithDuration:animations:completion:]` is great for simple animations. But when we need to build a sequence of animations, chaining together completion is verbose and difficult to adjust.

The keyframe animation methods provide a better alternative when building multi-part animations. Let's use them to make a "bounce" effect.


## Instructions

This is your goal:

![Animation](https://ironboard-curriculum-content.s3.amazonaws.com/iOS/objc-YouGiveLoveABadName/animation.gif)

[You'll need UIKeyFrameAnimations](http://www.shinobicontrols.com/blog/posts/2013/10/04/ios7-day-by-day-day-11-uiview-key-frame-animations)

Note how Bon Jovi "bounces" when the button is tapped -- the image first shrinks, then expands outward (slightly past its final size), then comes to a rest at a height that fills the screen. When the image shrinks, it goes through the same process in reverse. This sort of multi-step animation is perfect for the keyframe animation methods in UIKit.

**Implement this animation by adjusting constraints on the image view.** Check out the storyboard -- there are currently no constraints controlling the height and y-position of the image view.

So, your process should be something like this:

1. Add constraints that will let you easily animate the image as desired. Think about your options -- you could pin down the image view's height and top, but would that be easy to animate in the desired way?
    
    **Hint:** does the center-y of the image view change across animations? Maybe you could pin it down, and just animate between two height constraints.
2. Make Bon Jovi grow in the `expandButtonTapped:` method (we'll handle the toggling later). You'll need to build a keyframe animation that implements the "bounce" effect. It will have steps close to this:
    - Shrink slightly below the starting height
    - Grow slightly beyond the height of the screen
    - Shrink back down to the exact height of the screen.
    
    The animation should work on phones of all sizes and orientations. Don't hard-code the screen's height!
3. Make the `expandButtonTapped:` method toggle between the full-height and normal sizes of the image view. You'll probably have to add a flag property so you know whether to expand or shrink. The shrink animation should be the exact opposite of the expansion one:
    - Grow slightly beyond the height of the screen
    - Shrink down to slightly below the final height of the image
    - Return to the exact starting height


<p data-visibility='hidden'>View <a href='https://learn.co/lessons/youGiveLoveABadName' title='You Give Love A Bad Name'>You Give Love A Bad Name</a> on Learn.co and start learning to code for free.</p>
