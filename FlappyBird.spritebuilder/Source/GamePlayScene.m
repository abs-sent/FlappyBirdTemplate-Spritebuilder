#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    [self addObstacle];
    timeSinceObstacle = 0.0f;

}

-(void)update:(CCTime)delta
{
    
    // put update code here
    timeSinceObstacle += delta; // delta is approx 1/60th of a sec
    
    // check to see if 2 seconds have passed
    if ( timeSinceObstacle > 2.0f){
        [self addObstacle]; // add a new obstacle
        // then reset the time.
        timeSinceObstacle = 0.0f;
    }
}

// put new methods here
- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    // this will get called every time the player touches the screen
    [character flap];
}


// declare a method in objective-C
// -(int) doSomethingWithAString: (NSString*) myString{
// return [myString length] * 10;
// }

@end
