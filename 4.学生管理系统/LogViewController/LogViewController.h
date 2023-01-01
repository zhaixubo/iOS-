//
//  LogViewController.h
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/25.
//

#import "ViewController.h"
#import "RegisterViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface LogViewController : ViewController <UITextFieldDelegate, ZhuceDelegate>
- (void)zhuce:(NSMutableArray *)zhanghaoarray: (NSMutableArray *)mimaarray;

@property (nonatomic, strong)UITextField *firstTextField;
@property (nonatomic, strong)UITextField *secondTextField;
@property (nonatomic, strong)NSMutableArray *zhang;
@property (nonatomic, strong)NSMutableArray *mi;
@end

NS_ASSUME_NONNULL_END
