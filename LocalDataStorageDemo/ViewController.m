//
//  ViewController.m
//  LocalDataStorageDemo
//
//  Created by Prateek Gianchandani on 07/10/13.
//  Copyright (c) 2013 Prateek Gianchandani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField *userDefaultsTextField;
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *keychainTextField;

- (IBAction)saveInUserDefaultsTapped:(id)sender;
- (IBAction)saveInPlistFileTapped:(id)sender;
- (IBAction)saveInKeychainTapped:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveInUserDefaultsTapped:(id)sender {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  [defaults setObject:self.userDefaultsTextField.text forKey:@"DemoValue"];
  [defaults synchronize];
}

- (IBAction)saveInPlistFileTapped:(id)sender {
  NSString *path = [[NSBundle mainBundle] pathForResource:@"userInfo" ofType:@"plist"];
  NSMutableDictionary* plist = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
  [plist setValue:self.usernameTextField.text forKey:@"username"];
  [plist setValue:self.passwordTextField.text forKey:@"passwprd"];
  [plist writeToFile:path atomically:YES];
}

- (IBAction)saveInKeychainTapped:(id)sender {
}


@end
