//
//  LeftCell.h
//  MPMALL
//
//  Created by xixi_wen on 2019/7/4.
//  Copyright © 2019 panduola. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define LeftCell_Height 90.f
#define LeftCell_Width 90.f

@interface LeftCell : UITableViewCell

@property (nonatomic, strong) UIImageView *logoImgView;
@property (nonatomic, strong) UILabel *titleLabel;

+(NSString *) cellIdentifier;
-(void) setData:(id)data;
@end

NS_ASSUME_NONNULL_END
