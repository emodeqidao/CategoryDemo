//
//  ThreeTopBannerCell.m
//  MPMALL
//
//  Created by xixi_wen on 2019/7/4.
//  Copyright © 2019 panduola. All rights reserved.
//

#import "ThreeTopBannerCell.h"

@interface ThreeTopBannerCell()
@property (nonatomic, strong) UIImageView *imgView;
@end

@implementation ThreeTopBannerCell

+(NSString *) cellIdentifier
{
    return @"ThreeTopBannerCell_Cell_Identifier";
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.imgView = [[UIImageView alloc] init];
        self.imgView.frame = CGRectMake(10, ThreeTopBannerCell_addHeight, frame.size.width - 20, frame.size.height - ThreeTopBannerCell_addHeight);
        self.imgView.contentMode = UIViewContentModeScaleAspectFill;
        self.imgView.backgroundColor = [UIColor orangeColor];
        self.imgView.clipsToBounds = YES;
        [self.contentView addSubview:self.imgView];
    }
    return self;
}

-(void) setData:(id)data
{
    NSString *urlStr = data;
//    [self.imgView setSmallImageWithURL:urlStr];
    self.imgView.image = [UIImage imageNamed:@"banner"];
}

@end
