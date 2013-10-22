//
//  SWViewController.h
//  GestionDeFicheros
//
//  Created by Pablo Formoso Estada on 19/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <CoreMedia/CoreMedia.h>
#import <UIKit/UIKit.h>

@interface SWViewController : UIViewController <UIActionSheetDelegate,UINavigationControllerDelegate,
    UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *txLabel;
@property (weak, nonatomic) IBOutlet UIImageView *camaraImageView;

- (IBAction)readFile:(id)sender;
- (IBAction)addPhoto:(id)sender;

@end
