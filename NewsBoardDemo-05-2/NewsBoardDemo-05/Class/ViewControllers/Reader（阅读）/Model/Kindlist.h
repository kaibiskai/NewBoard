//
//  Kindlist.h
//  NewsBoardDemo-05
//
//  Created by Invoter丶C on 16/4/20.
//  Copyright © 2016年 IT. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DeList;

@interface Kindlist : NSObject

@property (nonatomic,copy) NSString *kind;
@property (nonatomic, retain) NSMutableArray <DeList *>  *diListArr ;
- (instancetype)initWithDic:(NSDictionary *)dic ;

@end




