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
    NSString *batchpresignerurl;
    NSString *batchpostsignerurl;
    NSString *batchjson;
    NSString *filename;
    NSString *sticky;
    NSString *resetsticky;
}

@property (nonatomic, strong) NSString *datField;
@property (nonatomic, strong) NSString *formatField;
@property (nonatomic, strong) NSString *algorithmField;
@property (nonatomic, strong) NSString *propertiesField;
@property (nonatomic, strong) NSString *idField;
@property (nonatomic, strong) NSString *stServletField;
@property (nonatomic, strong) NSString *batchpresignerurl;
@property (nonatomic, strong) NSString *batchpostsignerurl;
@property (nonatomic, strong) NSString *batchjson;
@property (nonatomic, strong) NSString *filename;
@property (nonatomic, strong) NSString *sticky;
@property (nonatomic, strong) NSString *resetsticky;


@end
