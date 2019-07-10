//
//  GoodsClassModel.m
//  MPMALL
//
//  Created by xixi_wen on 2019/7/8.
//  Copyright © 2019 panduola. All rights reserved.
//

#import "GoodsClassModel.h"

@implementation GoodsClassModel

+(NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"idField":@"id",
             };
}

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"childrenList":[GoodsClassModel class],
             };
}

@end
