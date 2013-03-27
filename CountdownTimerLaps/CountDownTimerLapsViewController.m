//
//  CountDownTimerLapsViewController.m
//  CountdownTimerLaps
//
//  Created by Gaurav Hombali on 12/10/12.
//  Copyright (c) 2012 Gaurav Hombali. All rights reserved.
//

#import "CountDownTimerLapsViewController.h"
#import <AVFoundation/AVAudioPlayer.h>

@interface CountDownTimerLapsViewController ()

@end


@implementation CountDownTimerLapsViewController

@synthesize countdownTimerLabel;
@synthesize minutes;
@synthesize seconds;


- (void)viewDidLoad
{
    [super viewDidLoad];
    countdownTimerLabel.text=timerOutPut;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)timerRun{
    secondsCount=secondsCount-1;
    int minutesLabel = secondsCount/60;
    int secondsLabel = secondsCount-(minutesLabel*60);
    timerOutPut = [NSString stringWithFormat:@"%.2d:%.2d", minutesLabel, secondsLabel];
    countdownTimerLabel.text=timerOutPut;
    
        
    
    if (secondsCount == 0) {
        [self NotifyMe];
        int minutesInput = [minutes.text intValue];
        int secondsInput = [seconds.text intValue];
        secondsCount = minutesInput*60+secondsInput+1;
    }
    
    
}

-(void)setTimer{
    if (!countdownTimer){
    int minutesInput = [minutes.text intValue];
    int secondsInput = [seconds.text intValue];
    secondsCount = minutesInput*60+secondsInput+1;
        if(secondsCount>1){
    countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                      target:self
                                                    selector:@selector(timerRun)
                                                    userInfo:nil
                                                     repeats:YES];
        }
    }
}

-(void)NotifyMe{
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Glass.aiff", [[NSBundle mainBundle] resourcePath]]];
    
    NSError *error;
    theAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    theAudio.numberOfLoops=2;
    theAudio.volume=1.0;
    [theAudio play];
}

- (IBAction)startTimer {
    [minutes resignFirstResponder];
    [seconds resignFirstResponder];
    if ([minutes.text length]>0 || [seconds.text length]>0)
    {
        [self setTimer];
    }
}

- (IBAction)stopTimer {
    [countdownTimer invalidate];
    countdownTimer=nil;
    [theAudio stop];
    
}
@end
