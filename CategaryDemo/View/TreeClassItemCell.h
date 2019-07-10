//
//  TreeClassItemCell.h
//  MPMALL
//
//  Created by xixi_wen on 2019/7/5.
//  Copyright © 2019 panduola. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define TreeClassItemCell_Height 90.f

@interface TreeClassItemCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *logoImgView;
@property (nonatomic, strong) UILabel *nameLabel;

+(NSString *) cellIdentifier;

@end

NS_ASSUME_NONNULL_END
