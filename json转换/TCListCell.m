//
//  TCListCell.m
//  顺道嘉商家版
//
//  Created by 胡高广 on 2017/11/1.
//  Copyright © 2017年 北京同创共享网络科技有限公司. All rights reserved.
//

#import "TCListCell.h"


@implementation TCListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = ViewColor;
        [self createUI];
        [self setUIFrame];
    }
    return self;
}
//创建视图的view
-(void)createUI
{
    
    self.backView = [UIView new];
    self.backView.backgroundColor = [UIColor whiteColor];
    
    self.stateView = [UIView new];
    self.stateView.backgroundColor = TCUIColorFromRGB(0xE6E6E6);

    self.stateLabel = [UILabel publicLab:nil textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter size:14 numberOfLines:0];
    
    self.stateLabel.backgroundColor = TCUIColorFromRGB(0x0088CC);
    
    self.ordelLabel = [UILabel publicLab:nil textColor:TCUIColorFromRGB(0x5E5E5E) textAlignment:NSTextAlignmentRight size:14 numberOfLines:0];
    
    self.addressLabel = [UILabel publicLab:nil textColor:TCUIColorFromRGB(0x464646) textAlignment:NSTextAlignmentLeft size:16 numberOfLines:0];
    
    self.phoneButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.phoneButton setImage:[UIImage imageNamed:@"1"] forState:(UIControlStateNormal)];
    [self.phoneButton addTarget:self action:@selector(phoneBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.nameLabel = [UILabel publicLab:nil textColor:TCUIColorFromRGB(0x525F66) textAlignment:NSTextAlignmentRight size:13 numberOfLines:0];
    
    self.priceLabel = [UILabel publicLab:nil textColor:TCUIColorFromRGB(0xFF5500) textAlignment:NSTextAlignmentLeft size:16 numberOfLines:0];
    
    self.lineView = [UIView new];
    self.lineView.backgroundColor = TCUIColorFromRGB(0xEDEDED);
    
    self.deliveryLabel = [UILabel publicLab:nil textColor:TCUIColorFromRGB(0x656565) textAlignment:NSTextAlignmentLeft size:12 numberOfLines:0];
    
    self.ordelTimeLabel = [UILabel publicLab:nil textColor:TCUIColorFromRGB(0x656565) textAlignment:NSTextAlignmentRight size:12 numberOfLines:0];
    
    //活动的文字
    self.activeLabel = [UILabel publicLab:nil textColor:TCUIColorFromRGB(0xFF5500) textAlignment:NSTextAlignmentLeft size:12 numberOfLines:0];
    
    self.activeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.activeBtn setImage:[UIImage imageNamed:@"下标黑"] forState:(UIControlStateNormal)];
    
//    self.activeBtn.backgroundColor = [UIColor redColor];
    self.activeBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    [self.activeBtn setTitleColor:TCUIColorFromRGB(0x525F66) forState:(UIControlStateNormal)];
    
    self.activeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
  
    /******* 以下方法是让图片靠右，文字靠左 *******/
    CGFloat imageWidth = self.activeBtn.imageView.bounds.size.width;
    CGFloat labelWidth = self.activeBtn.titleLabel.bounds.size.width;
    self.activeBtn.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth, 0, -labelWidth - 113);
    self.activeBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth - 30, 0, imageWidth);
    [self.activeBtn addTarget:self action:@selector(unfold:) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.activeView = [[ActiveView alloc]init];
    //self.activeView.backgroundColor = [UIColor redColor];
    
    [self.contentView sd_addSubviews:@[self.backView, self.stateView, self.stateLabel, self.ordelLabel, self.addressLabel, self.phoneButton, self.nameLabel, self.priceLabel, self.lineView, self.deliveryLabel, self.ordelTimeLabel,self.activeLabel,self.activeBtn, self.activeView]];
}
- (void)setUIFrame{

    self.backView.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake(10, 10, 0, 10));
    
    self.stateView.sd_layout
    .topEqualToView(self.backView)
    .leftEqualToView(self.backView)
    .rightEqualToView(self.backView)
    .heightIs(36);
    
    self.stateLabel.sd_layout
    .topEqualToView(self.stateView)
    .leftEqualToView(self.stateView)
    .bottomEqualToView(self.stateView)
    .widthIs(73);
    
    self.ordelLabel.sd_layout
    .topEqualToView(self.stateView)
    .rightSpaceToView(self.contentView, 18)
    .bottomEqualToView(self.stateView)
    .widthIs(60);
    
    self.addressLabel.sd_layout
    .topSpaceToView(self.stateView, 16)
    .leftSpaceToView(self.contentView, 18)
    .rightSpaceToView(self.ordelLabel, 0)
    .autoHeightRatio(0);// 关键的一步，不设置高度
    
    self.phoneButton.sd_layout
    .topEqualToView(self.addressLabel)
    .rightEqualToView(self.ordelLabel)
    .widthIs(32)
    .heightIs(32);
    
    self.priceLabel.sd_layout
    .topSpaceToView(self.addressLabel, 8)
    .leftEqualToView(self.addressLabel)
    .widthIs((WIDHT - 20)/2)
    .heightIs(22);
    
    self.nameLabel.sd_layout
    .rightEqualToView(self.ordelLabel)
    .centerYEqualToView(self.priceLabel)
    .widthIs((WIDHT - 20)/2)
    .heightIs(22);
    
    self.lineView.sd_layout
    .topSpaceToView(self.priceLabel, 8)
    .leftSpaceToView(self.contentView, 18)
    .rightSpaceToView(self.contentView, 18)
    .heightIs(1);
    
    self.deliveryLabel.sd_layout
    .topEqualToView(self.lineView)
    .leftEqualToView(self.lineView)
    .widthIs((WIDHT - 20)/2 - 8)
    .heightIs(22 + 18);
