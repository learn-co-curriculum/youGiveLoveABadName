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

@property (nonatomic, assign) NSInteger innerBounceDistance;
@property (nonatomic, assign) NSInteger outerBounceDistance;
@property (nonatomic, assign) NSInteger imageTopConstant;
@property (nonatomic, assign) NSInteger imageBottomConstant;
@property (nonatomic) BOOL isStretched;

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.innerBounceDistance = 8;
    self.outerBounceDistance = 20;
    self.imageTopConstant = self.bonJoviTop.constant;
    self.imageBottomConstant = -self.bonJoviBot.constant;
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
                self.bonJoviTop.constant += self.innerBounceDistance; // 185
                self.bonJoviBot.constant -= self.innerBounceDistance; // -205
                [self.view layoutIfNeeded];
            }];
            
            // get zoom out to full
            [UIView addKeyframeWithRelativeStartTime:0.25 relativeDuration:.25 animations:^{
                self.bonJoviTop.constant -= (self.imageTopConstant + self.innerBounceDistance); // 0
                self.bonJoviBot.constant += (self.imageBottomConstant + self.innerBounceDistance); // 0
                [self.view layoutIfNeeded];
            }];
            
            // bounce a little bit out
            [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:.25 animations:^{
                self.bonJoviTop.constant -= self.outerBounceDistance; // -20
                self.bonJoviBot.constant += self.outerBounceDistance; //  20
                [self.view layoutIfNeeded];
            }];
            
            // return to full
            [UIView addKeyframeWithRelativeStartTime:0.75 relativeDuration:.25 animations:^{
                self.bonJoviTop.constant += self.outerBounceDistance; // 0
                self.bonJoviBot.constant -= self.outerBounceDistance; // 0
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
                self.bonJoviTop.constant -= self.outerBounceDistance; // -20
                self.bonJoviBot.constant += self.outerBounceDistance; //  20
                [self.view layoutIfNeeded];
            }];
            
            // zoom into small
            [UIView addKeyframeWithRelativeStartTime:0.25 relativeDuration:.25 animations:^{
                self.bonJoviTop.constant += (self.imageTopConstant + self.outerBounceDistance); // 177 (ORIGINAL)
                self.bonJoviBot.constant -= (self.imageBottomConstant + self.outerBounceDistance); // -197 (ORIGINAL)
                [self.view layoutIfNeeded];
            }];
            
            // bounce a little bit in
            [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:.25 animations:^{
                self.bonJoviTop.constant += self.innerBounceDistance; // 185
                self.bonJoviBot.constant -= self.innerBounceDistance; // -205
                [self.view layoutIfNeeded];
            }];
            
            // return to small
            [UIView addKeyframeWithRelativeStartTime:0.75 relativeDuration:.25 animations:^{
                self.bonJoviTop.constant -= self.innerBounceDistance; // 177
                self.bonJoviBot.constant += self.innerBounceDistance; // -197
                [self.view layoutIfNeeded];
            }];
        } completion:nil];
        
        self.isStretched = NO;
    }
}
@end
