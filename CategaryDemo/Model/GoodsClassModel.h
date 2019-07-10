//
//  GoodsClassModel.h
//  MPMALL
//
//  Created by xixi_wen on 2019/7/8.
//  Copyright © 2019 panduola. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GoodsClassModel : NSObject

@property (nonatomic, strong) NSString *idField;
@property (nonatomic, strong) NSString *pid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *level;
@property (nonatomic, strong) NSString *indexs;
@property (nonatomic, strong) NSString *iconUrl;
@property (nonatomic, strong) NSString *showUrl;
@property (nonatomic, strong) NSString *productUrl;
@property (nonatomic, strong) NSArray<GoodsClassModel *> *childrenList;

@end

NS_ASSUME_NONNULL_END
