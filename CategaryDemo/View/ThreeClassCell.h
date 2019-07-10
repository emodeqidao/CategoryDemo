//
//  ThreeClassCell.h
//  MPMALL
//
//  Created by xixi_wen on 2019/7/4.
//  Copyright © 2019 panduola. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ReturnSelectItemBlock)(NSString *selectItemId);

NS_ASSUME_NONNULL_BEGIN

@interface ThreeClassCell : UICollectionViewCell

@property (nonatomic, copy) ReturnSelectItemBlock returnSelectItemBlock;

@property (nonatomic, strong) UIImageView *iconImgView;

+(NSString *) cellIdentifier;

-(CGFloat) getCollectionHeight:(NSMutableArray *)dataArray;
-(void) reloadData;

-(void) selectBlock:(ReturnSelectItemBlock)block;

@end

NS_ASSUME_NONNULL_END
