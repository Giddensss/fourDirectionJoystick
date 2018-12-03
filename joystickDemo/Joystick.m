//
//  joystick.m
//  joystickDemo
//
//  Created by Alan L  Hamilton on 2018/11/30.
//  Copyright © 2018 Alan L  Hamilton. All rights reserved.
//

#import "Joystick.h"



@interface Joystick() {
    UIView *controller;
    UIImageView *bg;
    UIImageView *controllerbg;
    CGFloat frameWidth;
    CGFloat frameHeight;
    CGFloat controllerSize;
    CGFloat centerArea;
    
    enum stickDirection currentDirection;
}
@end

@implementation Joystick

- (id) init {
    self = [super init];
    if (self) {
        [self setBackgroundColor: DEFAULT_BG_COLOR];
        currentDirection = origin;
        
    }
    return self;
}

- (id) initJoystickWithRadius:(CGFloat)radius x:(int)x y:(int)y {
    self =[super init];
    if (self) {
        [self setFrame:CGRectMake(x, y, radius * 2, radius * 2)];
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        [self setBackgroundColor:DEFAULT_BG_COLOR];
        currentDirection = origin;
        
        bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, radius * 2, radius * 2)];
        [bg setBackgroundColor: [UIColor clearColor]];
        [self addSubview:bg];
        
        controllerSize = radius * 2 * CONTROLLER_SIZE_RATIO;
        controller = [[UIView alloc] initWithFrame:CGRectMake(radius - controllerSize / 2 ,
                                                              radius - controllerSize / 2 ,
                                                              controllerSize, controllerSize)];
        controller.layer.cornerRadius = controllerSize / 2;
        controller.layer.masksToBounds = YES;
        [controller setBackgroundColor:DEFAULT_CONTROLLER_COLOR];
        [self addSubview:controller];
        
        controllerbg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, controllerSize, controllerSize)];
        [controllerbg setBackgroundColor:[UIColor clearColor]];
        [controller addSubview:controllerbg];
    }
    return self;
}

- (id) initJoystickWithRadius:(CGFloat)radius x:(int) x y:(int) y backgroundColor:(UIColor *)bgColor controllerColer:(UIColor *)controllerColor {
    self = [super init];
    if (self) {
        [self setFrame:CGRectMake(x, y, radius * 2, radius * 2)];
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        [self setBackgroundColor:bgColor];
        currentDirection = origin;
        
        bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, radius * 2, radius * 2)];
        [bg setBackgroundColor: [UIColor clearColor]];
        [self addSubview:bg];
        
        controllerSize = radius * 2 * CONTROLLER_SIZE_RATIO;
        controller = [[UIView alloc] initWithFrame:CGRectMake(radius - controllerSize / 2 ,
                                                              radius - controllerSize / 2 ,
                                                              controllerSize, controllerSize)];
        controller.layer.cornerRadius = controllerSize / 2;
        controller.layer.masksToBounds = YES;
        [controller setBackgroundColor:controllerColor];
        [self addSubview:controller];
        
        controllerbg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, controllerSize, controllerSize)];
        [controllerbg setBackgroundColor:[UIColor clearColor]];
        [controller addSubview:controllerbg];
    }
    return self;
}

- (id) initJoystickWithRadius:(CGFloat)radius x:(int) x y:(int) y backgroundImage:(UIImage *)bgImg controllerImage:(UIImage *)controllerImage {
    self =[super init];
    if (self) {
        [self setFrame:CGRectMake(x, y, radius * 2, radius * 2)];
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        [self setBackgroundColor:DEFAULT_BG_COLOR];
        currentDirection = origin;
        
        bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, radius * 2, radius * 2)];
        [bg setImage:bgImg];
        [self addSubview:bg];
        
        controllerSize = radius * 2 * CONTROLLER_SIZE_RATIO;
        controller = [[UIView alloc] initWithFrame:CGRectMake(radius - controllerSize / 2 ,
                                                              radius - controllerSize / 2 ,
                                                              controllerSize, controllerSize)];
        controller.layer.cornerRadius = controllerSize / 2;
        controller.layer.masksToBounds = YES;
        [controller setBackgroundColor:DEFAULT_CONTROLLER_COLOR];
        [self addSubview:controller];
        
        controllerbg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, controllerSize, controllerSize)];
        [controllerbg setImage:controllerImage];
        [controller addSubview:controllerbg];
    }
    return self;
}

