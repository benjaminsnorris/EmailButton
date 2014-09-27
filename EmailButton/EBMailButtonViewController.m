//
//  EBMailButtonViewController.m
//  EmailButton
//
//  Created by Joshua Howland on 6/5/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "EBMailButtonViewController.h"
#import <MessageUI/MessageUI.h>

@interface EBMailButtonViewController () <MFMailComposeViewControllerDelegate>

@end

@implementation EBMailButtonViewController

- (IBAction)sendEmail:(id)sender {
    MFMailComposeViewController *mailViewController = [MFMailComposeViewController new];
    mailViewController.mailComposeDelegate = self;
    [mailViewController setSubject:@"My great feedback"];
    [mailViewController setToRecipients:@[@"ben@bsn.io"]];
    [mailViewController setMessageBody:@"I love this app so much! This is why:\n" isHTML:NO];
    
    if ([MFMailComposeViewController canSendMail]) {
        [self presentViewController:mailViewController animated:YES completion:^{
            // Code that would run after the view is presented
        }];
    }
    
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [controller dismissViewControllerAnimated:YES completion:nil];
}


@end
