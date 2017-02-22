//
//  MyCell.m
//  json
//
//  Created by tangyuhua on 2017/2/22.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "MyCell.h"
#import <Masonry.h>
@interface MyCell ()
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UILabel *introLabel;
@end

@implementation MyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configSubView];
        [self configureConstraint];
          }
    return self;
}


- (void)configSubView
{
    self.titleLabel = [UILabel new];
    self.titleLabel.numberOfLines  = 2;
    [self.titleLabel sizeToFit];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:self.titleLabel];
    
    self.introLabel = [UILabel new];
    self.introLabel.numberOfLines  = 2;
    [self.introLabel sizeToFit];
    self.introLabel.textColor = [UIColor greenColor];
    self.introLabel.font = [UIFont systemFontOfSize:17.0];
    [self.contentView addSubview:self.introLabel];
    
    
}

- (void)configureConstraint {
    
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        
    }];
    
    [self.introLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.bottom.equalTo(self.contentView.mas_bottom);
        
    }];
}

- (void)setModel:(MyData *)model {
    self.titleLabel.text = model.title;
    self.introLabel.text = model.intro;
}


@end
