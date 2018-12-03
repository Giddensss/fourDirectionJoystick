//
//  ViewController.m
//  joystickDemo
//
//  Created by Alan L  Hamilton on 2018/11/30.
//  Copyright © 2018 Alan L  Hamilton. All rights reserved.
//

#import "ViewController.h"
#import "Joystick.h"
@interface ViewController (){
    Joystick *stick;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //place a joystick at the center of the screen
    stick = [[Joystick alloc] initJoystickWithRadius:100
                                                   x:self.view.frame.size.width / 2 - 100
                                                   y:self.view.frame.size.height / 2 - 100
                                     backgroundColor:[UIColor blackColor]
                                     controllerColer:[UIColor lightGrayColor]];
    [self.view addSubview:stick];
}


@end
