//
//  DLSystemSound.m
//  DLKit
//
//  Created by XueYulun on 15/3/26.
//  Copyright (c) 2015年 X. All rights reserved.
//

#import "DLSystemSound.h"

@implementation DLSystemSound


+ (void)playSystemSound:(AudioID)audioID {
    AudioServicesPlaySystemSound(audioID);
}

+ (void)playSystemSoundVibrate {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

+ (SystemSoundID)playCustomSound:(NSURL *)soundURL {
    SystemSoundID soundID;
    
    OSStatus err = AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundURL), &soundID);
    if(err != kAudioServicesNoError) {
        
        
    }
    return (unsigned int)soundID;
}

+ (BOOL)disposeSound:(SystemSoundID)soudID {
    OSStatus err = AudioServicesDisposeSystemSoundID(soudID);
    if(err != kAudioServicesNoError) {
        return NO;
    }
    
    return YES;
}

@end
