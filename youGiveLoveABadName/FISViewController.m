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
- (IBAction)expand:(id)sender;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bonJoviTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bonJoviBot;

@property (nonatomic) BOOL isStretched;

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.isStretched = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)expand:(id)sender {
    
    if(self.isStretched == NO){
        [UIView animateKeyframesWithDuration:1 delay:0 options:0 animations:^{
            
            // get bounce in
            [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:.25 animations:^{
                self.bonJoviTop.constant += 8; // 185
                self.bonJoviBot.constant -= 8; // -205
                [self.view layoutIfNeeded];
            }];
            
            // get zoom out to full
            [UIView addKeyframeWithRelativeStartTime:0.25 relativeDuration:.25 animations:^{
                self.bonJoviTop.constant -= 185; // 0
                self.bonJoviBot.constant += 205; // 0
                [self.view layoutIfNeeded];
            }];
            
            // bounce a little bit out
            [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:.25 animations:^{
                self.bonJoviTop.constant -= 20; // -20
                self.bonJoviBot.constant += 20; //  20
                [self.view layoutIfNeeded];
            }];
            
            // return to full
            [UIView addKeyframeWithRelativeStartTime:0.75 relativeDuration:.25 animations:^{
                self.bonJoviTop.constant += 20; // 0
                self.bonJoviBot.constant -= 20; // 0
                [self.view layoutIfNeeded];
            }];
            
        } completion:nil];
        
        self.isStretched = YES;
    }
    else
    {
        [UIView animateKeyframesWithDuration:1 delay:0 options:0 animations:^{
            
            // bounce a little bit out
            [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:.25 animations:^{
                self.bonJoviTop.constant -= 20; // -20
                self.bonJoviBot.constant += 20; //  20
                [self.view layoutIfNeeded];
            }];
            
            // zoom into small
            [UIView addKeyframeWithRelativeStartTime:0.25 relativeDuration:.25 animations:^{
                self.bonJoviTop.constant += 197; // 177 (ORIGINAL)
                self.bonJoviBot.constant -= 217; // -197 (ORIGINAL)
                [self.view layoutIfNeeded];
            }];
            
            // bounce a little bit in
            [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:.25 animations:^{
                self.bonJoviTop.constant += 8; // 185
                self.bonJoviBot.constant -= 8; // -205
                [self.view layoutIfNeeded];
            }];
            
            // return to small
            [UIView addKeyframeWithRelativeStartTime:0.75 relativeDuration:.25 animations:^{
                self.bonJoviTop.constant -= 8; // 177
                self.bonJoviBot.constant += 8; // -197
                [self.view layoutIfNeeded];
            }];
        } completion:nil];
        
        self.isStretched = NO;
    }
}
@end
