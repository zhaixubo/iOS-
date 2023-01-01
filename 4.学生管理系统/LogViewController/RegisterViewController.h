//
//  RegisterViewController.h
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/25.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ZhuceDelegate <NSObject>

- (void)zhuce:(NSMutableArray *)zhanghaoarray: (NSMutableArray *)mimaarray;

@end


@interface RegisterViewController : ViewController <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *firstTextField;
@property (nonatomic, strong) UITextField *secondTextField;
@property (nonatomic, strong) UITextField *thirdTextField;

@property (assign, nonatomic) id<ZhuceDelegate> delegate;


@end


NS_ASSUME_NONNULL_END
