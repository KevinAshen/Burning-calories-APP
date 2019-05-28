//
//  BCLSelectFinishViewController.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/5/5.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLSelectFinishViewController.h"
#import "BCLSceneImageAnalyzer.h"
#import "BCLDetailFoodView.h"
#import "BCLDetailMessageJSONModel.h"

@interface BCLSelectFinishViewController ()

@property (nonatomic, strong) BCLSceneImageAnalyzer *sceneImageAnalyzer;
@property (nonatomic, strong) BCLDetailFoodView *detailFoodView;
@property (nonatomic, strong) BCLDetailMessageJSONModel *detailMessageJSONModel;

@end

@implementation BCLSelectFinishViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.87f green:0.87f blue:0.87f alpha:1.00f];

    _selectImageButton.frame = CGRectMake(kJKWLength, kJKWLength, kJKWLength * 3, kJKWLength * 3);
    [self.view addSubview:_selectImageButton];
    NSString *foodNameStr;
    switch (self.type) {
        case 1:
            self.sceneImageAnalyzer = [[BCLSceneImageAnalyzer alloc] initWithImageType:imageFruit];
            foodNameStr = [self analyzeItWithImageType:imageFruit];
            NSLog(@"是水果牙");
            break;
        case 2:
            self.sceneImageAnalyzer = [[BCLSceneImageAnalyzer alloc] initWithImageType:imageVeg];
            foodNameStr = [self analyzeItWithImageType:imageVeg];
            NSLog(@"是蔬菜牙");
        default:
            break;
    }
    [self getDetailWithFoodName:foodNameStr];
    //[self setupDetailFoodView];
}

- (void)getDetailWithFoodName:(NSString *)foodNameStr {
    for (int i = 0; i < foodNameStr.length; i++) {
        char k = [foodNameStr characterAtIndex:i];
        if (k == ' ') {
            NSLog(@"FIND YOU BITCH %d", i);
            foodNameStr = [foodNameStr stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        }
    }
    NSString *urlA = @"http://www.shidongxuan.top:8000/food/info?enName=";
    NSString *url = [urlA stringByAppendingString:foodNameStr];
    NSDictionary *parameters;
    if ([APIClient networkType] > 0) {
        [APIClient requestURL:url httpMethod:GET contentType:@"application/x-www-form-urlencoded" params:parameters response:^(ApiRequestStatusCode requestStatusCode, id JSON) {
            switch (requestStatusCode) {
                case ApiRequestOK: {
                    NSLog(@"%@---JSON", JSON);
                    BCLDetailMessageJSONModel *detailMessageJSONModel = [[BCLDetailMessageJSONModel alloc] initWithDictionary:JSON error:nil];
                    self.detailMessageJSONModel = [[BCLDetailMessageJSONModel alloc] init];
                    NSLog(@"detailMessageJSONModel：%@", detailMessageJSONModel);
                    [self setupDetailFoodViewWithModel:detailMessageJSONModel];
                }
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
}

- (void)setupDetailFoodViewWithModel:(BCLDetailMessageJSONModel *)model {
    self.detailFoodView = [[BCLDetailFoodView alloc] initWithFrame:CGRectMake(kJKWLength, kJKWLength * 4.5, kJKWLength * 3, kJKWLength * 2.5) DetailMessageJSONModel:model];
    //[_detailFoodView updateWithData:self.detailMessageJSONModel];
    NSLog(@"初始化完成");
    [self.view addSubview:_detailFoodView];
}

- (NSString *)analyzeItWithImageType:(ImageType)type {
    NSMutableString * msg = [NSMutableString new];
    NSMutableDictionary* all = [NSMutableDictionary new];
    
    NSString *label = [self.sceneImageAnalyzer analyzeImage:_selectImageButton.imageView.image imageType:type allPossible:all];
    
    [all enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSNumber * _Nonnull value, BOOL * _Nonnull stop) {
        [msg appendFormat:@"%@  -  %.02f%%\n", key, value.floatValue * 100];
    }];
    NSLog(@"it is %@", label);
    return label;
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
