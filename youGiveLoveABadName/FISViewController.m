//
//  FISViewController.m
//  youGiveLoveABadName
//
//  Created by Joe Burgess on 7/9/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *bonJovi;
@property (nonatomic) CGRect baseFrame;
- (IBAction)expand:(id)sender;

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)expand:(id)sender {
    
    self.baseFrame = CGRectMake(0,197,320,174);
    
    UIButton *expandButton = (UIButton *)sender;
    
    expandButton.enabled = NO;
    
    void (^animationBlock)() = ^{
 
        if (CGRectEqualToRect(self.bonJovi.frame,self.baseFrame))
        {
            
        CGRect miniFrame = CGRectMake(self.baseFrame.origin.x, self.baseFrame.origin.y + 10, self.baseFrame.size.width, self.baseFrame.size.height - 20);
            
        [UIView addKeyframeWithRelativeStartTime:0
                                    relativeDuration:0.2
                                          animations:^{
                                              self.bonJovi.frame = miniFrame;
                                          }];

        [UIView addKeyframeWithRelativeStartTime:0.2
                                    relativeDuration:0.6
                                          animations:^{
                                              self.bonJovi.frame = CGRectMake(0, -60, 320, 688);
                                          }];
            
        [UIView addKeyframeWithRelativeStartTime:0.8
                                    relativeDuration:0.2
                                          animations:^{
                                              self.bonJovi.frame = self.view.frame;
                                          }];

        
        }
        else {
            [UIView addKeyframeWithRelativeStartTime:0
                                    relativeDuration:0.5
                                          animations:^{
                                              self.bonJovi.frame = self.baseFrame;
                                          }];
        }
            
    
    
    };
    
    [UIView animateKeyframesWithDuration:0.4
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionCalculationModeCubic |
     UIViewAnimationOptionCurveLinear
                              animations:animationBlock
                              completion:^(BOOL finished) {
                                  expandButton.enabled = YES;
                              }];
    
    
  }

@end
