//
//  PDFImageAnnotation.m
//  ABAPdf
//
//  Created by Desarrollo Abamobile on 27/6/24.
//

#import <Foundation/Foundation.h>
#import "PDFImageAnnotation.h"

@implementation PDFImageAnnotation

- (instancetype)initWithImage:(UIImage *)image bounds:(CGRect)bounds properties:(NSDictionary<NSString *, id> *)properties {
    self = [super initWithBounds:bounds forType:PDFAnnotationSubtypeStamp withProperties:properties];
    if (self) {
	   _image = image;
    }
    return self;
}

- (void)drawWithBox:(PDFDisplayBox)box inContext:(CGContextRef)context {
    [super drawWithBox:box inContext:context];
    CGImageRef cgImage = [self.image CGImage];
    
    if (cgImage) {
	   CGFloat imageAspectRatio = CGImageGetWidth(cgImage) / (CGFloat)CGImageGetHeight(cgImage);
	   CGFloat boundsAspectRatio = self.bounds.size.width / self.bounds.size.height;
	   
	   CGRect drawRect = self.bounds;
	   
	   if (imageAspectRatio > boundsAspectRatio) {
		  CGFloat drawWidth = self.bounds.size.width;
		  CGFloat drawHeight = drawWidth / imageAspectRatio;
		  drawRect = CGRectMake(
			 self.bounds.origin.x,
			 self.bounds.origin.y + (self.bounds.size.height - drawHeight) / 2,
			 drawWidth,
			 drawHeight
		  );
	   } else {
		  CGFloat drawHeight = self.bounds.size.height;
		  CGFloat drawWidth = drawHeight * imageAspectRatio;
		  drawRect = CGRectMake(
			 self.bounds.origin.x + (self.bounds.size.width - drawWidth) / 2,
			 self.bounds.origin.y,
			 drawWidth,
			 drawHeight
		  );
	   }
	   
	   CGContextDrawImage(context, drawRect, cgImage);
    }
}

@end
