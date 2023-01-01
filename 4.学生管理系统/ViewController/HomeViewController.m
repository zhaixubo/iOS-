//
//  HomeViewController.m
//  4.学生管理系统
//
//  Created by 翟旭博 on 2022/8/1.
//

#import "HomeViewController.h"
#import "MyTableViewCell.h"
#import "IncreaseViewController.h"
#import "DeleteViewController.h"
#import "SearchViewController.h"
#import "ChangeViewController.h"
#import "SortViewController.h"

#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *backguoundimage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    backguoundimage.frame = CGRectMake(0, 0, width, height);
    [self.view addSubview:backguoundimage];
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(40, 45, 150, 50)];
    name.font = [UIFont systemFontOfSize:24];
    name.text = @"姓名";
    [self.view addSubview:name];
        
    UILabel *class0 = [[UILabel alloc] initWithFrame:CGRectMake(190, 45, 150, 50)];
    class0.font = [UIFont systemFontOfSize:24];
    class0.text = @"班级";
    [self.view addSubview:class0];
        
    UILabel *grade = [[UILabel alloc] initWithFrame:CGRectMake(340, 45, 150, 50)];
    grade.font = [UIFont systemFontOfSize:24];
    grade.text = @"成绩";
    [self.view addSubview:grade];
    
    _increaseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _increaseButton.layer.masksToBounds = YES;
    _increaseButton.layer.cornerRadius = 10;
    [_increaseButton setTitle:@"增加" forState:UIControlStateNormal];
    _increaseButton.titleLabel.font = [UIFont systemFontOfSize:25];
    _increaseButton.titleLabel.tintColor = [UIColor whiteColor];
    _increaseButton.layer.borderWidth = 2;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 255, 255, 255, 255 });
    _increaseButton.layer.borderColor = colorref;
    _increaseButton.frame = CGRectMake(90, 570, 100, 50);
    [_increaseButton addTarget:self action:@selector(increase) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_increaseButton];
    
    _delegateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _delegateButton.layer.masksToBounds = YES;
    _delegateButton.layer.cornerRadius = 10;
    [_delegateButton setTitle:@"删除" forState:UIControlStateNormal];
    _delegateButton.titleLabel.font = [UIFont systemFontOfSize:25];
    _delegateButton.titleLabel.tintColor = [UIColor whiteColor];
    _delegateButton.layer.borderWidth = 2;
    _delegateButton.layer.borderColor = colorref;
    _delegateButton.frame = CGRectMake(245, 570, 100, 50);
    [_delegateButton addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_delegateButton];
    
    
    _changeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _changeButton.layer.masksToBounds = YES;
    _changeButton.layer.cornerRadius = 10;
    [_changeButton setTitle:@"修改" forState:UIControlStateNormal];
    _changeButton.titleLabel.font = [UIFont systemFontOfSize:25];
    _changeButton.titleLabel.tintColor = [UIColor whiteColor];
    _changeButton.layer.borderWidth = 2;
    _changeButton.layer.borderColor = colorref;
    _changeButton.frame = CGRectMake(90, 630, 100, 50);
    [_changeButton addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_changeButton];
    
    _searchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _searchButton.layer.masksToBounds = YES;
    _searchButton.layer.cornerRadius = 10;
    [_searchButton setTitle:@"查找" forState:UIControlStateNormal];
    _searchButton.titleLabel.font = [UIFont systemFontOfSize:25];
    _searchButton.titleLabel.tintColor = [UIColor whiteColor];
    _searchButton.layer.borderWidth = 2;
    _searchButton.layer.borderColor = colorref;
    _searchButton.frame = CGRectMake(245, 630, 100, 50);
    [_searchButton addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_searchButton];
    
    
    _sortButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _sortButton.layer.masksToBounds = YES;
    _sortButton.layer.cornerRadius = 10;
    [_sortButton setTitle:@"排序" forState:UIControlStateNormal];
    _sortButton.titleLabel.font = [UIFont systemFontOfSize:25];
    _sortButton.titleLabel.tintColor = [UIColor whiteColor];
    _sortButton.layer.borderWidth = 2;
    _sortButton.layer.borderColor = colorref;
    _sortButton.frame = CGRectMake(90, 690, 100, 50);
    [_sortButton addTarget:self action:@selector(sort) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_sortButton];
    
    _exitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _exitButton.layer.masksToBounds = YES;
    _exitButton.layer.cornerRadius = 10;
    [_exitButton setTitle:@"退出" forState:UIControlStateNormal];
    _exitButton.titleLabel.font = [UIFont systemFontOfSize:25];
    _exitButton.titleLabel.tintColor = [UIColor whiteColor];
    _exitButton.layer.borderWidth = 2;
    _exitButton.layer.borderColor = colorref;
    _exitButton.frame = CGRectMake(245, 690, 100, 50);
    [_exitButton addTarget:self action:@selector(exit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_exitButton];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 95, width, 400)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
    _namearray = [NSMutableArray arrayWithObjects:@"老王", @"老孙", @"小王", @"张三", nil];
    _classarray = [NSMutableArray arrayWithObjects:@"1班", @"2班", @"3班", @"4班", nil];
    _gradearray = [NSMutableArray arrayWithObjects:@"65", @"89", @"56", @"54", nil];
}

