//
//  PDFCustomTextAnnotation.h
//  ABAPdf
//
//  Created by Desarrollo Abamobile on 27/6/24.
//

#import <PDFKit/PDFKit.h>

@interface PDFCustomTextAnnotation : PDFAnnotation

@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *fontColor;

- (instancetype)initWithText:(NSString *)text bounds:(CGRect)bounds font:(UIFont *)font fontColor:(UIColor *)fontColor;

@end
