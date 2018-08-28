//
//  AOXMLParser.m
//  Firma_iOS
//
//  Created by Javier on 20/10/14.
//  Copyright (c) 2014 Atos. All rights reserved.
//

#import "AOCounterSignXMLParser.h"
#import "AOCounterSignPreItems.h"
#import "Firma.h"
#import "GlobalConstants.h"

@implementation AOCounterSignXMLParser

// Punto de partida del parseo, se comprueban que los datos son validos y se prepara el contenedor de los datos.
-(NSMutableArray *)parseXML: (NSData *) data {
    
    // Parse the XML
    self.xmlParser = [[NSXMLParser alloc] initWithData:data];
    self.xmlParser.delegate = self;
    BOOL success = [self.xmlParser parse];
    
    // Return the stack’s root dictionary on success
    if (success)
    {
        return self.firmas;
    }
    return nil;
}

// Cuando se produce un error durante el proceso de parseo, invalidamos el resultado.
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    NSLog(@"Error durante la realizacion del parseo del XML: %@", [parseError localizedDescription]);
    self.error = true;
}

// Se ejecuta antes de iniciar el parseo, se inician las variables que hacen falta para el proceso.
-(void)parserDidStartDocument:(NSXMLParser *)parser{
    
}

// Se ejecuta al detectar el comienzo de una nueva etiqueta XML.
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    if ( [elementName isEqualToString:@"firmas"]) {
        // Firmas is an NSMutableArray instance variable
        if (!self.firmas) {
            self.firmas = [[NSMutableArray alloc] init];
        }
        return;
    }
    
    if ( [elementName isEqualToString:@"firma"] ) {
        // currentFirma is an Firma instance variable
        self.currentFirma = [[Firma alloc] init];
        self.currentFirma.ident = [attributeDict objectForKey:@"Id"];
        self.currentFirma.params = [[NSMutableDictionary alloc] init];
        return;
    }
    
    if ( [elementName isEqualToString:@"param"] ) {
        
        NSString *attributeN = [attributeDict objectForKey:@"n"];
        self.currentParam = attributeN ;
    
        return;
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if (!self.currentStringValue) {
        // currentStringValue is an NSMutableString instance variable
        self.currentStringValue = [[NSMutableString alloc] initWithCapacity: 2048];
    }
    [self.currentStringValue appendString: string];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ( [elementName isEqualToString:SIGNATURES]) {
        
        return;
    }
    
    if ( [elementName isEqualToString:SIGNATURE] ) {
        
        [self.firmas addObject: self.currentFirma];
        self.currentFirma;
        return;
    }
    
    if ( [elementName isEqualToString:PARAMETERS] ) {
        
        [self.currentFirma.params setValue:self.currentStringValue forKey:self.currentParam];
        self.currentStringValue;
        self.currentStringValue = nil;
    }
}

@end
