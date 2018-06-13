//
//  SYViewController.m
//  SYEmailHelperExample
//
//  Created by Stanislas Chevallier on 08/02/2017.
//  Copyright © 2017 Syan. All rights reserved.
//

#import "SYViewController.h"
#import "SYEmailHelper.h"

@interface SYViewController ()
@property (nonatomic, weak) IBOutlet UITextField *fieldEmail;
@property (nonatomic, weak) IBOutlet UITextField *fieldSubject;
@property (nonatomic, weak) IBOutlet UITextField *fieldBody;
@property (nonatomic, weak) IBOutlet UILabel *labelCompletion;
@end

@implementation SYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.labelCompletion setText:nil];
}

- (IBAction)buttonSendTap:(id)sender
{
    [self.labelCompletion setText:nil];
    
    [SYEmailServicePasteboard setName:@"Copy email address to pasteboard"];
    [[SYEmailHelper shared] setShowCopyToPasteboard:YES];
    [[SYEmailHelper shared] setActionSheetTitleText:@"Which app you wanna use?"];
    [[SYEmailHelper shared] setActionSheetCancelButtonText:@"fuhgeddaboudit"];
    [[SYEmailHelper shared] composeEmailWithAddress:self.fieldEmail.text
                                            subject:self.fieldSubject.text
                                               body:self.fieldBody.text
                                       presentingVC:self
                                         completion:
     ^(BOOL userCancelled, SYEmailService *service, NSError *error)
    {
        if (userCancelled)
            self.labelCompletion.text = @"User cancelled";
        else if (service && error)
            self.labelCompletion.text = [NSString stringWithFormat:@"Service %@ encountered error: %@", service.name, error.localizedDescription];
        else if (error)
            self.labelCompletion.text = [NSString stringWithFormat:@"Encountered error: %@", error.localizedDescription];
        else
            self.labelCompletion.text = [NSString stringWithFormat:@"No error, used service %@", service.name];
    }];
}


@end
