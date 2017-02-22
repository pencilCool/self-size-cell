//
//  MyData.m
//  json
//
//  Created by tangyuhua on 2017/2/22.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "MyData.h"

@implementation MyData

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"name" : @"n",
             @"page" : @"p",
             @"desc" : @"ext.desc",
             @"idField" : @"id"};
}

+ (NSArray *)modelPropertyWhitelist {
    return @[@"title",@"intro",@"images",@"idField"];
}

@end
