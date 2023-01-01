//
//  IncreaseViewController.m
//  4.学生管理系统
//
//  Created by 翟旭博 on 2022/8/1.
//

#import "IncreaseViewController.h"
#import "HomeViewController.h"
#import "MyTableViewCell.h"
#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height
@interface IncreaseViewController ()

@end

@implementation IncreaseViewController

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
    
    _rightbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _rightbutton.layer.masksToBounds = YES;
    _rightbutton.layer.cornerRadius = 10;
    [_rightbutton setTitle:@"确定" forState:UIControlStateNormal];
    _rightbutton.titleLabel.font = [UIFont systemFontOfSize:25];
    _rightbutton.titleLabel.tintColor = [UIColor whiteColor];
    _rightbutton.layer.borderWidth = 2;
    _rightbutton.layer.borderColor = colorref;
    _rightbutton.frame = CGRectMake(245, 630, 100, 50);
    [_rightbutton addTarget:self action:@selector(pressok) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_rightbutton];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 95, width, 400)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
    _firstTextField = [[UITextField alloc] initWithFrame:CGRectMake(80, 400, 275, 50)];
    _firstTextField.backgroundColor = [UIColor whiteColor];
    _firstTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xingming.png"]];
    _firstTextField.borderStyle = UITextBorderStyleRoundedRect;
    _firstTextField.leftViewMode = UITextFieldViewModeAlways;
    _firstTextField.placeholder = @"请输入姓名";
    [self.view addSubview:_firstTextField];
    
    _secondTextField = [[UITextField alloc] init];
    _secondTextField.frame = CGRectMake(80, 470, 275, 50);
    _secondTextField.backgroundColor = [UIColor whiteColor];
    _secondTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"banji.png"]];
    _secondTextField.borderStyle = UITextBorderStyleRoundedRect;
    _secondTextField.leftViewMode = UITextFieldViewModeAlways;
    _secondTextField.placeholder = @"请输入班级";
    [self.view addSubview:_secondTextField];
    
    _thirdTextField = [[UITextField alloc] init];
    _thirdTextField.frame = CGRectMake(80, 540, 275, 50);
    _thirdTextField.backgroundColor = [UIColor whiteColor];
    _thirdTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chengji.png"]];
    _thirdTextField.borderStyle = UITextBorderStyleRoundedRect;
    _thirdTextField.leftViewMode = UITextFieldViewModeAlways;
    _thirdTextField.placeholder = @"请输入成绩";
    [self.view addSubview:_thirdTextField];
    
    _firstTextField.delegate = self;
    _secondTextField.delegate = self;
    _thirdTextField.delegate = self;
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

- (void)pressok {
    if ([_firstTextField.text isEqualToString: @"" ]|| [_secondTextField.text isEqualToString: @"" ] || [_thirdTextField.text isEqualToString: @"" ]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"输入信息不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:sure];
        [self presentViewController:alertController animated:YES completion:nil];
    } else {
        int boo = 0;
        for (int i = 0; i < _namearray.count; i++) {
            if ([_firstTextField.text isEqualToString:_namearray[i]] && [_secondTextField.text isEqualToString:_classarray[i]]) {
                boo = 1;
                break;
            }
        }
        if (boo == 1) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"已存在此人" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:sure];
            [self presentViewController:alertController animated:YES completion:nil];
        } else {
            NSString *firstString = [_secondTextField.text substringToIndex:1];
            NSString *secondString = [_secondTextField.text substringFromIndex:1];
            NSInteger grade = [_thirdTextField.text intValue];
            if (([firstString isEqualToString:@"1"] || [firstString isEqualToString:@"2"] || [firstString isEqualToString:@"3"] || [firstString isEqualToString:@"4"] || [firstString isEqualToString:@"5"]) && [secondString isEqualToString:@"班"] && (grade >= 0 || grade <= 100)&& _secondTextField.text.length == 2) {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"通知" message:@"添加成功" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    [_namearray addObject:_firstTextField.text];
                    [_classarray addObject:_secondTextField.text];
                    [_gradearray addObject:_thirdTextField.text];
                    [_delegate newincrease:_namearray :_classarray :_gradearray];
                    [self dismissViewControllerAnimated:YES completion:nil];
                }];
                [alertController addAction:sure];
                [self presentViewController:alertController animated:YES completion:nil];
            } else {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"输入格式有问题" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:sure];
                [self presentViewController:alertController animated:YES completion:nil];
            }
        }
    }
}

//点击屏幕空白处调用此函数
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //使虚拟键盘回收
    [_firstTextField resignFirstResponder];
    [_secondTextField resignFirstResponder];
    [_thirdTextField resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.view.frame =CGRectMake(0.0f, -100,width,height);
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.view.frame =CGRectMake(0.0f, 0,width,height);
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
