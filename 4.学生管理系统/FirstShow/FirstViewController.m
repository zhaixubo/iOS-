//
//  FirstViewController.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/25.
//

#import "FirstViewController.h"
#import "ScrollTableViewCell.h"
#import "ShareTableViewCell.h"
#import "holidayViewController.h"



@interface FirstViewController ()
@property (nonatomic, strong) ShareTableViewCell *cell0;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
    tabBarItem.image = [[UIImage imageNamed:@"zhuye.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem.selectedImage =[[UIImage imageNamed:@"zhuye2.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = tabBarItem;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"actionbar.png"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
    
    _tableView = [[UITableView alloc] initWithFrame: self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[ScrollTableViewCell class] forCellReuseIdentifier:@"1"];
    [self.tableView registerClass:[ShareTableViewCell class] forCellReuseIdentifier:@"2"];
    [self.view addSubview:_tableView];
    
    UILabel *titlelabel = [[UILabel alloc] init];
    titlelabel.text = @"SHARE";
    titlelabel.textColor = [UIColor whiteColor];
    titlelabel.font = [UIFont systemFontOfSize:20];
    self.navigationItem.titleView = titlelabel;
    
    UIColor *newblue = [UIColor colorWithRed:(66.0f / 255.0f) green:(140.0f / 255.0f)blue:(230.0f / 255.0f) alpha:1.0f];
    UINavigationBarAppearance *appearance = [UINavigationBarAppearance new];
    [appearance configureWithOpaqueBackground];
    appearance.backgroundColor = newblue;
    appearance.shadowColor = [UIColor clearColor];
    self.navigationController.navigationBar.standardAppearance = appearance;
    self.navigationController.navigationBar.scrollEdgeAppearance = self.navigationController.navigationBar.standardAppearance;


}


//获取每组单元格的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

//获取单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {
        return 200;
    } else {
        return 170;
    }
}

//创建单元格对象函数
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        ScrollTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.row == 1) {
        ShareTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
        cell.imageview.image = [UIImage imageNamed:@"list_img1"];
        cell.FirstLabel.text = @"假日";
        cell.SecondLabel.text = @"原创——插画——练习习作";
        cell.ThirdLabel.text = @"15分钟前";
        cell.FourLabel.text = @"share小白";
        
        cell.xinlabel.text = @"16";
        cell.xinnum = 16;
        cell.chakanlabel.text = @"16";
        cell.fenxiangnum = 66;
        cell.fenxianglabel.text = @"66";
        

        return cell;
    } else if (indexPath.row == 2) {
        ShareTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
        cell.imageview.image = [UIImage imageNamed:@"list_img2"];
        cell.FirstLabel.text = @"国外画册";
        cell.SecondLabel.text = @"平面设计——画册设计";
        cell.ThirdLabel.text = @"16分钟前";
        cell.FourLabel.text = @"share小王";
        
        cell.xinlabel.text = @"15";
        cell.xinnum = 15;
        cell.chakanlabel.text = @"16";
        cell.fenxiangnum = 66;
        cell.fenxianglabel.text = @"66";
        return cell;
    } else if (indexPath.row == 3) {
        ShareTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
        cell.imageview.image = [UIImage imageNamed:@"list_img3"];
        cell.FirstLabel.text = @"扁平设计";
        cell.SecondLabel.text = @"平面设计——海报设计";
        cell.ThirdLabel.text = @"17分钟前";
        cell.FourLabel.text = @"share小吕";
        
        cell.xinlabel.text = @"72";
        cell.xinnum = 72;
        cell.chakanlabel.text = @"15";
        cell.fenxiangnum = 76;
        cell.fenxianglabel.text = @"76";
        return cell;
    } else {
        ShareTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
        cell.imageview.image = [UIImage imageNamed:@"list_img4"];
        cell.FirstLabel.text = @"版式整理";
        cell.SecondLabel.text = @"平面设计——样式设计";
        cell.ThirdLabel.text = @"18分钟前";
        cell.FourLabel.text = @"share小王";
        
        cell.xinnum = 45;
        cell.xinlabel.text = @"45";
        cell.chakanlabel.text = @"70";
        cell.fenxiangnum = 31;
        cell.fenxianglabel.text = @"31";
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        _cell0 = [self.tableView cellForRowAtIndexPath:indexPath];
        holidayViewController *vc = [[holidayViewController alloc] init];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        vc.xinnum = _cell0.xinnum;
        vc.fenxiangnum = _cell0.fenxiangnum;
        vc.delegate = self;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)changexin:(int)i :(int)j {
    if (i == 16) {
        NSString *str1 = [NSString stringWithFormat:@"%d", i];
        _cell0.xinnum = i;
        _cell0.xinlabel.text = str1;
    } else {
        NSString *str1 = [NSString stringWithFormat:@"%d", i];
        _cell0.xinnum = i;
        _cell0.xinlabel.text = str1;
        _cell0.xin.tag = 0;
        [_cell0.xin setImage:[UIImage imageNamed:@"redzan.png"] forState:UIControlStateNormal];
    }
    
    NSString *str2 = [NSString stringWithFormat:@"%d", j];
    _cell0.fenxiangnum = j;
    _cell0.fenxianglabel.text = str2;
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
