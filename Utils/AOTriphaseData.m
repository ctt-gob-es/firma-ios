//
//  AOTriphaseData.m
//  SignSample02
//
//  Created by User1 on 11/12/15.
//  Copyright © 2015 Atos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AOTriphaseData.h"
#import "AOCounterSignPreItems.h"

@implementation AOTriphaseData

# pragma mark -
# pragma mark Parsing

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    
    if (self) {
        
        NSArray *dictKeys = [dict allKeys];
        
        if ([dictKeys containsObject:@"id"]) {
            _id = dict[@"id"];
        }
    }
    
    return self;
}

- (id)initWithId:(NSString *)id
{
    self = [super init];
    
    if (self) {
        self.id = id;
    }
    
    return self;
}


@end




