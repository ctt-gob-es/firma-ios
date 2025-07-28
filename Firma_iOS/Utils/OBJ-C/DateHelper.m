//
//  DateHelper.m
//  PortaFirmasUniv
//
//  Created by Rocio Tovar on 12/3/15.
//  Copyright (c) 2015 Atos. All rights reserved.
//

#import "DateHelper.h"
#import "NSDateFormatter+Utils.h"

static NSString *const kAODefaultDateFormat = @"dd/MM/yyyy";

@implementation DateHelper

+ (NSString *)getStringFromDate:(NSDate *)date
{
    return [self getStringFromDate:date withFormat:kAODefaultDateFormat];
}

+ (NSString *)getStringFromDate:(NSDate *)date withFormat:(NSString *)format
{
    if (!date) {
        return nil;
    }
    
    NSDateFormatter * df = [[NSDateFormatter alloc] initWithCurrentLocale];
    [df setDateFormat:format];
    
    return [df stringFromDate:date];
}

+ (NSDate *)getDateFromString:(NSString *)stringDate
{
    return [self getDateFromString:stringDate withFormat:kAODefaultDateFormat];
}

+ (NSDate *)getDateFromString:(NSString *)stringDate withFormat:(NSString *)format
{
    if (stringDate) {
        NSDateFormatter *df = [[NSDateFormatter alloc] initWithCurrentLocale];
        [df setDateFormat:format];

        return [df dateFromString:stringDate];
    }

    return nil;
}

@end