- (void)increase {
    IncreaseViewController *viewcontroller = [[IncreaseViewController alloc] init];
    viewcontroller.modalPresentationStyle = UIModalPresentationFullScreen;
    viewcontroller.namearray = _namearray;
    viewcontroller.classarray = _classarray;
    viewcontroller.gradearray = _gradearray;
    viewcontroller.delegate = self;
    [self presentViewController:viewcontroller animated:YES completion:nil];
}

- (void)delete {
    DeleteViewController *viewcontroller = [[DeleteViewController alloc] init];
    viewcontroller.modalPresentationStyle = UIModalPresentationFullScreen;
    viewcontroller.namearray = _namearray;
    viewcontroller.classarray = _classarray;
    viewcontroller.gradearray = _gradearray;
    viewcontroller.delegate = self;
    [self presentViewController:viewcontroller animated:YES completion:nil];
}

- (void)change {
    ChangeViewController *viewcontroller = [[ChangeViewController alloc] init];
    viewcontroller.modalPresentationStyle = UIModalPresentationFullScreen;
    viewcontroller.namearray = _namearray;
    viewcontroller.classarray = _classarray;
    viewcontroller.gradearray = _gradearray;
    viewcontroller.delegate = self;
    [self presentViewController:viewcontroller animated:YES completion:nil];
}

- (void)search {
    SearchViewController *viewcontroller = [[SearchViewController alloc] init];
    viewcontroller.modalPresentationStyle = UIModalPresentationFullScreen;
    viewcontroller.namearray = _namearray;
    viewcontroller.classarray = _classarray;
    viewcontroller.gradearray = _gradearray;
    [self presentViewController:viewcontroller animated:YES completion:nil];
}

- (void)sort {
    SortViewController *viewcontroller = [[SortViewController alloc] init];
    viewcontroller.modalPresentationStyle = UIModalPresentationFullScreen;
    viewcontroller.namearray = _namearray;
    viewcontroller.classarray = _classarray;
    viewcontroller.gradearray = _gradearray;
    viewcontroller.delegate = self;
    [self presentViewController:viewcontroller animated:YES completion:nil];
}

- (void)exit {
    [[UIApplication sharedApplication]performSelector:@selector(suspend)];
}

//获取每组单元格的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _namearray.count;
}

//获取单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

//创建单元格对象函数
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.FirstLabel.text = _namearray[indexPath.row];
    cell.SecondLabel.text = _classarray[indexPath.row];
    cell.ThirdLabel.text = _gradearray[indexPath.row];
    return cell;
}

- (void)newincrease:(NSMutableArray *)namearray :(NSMutableArray *)classarray :(NSMutableArray *)gradearray {
    _namearray = namearray;
    _classarray = classarray;
    _gradearray = gradearray;
    [_tableView reloadData];
}
- (void)newdelete:(NSMutableArray *)namearray :(NSMutableArray *)classarray :(NSMutableArray *)gradearray {
    _namearray = namearray;
    _classarray = classarray;
    _gradearray = gradearray;
    [_tableView reloadData];
}
- (void)newsort:(NSMutableArray *)namearray :(NSMutableArray *)classarray :(NSMutableArray *)gradearray {
    _namearray = namearray;
    _classarray = classarray;
    _gradearray = gradearray;
    [_tableView reloadData];
}
- (void)newchange:(NSMutableArray *)namearray :(NSMutableArray *)classarray :(NSMutableArray *)gradearray {
    _namearray = namearray;
    _classarray = classarray;
    _gradearray = gradearray;
    [_tableView reloadData];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
