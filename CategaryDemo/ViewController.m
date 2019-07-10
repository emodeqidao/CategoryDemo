//
//  ViewController.m
//  CategaryDemo
//
//  Created by xixi_wen on 2019/7/10.
//  Copyright © 2019 xixi. All rights reserved.
//

#import "ViewController.h"
#import "LeftCell.h"
#import "ThreeTopBannerCell.h"
#import "ThreeClassCell.h"
#import "GoodsClassModel.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *leftDataArray;
@property (nonatomic, strong) NSMutableArray *rightDataArray;
@property (nonatomic, strong) GoodsClassModel *currentSelectModel;

@property (nonatomic, strong) ThreeClassCell *tempCell;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"分类";
    self.leftDataArray = [NSMutableArray array];
    self.rightDataArray = [NSMutableArray array];
    [self initView];
    
    [self getLeftData];
}

-(void) initView
{
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.collectionView];
}

-(UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = CGRectMake(0, 0, 90.f, kScreen_Height);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

#pragma mark
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.leftDataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeftCell *cell = [tableView dequeueReusableCellWithIdentifier:[LeftCell cellIdentifier]];
    if (!cell)
    {
        cell = [[LeftCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[LeftCell cellIdentifier]];
    }
    cell.titleLabel.text = [NSString stringWithFormat:@"%zd", indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return LeftCell_Height;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    GoodsClassModel *model = [self.leftDataArray objectAtIndex:indexPath.row];
    self.currentSelectModel = model;
    [self getGoodsClassWithPid:model.idField];
}


#pragma mark
-(UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(self.tableView.right, 0, kScreen_Width - self.tableView.width, self.tableView.height) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.alwaysBounceVertical=YES;
        
        [_collectionView registerClass:[ThreeTopBannerCell class] forCellWithReuseIdentifier:[ThreeTopBannerCell cellIdentifier]];
        [_collectionView registerClass:[ThreeClassCell class] forCellWithReuseIdentifier:[ThreeClassCell cellIdentifier]];
        [_collectionView registerClass:[UICollectionReusableView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FootView"];
    }
    return _collectionView;
}

#pragma mark
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    id model = [self.rightDataArray objectAtIndex:indexPath.section];
    if ([model isKindOfClass:[NSString class]])
    {
        ThreeTopBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[ThreeTopBannerCell cellIdentifier] forIndexPath:indexPath];
        [cell setData:self.currentSelectModel.showUrl];
        return cell;
    }
    else
    { //goodsclassmodel
        ThreeClassCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:[ThreeClassCell cellIdentifier] forIndexPath:indexPath];
        
        GoodsClassModel *model = [self.rightDataArray objectAtIndex:indexPath.section];
        [cell getCollectionHeight:(NSMutableArray *)model.childrenList];
        [cell reloadData];
        
        [cell selectBlock:^(NSString *selectItemId) {
            NSLog(@"pid : %@", self.currentSelectModel.idField);
            NSLog(@"选中id : %@", selectItemId);
        }];
        return cell;
    }
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.rightDataArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil;
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        UILabel *label = [headerView viewWithTag:666];
        if (!label)
        {
            UILabel *tLabel = [[UILabel alloc] init];
            tLabel.frame = CGRectMake(10, 20, headerView.width - 20.f, 17.f);
            tLabel.font = [UIFont systemFontOfSize:12.f];
            tLabel.textColor = [UIColor grayColor];
            tLabel.tag = 666;
            [headerView addSubview:tLabel];
            label = tLabel;
        }
        
        GoodsClassModel *rightModel = [self.rightDataArray objectAtIndex:indexPath.section];
        label.text = rightModel.name?:@"";
        
        reusableView = headerView;
    }
    else if ([kind isEqualToString:UICollectionElementKindSectionFooter])
    {
        // 底部视图
        UICollectionReusableView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FootView" forIndexPath:indexPath];
        
        reusableView = footView;
    }
    
    return reusableView;
}


- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return CGSizeZero;
    }
    else
    {
        CGSize size = CGSizeMake(self.collectionView.width, 40.f);
        return size;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if (section == self.rightDataArray.count)
    {
        CGSize size = CGSizeMake(CGRectGetWidth(self.collectionView.frame), 40.f);
        return size;
    }
    else
    {
        return CGSizeZero;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        //比例是 宽高 53:18
        CGFloat height = (self.collectionView.width - 20) * 18.f / 53.f;
        CGSize size = CGSizeMake(self.collectionView.width, height + ThreeTopBannerCell_addHeight);
        return size;
    }
    else
    {
        GoodsClassModel *model = [self.rightDataArray objectAtIndex:indexPath.section];
        CGSize size = CGSizeMake(self.collectionView.width, [self getCellHeight:(NSMutableArray *)model.childrenList]);
        return size;
    }
}

#pragma mark 初始化数据
-(int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}


-(void) getLeftData
{
    //MARK:这里可以调用接口去获取一级目录分类的数据
    for (int i = 0; i < 20; i++)
    {
        
        [self.leftDataArray addObject:[self createOneModel:i]];
    }
    
    [self.tableView reloadData];

    
    if (self.leftDataArray.count > 0)
    {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
            if ([self.tableView.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)])
            {
                [self.tableView.delegate tableView:self.tableView didSelectRowAtIndexPath:indexPath];
            }
        });
    }
}

//MARK:根据一级目录的id 获取二三级的分类数据
-(void) getGoodsClassWithPid:(NSString *)pId
{
    [self.rightDataArray removeAllObjects];
    
    [self.rightDataArray addObject:@"banner"];
    
    for (int i = 0; i < 10; i++)
    {
        [self.rightDataArray addObject:[self createTwoModel:i]];
    }
    [self.collectionView reloadData];
    if (self.rightDataArray.count > 0)
    {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionTop animated:NO];
    }
}

-(GoodsClassModel *) createOneModel:(int)iflag
{
    GoodsClassModel *model = [[GoodsClassModel alloc] init];
    model.idField = [NSString stringWithFormat:@"%d", iflag];
    model.pid = @"0";
    model.name = [NSString stringWithFormat:@"一级目录 %d", iflag];
    return model;
}

-(GoodsClassModel *) createTwoModel:(int)iFlag
{
    GoodsClassModel *model = [[GoodsClassModel alloc] init];
    model.idField = [NSString stringWithFormat:@"%d", iFlag];
    model.pid = [NSString stringWithFormat:@"%d", iFlag];
    model.name = [NSString stringWithFormat:@"随机-%d", iFlag];
    model.childrenList = @[];
    NSMutableArray *arr = [NSMutableArray array];
    int end = [self getRandomNumber:3 to:9];
    for (int i = 0; i < end; i++)
    {
        [arr addObject:[self createThreeModel:i]];
    }
    model.childrenList = arr;
    return model;
}

-(GoodsClassModel *) createThreeModel:(int)iflag
{
    GoodsClassModel *model = [[GoodsClassModel alloc] init];
    model.idField = [NSString stringWithFormat:@"%d", iflag];
    model.pid = [NSString stringWithFormat:@"%d", iflag];
    model.name = [NSString stringWithFormat:@"三级目录 %d", iflag];
    return model;
}

#pragma mark 预算高度
-(CGFloat) getCellHeight:(NSMutableArray *)dataArray
{
    //获取cell 的高度
    return [self.tempCell getCollectionHeight:dataArray];
}

-(ThreeClassCell *)tempCell
{
    if (!_tempCell)
    {
        _tempCell = [[ThreeClassCell alloc] initWithFrame:CGRectMake(0, 0, self.collectionView.width, 1000)];
    }
    return _tempCell;
}

@end
