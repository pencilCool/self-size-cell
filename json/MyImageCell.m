//
//  MyImageCell.m
//  json
//
//  Created by tangyuhua on 2017/2/22.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "MyImageCell.h"
#import <Masonry.h>
#import <YYKit/UIView+YYAdd.h>
#import <YYKit/UIImageView+YYWebImage.h>
@interface MyImageCell ()
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UILabel *introLabel;
@property (nonatomic ,strong) UIImageView *myImageView;
@end

@implementation MyImageCell


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
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.titleLabel setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisVertical];
    [self.contentView addSubview:self.titleLabel];
    
    self.introLabel = [UILabel new];
    self.introLabel.numberOfLines  = 2;
    [self.introLabel sizeToFit];
    self.introLabel.textColor = [UIColor greenColor];
    self.introLabel.font = [UIFont systemFontOfSize:17.0];
    self.introLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.introLabel setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisVertical];
    [self.contentView addSubview:self.introLabel];
    
    
    self.myImageView = [UIImageView new];
    self.myImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.myImageView.translatesAutoresizingMaskIntoConstraints  = NO;
    [self.contentView addSubview:self.myImageView];
    
    
    
}

- (void)configureConstraint {
    
    [self.myImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right);
        make.width.mas_equalTo(@(self.contentView.width * 0.3));
        make.centerY.equalTo(self.contentView);
        make.top.equalTo(self.contentView.mas_top).with.priorityLow();
        make.bottom.equalTo(self.contentView.mas_bottom).with.priorityLow();

    }];
    
    
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.myImageView.mas_left);
        make.bottom.equalTo(self.introLabel.mas_top);
        
    }];
    
    [self.introLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.myImageView.mas_left);
        make.bottom.equalTo(self.contentView.mas_bottom);
        
    }];
}

- (void)setModel:(MyData *)model {
    
    self.titleLabel.text = model.title;
    self.introLabel.text = model.intro;
    
    [self.myImageView setImageWithURL:[NSURL URLWithString:model.images[0]] placeholder:nil options:YYWebImageOptionProgressive completion:^(UIImage * _Nullable image,
                                                                                                                                             NSURL *url,
                                                                                                                                             YYWebImageFromType from,
                                                                                                                                             YYWebImageStage stage,
                                                                                                                                             NSError * _Nullable error){
        
        
        
    }];
    
}



@end
