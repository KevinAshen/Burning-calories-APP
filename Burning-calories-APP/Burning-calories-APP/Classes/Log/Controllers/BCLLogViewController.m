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
#import "BCLLogModel.h"


@interface BCLLogViewController ()

@property (nonatomic, strong) BCLLogView *logView;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIButton *button;

@end

@implementation BCLLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"日志";
    
    
    _logView = [[BCLLogView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_logView];
    
    _logView.tableView.delegate = self;
    [self getFoodMessage];

    // Do any additional setup after loading the view.
}
- (void)getFoodMessage {
    NSString *url = @"http://www.shidongxuan.top:8000/food/get";
    if ([APIClient networkType] > 0) {
        [APIClient requestURL:url httpMethod:GET contentType:nil params:nil response:^(ApiRequestStatusCode requestStatusCode, id JSON) {
            switch (requestStatusCode) {
                case ApiRequestOK:{
                    NSLog(@"%@", JSON);
                    
                    BCLLogModel *logModel = [[BCLLogModel alloc] initWithDictionary:JSON error:nil];
                    
                    NSArray *data = [NSArray array];
                    data = [logModel data];
                    BCLFoodDataModel *model = [[BCLFoodDataModel alloc] initWithDictionary:data[data.count - 1] error:nil];
                    NSLog(@"%@--Model-----", model);
                    int daysCount = [self calculateLogDay:[model createTime]];
                    
                    NSMutableArray *allDaysArray = [NSMutableArray array];
                    for (int i = 0; i <= daysCount; i++) {
                        NSMutableArray *dayArray = [NSMutableArray array];
//                        BCLFoodDataModel *model = [[BCLFoodDataModel alloc] initWithDictionary:data[data.count - 1] error:nil];
//                        [dayArray addObject:model];
                        [allDaysArray addObject:dayArray];
                    }
                    for (int i = 0; i < data.count; i++) {
                        BCLFoodDataModel *model = [[BCLFoodDataModel alloc] initWithDictionary:data[i] error:nil];
                        NSInteger dayIndex = [self calculateLogDay:[model createTime]];
                        [allDaysArray[dayIndex] addObject:model];
                    }
                    NSLog(@"%@---allDaysArray----", allDaysArray);
                    NSArray *foodArray = [allDaysArray copy];
                    self.logView.foodArray = [NSArray array];
                    self.logView.foodArray = foodArray;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.logView.tableView reloadData];
                    });
                    break;
                }
                    
                default:
                    break;
            }
        }];
    }
}
//根据日期返回距离今天为第几天
- (int)calculateLogDay:(NSString *)dateTime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *date = [NSDate date];
    
    NSString *dateString = [dateTime substringToIndex:10];
    
    NSDate *endTimeDate = [formatter dateFromString:dateString];
//    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//    NSDateComponents *comps = [[NSDateComponents alloc] init];
//    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
//
//    comps = [calendar components:unitFlags fromDate:date];
//    NSInteger month = [comps month];
//    NSInteger day = [comps day];
//
//    NSDateComponents *compsEnd = [[NSDateComponents alloc] init];
//    compsEnd = [calendar components:unitFlags fromDate:endTimeDate];
//    NSInteger monthEnd = [compsEnd month];
//    NSInteger dayEnd = [compsEnd day];
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitDay;
    NSDateComponents *delta = [calender components:unit fromDate:endTimeDate toDate:date options:0];
    
    int instanceDay = (int)delta.day;
    NSLog(@"%d", instanceDay);
    return instanceDay ;
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
    NSLog(@"%@", self.view);
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
//}


@end