- (void) customize:(NSDictionary *)attrs {
    NSArray *keys = attrs.allKeys;
    UIColor *bgColor = [keys containsObject:backgroundColorKey] ? [attrs objectForKey:backgroundColorKey] : nil;
    UIColor *controllerBGColor = [keys containsObject:controllerBackgroundColorKey] ? [attrs objectForKey:controllerBackgroundColorKey] : nil;
    UIColor *boundColor = [keys containsObject:boundColorKey] ? [attrs objectForKey:boundColorKey] : nil;
    UIColor *controllerBoundColor = [keys containsObject:controllerBackgroundColorKey] ? [attrs objectForKey:controllerBackgroundColorKey] : nil;
    
    NSString *bgImage = [keys containsObject:backgroundImageKey] ? [attrs objectForKey:backgroundImageKey] : @"";
    NSString *controllerImage = [keys containsObject:controllerBackgroundImageKey] ? [attrs objectForKey:controllerBackgroundImageKey] : @"";
    
    CGFloat boundWidth = [keys containsObject:boundWidthKey] ? [[attrs objectForKey:boundWidthKey] floatValue] : 0.0f;
    CGFloat controllerBoundWidth = [keys containsObject:controllerBoundWidthKey] ? [[attrs objectForKey:controllerBoundWidthKey] floatValue] : 0.0f;
    
    if (bgColor) {
        [self setBackgroundColor:bgColor];
    }
    if (controllerBGColor) {
        [controller setBackgroundColor:controllerBGColor];
    }
    if (boundColor) {
        self.layer.borderColor = (__bridge CGColorRef _Nullable)(boundColor);
    }
    if (controllerBoundColor) {
        controller.layer.borderColor = (__bridge CGColorRef _Nullable)controllerBoundColor;
    }
    if (![bgImage isEqualToString:@""]) {
        [bg setImage:[UIImage imageNamed:bgImage]];
    }
    if (![controllerImage isEqualToString:@""]) {
        [controllerbg setImage:[UIImage imageNamed:controllerImage]];
    }
    self.layer.borderWidth = boundWidth;
    controller.layer.borderWidth = controllerBoundWidth;
    
}


- (void)setFrame:(CGRect)frame {
    [super setFrame: frame];
    frameWidth = frame.size.width;
    frameHeight = frame.size.height;
    if (controllerSize == 0) {
        controllerSize = frameWidth * CONTROLLER_SIZE_RATIO;
    }
    centerArea = frameWidth * CONTROLLER_CENTER_AREA;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (void) setBackgroundColor:(UIColor *)backgroundColor controllerBackgroundColor:(nonnull UIColor *)controllerBGColor {
    [self setBackgroundColor:backgroundColor];
    [controller setBackgroundColor:controllerBGColor];
}

- (void)setBackgroundImage:(UIImage *)bgImage controllerBackgroundImage:(UIImage *)controllerBGIamge {
    [bg setImage:bgImage];
    [controllerbg setImage:controllerBGIamge];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
#if EVENT_PRINT
    NSLog(@"touch began");
#endif
    [_delegate onTouchStarted];
}

- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
#if EVENT_PRINT
    NSLog(@"touch moved ");
#endif
    for (UITouch *t in touches) {
        CGPoint point = [t locationInView:self];
        CGPoint center = CGPointMake(frameWidth / 2, frameHeight / 2);
        CGFloat distance = [self absoluteDistance:point p2:center];
        enum stickDirection direction = origin;
        if (point.x < center.x) {
            // left side
            if (point.y >= point.x && point.y <= -point.x + frameWidth) {
                // left
                if (point.x <= frameWidth / 2 - centerArea) {
                    direction = left;
                }
            } else if (point.y < center.y) {
                // up
                if (point.y <= frameHeight / 2 - centerArea) {
                    direction = up;
                }
            } else if (point.y > center.y) {
                // down
                if (point.y >= frameHeight / 2 + centerArea) {
                    direction = down;
                }
            }
        } else {
            //right side
            if (point.y <= point.x && point.y >= -point.x + frameWidth) {
                // left
                if (point.x >= frameWidth / 2 + centerArea) {
                    direction = right;
                }
            } else if (point.y < center.y) {
                // up
                if (point.y <= frameHeight / 2- centerArea) {
                    direction = up;
                }
            } else if (point.y > center.y) {
                //down
                if (point.y >= frameHeight / 2 + centerArea) {
                    direction = down;
                }
            }
        }
#if CONTROLLER_DEBUG_PRINT
        NSLog(@"joystick %d,%d",currentDirection,direction);
#endif
        if (currentDirection != direction) {
            currentDirection = direction;
            [self updateControllerPosition:direction distance:distance];
            [_delegate onStickDirectionChanged:direction];
        }
    }
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
#if EVENT_PRINT
    NSLog(@"touch ended");
#endif
    [self updateControllerPosition:origin distance:0];
    [_delegate onTouchEnded];
}

-(CGFloat) absoluteDistance:(CGPoint) p1 p2:(CGPoint) p2{
    
    return sqrtf(pow((p1.x - p2.x), 2) + pow((p1.y - p2.y),2));
}

- (void) updateControllerPosition:(enum stickDirection) direction distance:(CGFloat) dis {
    CGFloat realDistance = dis + controllerSize / 2;
    CGFloat centerPointX = frameWidth / 2 - frameWidth * CONTROLLER_SIZE_RATIO / 2;
    CGFloat centerPointY = frameHeight / 2 - frameHeight * CONTROLLER_SIZE_RATIO / 2;
    if (realDistance > frameWidth / 2) {
        realDistance = frameWidth / 2 - controllerSize / 2;
    }
    switch (direction) {
        case left:
            [controller setFrame:CGRectMake(centerPointX - realDistance,
                                            centerPointY,
                                            controllerSize, controllerSize)];
            break;
        case right:
            [controller setFrame:CGRectMake(centerPointX + realDistance,
                                            centerPointY,
                                            controllerSize, controllerSize)];
            break;
        case up:
            [controller setFrame:CGRectMake(centerPointX,
                                            centerPointY - realDistance,
                                            controllerSize, controllerSize)];
            break;
        case down:
            [controller setFrame:CGRectMake(centerPointX,
                                            centerPointY + realDistance,
                                            controllerSize, controllerSize)];
            break;
        case origin:
            [controller setFrame:CGRectMake(centerPointX,
                                            centerPointY,
                                            controller.frame.size.width,
                                            controller.frame.size.height)];
            break;
    }
}
@end
