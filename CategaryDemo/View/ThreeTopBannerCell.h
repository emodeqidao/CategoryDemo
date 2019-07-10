//
//  ThreeTopBannerCell.h
//  MPMALL
//
//  Created by xixi_wen on 2019/7/4.
//  Copyright © 2019 panduola. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define ThreeTopBannerCell_addHeight 10.f //额外增加的高度（图片距离顶部高度）

@interface ThreeTopBannerCell : UICollectionViewCell

+(NSString *) cellIdentifier;

-(void) setData:(id)data;

@end

NS_ASSUME_NONNULL_END
