//
//  VCMainViewController.m
//  抽屉效果
//
//  Created by WangXueqi on 16/12/7.
//  Copyright © 2016年 JingBei. All rights reserved.
//

#import "VCMainViewController.h"
#import "VCTabbarViewController.h"
#import "UIView+Category.h"
#import "ZYWSideView.h"
@interface VCMainViewController ()

@end

@implementation VCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatSubView];
    [self addTabbarView];
    [self addRecognizer];
}

-(void)creatSubView{

    //在self.view上创建一个透明的View
    ZYWSideView *mainView=[[ZYWSideView alloc]initWithFrame:CGRectMake(-self.view.frame.size.width*0.25,0,self.view.bounds.size.width,self.view.bounds.size.height)];
    
    //设置冰川背景图
    UIImageView *img=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sidebar_bg"]];
    img.frame=CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height*0.4);
    
    [self.view addSubview:img];
    
    //添加
    [self.view addSubview:mainView];
    
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(zhuchuanzuo:) name:@"主传左" object:nil];
}

-(void)zhuchuanzuo:(NSNotification *)notify{
    
    //获取最右边范围
    CGAffineTransform  rightScopeTransform=CGAffineTransformTranslate(self.view.transform,[UIScreen mainScreen].bounds.size.width*0.5, 0);
    
    [UIView animateWithDuration:0.2 animations:^{
        
        //    当移动到右边极限时
        if ([self.view.subviews objectAtIndex:2].ttx == 0) {
            
            //        限制最右边的范围
            [self.view.subviews objectAtIndex:2].transform=rightScopeTransform;
            //        限制透明view最右边的范围
            [self.view.subviews objectAtIndex:1].ttx=[self.view.subviews objectAtIndex:2].ttx/2;
            
            //        当移动到左边极限时
        }else{
            
            //        限制最左边的范围
            [self.view.subviews objectAtIndex:2].transform=CGAffineTransformTranslate(self.view.transform,0, 0);
            //    限制透明view最左边的范围
            [self.view.subviews objectAtIndex:1].ttx=[self.view.subviews objectAtIndex:2].ttx/2;
            
        }
    }];
    
//    [UIView animateWithDuration:0.2 animations:^{
//        
//        if ([self.view.subviews objectAtIndex:2].x >[UIScreen mainScreen].bounds.size.width*0.5) {
//            
//            [self.view.subviews objectAtIndex:2].transform=rightScopeTransform;
//            
//            [self.view.subviews objectAtIndex:1].ttx=[self.view.subviews objectAtIndex:2].ttx/3;
//            
//        }else{
//            
//            [self.view.subviews objectAtIndex:2].transform = CGAffineTransformIdentity;
//            
//            [self.view.subviews objectAtIndex:1].ttx=[self.view.subviews objectAtIndex:2].ttx/3;
//        }
//    }];
}

//添加手势
-(void)addRecognizer{
    //    添加拖拽
    UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(didPanEvent:)];
    
    [self.view addGestureRecognizer:pan];
}


//实现拖拽
-(void)didPanEvent:(UIPanGestureRecognizer *)recognizer{
    
    
    // 1. 获取手指拖拽的时候, 平移的值
    CGPoint translation = [recognizer translationInView:[self.view.subviews objectAtIndex:2]];
    
    // 2. 让当前控件做响应的平移
    [self.view.subviews objectAtIndex:2].transform = CGAffineTransformTranslate([self.view.subviews objectAtIndex:2].transform, translation.x, 0);
    
//    NSLog(@"self.view.subviews === %@ self.view.subviews.count === %lu ",self.view.subviews[2],(unsigned long)self.view.subviews.count);
    
    [self.view.subviews objectAtIndex:1].ttx=[self.view.subviews objectAtIndex:2].ttx/3;
    
    // 3. 每次平移手势识别完毕后, 让平移的值不要累加
    [recognizer setTranslation:CGPointZero inView:[self.view.subviews objectAtIndex:2]];
    
    //获取最右边范围
    CGAffineTransform  rightScopeTransform=CGAffineTransformTranslate(self.view.transform,[UIScreen mainScreen].bounds.size.width*0.75, 0);
    
    //    当移动到右边极限时
    if ([self.view.subviews objectAtIndex:2].transform.tx>rightScopeTransform.tx) {
        
        //        限制最右边的范围
        [self.view.subviews objectAtIndex:2].transform=rightScopeTransform;
        //        限制透明view最右边的范围
        [self.view.subviews objectAtIndex:1].ttx=[self.view.subviews objectAtIndex:2].ttx/3;
        
        //        当移动到左边极限时
    }else if ([self.view.subviews objectAtIndex:2].transform.tx<0.0){
        
        //        限制最左边的范围
        [self.view.subviews objectAtIndex:2].transform=CGAffineTransformTranslate(self.view.transform,0, 0);
        //    限制透明view最左边的范围
        [self.view.subviews objectAtIndex:1].ttx=[self.view.subviews objectAtIndex:2].ttx/3;
        
    }
    //    当托拽手势结束时执行
    if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        [UIView animateWithDuration:0.2 animations:^{
            
            if ([self.view.subviews objectAtIndex:2].x >[UIScreen mainScreen].bounds.size.width*0.5) {
                
                [self.view.subviews objectAtIndex:2].transform=rightScopeTransform;
                
                [self.view.subviews objectAtIndex:1].ttx=[self.view.subviews objectAtIndex:2].ttx/3;
                
            }else{
                
                [self.view.subviews objectAtIndex:2].transform = CGAffineTransformIdentity;
                
                [self.view.subviews objectAtIndex:1].ttx=[self.view.subviews objectAtIndex:2].ttx/3;
            }
        }];
    }
}

-(void)addTabbarView{

    VCTabbarViewController * vct = [[VCTabbarViewController alloc]init];
    [self addChildViewController:vct];
    [self.view addSubview:vct.view];
    vct.view.frame = self.view.bounds;
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
