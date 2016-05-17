//
//  UIBarButtonItem+Extension.h
//  NewsBoardDemo-05
//
//  Created by Invoter丶C on 16/4/19.
//  Copyright © 2016年 IT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (nonnull instancetype)itemWithTitle:(nullable NSString *)title  imageNamed:(nullable NSString *)imgName   addTarget:(nullable id)target sel:(nullable SEL)method;
    
    
@end



