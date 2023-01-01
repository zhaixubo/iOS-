//
//  SortViewController.m
//  4.学生管理系统
//
//  Created by 翟旭博 on 2022/8/1.
//

#import "SortViewController.h"
#import "HomeViewController.h"
#import "MyTableViewCell.h"
#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height
@interface SortViewController ()

@end

@implementation SortViewController

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
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 95, width, 400)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
    _leftbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _leftbutton.layer.masksToBounds = YES;
    _leftbutton.layer.cornerRadius = 10;
    [_leftbutton setTitle:@"退出" forState:UIControlStateNormal];
    _leftbutton.titleLabel.font = [UIFont systemFontOfSize:25];
    _leftbutton.titleLabel.tintColor = [UIColor whiteColor];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 255, 255, 255, 255 });
    _leftbutton.layer.borderWidth = 2;
    _leftbutton.layer.borderColor = colorref;
    _leftbutton.frame = CGRectMake(90, 630, 100, 50);
    [_leftbutton addTarget:self action:@selector(pressback) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_leftbutton];
    
    _smallbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _smallbutton.layer.masksToBounds = YES;
    _smallbutton.layer.cornerRadius = 10;
    [_smallbutton setTitle:@"从小到大排序" forState:UIControlStateNormal];
    _smallbutton.titleLabel.font = [UIFont systemFontOfSize:25];
    _smallbutton.titleLabel.tintColor = [UIColor whiteColor];
    _smallbutton.layer.borderWidth = 2;
    _smallbutton.layer.borderColor = colorref;
    _smallbutton.frame = CGRectMake(90, 430, 250, 50);
    [_smallbutton addTarget:self action:@selector(presssmall) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_smallbutton];
    
    _bigbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _bigbutton.layer.masksToBounds = YES;
    _bigbutton.layer.cornerRadius = 10;
    [_bigbutton setTitle:@"从大到小排序" forState:UIControlStateNormal];
    _bigbutton.titleLabel.font = [UIFont systemFontOfSize:25];
    _bigbutton.titleLabel.tintColor = [UIColor whiteColor];
    _bigbutton.layer.borderWidth = 2;
    _bigbutton.layer.borderColor = colorref;
    _bigbutton.frame = CGRectMake(90, 530, 250, 50);
    [_bigbutton addTarget:self action:@selector(pressbig) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_bigbutton];
}

- (void)pressback {
    [self dismissViewControllerAnimated:YES completion:nil];
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

- (void)presssmall {
    for (int i = 0; i < _namearray.count; i++) {
        for (int j = 0; j < _namearray.count - 1; j++) {
            NSInteger qian = [_gradearray[j] intValue];
            NSInteger hou = [_gradearray[j + 1] intValue];
            if (qian > hou) {
                NSMutableString *a = [NSMutableString stringWithString:_gradearray[j]];
                NSMutableString *b = [NSMutableString stringWithString:_classarray[j]];
                NSMutableString *c = [NSMutableString stringWithString:_namearray[j]];
                _namearray[j] = _namearray[j + 1];
                _gradearray[j] = _gradearray[j + 1];
                _classarray[j] = _classarray[j + 1];
                _gradearray[j + 1] = a;
                _classarray[j + 1] = b;
                _namearray[j + 1] = c;
            }
        }
    }
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"通知" message:@"排序成功" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [_delegate newsort:_namearray :_classarray :_gradearray];
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction:sure];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)pressbig {
    for (int i = 0; i < _namearray.count; i++) {
        for (int j = 0; j < _namearray.count - 1; j++) {
            NSInteger qian = [_gradearray[j] intValue];
            NSInteger hou = [_gradearray[j + 1] intValue];
            if (qian < hou) {
                NSMutableString *a = [NSMutableString stringWithString:_gradearray[j]];
                NSMutableString *b = [NSMutableString stringWithString:_classarray[j]];
                NSMutableString *c = [NSMutableString stringWithString:_namearray[j]];
                _namearray[j] = _namearray[j + 1];
                _gradearray[j] = _gradearray[j + 1];
                _classarray[j] = _classarray[j + 1];
                _gradearray[j + 1] = a;
                _classarray[j + 1] = b;
                _namearray[j + 1] = c;
            }
        }
    }
   
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"通知" message:@"排序成功" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [_delegate newsort:_namearray :_classarray :_gradearray];
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction:sure];
    [self presentViewController:alertController animated:YES completion:nil];
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
