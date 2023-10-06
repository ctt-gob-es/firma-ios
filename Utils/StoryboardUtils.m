    //
    //  StoryboardUtils.m
    //  Cliente @firma
    //
    //  Created by ABAMobile on 6/10/23.
    //  Copyright © 2023 Solid GEAR. All rights reserved.
    //

#import "StoryboardUtils.h"
#import "GlobalConstants.h"

@implementation StoryboardUtils

- (UIStoryboard *)getMainStoryboard {
    UIStoryboard *mainStoryboard;
   /* if ([(NSString*)[UIDevice currentDevice].model hasPrefix:IPAD] ) {
        mainStoryboard = [UIStoryboard storyboardWithName:IPAD_STORYBOARD
                                                   bundle: nil];
    }
    else {
        mainStoryboard = [UIStoryboard storyboardWithName:IPHONE_STORYBOARD
                                                   bundle: nil];
    }*/
    mainStoryboard = [UIStoryboard storyboardWithName:IPAD_STORYBOARD
                                               bundle: nil];
    return mainStoryboard;
}

@end
