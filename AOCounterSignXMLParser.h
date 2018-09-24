//
//  AOXMLParser.h
//  SignSample02
//
//  Created by Javier on 20/10/14.
//  Copyright (c) 2014 Atos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AOCounterSignPreItems.h"
#import "Firma.h"

@interface AOCounterSignXMLParser : NSObject <NSXMLParserDelegate>

- (NSMutableArray *)parseXML:(NSData *) data;

@property (nonatomic, strong) NSXMLParser *xmlParser;

@property (nonatomic, strong) NSMutableArray *firmas;

@property (nonatomic, strong) Firma *currentFirma;

@property (nonatomic, strong) NSMutableString *currentStringValue;

@property (nonatomic, assign) BOOL error;

@property (nonatomic, assign) NSString *currentParam;


@end
