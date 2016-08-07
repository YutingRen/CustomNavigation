//
//  TCustomNavigationView.h
//  HighLieChe
//
//  Created by timmy on 16/5/6.
//  Copyright © 2016年 timmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCustomNavigationView : UIView

@property(nonatomic,strong)UIImageView *customNavigationView;

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title;

- (void)navigationViewAhlpa:(CGFloat)ahlpa;

- (void)setNaviTitle:(NSString *)title;

@end
