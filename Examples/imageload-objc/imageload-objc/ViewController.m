//
//  ViewController.m
//  imageload-objc
//
//  Created by Matthew Schmulen on 10/10/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation ViewController

- (IBAction)actionLoad:(id)sender {
    NSLog(@"Load Image");
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


#pragma internal


// This is a synchro call and will lock the main thread
- (void)loadImageFromURLSynchronous {
    NSString *imageURL = self.textField.text;
    NSData *image = [NSData dataWithContentsOfURL: [NSURL URLWithString:imageURL]];
    self.imageView.image = [UIImage imageWithData:image];
    
    /*
    NSURL *url = [NSURL URLWithString:path];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc] initWithData:data cache:NO];
    */
}

- (void)loadImageFromURLASynchronous {
    NSString *imageURL = self.textField.text;
    
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:imageURL]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            NSLog(@"block callback");
            self.imageView.image = [UIImage imageWithData:data];
    }];
    
}


// Using https://github.com/rs/SDWebImage
-(void)loadImageFromURLSDWebImage
{
    //#import "UIImageView+WebCache.h"
    //[self.imageView setImageWithURL:[NSURL URLWithString:@"http://www.domain.com/path/to/image.jpg"] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    
}




/* 
 
 With Dispatch QUEU
 
 This is a three step process. First you will create an NSURL object to hold the URL we are attempting to access. We will supply this URL to the NSData class method, +dataWithContentsOfURL: to obtain the image over the network as raw data, then use the +imageWithData: class method on UIImage to convert the data into an image.
 
 NSURL *imageURL = [NSURL URLWithString:@"http://example.com/demo.jpg"];
 NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
 UIImage *image = [UIImage imageWithData:imageData];
 Please note that +dataWithContentsOfURL: executes a synchronous network request. If you run this on the main thread, it will block the UI until the image data is received from the network. Best practice is to run any network code on a background thread. If you're targeting OS 4.0+ you could do something like this...
 
 NSURL *imageURL = [NSURL URLWithString:@"http://example.com/demo.jpg"];
 
 dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
 NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
 
 dispatch_async(dispatch_get_main_queue(), ^{
 // Update the UI
 self.imageView.image = [UIImage imageWithData:imageData];
 });
 });

 */


/*
 USING GCD
 
 NSString *imgURL = @"imagUrl";
 
 NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]];
 
 [YourImgView setImage:[UIImage imageWithData:data]];
 Using GCD : If you don't want to hang your application then you can download your image in background.
 
 dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
 NSString *imgURL = @"imagUrl";
 NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]];
 
 //set your image on main thread.
 dispatch_async(dispatch_get_main_queue(), ^{
 [YourImgView setImage:[UIImage imageWithData:data]];
 });
 });
 
 */


#pragma internal-saveToDisk


-(void) SaveImageToFile: (UIImage*)image {
    if ( image != nil )
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *path = [documentsDirectory stringByAppendingPathComponent:@"test.png" ];
        NSData *data = UIImagePNGRepresentation(image);
        [data writeToFile:path atomically:YES];
    }
}

- (UIImage*) LoadImageFromFile: (NSString*)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString* path = [documentsDirectory stringByAppendingPathComponent:fileName ];
    UIImage* image = [UIImage imageWithContentsOfFile:path];
    return image;
}

@end
