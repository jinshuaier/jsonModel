//
//  TCListCell.h
//  顺道嘉商家版
//
//  Created by 胡高广 on 2017/11/1.
//  Copyright © 2017年 北京同创共享网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderInfoModel.h"

@interface TCListCell : UITableViewCell

@property (nonatomic, strong) OrderInfoModel *model;

@property (nonatomic, strong) UIView      *backView; //背景颜色
@property (nonatomic, strong) UIView      *stateView; // 横条的view
@property (nonatomic, strong) UIImageView *stateImage; //状态的View
@property (nonatomic, strong) UILabel     *titleLabel; //标题的文字
@property (nonatomic, strong) UILabel     *timeLabel; //活动的天数
@property (nonatomic, strong) UIButton    *changeBtn; //修改活动的按钮
@property (nonatomic, strong) UIButton    *phoneButton; //电话
@property (nonatomic, strong) UIView      *lineView; // 横线


@property (nonatomic, strong) UILabel *stateLabel; //状态的文字
@property (nonatomic, strong) UILabel *ordelLabel; //订单状态
@property (nonatomic, strong) UILabel *addressLabel; //收货地址
@property (nonatomic, strong) UILabel *priceLabel; //价格
@property (nonatomic, strong) UILabel *nameLabel; //姓名
@property (nonatomic, strong) UILabel *deliveryLabel; //送达时间
@property (nonatomic, strong) UILabel *ordelTimeLabel; //订单时间


@end
