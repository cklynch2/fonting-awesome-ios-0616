//
//  ViewController.h
//  Fonting Awesome
//
//  Created by Flatiron School on 6/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FAKIcon.h"
#import "FAKFontAwesome.h"
#import "FAKFoundationIcons.h"
#import "FAKZocial.h"
#import "FAKIonIcons.h"
#import "CWStatusBarNotification.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILongPressGestureRecognizer *buttonHeldGesture;
- (IBAction)iconButtonTapped:(id)sender;
- (IBAction)iconButtonHeld:(id)sender;


@end