//    self.deliveryLabel.backgroundColor = [UIColor redColor];
    
    self.ordelTimeLabel.sd_layout
    .topEqualToView(self.deliveryLabel)
    .rightEqualToView(self.ordelLabel)
    .widthIs((WIDHT - 20)/2 - 8)
    .heightIs(22 + 18);
    
    self.activeLabel.sd_layout
    .topSpaceToView(self.ordelTimeLabel, 10)
    .leftEqualToView(self.lineView)
    .widthIs((WIDHT - 20)/2 - 8)
    .heightIs(20)
    .autoHeightRatio(0);// 关键的一步，不设置高度
    
    self.activeBtn.sd_layout
    .topEqualToView(self.activeLabel)
    .rightSpaceToView(self.contentView , 20)
    .widthIs(80)
    .heightIs(20);
    
}
// 加载数据
- (void)setModel:(OrderInfoModel *)model{

    _model = model;
    self.addressLabel.text  = model.address;
    self.nameLabel.text     = model.name;
    self.deliveryLabel.text = [NSString stringWithFormat:@"%@点之前送达",model.orderTill];
    self.ordelTimeLabel.text = model.orderCreateTime;
    self.priceLabel.text = [NSString stringWithFormat:@"¥ %@",model.orderPrice];
    
    NSString *deliverType = [NSString stringWithFormat:@"%@",model.orderDeliverType];
    if ([deliverType isEqualToString:@"1"]) {
        self.stateLabel.text = @"速送订单";
        self.stateLabel.backgroundColor = TCUIColorFromRGB(0x0088CC);
    } else if ([deliverType isEqualToString:@"2"]) {
        self.stateLabel.text = @"自取订单";
        self.stateLabel.backgroundColor = TCUIColorFromRGB(0xCCCCCC);
    } else if ([deliverType isEqualToString:@"3"]) {
        self.stateLabel.text = @"预定订单";
        self.stateLabel.backgroundColor = TCUIColorFromRGB(0x00CCCC);
    } else if ([deliverType isEqualToString:@"4"]) {
        self.stateLabel.text = @"线下订单";
        self.stateLabel.backgroundColor = TCUIColorFromRGB(0xCCCCCC);
    }
    
    //订单状态
    NSString *status = [NSString stringWithFormat:@"%@",model.orderType];
    if ([status isEqualToString:@"1"]) {
        self.ordelLabel.text = @"新订单";
        
    } else if ([status isEqualToString:@"2"]) {
        self.ordelLabel.text = @"待配送";
        
    } else if ([status isEqualToString:@"3"]) {
        self.ordelLabel.text = @"配送中";
        
    } else if ([status isEqualToString:@"4"]) {
        self.ordelLabel.text = @"已送达";
        
    } else if ([status isEqualToString:@"5"]) {
        self.ordelLabel.text = @"已完成";
        
    } else if ([status isEqualToString:@"0"]) {
        self.ordelLabel.text = @"";
        
    } else if ([status isEqualToString:@"-1"]) {
        self.ordelLabel.text = @"";
        
    } else if ([status isEqualToString:@"-2"]) {
        self.ordelLabel.text = @"订单关闭";
        
    } else if ([status isEqualToString:@"-3"]) {
        self.ordelLabel.text = @"订单关闭";
        
    } else if ([status isEqualToString:@"-4"]) {
        self.ordelLabel.text = @"订单关闭";
    }
    
    self.activeLabel.text = @"新店活动,特大优惠,满100减20";
    
    NSArray *titles = @[@"新店活动,特大优惠,满100减20",@"超级豪华三人套餐",@"新用户下单立马减12元", @"精品爆款 超级折扣", @"进店领5元代金券"];
    
    self.count =  titles.count;
    
    [self.activeBtn setTitle:[NSString stringWithFormat:@"有%lu个活动",(unsigned long)titles.count] forState:(UIControlStateNormal)];
    
    if (model.isOpen == NO) {
        self.selectState = NO;
        
        if (titles.count == 1){
            self.activeView.sd_layout
            .topSpaceToView(self.activeBtn, 5)
            .leftEqualToView(self.deliveryLabel)
            .rightEqualToView(self.ordelTimeLabel)
            .heightIs(18);
        } else {
            self.activeView.sd_layout
            .topSpaceToView(self.activeBtn, 5)
            .leftEqualToView(self.deliveryLabel)
            .rightEqualToView(self.ordelTimeLabel)
            .heightIs(36);
        }
        [self.activeView initWithTitles:titles isOpen:NO];
        [self setupAutoHeightWithBottomView:self.activeView bottomMargin:10];
    }else{
        self.selectState = YES;
        self.activeView.sd_layout
        .topSpaceToView(self.activeBtn, titles.count)
        .leftEqualToView(self.deliveryLabel)
        .rightEqualToView(self.ordelTimeLabel)
        .heightIs(titles.count *18);
        [self.activeView initWithTitles:titles isOpen:YES];
        [self setupAutoHeightWithBottomView:self.activeView bottomMargin:10];
    }
}
#pragma mark -- 打电话
- (void)phoneBtn:(UIButton *)sender{
    //NSLog(@"我点击了手机号人头像");
}

#pragma mark -- 活动
- (void)unfold:(UIButton *)sender{
    
    if (self.selectState) {
        self.model.isOpen = NO;
        self.selectState = NO;
    }else{
        self.model.isOpen = YES;
        self.selectState = YES;
    }
    if ([self.delegate respondsToSelector:@selector(btnClick:)]) {
        [self.delegate btnClick:self];
    }
}

@end
