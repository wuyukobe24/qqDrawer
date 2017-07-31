//
//  MiddleViewController.m
//  抽屉效果
//
//  Created by WangXueqi on 16/12/7.
//  Copyright © 2016年 JingBei. All rights reserved.
//

#import "MiddleViewController.h"

@interface MiddleViewController ()

@end

@implementation MiddleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem * btnItem = [[UIBarButtonItem alloc]initWithTitle:@"点击" style:UIBarButtonItemStylePlain target:self action:@selector(btnClick)];
    self.navigationItem.leftBarButtonItem = btnItem;
    
    [self addSubView];
    
}

//获取某一天的前天和后天日期
-(void)addSubView{
 NSDate * date = [NSDate date];
//    NSString *dateString = @"2014-09-01";

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
//    NSDate *date = [formatter dateFromString:dateString];
   
    NSDate *yesterday = [NSDate dateWithTimeInterval:-7*60 * 60 * 24 sinceDate:date];
    NSDate *tomorrow = [NSDate dateWithTimeInterval:7*60 * 60 * 24 sinceDate:date];
    NSLog(@"yesterday %@    tomorrow %@", [formatter stringFromDate:yesterday], [formatter stringFromDate:tomorrow]);
    
    [self getMonthBeginAndEndWith:nil];
}

//获取某一天所在的周的第一天和最后一天（周一和周日）
- (void)getMonthBeginAndEndWith:(NSDate *)newDate{
    if (newDate == nil) {
        newDate = [NSDate date];
    }
    double interval = 0;
    NSDate *beginDate = nil;
    NSDate *endDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setFirstWeekday:2];//设定周一为周首日
    BOOL ok = [calendar rangeOfUnit:NSWeekCalendarUnit startDate:&beginDate interval:&interval forDate:newDate];
    //分别修改为 NSDayCalendarUnit NSWeekCalendarUnit NSYearCalendarUnit
    if (ok) {
        endDate = [beginDate dateByAddingTimeInterval:interval-2];
    }else {
        return;
    }
    NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];
//    [myDateFormatter setDateFormat:@"yyyy.MM.dd"];
    [myDateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *beginString = [myDateFormatter stringFromDate:beginDate];
    NSString *endString = [myDateFormatter stringFromDate:endDate];
    
    NSString *s = [NSString stringWithFormat:@"%@-%@",beginString,endString];
    
    NSLog(@"s === %@",s);
    
    //获取一周每一天
    NSMutableArray * array = [NSMutableArray array];

    for (int i = 0; i<7; i++) {
        NSDate *dayDate = [NSDate dateWithTimeInterval:i*60 * 60 * 24 sinceDate:beginDate];
        [myDateFormatter setDateFormat:@"dd"];
        NSString * dayStr = [myDateFormatter stringFromDate:dayDate];
        [array addObject:dayStr];
    }
    NSLog(@"array === %@",array);
}



-(void)btnClick{
    
    //    发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"主传左" object:nil];
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
