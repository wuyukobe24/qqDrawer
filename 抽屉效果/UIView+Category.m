//
//  UIView+Category.m
//  抽屉效果
//
//  Created by WangXueqi on 16/12/7.
//  Copyright © 2016年 JingBei. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

-(CGFloat)x{
    return self.frame.origin.x;
}
-(void)setX:(CGFloat)x{
    CGRect frame=self.frame;
    frame.origin.x=x;
    self.frame=frame;
}



-(CGFloat)y{
    return self.frame.origin.y;
}
-(void)setY:(CGFloat)y{
    CGRect frame=self.frame;
    frame.origin.y=y;
    self.frame=frame;
}


-(CGFloat)w{
    return self.frame.size.width;
}
-(void)setW:(CGFloat)w{
    CGRect frame=self.frame;
    frame.size.width=w;
    self.frame=frame;
}



-(CGFloat)h{
    return self.frame.size.height;
}
-(void)setH:(CGFloat)h{
    CGRect frame=self.frame;
    frame.size.height=h;
    self.frame=frame;
}








-(CGFloat)ttx{
    return self.transform.tx;
}
-(void)setTtx:(CGFloat)ttx{
    CGAffineTransform  transform=self.transform;
    transform.tx=ttx;
    self.transform=transform;
    
    
}




-(CGFloat)tty{
    return self.transform.ty;
}
-(void)setTty:(CGFloat)tty{
    CGAffineTransform  transform=self.transform;
    transform.ty=tty;
    self.transform=transform;
    
    
}


@end
