//
//  SortViewController.h
//  4.学生管理系统
//
//  Created by 翟旭博 on 2022/8/1.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SortDelegate <NSObject>

- (void)newsort:(NSMutableArray*)namearray:(NSMutableArray*)classarray:(NSMutableArray *)gradearray;

@end

@interface SortViewController : ViewController<UITableViewDelegate, UITableViewDataSource, SortDelegate>
@property (nonatomic, strong) NSMutableArray *namearray;
@property (nonatomic, strong) NSMutableArray *classarray;
@property (nonatomic, strong) NSMutableArray *gradearray;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *leftbutton;
@property (nonatomic, strong) UIButton *bigbutton;
@property (nonatomic, strong) UIButton *smallbutton;
@property (assign, nonatomic) id<SortDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
