//
//  TreeClassItemCell.m
//  MPMALL
//
//  Created by xixi_wen on 2019/7/5.
//  Copyright © 2019 panduola. All rights reserved.
//

#import "TreeClassItemCell.h"

@implementation TreeClassItemCell

+(NSString *) cellIdentifier
{
    return @"TreeClassItemCell_Cell_Identifier";
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        CGFloat imageWidth = 68.f;
        if (frame.size.width < imageWidth)
        {
            imageWidth = frame.size.width;
        }
        self.logoImgView = [[UIImageView alloc] init];
        self.logoImgView.size = CGSizeMake(imageWidth, imageWidth);
        self.logoImgView.top = 0;
        self.logoImgView.left = (frame.size.width - imageWidth) / 2.f;
        self.logoImgView.contentMode = UIViewContentModeScaleAspectFill;
        self.logoImgView.clipsToBounds = YES;
        self.logoImgView.backgroundColor = XF_randomColor;
        [self.contentView addSubview:self.logoImgView];
        
        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.frame = CGRectMake(0, self.logoImgView.bottom + 5.f, frame.size.width, 17.f);
        self.nameLabel.textAlignment= NSTextAlignmentCenter;
        self.nameLabel.font = [UIFont systemFontOfSize:12.f];
        self.nameLabel.textColor = [UIColor blueColor];
        [self.contentView addSubview:self.nameLabel];
        
        self.nameLabel.text = @"口红";
    }
    return self;
}

-(void) setData:(id)data
{
    
}

@end
