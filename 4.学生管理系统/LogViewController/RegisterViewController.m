//
//  RegisterViewController.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/25.
//

#import "RegisterViewController.h"
#import "LogViewController.h"

NSMutableArray *_zhanghaoarray;
NSMutableArray *_mimaarray;
@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *backguoundimage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2.jpg"]];
    backguoundimage.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:backguoundimage];
    
    _firstTextField = [[UITextField alloc] init];
    _firstTextField.frame = CGRectMake(80, 400, 275, 50);
    _firstTextField.backgroundColor = [UIColor whiteColor];
    _firstTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"email_img.png"]];
    _firstTextField.borderStyle = UITextBorderStyleRoundedRect;
    _firstTextField.leftViewMode = UITextFieldViewModeAlways;
    _firstTextField.placeholder = @"请输入E-mail";
    [self.view addSubview:_firstTextField];
    
    _secondTextField = [[UITextField alloc] init];
    _secondTextField.frame = CGRectMake(80, 470, 275, 50);
    _secondTextField.backgroundColor = [UIColor whiteColor];
    _secondTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_img.png"]];
    _secondTextField.borderStyle = UITextBorderStyleRoundedRect;
    _secondTextField.leftViewMode = UITextFieldViewModeAlways;
    _secondTextField.placeholder = @"请输入账号";
    [self.view addSubview:_secondTextField];
    
    _thirdTextField = [[UITextField alloc] init];
    _thirdTextField.frame = CGRectMake(80, 540, 275, 50);
    _thirdTextField.backgroundColor = [UIColor whiteColor];
    _thirdTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pass_img.png"]];
    _thirdTextField.borderStyle = UITextBorderStyleRoundedRect;
    _thirdTextField.leftViewMode = UITextFieldViewModeAlways;
    _thirdTextField.placeholder = @"请输入密码";
    //_thirdTextField.secureTextEntry = YES;
    [self.view addSubview:_thirdTextField];
    
    UIButton *zhucebutton = [[UIButton alloc] init];
    zhucebutton.layer.masksToBounds = YES;
    zhucebutton.layer.cornerRadius = 10;
    [zhucebutton setTitle:@"确认注册" forState:UIControlStateNormal];
    zhucebutton.titleLabel.font = [UIFont systemFontOfSize:25];
    zhucebutton.titleLabel.textColor = [UIColor whiteColor];
    zhucebutton.layer.borderWidth = 2;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 1, 1, 1 });
    zhucebutton.layer.borderColor = colorref;
    zhucebutton.frame = CGRectMake(130, 620, 170, 50);
    [zhucebutton addTarget:self action:@selector(presszhuce) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:zhucebutton];
    
    UIButton *leftbutton = [[UIButton alloc] init];
    leftbutton.frame = CGRectMake(30, 30, 50, 50);
    [leftbutton setImage:[UIImage imageNamed:@"back_img.png"] forState:UIControlStateNormal];
    [leftbutton addTarget:self action:@selector(pressback) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftbutton];
    
    _firstTextField.delegate = self;
    _secondTextField.delegate = self;
    _thirdTextField.delegate = self;
    
    _zhanghaoarray = [[NSMutableArray alloc] init];
    _mimaarray = [[NSMutableArray alloc] init];
}


//点击屏幕空白处调用此函数
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //使虚拟键盘回收
    [_firstTextField resignFirstResponder];
    [_secondTextField resignFirstResponder];
    [_thirdTextField resignFirstResponder];
}

//返回
- (void)pressback {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.view.frame =CGRectMake(0.0f, -100,self.view.frame.size.width,self.view.frame.size.height);
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.view.frame =CGRectMake(0.0f, 0,self.view.frame.size.width,self.view.frame.size.height);
}

//注册完成
- (void)presszhuce {
    int boo = 0;
    for (int i = 0; i < _zhanghaoarray.count; i++) {
        if ([_zhanghaoarray[i] isEqualToString:_secondTextField.text]) {
            boo = 1;
            break;
        }
    }
    if (boo == 1) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"账号已经注册过" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:sure];
        [self presentViewController:alertController animated:YES completion:nil];
    } else {
        [_zhanghaoarray addObject:_secondTextField.text];
        [_mimaarray addObject:_thirdTextField.text];
        [_delegate zhuce:_zhanghaoarray:_mimaarray];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    _firstTextField.text = nil;
    _secondTextField.text = nil;
    _thirdTextField.text = nil;
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
