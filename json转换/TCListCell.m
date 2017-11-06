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
    [self.phoneButton setImage:[UIImage imageNamed:@"电话图标"] forState:(UIControlStateNormal)];
    [self.phoneButton addTarget:self action:@selector(phoneBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.nameLabel = [UILabel publicLab:nil textColor:TCUIColorFromRGB(0x525F66) textAlignment:NSTextAlignmentRight size:13 numberOfLines:0];
    
    self.priceLabel = [UILabel publicLab:nil textColor:TCUIColorFromRGB(0xFF5500) textAlignment:NSTextAlignmentLeft size:16 numberOfLines:0];
    
    self.lineView = [UIView new];
    self.lineView.backgroundColor = TCUIColorFromRGB(0xEDEDED);
    
    self.deliveryLabel = [UILabel publicLab:nil textColor:TCUIColorFromRGB(0x656565) textAlignment:NSTextAlignmentLeft size:12 numberOfLines:0];
    
    self.ordelTimeLabel = [UILabel publicLab:nil textColor:TCUIColorFromRGB(0x656565) textAlignment:NSTextAlignmentRight size:12 numberOfLines:0];
    
    [self.contentView sd_addSubviews:@[self.backView, self.stateView, self.stateLabel, self.ordelLabel, self.addressLabel, self.phoneButton, self.nameLabel, self.priceLabel, self.lineView, self.deliveryLabel, self.ordelTimeLabel]];
    
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
    .topSpaceToView(self.lineView, 0)
    .leftEqualToView(self.lineView)
    .widthIs((WIDHT - 20)/2 - 8)
    .heightIs(22 + 18);
    
    self.ordelTimeLabel.sd_layout
    .topEqualToView(self.deliveryLabel)
    .rightEqualToView(self.ordelLabel)
    .widthIs((WIDHT - 20)/2 - 8)
    .heightIs(22 + 18);
    
    // 这句话比较重要
    [self setupAutoHeightWithBottomView:self.deliveryLabel bottomMargin:0];
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
}
#pragma mark -- 打电话
- (void)phoneBtn:(UIButton *)sender
{
    
}


@end
