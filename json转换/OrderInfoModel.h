//
//  OrderInfoModel.h
//  json转换
//
//  Created by 张艳江 on 2017/11/2.
//  Copyright © 2017年 jinshuaier. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderInfoModel : NSObject

@property (nonatomic, copy) NSString *orderCompleteTime;
@property (nonatomic, copy) NSString *orderCreateTime;
@property (nonatomic, copy) NSString *orderDeliverType;
@property (nonatomic, copy) NSString *orderDiscount;
@property (nonatomic, copy) NSString *orderID;
@property (nonatomic, copy) NSString *orderMID;
@property (nonatomic, copy) NSString *orderOrderSN;
@property (nonatomic, copy) NSString *orderPrice;
@property (nonatomic, copy) NSString *orderQCode;
@property (nonatomic, copy) NSString *orderRemark;
@property (nonatomic, copy) NSString *orderStatus;
@property (nonatomic, copy) NSString *orderTill;
@property (nonatomic, copy) NSString *orderType;

@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *mobile;

@property (nonatomic, assign) BOOL isOpen;


+ (id)orderInfoWithDictionary:(NSDictionary *)dictInfo;


@end
