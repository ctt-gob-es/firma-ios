//
//  AOEntity.h
//  Firma_iOS
//
//

#import <Foundation/Foundation.h>

@interface AOEntity : NSObject{
    NSString *datField;
    NSString *formatField;
    NSString *algorithmField;
    NSString *propertiesField;
    NSString *idField;
    NSString *stServletField;
}

@property (nonatomic, strong) NSString *datField;
@property (nonatomic, strong) NSString *formatField;
@property (nonatomic, strong) NSString *algorithmField;
@property (nonatomic, strong) NSString *propertiesField;
@property (nonatomic, strong) NSString *idField;
@property (nonatomic, strong) NSString *stServletField;


@end
