//
//  Joystick.h
//  joystickDemo
//
//  The four-direction joystick header file
//  Public APIs and Delegate is defined here
//
//  Created by Alan L  Hamilton on 2018/11/30.
//  Copyright © 2018 Alan L  Hamilton. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
#define DEFAULT_BG_COLOR [UIColor blackColor]                                                   // Default background color for the outside circle
#define DEFAULT_CONTROLLER_COLOR [UIColor lightGrayColor]                                       // Default background color for the inside circle
#define CONTROLLER_SIZE_RATIO 0.333                                                             // Default ratio of the radius of inside circle to
                                                                                                // that of the outside circle.
#define CONTROLLER_CENTER_AREA 0.15                                                             // An area of "center of the controller"
#define EVENT_PRINT 0
#define CONTROLLER_DEBUG_PRINT 1
enum stickDirection{
    left,
    up,
    right,
    down,
    origin,
};

// keys for attributes dictionary
const static NSString *backgroundColorKey                                                       = @"BackgroundColor";
const static NSString *backgroundImageKey                                                       = @"backgrondImage";
const static NSString *boundColorKey                                                            = @"boundColor";
const static NSString *boundWidthKey                                                            = @"boundWidth";
const static NSString *controllerBackgroundColorKey                                             = @"controllerBGColor";
const static NSString *controllerBackgroundImageKey                                             = @"controllerBGImage";
const static NSString *controllerBoundWidthKey                                                  = @"controllerBoundWidth";
const static NSString *controllerBoundColorKey                                                  = @"controllerBoundColor";

/*
 * The delegate of the joystick
 * which will listen to the change in direction of user's finger motion
 *
 */
@protocol JoystickDelegate <NSObject>
- (void) onTouchStarted;
- (void) onStickDirectionChanged:(enum stickDirection) direction;
- (void) onTouchEnded;
@end

@interface Joystick : UIView
@property id<JoystickDelegate> delegate;

/*
 * constuctor
 * @param radius: the radius of the joystick
 * @param x:      x coordinate of the joystick
 * @param y:      y coordinate of the joystick
 */
- (id) initJoystickWithRadius:(CGFloat) radius x:(int) x y:(int) y;

/*
 * constuctor
 * @param radius:          the radius of the joystick
 * @param x:               x coordinate of the joystick
 * @param y:               y coordinate of the joystick
 * @param backgroundColor: the background color of the outside circle
 * @param controllerColor: the background color of the inside circle
 */
- (id) initJoystickWithRadius:(CGFloat) radius x:(int) x y:(int)y backgroundColor:(UIColor *) bgColor controllerColer:(UIColor *) controllerColor;

/*
 * constuctor
 * @param radius:          the radius of the joystick
 * @param x:               x coordinate of the joystick
 * @param y:               y coordinate of the joystick
 * @param backgroundImage: the background image of the outside circle
 * @param controllerImage: the background image of the inside circle
 */
- (id) initJoystickWithRadius:(CGFloat) radius x:(int) x y:(int)y backgroundImage:(UIImage *) bg controllerImage:(UIImage *)controllerImage;

/*
 * This method can change some attributes of the joystick
 * by passing a attribute dictionary.
 * The key attributes that can be custimzed are list above,
 * please check those const static NSString above.
 * It doesn't require to give the value of all these attributes.
 *
 * @param attrs: attribute dictioanry.
 *
 */
- (void) customize:(NSDictionary *) attrs;

/*
 * Set the background image of the joystick
 *
 * @param bgImage:                   background image of the outside circle
 * @param controllerBackgroundImage: background image of the inside circle
 *
 */
- (void) setBackgroundImage:(UIImage *) bgImage controllerBackgroundImage:(UIImage *) controllerBGIamge;

/*
 * Set the background color of the joystick
 *
 * @param backgroundColor:           background color of the outside circle
 * @param controllerBackgroundColor: background color of the inside circle
 *
 */
- (void) setBackgroundColor:(UIColor *)backgroundColor controllerBackgroundColor:(UIColor *) controllerBGColor;

@end

NS_ASSUME_NONNULL_END
