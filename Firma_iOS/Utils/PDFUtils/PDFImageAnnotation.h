//
//  PDFImageAnnotation.h
//  ABAPdf
//
//  Created by Desarrollo Abamobile on 27/6/24.
//
#import <PDFKit/PDFKit.h>

@interface PDFImageAnnotation : PDFAnnotation

@property (nonatomic, strong) UIImage *image;

- (instancetype)initWithImage:(UIImage *)image bounds:(CGRect)bounds properties:(NSDictionary<NSString *, id> *)properties;

@end


