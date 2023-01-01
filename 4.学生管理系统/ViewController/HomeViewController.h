//
//  HomeViewController.h
//  4.学生管理系统
//
//  Created by 翟旭博 on 2022/8/1.
//

#import "ViewController.h"
#import "IncreaseViewController.h"
#import "DeleteViewController.h"
#import "ChangeViewController.h"
#import "SearchViewController.h"
#import "SortViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : ViewController <UITableViewDelegate, UITableViewDataSource, increaseDelegate, DeleteDelegate, SortDelegate, ChangeDelegate>

@property (nonatomic, strong) UIButton *exitButton;
@property (nonatomic, strong) UIButton *increaseButton;
@property (nonatomic, strong) UIButton *delegateButton;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UIButton *sortButton;
@property (nonatomic, strong) UIButton *changeButton;
@property (nonatomic, strong) NSMutableArray *namearray;
@property (nonatomic, strong) NSMutableArray *classarray;
@property (nonatomic, strong) NSMutableArray *gradearray;
@property (nonatomic, strong) UITableView *tableView;
@end

NS_ASSUME_NONNULL_END
