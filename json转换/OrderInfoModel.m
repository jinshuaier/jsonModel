//
//  OrderInfoModel.m
//  json转换
//
//  Created by 张艳江 on 2017/11/2.
//  Copyright © 2017年 jinshuaier. All rights reserved.
//

#import "OrderInfoModel.h"

@implementation OrderInfoModel

+ (id)orderInfoWithDictionary:(NSDictionary *)dictInfo {
    
    return [[self alloc] initWithOrderInfoDictionary:dictInfo];
}

- (id)initWithOrderInfoDictionary:(NSDictionary *)dictInfo {
    
    if (self = [super init]) {
        
        self.orderCompleteTime = dictInfo[@"completeTime"];
        self.orderCreateTime   = dictInfo[@"createTime"];
        self.orderDeliverType  = dictInfo[@"deliverType"];
        self.orderDiscount     = dictInfo[@"discount"];
        self.orderID           = dictInfo[@"id"];
        self.orderMID          = dictInfo[@"mid"];
        self.orderOrderSN      = dictInfo[@"ordersn"];
        self.orderPrice        = dictInfo[@"price"];
        self.orderQCode        = dictInfo[@"qrcode"];
        self.orderRemark       = dictInfo[@"remark"];
        self.orderStatus       = dictInfo[@"status"];
        self.orderTill         = dictInfo[@"till"];
        self.orderType         = dictInfo[@"type"];
        
        self.address = dictInfo[@"address"][@"address"];
        self.name    = dictInfo[@"address"][@"name"];
        self.mobile  = dictInfo[@"address"][@"mobile"];
        
        self.isOpen = NO;
    }
    return self;
}


@end
