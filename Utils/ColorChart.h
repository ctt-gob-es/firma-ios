//
//  ColorChart.h
//  PortaFirmasUniv
//
//  Created by Rocio Tovar on 6/3/15.
//  Copyright (c) 2015 Atos. All rights reserved.
//

#import <Foundation/Foundation.h>

#define THEME_COLOR           [ColorChart colorFromHexString:@"#69191f"]
#define COLOR_PRIORITY_RED    [ColorChart colorFromHexString:@"#ff4466"]
#define COLOR_PRIORITY_ORANGE [ColorChart colorFromHexString:@"#ff9966"]
#define COLOR_PRIORITY_YELLOW [ColorChart colorFromHexString:@"#f6d965"]
#define NAVIGATION_BAR_COLOR [ColorChart colorFromHexString:@"#757575"]
#define COLOR_GRAY [ColorChart colorFromHexString:@"#757575"]
#define LINK_COLOR [ColorChart colorFromHexString:@"#0271E8"]
#define COMPONENTS_BORDER_COLOR [ColorChart colorFromHexString:@"#707070"]
#define ThemeColorWithAlpha(alpha) [THEME_COLOR colorWithAlphaComponent : alpha]
#define COLOR_DARK_GREEN [ColorChart colorFromHexString:@"#116600"]

@interface ColorChart : NSObject

/**
 *  Returns a UIColor object given its hexadecimal code. Assumes input like "#00FF00" (#RRGGBB).
 *
 *  @param hexString The hexadecimal code of the wanted color. Assumes input like "#00FF00" (#RRGGBB).
 *
 *  @return A UIColor with the wanted color.
 */
+ (UIColor *)colorFromHexString:(NSString *)hexString;

@end
