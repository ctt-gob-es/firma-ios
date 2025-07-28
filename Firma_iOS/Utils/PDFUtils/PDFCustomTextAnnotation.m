//
//  PDFCustomTextAnnotation.m
//  ABAPdf
//
//  Created by Desarrollo Abamobile on 27/6/24.
//

#import <Foundation/Foundation.h>
#import "PDFCustomTextAnnotation.h"

@implementation PDFCustomTextAnnotation

- (instancetype)initWithText:(NSString *)text bounds:(CGRect)bounds font:(UIFont *)font fontColor:(UIColor *)fontColor {
	self = [super initWithBounds:bounds forType:PDFAnnotationSubtypeFreeText withProperties:nil];
	if (self) {
		self.contents = text;
		self.font = font;
		self.fontColor = fontColor;
		self.color = [UIColor clearColor];
		
		PDFBorder *border = [[PDFBorder alloc] init];
		border.lineWidth = 1.0;
		self.border = border;
	}
	return self;
}

- (void)drawWithBox:(PDFDisplayBox)box inContext:(CGContextRef)context {
	[super drawWithBox:box inContext:context];
	
	if (self.contents) {
		NSDictionary *attributes = @{
			NSFontAttributeName: self.font,
			NSForegroundColorAttributeName: self.fontColor
		};
		NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:self.contents attributes:attributes];
		
		CGContextSaveGState(context);
		CGContextTranslateCTM(context, self.bounds.origin.x, self.bounds.origin.y);
		CGContextScaleCTM(context, 1.0, -1.0);
		
		CGRect textRect = CGRectMake(0, -self.bounds.size.height, self.bounds.size.width, self.bounds.size.height);
		[attributedText drawInRect:textRect];
		
		CGContextRestoreGState(context);
	}
}

@end
