//
//  ARSCNView+DSYARscnView_ex.m
//  SmartCompus
//
//  Created by doushuyao on 2018/1/20.
//  Copyright © 2018年 opooc. All rights reserved.
//

#import "ARSCNView+DSYARscnView_ex.h"
#import <ARKit/ARKit.h>
#import <SceneKit/SceneKit.h>

@implementation ARSCNView (DSYARscnView_ex)

-(SCNVector3)worldVector:(CGPoint)position{
    ARFrame* frame ;
   NSArray*arr =  [frame hitTest:position types:ARHitTestResultTypeFeaturePoint];
    ARHitTestResult* aresult = [arr firstObject];
   
   float x = aresult.worldTransform.columns[3].x;
    float y =aresult.worldTransform.columns[3].y;
    float z = aresult.worldTransform.columns[3].z;
    
 return  SCNVector3Make(x,y,z);

    
}


@end
