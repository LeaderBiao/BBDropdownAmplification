//
//  ViewController.m
//  BBDropdownAmplification
//
//  Created by BiaoGe on 2016/11/26.
//  Copyright © 2016年 BiaoGe. All rights reserved.
//

#import "ViewController.h"

#define  NavigationBarHight 64.0f
#define  ImageHight 200.0f


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
/** 底层背景图*/
@property (nonatomic,strong)UIImageView *zoomImageView;
/** 图像*/
@property (nonatomic,strong)UIImageView *circleView;
/** 昵称*/
@property (nonatomic,strong)UILabel *label;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"下拉放大";
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.contentInset = UIEdgeInsetsMake(ImageHight, 0, 0, 0);
    [self.view addSubview:self.tableView];
    
    self.zoomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"0"]];
    self.zoomImageView.frame  = CGRectMake(0, -ImageHight, self.view.frame.size.width, ImageHight);
    //设置不会被纵向拉伸
    self.zoomImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.zoomImageView.clipsToBounds = YES;
    [self.tableView addSubview:self.zoomImageView];
    
    //设置autoresizesSubviews让子类自动布局
    self.zoomImageView.autoresizesSubviews = YES;
    
    self.circleView = [[UIImageView alloc]initWithFrame:CGRectMake(10, ImageHight - 50, 40, 40)];
    self.circleView.layer.cornerRadius = 7.5f;
    self.circleView.clipsToBounds = YES;
    self.circleView.image = [UIImage imageNamed:@"0"];
    //自动布局,自适应顶部
    self.circleView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [_zoomImageView addSubview:_circleView];
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(60, ImageHight - 40, 280, 20)];
    self.label.textColor = [UIColor blackColor];
    self.label.text = @"Biao";
    //自动布局,自适应顶部
    self.label.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [_zoomImageView addSubview:self.label];
    //解决tableView在导航栏遮盖的时候还会透明显示问题
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //根据实际选择 加不加上NavigationBarHigth(44,64 或者没有导航条)
    CGFloat y = scrollView.contentOffset.y;
    if(y < - ImageHight)
    {
        CGRect frame = self.zoomImageView.frame;
        frame.origin.y = y;
        frame.size.height = -y;
        self.zoomImageView.frame = frame;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.separatorInset = UIEdgeInsetsZero;
        cell.clipsToBounds = YES;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Biao - %ld",indexPath.row];
    return cell;
}


@end
