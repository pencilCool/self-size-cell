//
//  MyImageCell.h
//  json
//
//  Created by tangyuhua on 2017/2/22.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SWTableViewCell/SWTableViewCell.h>
#import "MyData.h"

@interface MyImageCell : SWTableViewCell
@property (nonatomic, strong) MyData *model;
@end
