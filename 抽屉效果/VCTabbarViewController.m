//
//  VCTabbarViewController.m
//  抽屉效果
//
//  Created by WangXueqi on 16/12/7.
//  Copyright © 2016年 JingBei. All rights reserved.
//

#import "VCTabbarViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "MiddleViewController.h"
@interface VCTabbarViewController ()

@end

@implementation VCTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addChildViewController];
}

-(void)addChildViewController{

    [self addChildViewController:[[LeftViewController alloc]init] andTitle:@"左边" andImageName:@"tab_buddy_"];
    
    [self addChildViewController:[[MiddleViewController alloc]init] andTitle:@"中间" andImageName:@"tab_recent_"];
    
    [self addChildViewController:[[RightViewController alloc]init] andTitle:@"右边" andImageName:@"tab_qworld_"];
}

-(void)addChildViewController:(UIViewController *)VC andTitle:(NSString *)title andImageName:(NSString *)imageName{
    
    VC.title=title;
    VC.tabBarItem.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@nor",imageName]];
    
    VC.tabBarItem.selectedImage=[UIImage imageNamed:[NSString stringWithFormat:@"%@press",imageName]];
    
    self.tabBar.tintColor=[UIColor colorWithRed:13/255.0 green:184/255.0 blue:246/255.0 alpha:1];
    
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:VC];
    
    
    [self addChildViewController:nav];
    
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
