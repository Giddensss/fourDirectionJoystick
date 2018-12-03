Four-Direction Joystick

This is a demo of a four-diretion joystick written in Objective-C. This joystick only can recognize four directions: Left, Right, Up, Down. There is a "center area" where is determined as "origin". The size of the area is controller by a macro.

The UI design is very simple. That is,  a smaller inside circle  laying on a bigger outside circle where the centers of two circles are at the same x,y coordianate. The smaller inside circle is defined as "controller", and the whole thing is defined as "joystick".

![Image Text](https://github.com/Giddensss/image-folder/blob/master/IMG_0108.PNG)

Public APIs:

1. Construtors:

-(id) initJoystickWithRadius:(CGFloat) radius x:(int) x y:(int) y;

-(id) initJoystickWithRadius:(CGFloat) radius x:(int) x y:(int)y backgroundColor:(UIColor *) bgColor controllerColer:(UIColor *) controllerColor;

-(id) initJoystickWithRadius:(CGFloat) radius x:(int) x y:(int)y backgroundImage:(UIImage *) bg controllerImage:(UIImage *)controllerImage;

2. Customizations:

-(void) customize:(NSDictionary *) attrs;

Passing an NSDictionary which contrains the attributes that need to be customized to customize the joystick. The available attributes are:  

                                      @"BackgroundColor"                         UIColor                                 
                                      @"backgrondImage"                          NSString  
                                      @"boundColor"                                   UIColor
                                      @"boundWidth"                                  CGFloat
                                      @"controllerBGColor"                         UIColor
                                      @"controllerBGImage"                        NSString
                                      @"controllerBoundWidth"                   CGFloat
                                      @"controllerBoundColor"                    UIColor  
                                      
All these keys have been defined in .h that you can easily use the constances when creating the dirctionary. Note that it doesn't require to pass a dictionary with all these key-value mappings to customize. Just choose those you need. 

-(void) setBackgroundImage:(UIImage *) bgImage controllerBackgroundImage:(UIImage *) controllerBGIamge;

-(void) setBackgroundColor:(UIColor *)backgroundColor controllerBackgroundColor:(UIColor *) controllerBGColor;
