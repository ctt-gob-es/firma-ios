//
//  AOXMLReader.h
//  Firma_iOS
//
//

#import <Foundation/Foundation.h>
#import "AOEntity.h"

@interface AOXMLReader : NSObject <NSXMLParserDelegate>{
    NSMutableString *currentNodeContent;
    NSXMLParser *parser;
    AOEntity *currentEntidad;
}
@property (nonatomic, strong) NSMutableArray *entidades;

-(id) loadXMLByString:(NSString *)xmlString;


@end
