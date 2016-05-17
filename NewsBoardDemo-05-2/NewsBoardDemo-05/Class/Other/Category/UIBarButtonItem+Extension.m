//
//  UIBarButtonItem+Extension.m
//  NewsBoardDemo-05
//
//  Created by Invoter丶C on 16/4/19.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
/**
 * barbuttonitem
 */
+ (instancetype)itemWithTitle:(nullable NSString *)title  imageNamed:(nullable NSString *)imgName   addTarget:(id)target sel:(SEL)method {
    
    UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
//    button.width = 30;
//    button.height = 30;

    
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    
    button.width = button.currentTitle.stringWidth + button.currentImage.size.width;
    button.height = 50;

    // 上 左 下 右
    // [button setContentEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
  //  button.backgroundColor = [UIColor grayColor];
    [button addTarget:target action:method forControlEvents:UIControlEventTouchUpInside];
    //search_icon
    return [[self alloc] initWithCustomView:button];
}

    
@end
