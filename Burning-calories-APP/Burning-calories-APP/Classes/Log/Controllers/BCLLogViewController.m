//
//  BCLLogViewController.m
//  Burning-calories-APP
//
//  Created by mac on 2019/1/23.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLLogViewController.h"
#import "BCLLogView.h"
#import "BCLBaseViewController.h"
#import "BCLDayTimeRecordViewController.h"
#import "BCLWeekTimeRecordViewController.h"
#import "BCLMonthTimeRecordViewController.h"
#import "APIClient.h"

@interface BCLLogViewController ()

@property (nonatomic, strong) BCLLogView *logView;
@end

@implementation BCLLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"日志";
    
    _logView = [[BCLLogView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_logView];
    
    _logView.tableView.delegate = self;
    NSString *url = @"http://www.shidongxuan.top:8000/user/register";
    NSDictionary *parameters = @{@"username":@"强淑婷",@"password":@"863139668",@"gender":@1, @"phone":@"18391741628",@"email":@"dfssd",@"birth":@"2019/08/18 00:00:00"};
    if([APIClient networkType] > 0) {
        [APIClient requestURL:url httpMethod:POST contentType:@"application/x-www-form-urlencoded" params:parameters response:^(ApiRequestStatusCode requestStatusCode, id JSON) {
            switch (requestStatusCode) {
                case ApiRequestOK:
                    NSLog(@"%@", JSON);
                    break;
                case ApiRequestError:
                    break;
                case ApiRequestNotReachable:
                    break;
                default:
                    break;
            }
        }];
    }
    
    // Do any additional setup after loading the view.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0 || indexPath.row == 1) {
        return 50.0 / 667 * kDeviceHeight;
    }
    return 150.0 / 667 * kDeviceHeight;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return  0.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc]init];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc]init];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
        BCLDayTimeRecordViewController *new = [[BCLDayTimeRecordViewController alloc]init];
        [self.navigationController pushViewController:new animated:YES];
    } else if (indexPath.row == 1) {
        BCLWeekTimeRecordViewController *new = [[BCLWeekTimeRecordViewController alloc] init];
        [self.navigationController pushViewController:new animated:YES];
    } else {
        BCLMonthTimeRecordViewController *new
        = [[BCLMonthTimeRecordViewController alloc] init];
        [self.navigationController pushViewController:new animated:YES];
    }
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
//}


@end
