//
//  AutoHeightTableViewCell.m
//  AutoHeight_ListView
//
//  Created by Rainer on 2018/4/8.
//  Copyright © 2018年 Rainer. All rights reserved.
//

#import "AutoHeightTableViewCell.h"
#import <Masonry.h>

@interface AutoHeightTableViewCell ()

@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIImageView *contentImageView;

@end

@implementation AutoHeightTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupContentSubviews];
    }
    
    return self;
}

- (instancetype)initAutoHeightTableViewCellWithTableView:(UITableView *)tableView {
    static NSString *autoHeightTableViewCellIdentifierId = @"AutoHeightTableViewCellIdentifierId";
    
    AutoHeightTableViewCell *autoHeightTableViewCell = [tableView dequeueReusableCellWithIdentifier:autoHeightTableViewCellIdentifierId];
    
    if (nil == autoHeightTableViewCell) {
        autoHeightTableViewCell = [[AutoHeightTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:autoHeightTableViewCellIdentifierId];
    }
    
    return autoHeightTableViewCell;
}

+ (instancetype)autoHeightTableViewCellWithTableView:(UITableView *)tableView {
    return [[self alloc] initAutoHeightTableViewCellWithTableView:(UITableView *)tableView];
}

- (void)setupContentSubviews {
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.contentImageView];
}

- (void)setContentTitle:(NSString *)contentTitle {
    _contentTitle = contentTitle;
    
    self.contentLabel.text = contentTitle;
    
    [self setNeedsUpdateConstraints];
    
    [self updateConstraintsIfNeeded];
}

- (void)updateConstraints {
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(15);
        make.right.offset(-15);
        make.bottom.equalTo(self.contentImageView.mas_top).offset(-15);
    }];
    
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.height.mas_equalTo(200);
        make.right.offset(-15);
        make.bottom.offset(-15);
    }];
    
    [super updateConstraints];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

- (UILabel *)contentLabel {
    if (nil == _contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        
        _contentLabel.font = [UIFont boldSystemFontOfSize:18.0];
        _contentLabel.numberOfLines = 0;
    }
    
    return _contentLabel;
}

- (UIImageView *)contentImageView {
    if (nil == _contentImageView) {
        _contentImageView = [[UIImageView alloc] init];
        
        _contentImageView.backgroundColor = [UIColor orangeColor];
    }
    
    return _contentImageView;
}

@end
