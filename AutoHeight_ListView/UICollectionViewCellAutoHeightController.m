//
//  UICollectionViewCellAutoHeightController.m
//  AutoHeight_ListView
//
//  Created by Rainer on 2018/4/8.
//  Copyright © 2018年 Rainer. All rights reserved.
//

#import "UICollectionViewCellAutoHeightController.h"
#import "AutoHeightCollectionViewCell.h"

@interface UICollectionViewCellAutoHeightController () <UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation UICollectionViewCellAutoHeightController

static NSString * const autoHeightCollectionViewCellReuseIdentifier = @"AutoHeightCollectionViewCellReuseIdentifierId";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
    
    // 注册表格行
    [self.collectionView registerClass:[AutoHeightCollectionViewCell class] forCellWithReuseIdentifier:autoHeightCollectionViewCellReuseIdentifier];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AutoHeightCollectionViewCell *autoHeightCollectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:autoHeightCollectionViewCellReuseIdentifier forIndexPath:indexPath];
    
    autoHeightCollectionViewCell.backgroundColor = [UIColor whiteColor];
    autoHeightCollectionViewCell.contentTitle = self.dataArray[indexPath.row];
    
    return autoHeightCollectionViewCell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (UICollectionView *)collectionView {
    if (nil == _collectionView) {
        UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        // 预估表格大小：宽度、高度
        collectionViewFlowLayout.estimatedItemSize = CGSizeMake(self.view.frame.size.width, 200);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:collectionViewFlowLayout];
        
        _collectionView.backgroundColor = [UIColor grayColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    
    return _collectionView;
}

- (NSArray *)dataArray {
    if (nil == _dataArray) {
        _dataArray = [NSArray array];
        
        _dataArray = @[@"在iOS开发中势必会用到一些第三方依赖库，比如大家都熟悉的ASIHttpRequest、AFNetworking、JSONKit等。使用这些第三方类库能极大的方便项目的开发，但是，集成这些依赖库需要我们手动去配置，例如集成ASIHttpRequest库时除了加入源码以外还需要手动去添加一些系统的framework，CFNetwork、MobileCoreServices等，如果这些第三方库发生了更新，还需要手动去更新项目。这就显得非常麻烦。有麻烦自然有解决办法，CocoaPods就是为了解决这个问题而生的。通过CocoaPods，我们可以将第三方的依赖库统一管理起来，配置和更新只需要通过简单的几行命令即可完成，大大的提高了实际开发中的工作效率，使我们的主要精力集中到更重要的事情上去。", @"Mac打开终端，移除原有镜像：$ gem sources -r https://rubygems.org/", @"安装CocoaPods，需要Ruby版本在 2.2.2 以上，这里使用RVM对Ruby进行升级：", @"RVM (Ruby Version Manager)，即Ruby版本管理器，包括Ruby的版本管理和Gem库管理。按照下面的命令安装 RVM，需等待一段时间，务必保持网络稳定：$ curl -L get.rvm.io | bash -s stable $ source ~/.bashrc $ source ~/.bash_profile 若提示-bash: /Users/Xiao/.bash_profile: No such file or directory找不到 .bash_profile 文件，直接在根目录创建一个即可： $ cd ~ $ touch .bash_profile 安装成功后，可查看rvm版本：$ rvm -v", @"用RVM升级Ruby"];
    }
    
    return _dataArray;
}

@end
