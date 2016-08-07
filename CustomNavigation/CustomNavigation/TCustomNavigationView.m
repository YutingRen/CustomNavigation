

#import "TCustomNavigationView.h"
#import "Masonry.h"


#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREEN_SCALE_WIDTH SCREEN_WIDTH / 320.0
#define PX_24          [UIFont systemFontOfSize:12 * SCREEN_SCALE_WIDTH]
#define PX_26          [UIFont systemFontOfSize:13 * SCREEN_SCALE_WIDTH]

@interface TCustomNavigationView ()

@property(nonatomic,strong)UIImageView *ahlpaView;
@property(nonatomic,strong)UILabel *tripLabel;


@end

@implementation TCustomNavigationView

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutCuetomViewWithFrame:frame title:title];
        
    }
    
    return self;
}

- (void)layoutCuetomViewWithFrame:(CGRect)frame title:(NSString *)title{
    
    self.backgroundColor = [UIColor clearColor];
    self.ahlpaView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
    self.ahlpaView.image = [UIImage imageNamed:@"dingbutiao-.png"];
    self.ahlpaView.alpha = 0;
    [self addSubview:self.ahlpaView];
    self.customNavigationView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"圆角矩形-1.png"]];
    [self addSubview:self.customNavigationView];
    self.customNavigationView.userInteractionEnabled = YES;
    [self.customNavigationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
        make.height.equalTo([NSNumber numberWithDouble: 23 * SCREEN_SCALE_WIDTH]);
//        make.left.equalTo(self).with.offset( 51 * SCREEN_SCALE_WIDTH);
    }];
    UIView *tripView = [UIView new];
    [self.customNavigationView addSubview:tripView];
    [tripView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.customNavigationView);
        make.width.mas_lessThanOrEqualTo(self.customNavigationView).with.offset(-30);
        make.height.equalTo(self.customNavigationView);
        
    }];
    
    UIButton *tripButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [tripView addSubview:tripButton];
    self.tripLabel = [UILabel new];
    [tripView addSubview:self.tripLabel];
    
    [tripButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(tripView.mas_right);
        make.left.equalTo(self.tripLabel.mas_right).with.offset( 6 );
        make.centerY.equalTo(tripView);
    }];
    
    [tripButton setBackgroundImage:[UIImage imageNamed:@"homepage_矩形-10-副本.png"] forState:UIControlStateNormal];
    
    [self.tripLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tripView.mas_left);
        make.right.equalTo(tripButton.mas_left).with.offset( -6 );
        make.centerY.equalTo(tripView);
        make.width.mas_lessThanOrEqualTo(tripView).with.offset( -15 );
    }];
    [self.tripLabel setText:title];
    self.tripLabel.font = PX_26;
    self.tripLabel.textColor = [UIColor whiteColor];
    
}

- (void)setNaviTitle:(NSString *)title {
    self.tripLabel.text = title;
}


- (void)navigationViewAhlpa:(CGFloat)ahlpa {
    self.ahlpaView.alpha = ahlpa;
}

@end
