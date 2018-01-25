//
//  ViewController.m
//  OPOOC
//
//  Created by doushuyao on 2018/1/17.
//  Copyright © 2018年 opooc. All rights reserved.
//

#import "DSYSmartFindImage.h"
#import  "MobileNet.h"
#import "AFNetworking.h"
#import "MD5Tool.h"
#import "SuPhotoPicker.h"
#import "DSYDefines.h"

@interface DSYSmartFindImage ()
@property(nonatomic,strong)UILabel* bal;
@property(nonatomic,strong)NSString* sss;
@property(nonatomic,strong)UIButton*imageBtn;
@property(nonatomic,strong)UIImage* checkimage;
@end

@implementation DSYSmartFindImage


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"science_bg"]];
    _imageBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    _imageBtn.frame =CGRectMake((SCREEN_WIDTH-150)*0.5, 100, 150, 150);
    [_imageBtn setImage:[UIImage imageNamed:@"sum"] forState:UIControlStateNormal];
    [_imageBtn addTarget:self action:@selector(sum)   forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_imageBtn];
    
    
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake((SCREEN_WIDTH-250)*0.5, CGRectGetMaxY(_imageBtn.frame)+20, 250 , 40);
//    btn.backgroundColor = [UIColor redColor];
    //[btn setTitle:@"查一查" forState:UIControlStateNormal];
  
    
    
   
    [btn setBackgroundImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
    btn.layer.cornerRadius = 10;
    btn.layer.borderColor = [UIColor blueColor].CGColor;
    btn.layer.borderWidth = 1;
    [btn.layer masksToBounds];
    btn.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    
    _bal = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2 -50,  self.view.frame.size.height /2 -50, 200  , 200)];
    _bal.text = @"what it is?";
    _bal.textAlignment = 0;
    _bal.font = [UIFont systemFontOfSize:24.f];
    _bal.textColor = [UIColor blueColor];
    [self.view addSubview:_bal];
    
    
  
    
    [btn addTarget:self action:@selector(delaiwe) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)sum{
    SuPhotoPicker * picker = [[SuPhotoPicker alloc]init];
    //最大选择图片的数量以及最大快速预览图片的数量，默认为20
    picker.selectedCount = 1;
    picker.preViewCount = 1;
    //现在在界面上
    [picker showInSender:self handle:^(NSArray<UIImage *> *photos) {
        if ([photos firstObject] != nil) {
            
        
            [_imageBtn setImage:[photos firstObject] forState:UIControlStateNormal];
            _checkimage = [photos firstObject];
        }
        else{
            
        }
    }];
    
    
    
}
-(NSString *)replaceUnicode:(NSString *)unicodeStr {
    
    NSString *tempStr1 = [unicodeStr stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
                                                           mutabilityOption:NSPropertyListImmutable
                                                                     format:NULL
                                                           errorDescription:NULL];
    
    //NSLog(@"Output = %@", returnStr);
    
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
}
-(void)moxing{
    
}
-(void)delaiwe{
    MobileNet *model = [[MobileNet alloc] init];
    NSError* error = nil;
    if (_checkimage == nil) {
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您还未选择照片" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* act1 = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:act1];
        [self presentViewController:alert animated:YES completion:nil];
        
        
    }
    else{
        
        UIImage* image = _checkimage;
        CGSize a = CGSizeMake(224, 224);
        image = [self reSizeImage:image toSize:a];
        
        CGImageRef temimage = image.CGImage;
        CVPixelBufferRef buffer = [self pixelBufferFromCGImage:temimage];
        MobileNetInput* mobileNetInput = [[MobileNetInput alloc]initWithImage:buffer];
        MobileNetOutput* output = [model predictionFromFeatures:mobileNetInput error:&error];
        
        NSLog(@"%@",output.classLabel);
        _sss =output.classLabel;
        
    
    
    NSString *unicodeStr = [NSString stringWithCString:[_sss UTF8String] ];
    NSLog(@"%@",unicodeStr);
    NSString* salt =@"1";
    NSString* appid = @"20180117000116048";
    NSString* miyue = @"MZeGEWBHQh85biYUiG14";
    NSString* signp = [NSString stringWithFormat:@"%@%@%@%@",appid,unicodeStr,salt,miyue];
    NSString* sign = [MD5Tool MD5ForLower32Bate:signp];
    
    NSDictionary* dic = @{@"q":unicodeStr,
                          @"from":@"en",
                          @"to":@"zh",
                          @"appid":@"20180117000116048",
                          @"salt":salt,
                          @"sign":sign
                          };
    
    AFHTTPSessionManager* manageer  =[AFHTTPSessionManager manager];
    [manageer GET:@"http://api.fanyi.baidu.com/api/trans/vip/translate" parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
        NSLog(@"666");
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary* dic = responseObject;
        NSArray* arr = [dic objectForKey:@"trans_result"];
        NSDictionary* dddd = [arr firstObject];
        NSString* sttttt = [dddd objectForKey:@"dst"];
        NSString* sssss = [self replaceUnicode:sttttt];
        
        
        _bal.text = sssss;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        
    }];
    
    }
    
}
- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize

{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
    
}
- (CVPixelBufferRef)pixelBufferFromCGImage:(CGImageRef)image{
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], kCVPixelBufferCGImageCompatibilityKey,
                             [NSNumber numberWithBool:YES], kCVPixelBufferCGBitmapContextCompatibilityKey,
                             nil];
    
    CVPixelBufferRef pxbuffer = NULL;
    
    CGFloat frameWidth = CGImageGetWidth(image);
    CGFloat frameHeight = CGImageGetHeight(image);
    
    CVReturn status = CVPixelBufferCreate(kCFAllocatorDefault,
                                          frameWidth,
                                          frameHeight,
                                          kCVPixelFormatType_32ARGB,
                                          (__bridge CFDictionaryRef) options,
                                          &pxbuffer);
    
    NSParameterAssert(status == kCVReturnSuccess && pxbuffer != NULL);
    
    CVPixelBufferLockBaseAddress(pxbuffer, 0);
    void *pxdata = CVPixelBufferGetBaseAddress(pxbuffer);
    NSParameterAssert(pxdata != NULL);
    
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef context = CGBitmapContextCreate(pxdata,
                                                 frameWidth,
                                                 frameHeight,
                                                 8,
                                                 CVPixelBufferGetBytesPerRow(pxbuffer),
                                                 rgbColorSpace,
                                                 (CGBitmapInfo)kCGImageAlphaNoneSkipFirst);
    NSParameterAssert(context);
    CGContextConcatCTM(context, CGAffineTransformIdentity);
    CGContextDrawImage(context, CGRectMake(0,
                                           0,
                                           frameWidth,
                                           frameHeight),
                       image);
    CGColorSpaceRelease(rgbColorSpace);
    CGContextRelease(context);
    
    CVPixelBufferUnlockBaseAddress(pxbuffer, 0);
    
    return pxbuffer;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

