//
//  IncreaseViewController.h
//  4.学生管理系统
//
//  Created by 翟旭博 on 2022/8/1.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol increaseDelegate <NSObject>

- (void)newincrease:(NSMutableArray*)namearray:(NSMutableArray*)classarray:(NSMutableArray *)gradearray;

@end

@interface IncreaseViewController : ViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (nonatomic, strong) NSMutableArray *namearray;
@property (nonatomic, strong) NSMutableArray *classarray;
@property (nonatomic, strong) NSMutableArray *gradearray;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITextField *firstTextField;
@property (nonatomic, strong) UITextField *secondTextField;
@property (nonatomic, strong) UITextField *thirdTextField;
@property (nonatomic, strong) UIButton *leftbutton;
@property (nonatomic, strong) UIButton *rightbutton;

@property (assign, nonatomic) id <increaseDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
