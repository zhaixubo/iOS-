//
//  FirstViewController.h
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/25.
//

#import "ViewController.h"
#import "holidayViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : ViewController <UITableViewDelegate, UITableViewDataSource,xindelegate>
- (void)changexin:(int)i:(int)j;

@property (nonatomic, strong) UITableView * tableView;


@end

NS_ASSUME_NONNULL_END
