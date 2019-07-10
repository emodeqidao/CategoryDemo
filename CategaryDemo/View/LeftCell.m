//
//  LeftCell.m
//  MPMALL
//
//  Created by xixi_wen on 2019/7/4.
//  Copyright © 2019 panduola. All rights reserved.
//

#import "LeftCell.h"
#import "GoodsClassModel.h"

@interface LeftCell()
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *flagView;
@end

@implementation LeftCell

+(NSString *) cellIdentifier
{
    return @"LeftCell_Cell_Identifier";
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.bgView = [[UIView alloc] init];
        self.bgView.frame = CGRectMake(0, 0, LeftCell_Width, LeftCell_Height);
        self.bgView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.bgView];
        
        self.logoImgView = [[UIImageView alloc] init];
        self.logoImgView.size = CGSizeMake(40.f, 40.f);
        self.logoImgView.top = 14.f;
        self.logoImgView.left = (LeftCell_Width - self.logoImgView.width) * 0.5;
        self.logoImgView.contentMode = UIViewContentModeScaleAspectFill;
        self.logoImgView.clipsToBounds = YES;
        self.logoImgView.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:self.logoImgView];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.frame = CGRectMake(5, self.logoImgView.bottom + 5.f, LeftCell_Width - 10.f, 17.f);
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont systemFontOfSize:12.f];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.titleLabel];
        
        self.flagView = [[UIView alloc] init];
        self.flagView.frame = CGRectMake(0, 0, 3, LeftCell_Height);
        self.flagView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.flagView];
    }
    return self;
}

-(void) setData:(id)data
{
    GoodsClassModel *model = data;
//    [self.logoImgView setSmallImageWithURL:model.iconUrl];
    self.titleLabel.text = model.name?:@"";
}

#pragma mark
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if (selected)
    {
        self.bgView.backgroundColor = [UIColor whiteColor];
        self.flagView.backgroundColor = [UIColor redColor];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:12.f];
        self.logoImgView.backgroundColor = [UIColor orangeColor];
    }
    else
    {
        self.bgView.backgroundColor = [UIColor grayColor];
        self.flagView.backgroundColor = [UIColor grayColor];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont systemFontOfSize:12.f];
    }
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    if (highlighted)
    {
        self.bgView.backgroundColor = [UIColor whiteColor];
        self.flagView.backgroundColor = [UIColor redColor];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:12.f];
        self.logoImgView.backgroundColor = [UIColor orangeColor];
    }
    else
    {
        self.bgView.backgroundColor = [UIColor grayColor];
        self.flagView.backgroundColor = [UIColor grayColor];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont systemFontOfSize:12.f];
    }
}

@end
