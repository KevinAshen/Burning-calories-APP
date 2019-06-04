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

@interface BCLSelectFinishViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) BCLSceneImageAnalyzer *sceneImageAnalyzer;
@property (nonatomic, strong) BCLDetailFoodView *detailFoodView;
@property (nonatomic, strong) BCLDetailMessageJSONModel *detailMessageJSONModel;

@property (nonatomic, strong) UIButton *affirmButton;
@property (nonatomic, strong) UIButton *cancelButton;

@property (nonatomic, copy) NSArray *itemArr1;
@property (nonatomic, copy) NSArray *itemArr2;
@property (nonatomic, copy) NSArray *itemArr3;

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
    
    self.itemArr1 = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7"];
    self.itemArr2 = @[@"个"];
    self.itemArr3 = @[@"苹果"];
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
        NSLog(@"shixian");
        self->_imageRecognitionBounceView.imageRecognitionPickerView.pickerView.dataSource  = self;
        self->_imageRecognitionBounceView.imageRecognitionPickerView.pickerView.delegate = self;
    };
    [_imageRecognitionBounceView.imageRecognitionPickerView setupPickerView];
    
}

- (void)getDetailWithFoodName:(NSString *)foodNameStr {
//    if ([foodNameStr isEqualToString:@"Hami melo"]) {
//        foodNameStr = @"Hami melon";
//    }
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
    if (component == 0) {
        return _itemArr3[row];
    }
    if (component == 1) {
        return _itemArr1[row];
    }
    return _itemArr2[row];
}

#pragma mark -- UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return _itemArr3.count;
    }
    if (component == 1) {
        return _itemArr1.count;
    }
    return _itemArr2.count;
}

// 当用户选中UIPickerViewDataSource中指定列和列表项时激发该方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component {
    NSString *temp = _itemArr1[row];
    self.imageRecognitionBounceView.imageRecognitionPickerView.textField.text = temp;
}


@end
