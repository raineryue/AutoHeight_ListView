//
//  AutoHeightCollectionViewCell.m
//  AutoHeight_ListView
//
//  Created by Rainer on 2018/4/8.
//  Copyright © 2018年 Rainer. All rights reserved.
//

#import "AutoHeightCollectionViewCell.h"
#import <Masonry.h>

@interface AutoHeightCollectionViewCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation AutoHeightCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupContentSubviews];
    }
    
    return self;
}

- (void)setupContentSubviews {
    [self.contentView addSubview:self.imageView];
    
    [self.contentView addSubview:self.titleLabel];
}

- (void)setContentTitle:(NSString *)contentTitle {
    _contentTitle = contentTitle;
    
    self.titleLabel.text = contentTitle;
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)updateConstraints {
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(15);
        make.left.offset(15);
        make.height.offset(200);
        make.right.offset(-15);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).offset(15);
        make.left.offset(15);
        make.bottom.offset(-15);
        make.right.offset(-15);
    }];
    
    [super updateConstraints];
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGSize size = [self.contentView systemLayoutSizeFittingSize:layoutAttributes.size];
    
    CGRect frame = layoutAttributes.frame;
    
    frame.size.height = size.height;
    layoutAttributes.frame = frame;
    
    return layoutAttributes;
}

- (UIImageView *)imageView {
    if (nil == _imageView) {
        _imageView = [[UIImageView alloc] init];
        
        _imageView.backgroundColor = [UIColor greenColor];
    }
    
    return _imageView;
}

- (UILabel *)titleLabel {
    if (nil == _titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        
        _titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
        _titleLabel.numberOfLines = 0;
    }
    
    return _titleLabel;
}

@end
