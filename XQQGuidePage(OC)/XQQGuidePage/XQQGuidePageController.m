//
//  XQQGuidePageController.m
//  XQQGuidePage
//
//  Created by XQQ on 16/8/16.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQGuidePageController.h"
#import "AppDelegate.h"

#define iphoneWidth  [UIScreen mainScreen].bounds.size.width
#define iphoneHeight [UIScreen mainScreen].bounds.size.height

#define PHOTOCOUNT 6

@interface XQQGuidePageController ()<UIScrollViewDelegate>
/**
 *  滚动视图
 */
@property(nonatomic, strong)  UIScrollView * scrollView;
/**
 *  pageControl
 */
@property(nonatomic, strong)  UIPageControl  *  pageControl;
/**
 *  调过按钮
 */
@property(nonatomic, strong)  UIButton  *  skipBtn;
/**
 *  进入应用按钮
 */
@property(nonatomic, strong)  UIButton  *  enterBtn;
/**
 *  存储图片的数组
 */
@property(nonatomic, strong)  NSMutableArray  *  photoArr;

@end

@implementation XQQGuidePageController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    for (NSInteger i = 0; i < 7; i ++) {
        NSString * photoName = [NSString stringWithFormat:@"%ld.jpg",i];
        [self.photoArr addObject:photoName];
    }
    
    [self.view addSubview:self.scrollView];
    
    [self.view addSubview:self.skipBtn];
    
    [self.view addSubview:self.pageControl];
    
}


#pragma mark - actievty

- (void)BtnDidPress{
    AppDelegate * delegate = [UIApplication sharedApplication].delegate;
    [delegate enterMainVC];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x >= 6 * iphoneWidth) {
        //最后一页添加进入app按钮  也可以添加到最后一张的imageView上
        [self.view addSubview:self.enterBtn];
        [self.pageControl removeFromSuperview];
        [self.skipBtn removeFromSuperview];
    }else
    {
        [self.enterBtn removeFromSuperview];
        [self.view addSubview:self.pageControl];
        [self.view addSubview:self.skipBtn];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / iphoneWidth;
    self.pageControl.currentPage = index;
}

#pragma mark - setter&getter

- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.center = CGPointMake(iphoneWidth/2, iphoneHeight - 60);
        _pageControl.bounds = CGRectMake(0, 0, 150, 44);
        //设置页数
        _pageControl.numberOfPages = self.photoArr.count;
        _pageControl.userInteractionEnabled = NO;
        _pageControl.pageIndicatorTintColor = [UIColor orangeColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    }
    return _pageControl;
}


- (UIButton *)enterBtn
{
    if (!_enterBtn) {
        _enterBtn  = [[UIButton alloc]initWithFrame:CGRectMake(iphoneWidth/2-70, iphoneHeight - 10 - 44 - 20, 140, 44)];
        [_enterBtn setTitle:@"进入APP" forState:UIControlStateNormal];
        [_enterBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _enterBtn.backgroundColor = [UIColor colorWithRed:71/255.0 green:159/255.0 blue:219/255.0 alpha:0.8];
        [_enterBtn addTarget:self action:@selector(BtnDidPress) forControlEvents:UIControlEventTouchUpInside];
        _enterBtn.layer.cornerRadius = 14;
        _enterBtn.layer.masksToBounds = YES;
        _enterBtn.alpha = 0.8;
    }
    return _enterBtn;
}


- (UIButton *)skipBtn
{
    if (!_skipBtn) {
        _skipBtn = [[UIButton alloc]initWithFrame:CGRectMake(iphoneWidth - 90, 30, 80, 44)];
        [_skipBtn setTitle:@"跳过" forState:UIControlStateNormal];
        _skipBtn.backgroundColor = [UIColor colorWithRed:71/255.0 green:159/255.0 blue:219/255.0 alpha:0.8];
        [_skipBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_skipBtn addTarget:self action:@selector(BtnDidPress) forControlEvents:UIControlEventTouchUpInside];
        _skipBtn.layer.cornerRadius = 14;
        _skipBtn.layer.masksToBounds = YES;
        _skipBtn.alpha = 0.8;
    }
    return _skipBtn;
}


- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.scrollsToTop = NO;
        _scrollView.bounces = NO;
        _scrollView.contentOffset = CGPointZero;
        _scrollView.contentSize = CGSizeMake(iphoneWidth * self.photoArr.count, iphoneHeight);
        _scrollView.delegate = self;
        
        for (int i = 0; i < self.photoArr.count; i ++) {
            UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * iphoneWidth, 0, iphoneWidth, iphoneHeight)];
            imageView.image = [UIImage imageNamed:self.photoArr[i]];
            [_scrollView addSubview:imageView];
        }
        [self.view insertSubview:_scrollView atIndex:0];
    }
    return _scrollView;
}

- (NSMutableArray *)photoArr
{
    if (!_photoArr) {
        _photoArr = [[NSMutableArray alloc]initWithCapacity:PHOTOCOUNT];
    }
    return _photoArr;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
