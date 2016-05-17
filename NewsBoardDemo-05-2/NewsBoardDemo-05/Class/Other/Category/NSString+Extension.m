//
//  NSString+Extension.m
//  NewsBoardDemo-05
//
//  Created by Invoter丶C on 16/4/20.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (CGFloat)stringWidth {
    CGFloat  width = [self  boundingRectWithSize:CGSizeMake(100, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:25]} context:nil].size.width;
    return width;
}

@end










