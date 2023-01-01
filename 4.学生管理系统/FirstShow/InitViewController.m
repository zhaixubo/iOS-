//
//  InitViewController.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/25.
//

#import "InitViewController.h"

@interface InitViewController ()

@end

@implementation InitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView* imageSelf = [[UIImageView alloc]init];
    imageSelf.image = [UIImage imageNamed:@"1.开机界面.png"];
    imageSelf.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:imageSelf];
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
