//
//  ViewController.m
//  YodleTriangleChallenge
//
//  Created by Michael Vilabrera on 5/8/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) NSArray *lineArray;
@property (nonatomic) NSString *triangleString;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // URL: http://www.yodlecareers.com/puzzles/triangle.txt
    [self triangleURLPull];
}

- (void) triangleURLPull {
    // create the url
    NSURL *triangleURL = [NSURL URLWithString:@"http://www.yodlecareers.com/puzzles/triangle.txt"];
    // create the request
    NSURLRequest *request = [NSURLRequest requestWithURL:triangleURL];
    
    // create the connection with the request and download
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    // make session pull the request
    [session dataTaskWithRequest:request];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:triangleURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        // transfer data to string, etc
        self.triangleString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", self.triangleString);
    }];
    [dataTask resume];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
