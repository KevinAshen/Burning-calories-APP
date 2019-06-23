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
#import "BCLImageRecognitionBounceView.h"
#import "BCLImageRecognitionPickerView.h"
#import <AFNetworking.h>

@interface BCLSelectFinishViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) BCLSceneImageAnalyzer *sceneImageAnalyzer;
@property (nonatomic, strong) BCLDetailFoodView *detailFoodView;
@property (nonatomic, strong) BCLDetailMessageJSONModel *detailMessageJSONModel;

@property (nonatomic, strong) UIButton *affirmButton;
@property (nonatomic, strong) UIButton *cancelButton;

@property (nonatomic, copy) NSString *foodNameStr;
@property (nonatomic, copy) NSString *foodUnitStr;
@property (nonatomic, copy) NSString *foodQualityStr;
@property (nonatomic, copy) NSArray *numberArr1;
@property (nonatomic, assign) NSInteger caloriesInt;

@property (nonatomic, strong) BCLImageRecognitionBounceView *imageRecognitionBounceView;

@end

@implementation BCLSelectFinishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.87f green:0.87f blue:0.87f alpha:1.00f];

    _selectImageView.frame = CGRectMake(kJKWLength, kJKWLength, kJKWLength * 3, kJKWLength * 3);
    [self.view addSubview:_selectImageView];
    
    _selectImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    NSString *foodNameStr;
    switch (self.type) {
        case 1:
            self.sceneImageAnalyzer = [[BCLSceneImageAnalyzer alloc] initWithImageType:imageVeg];
            foodNameStr = [self analyzeItWithImageType:imageVeg];
            NSLog(@"是蔬菜牙");
            break;
        case 2:
            self.sceneImageAnalyzer = [[BCLSceneImageAnalyzer alloc] initWithImageType:imageFruit];
            foodNameStr = [self analyzeItWithImageType:imageFruit];
            NSLog(@"是水果牙");
        default:
            break;
    }
    [self getDetailWithFoodName:foodNameStr];
    
    self.affirmButton = [[UIButton alloc] initWithFrame:CGRectMake(kJKWLength, kJKWLength * 7.5, kJKWLength * 1, kJKWLength * 1)];
    [self.view addSubview:_affirmButton];
    
    [_affirmButton setBackgroundColor:[UIColor colorWithRed:0.28f green:0.29f blue:0.38f alpha:1.00f]];
    _affirmButton.layer.masksToBounds = YES;
    _affirmButton.layer.cornerRadius = 20;
    [_affirmButton setTitle:@"确认" forState:UIControlStateNormal];
    [_affirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_affirmButton addTarget:self action:@selector(touchAffirm) forControlEvents:UIControlEventTouchUpInside];
    
    self.cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(kJKWLength * 3, kJKWLength * 7.5, kJKWLength * 1, kJKWLength * 1)];
    [self.view addSubview:_cancelButton];
    
    [_cancelButton setBackgroundColor:[UIColor colorWithRed:0.28f green:0.29f blue:0.38f alpha:1.00f]];
    _cancelButton.layer.masksToBounds = YES;
    _cancelButton.layer.cornerRadius = 20;
    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_cancelButton addTarget:self action:@selector(touchCancel) forControlEvents:UIControlEventTouchUpInside];
    
    self.numberArr1 = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10"];
    
    
    
}
//上传数据网络请求
- (void)uploadFood {
    NSDate *dateNow = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY/MM/dd HH:mm:ss"];
    NSString *currentTimeString = [formatter stringFromDate:dateNow];
    NSString *userId =  [[NSUserDefaults standardUserDefaults] objectForKey:@"userId"];
    
    UIImage *originImage = [[UIImage alloc] init];
    originImage = self.selectImageView.image;
   
    //NSString *dataStr = [data base64EncodedDataWithOptions:0];
    //NSString *encodeImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    NSString *url = @"http://www.shidongxuan.top:8000/food/add";
    NSDictionary *dictionary = @{@"userId":userId,@"foodname":_detailMessageJSONModel.dataJSONModel.cnNameStr,@"updateMethod":@1,@"calories":[NSString stringWithFormat:@"%ld",(long)_caloriesInt ],@"type":[NSNumber numberWithInteger:self.type],@"foodTime":currentTimeString};
    NSLog(@"%@---dictionary-----", dictionary[@"userId"]);
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain",@"application/x-www-form-urlencodem", nil];
    sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [sessionManager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [sessionManager POST:url parameters:dictionary constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        UIImage *originImage = [[UIImage alloc] init];
        originImage = self.selectImageView.image;
        NSData *imageData = UIImageJPEGRepresentation(originImage, 1);
        
        [formData appendPartWithFileData:imageData name:@"foodImage"  fileName:@"something.jpg" mimeType:@"image/jpg"];       // 上传图片的参数key
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        [self dismissViewControllerClass:NSClassFromString(@"BCLTabBarController")];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
        NSLog(@"qst");
    }];
    
//    if ([APIClient networkType] > 0) {
//        [APIClient requestURL:url httpMethod:POST contentType:@"application/x-www-form-urlencoded" params:dictionary response:^(ApiRequestStatusCode requestStatusCode, id JSON) {
//            switch (requestStatusCode) {
//                case ApiRequestOK:
//                    NSLog(@"%@", JSON);
//                    break;
//
//                default:
//                    break;
//            }
//        }];
//    }
}

