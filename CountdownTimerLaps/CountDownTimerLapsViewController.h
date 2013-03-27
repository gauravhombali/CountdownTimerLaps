//
//  CountDownTimerLapsViewController.h
//  CountdownTimerLaps
//
//  Created by Gaurav Hombali on 12/10/12.
//  Copyright (c) 2012 Gaurav Hombali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface CountDownTimerLapsViewController : UIViewController <UITextFieldDelegate>



@property (strong, nonatomic) IBOutlet UILabel *countdownTimerLabel;
@property (strong, nonatomic) IBOutlet UITextField *minutes;
@property (strong, nonatomic) IBOutlet UITextField *seconds;

- (IBAction)startTimer;
- (IBAction)stopTimer;


@end
NSTimer *countdownTimer;
int secondsCount;
NSString *timerOutPut;
AVAudioPlayer *theAudio;
NSURL *path;