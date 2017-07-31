//
//  LeftViewController.m
//  抽屉效果
//
//  Created by WangXueqi on 16/12/7.
//  Copyright © 2016年 JingBei. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    UIBarButtonItem * btnItem = [[UIBarButtonItem alloc]initWithTitle:@"点击" style:UIBarButtonItemStylePlain target:self action:@selector(btnClick)];
    self.navigationItem.leftBarButtonItem = btnItem;
    [self addSubView];
}

-(void)btnClick{
    
    //    发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"主传左" object:nil];
}

-(void)addSubView{
    // 1、获取当前时间
    NSDate *now = [NSDate date];
    NSDateFormatter *nowFormate = [[NSDateFormatter alloc] init];
    nowFormate.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *nowTime = [nowFormate stringFromDate:now];
    NSLog(@"nowTime = %@",nowTime);
    
    // 2、拿现在的时间和过去时间或者将来时间对比，计算出相差多少天，多少年，多少秒等等；
    NSDate *beforTime = [nowFormate dateFromString:@"2014-06-14 19:25:00"];
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    //世纪
    NSInteger era  = kCFCalendarUnitEra;
    
    //年
    NSInteger year = kCFCalendarUnitYear;
    
    //月
    NSInteger month = kCFCalendarUnitMonth;
    
    //小时
    NSInteger hour = kCFCalendarUnitHour;
    
    //分钟
    NSInteger minute = kCFCalendarUnitMinute;
    
    //秒
    NSInteger second = kCFCalendarUnitSecond;
    
    NSDateComponents *compsEra = [calender components:era fromDate:beforTime toDate:now options:0];
    NSDateComponents *compsYear = [calender components:year fromDate:beforTime toDate:now options:0];
    NSDateComponents *compsMonth = [calender components:month fromDate:beforTime toDate:now options:0];
    NSDateComponents *compsHour = [calender components:hour fromDate:beforTime toDate:now options:0];
    NSDateComponents *compsMinute = [calender components:minute fromDate:beforTime toDate:now options:0];
    NSDateComponents *compsSecond = [calender components:second fromDate:beforTime toDate:now options:0];
    
    NSLog(@"相差世纪个数 = %ld",[compsEra era]);
    NSLog(@"相差年个数 = %ld",[compsYear year]);
    NSLog(@"相差月个数 = %ld",[compsMonth month]);
    NSLog(@"相差小时个数 = %ld",[compsHour hour]);
    NSLog(@"相差分钟个数 = %ld",[compsMinute minute]);
    NSLog(@"相差秒个数 = %ld",[compsSecond second]);
    
    // 3、获取时间戳（相对于1970年）
    CGFloat timestamp = now.timeIntervalSince1970;
    NSLog(@"距离1970年有多少秒 = %f",timestamp);
    
    // 4、计算距离现在有多少秒
    CGFloat sinceNow = beforTime.timeIntervalSinceNow;
    NSLog(@"距离现在有多少秒 = %f",fabs(sinceNow));
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
