//
//  ViewController.m
//  CustomNavigation
//
//  Created by 任雨婷 on 16/5/20.
//  Copyright © 2016年 任雨婷. All rights reserved.
//

#import "ViewController.h"
#import "TCustomNavigationView.h"
#import "Masonry.h"

#define BACKGROUND_COLOR   [UIColor colorWithRed:239.0 / 255.0 green:239.0 / 255.0 blue:244.0 / 255.0 alpha:1]
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<UIScrollViewDelegate>



@property(nonatomic,strong)UIScrollView *pageScrollView;//整体scrollView
@property(nonatomic,strong)UIView *contentView;//scrollView上面覆盖的整体view
@property(nonatomic,strong)TCustomNavigationView *customNavigationView;
@property(nonatomic,assign)CGRect naBarFrame;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {

    self.navigationController.navigationBarHidden = YES;


}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.pageScrollView = [UIScrollView new];
    [self.view addSubview:self.pageScrollView];
    [self.pageScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    self.pageScrollView.delegate = self;
    [self.view addSubview:self.pageScrollView];
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.contentView = [UIView new];
    [self.pageScrollView addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pageScrollView);
        make.left.equalTo(self.pageScrollView);
        make.width.equalTo(self.pageScrollView);
        make.bottom.equalTo(self.pageScrollView);
        make.height.equalTo([NSNumber numberWithInteger:1000]);
    }];
    self.contentView.backgroundColor = BACKGROUND_COLOR;
    UIView *titleView = [UIView new];    //标题view
    [self.contentView addSubview:titleView];
    [self setCustomNavigationView];
}

#pragma mark 导航栏调整
//滑动控制透明度 + title pageControll 控制
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView == self.pageScrollView) {
        
        CGFloat yValue = self.pageScrollView.contentOffset.y;
        if (yValue <= 200.0) {
            
            [self.customNavigationView navigationViewAhlpa:yValue / 200.0];
        }else{
            [self.customNavigationView navigationViewAhlpa:1];
        }
    }else {
        return;
    }
}



- (void)setCustomNavigationView {
    
    self.customNavigationView = [[TCustomNavigationView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 44) title:@"这个是title"];
    [self.view insertSubview:self.customNavigationView aboveSubview:self.pageScrollView];
    [self setCustomNavigationView:self.customNavigationView];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
