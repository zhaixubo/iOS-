//
//  MyTableViewCell.m
//  4.学生管理系统
//
//  Created by 翟旭博 on 2022/8/1.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.FirstLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _FirstLabel];
    
    self.SecondLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _SecondLabel];
    
    self.ThirdLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _ThirdLabel];
    
    return self;
}

- (void)layoutSubviews {
    _FirstLabel.frame = CGRectMake(15, 0, 100, 50);
    _FirstLabel.textAlignment = NSTextAlignmentCenter;
    _FirstLabel.font = [UIFont systemFontOfSize:20];
    _SecondLabel.frame = CGRectMake(165, 0, 100, 50);
    _SecondLabel.textAlignment = NSTextAlignmentCenter;
    _SecondLabel.font = [UIFont systemFontOfSize:20];
    _ThirdLabel.frame = CGRectMake(315, 0, 100, 50);
    _ThirdLabel.textAlignment = NSTextAlignmentCenter;
    _ThirdLabel.font = [UIFont systemFontOfSize:20];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