- (void)dismissViewControllerClass:(Class)class {
    UIViewController *vc = self;
    while (![vc isKindOfClass:class] && vc != nil) {
        vc = vc.presentingViewController;
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController *)vc).viewControllers.lastObject;
        }
    }
    [vc dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchCancel {
    [self dismissViewControllerAnimated:YES completion:nil];
    if (self.buttonActionPre) {
        self.buttonActionPre();
    }
}



- (void)touchAffirm {
    self.imageRecognitionBounceView = [[BCLImageRecognitionBounceView alloc] initWithFrame:self.view.frame];
    //_imageRecognitionBounceView.imageRecognitionPickerView = [[BCLImageRecognitionPickerView alloc] init];
    
    [_imageRecognitionBounceView showInView:self.view];
    _imageRecognitionBounceView.imageRecognitionPickerView.bounceShow = ^{
        self->_imageRecognitionBounceView.imageRecognitionPickerView.pickerView.dataSource  = self;
        self->_imageRecognitionBounceView.imageRecognitionPickerView.pickerView.delegate = self;
    };
    [_imageRecognitionBounceView.imageRecognitionPickerView setupSubview];
    
    typeof(self) weakSelf = self; _imageRecognitionBounceView.imageRecognitionPickerView.uploadCallBack = ^(NSString * _Nonnull calories) {
        [weakSelf uploadFood];
    };
    
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
                    self.detailMessageJSONModel = detailMessageJSONModel;
                    NSLog(@"self.detailMessageJSONModel：%@", self.detailMessageJSONModel);
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
    self.foodNameStr = model.dataJSONModel.cnNameStr;
    self.foodUnitStr = model.dataJSONModel.unitStr;
    self.foodQualityStr = model.dataJSONModel.qualityStr;
    NSLog(@"初始化完成");
    [self.view addSubview:_detailFoodView];
}

- (NSString *)analyzeItWithImageType:(ImageType)type {
    NSMutableString * msg = [NSMutableString new];
    NSMutableDictionary* all = [NSMutableDictionary new];
    
    NSString *label = [self.sceneImageAnalyzer analyzeImage:_selectImageView.image imageType:type allPossible:all];
    
    [all enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSNumber * _Nonnull value, BOOL * _Nonnull stop) {
        [msg appendFormat:@"%@  -  %.02f%%\n", key, value.floatValue * 100];
    }];
    NSLog(@"it is %@", label);
    return label;
}

#pragma mark -- UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 1) {
        return _numberArr1[row];
    }
    if (component == 0) {
        return _foodNameStr;
    }
    return _foodUnitStr;
}

#pragma mark -- UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 1) {
        return _numberArr1.count;
    }
    return 1;
}

// 当用户选中UIPickerViewDataSource中指定列和列表项时激发该方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component {
    NSString *numberStr = _numberArr1[row];
    NSInteger numberInt = [numberStr integerValue];
    NSInteger qualityInt = [_foodQualityStr integerValue];
    _caloriesInt = numberInt * qualityInt;
    NSString *caloriesStr = [NSString stringWithFormat:@"%ld大卡", _caloriesInt];
    self.imageRecognitionBounceView.imageRecognitionPickerView.textField.text = caloriesStr;
}


@end
