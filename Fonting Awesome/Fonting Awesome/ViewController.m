//
//  ViewController.m
//  Fonting Awesome
//
//  Created by Flatiron School on 6/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *changingIconButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view removeConstraints:self.view.constraints];
    self.changingIconButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.changingIconButton removeConstraints:self.changingIconButton.constraints];
    
    [self.changingIconButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.changingIconButton.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    
    FAKFontAwesome *lightbulbIcon = [FAKFontAwesome lightbulbOIconWithSize:100.0];
    [lightbulbIcon addAttribute:NSForegroundColorAttributeName value:[UIColor yellowColor]];
    NSAttributedString *lightbulbString = [lightbulbIcon attributedString];
    
    [self.changingIconButton setAttributedTitle:lightbulbString forState:UIControlStateNormal];
    
    // Apple documentation says that defaults are: 0.5 for duration, 1 for touches (number of fingers), 0 for taps, and 10 for allowable movement (measured in points. Writing them out explicitly here, just to familiarize myself with these gesture recognizer properties.
    self.buttonHeldGesture.minimumPressDuration = 0.5;
    self.buttonHeldGesture.numberOfTouchesRequired = 1;
    self.buttonHeldGesture.numberOfTapsRequired = 0;
    self.buttonHeldGesture.allowableMovement = 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)iconButtonTapped:(id)sender {
    
    if ([sender isSelected]) {
        FAKFontAwesome *starIcon = [FAKFontAwesome starIconWithSize:150.0];
        [starIcon addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor]];
        NSAttributedString *starString = [starIcon attributedString];
        
        [self.changingIconButton setAttributedTitle:starString forState:UIControlStateSelected];
        
        [sender setSelected:NO];
    
    } else {
        FAKFontAwesome *lightbulbIcon = [FAKFontAwesome lightbulbOIconWithSize:100.0];
        [lightbulbIcon addAttribute:NSForegroundColorAttributeName value:[UIColor yellowColor]];
        NSAttributedString *lightbulbString = [lightbulbIcon attributedString];
        
        [self.changingIconButton setAttributedTitle:lightbulbString forState:UIControlStateNormal];
        
        [sender setSelected:YES];
    }
}

- (IBAction)iconButtonHeld:(id)sender {
    CWStatusBarNotification *notification = [CWStatusBarNotification new];
    notification.notificationLabelBackgroundColor = [UIColor grayColor];
    
    if (self.buttonHeldGesture.state == UIGestureRecognizerStateBegan)
        [notification displayNotificationWithMessage:@"Yo, stop pressing! You only need to tap!" forDuration:1.5];
    
    else if (self.buttonHeldGesture.state == UIGestureRecognizerStateEnded)
        [notification dismissNotification];
}


@end
