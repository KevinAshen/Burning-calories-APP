//
//  BCLRegisterViewController.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/5/16.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLRegisterViewController.h"
#import "BCLRegisterView.h"
#import "BCLLoginViewController.h"

@interface BCLRegisterViewController ()

@property (nonatomic, strong) BCLRegisterView *registerView;
@property (nonatomic, copy) NSString *userNameString;
@property (nonatomic, copy)NSString *pwdString;
@property (nonatomic, copy) NSString *surePwdString;
@property (nonatomic, strong) NSDictionary *returnParameters;

@end

@implementation BCLRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.88f green:0.45f blue:0.53f alpha:1.00f];
    self.registerView = [[BCLRegisterView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_registerView];
    
    self.userNameString = [[NSString alloc] init];
    self.pwdString = [[NSString alloc] init];
    self.surePwdString = [[NSString alloc] init];
    self.returnParameters = [[NSDictionary alloc] init];
    
    typeof(self) weakSelf = self;
    self.registerView.sureRgCallBackBlock = ^(UIButton *button, NSString *userName, NSString *pwd, NSString *surePwd) {
        weakSelf.userNameString = userName;
        weakSelf.pwdString = pwd;
        weakSelf.surePwdString = surePwd;
        [weakSelf sureRgPwd];
        //[weakSelf showSureRgAlertView];
        
    };
    
        
    self.registerView.cancelRgCallBackBlock = ^(UIButton *button) {
        
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    };
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    // Do any additional setup after loading the view.
}

- (void)keyBoardWillShow:(NSNotification *)notification {
    CGFloat kbHeight = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y;
    CGFloat offset = kbHeight;
    //取得键盘的动画时间，这样可以在视图上移的时候更连贯、
    double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    if (offset > 0) {
        [UIView animateWithDuration:duration animations:^{
            self.view.transform = CGAffineTransformMakeTranslation(0.0f, self.registerView.cancelButton.origin.y - offset + 5);
        }];
    }
}
#pragma mark --- 当键盘消失后，视图需要恢复原状
- (void)keyBoardWillHide:(NSNotification *)notify {
    double duration = [[notify.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    //视图下移恢复原状
    [UIView animateWithDuration:duration animations:^{
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
}
- (void)sureRgPwd {
    NSString *url = @"http://www.shidongxuan.top:8000/user/register";
    NSDictionary *parameters = @{@"username":self.userNameString,@"password":self.pwdString,@"gender":@1, @"phone":@"15009175065",@"email":@"dfssd",@"birth":@"2019/08/18 00:00:00"};
    NSLog(@"%@--parameters---", parameters);
    
    
    if([APIClient networkType] > 0) {
        [APIClient requestURL:url httpMethod:POST contentType:@"application/x-www-form-urlencoded" params:parameters response:^(ApiRequestStatusCode requestStatusCode, id JSON) {
                switch (requestStatusCode) {
                    case ApiRequestOK:{
                        self.returnParameters = JSON;
                         NSLog(@"%@---self.returnParameters----", self.returnParameters);
                        if([self->_returnParameters[@"status"] isEqual:@0]) {
                            [self showSureRgAlertView];
                        } else {
                            [self showAlertView:@"用户名已存在" andMessage:@"唉。。。"];
                        }
                        
                        if(![self isEqualPassword:self.pwdString andsurePwd:self.surePwdString]) {
                            [self showAlertView:@"两次密码输入不同哦" andMessage:@"请重新检查输入"];
                        }
                        break;
                    }
                    case ApiRequestError:
                        break;
                    case ApiRequestNotReachable:
                        break;
                    default:
                        break;
                }
        }];
    }
}
- (void)getData:(id)sender {
    NSDictionary *returnParameters = (NSDictionary *)sender;
    self.returnParameters = returnParameters;
}
- (BOOL)isEqualPassword:(NSString *)pwd andsurePwd:(NSString *)surePwd{
    if([pwd isEqualToString:surePwd]) {
        return YES;
    }
    return NO;
}
- (void)showAlertView:(NSString *)title andMessage:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)showSureRgAlertView {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"注册成功" message:@"耶" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (self.returnValueBlock) {
            self.returnValueBlock(self.userNameString, self.pwdString);
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
