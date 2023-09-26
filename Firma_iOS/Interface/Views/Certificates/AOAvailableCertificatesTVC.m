    //
    //  AOAvailableCertificatesTVC.m
    //  Firma_iOS
    //
    //  Created by Rocio Tovar on 25/3/15.
    //  Copyright (c) 2015 Atos. All rights reserved.
    //

#import "AOAvailableCertificatesTVC.h"
#import "GlobalConstants.h"
#import <MobileCoreServices/MobileCoreServices.h>

static NSString *const kAOAvailableCertificatesTVCCellIdentifier = @"AOCertificateFileCell";

@interface AOAvailableCertificatesTVC ()
{
    NSString *_selectedCertificate;
    NSArray *_filesArray;
    UIStoryboardSegue *_segue;
}

@property (strong, nonatomic) IBOutlet UILabel *messageLabel;

@end

@implementation AOAvailableCertificatesTVC

int const kFilesAppButtonNormalHeightConstraint = 40;
int const kFilesAppButtonZeroHeightConstraint = 0;

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView reloadData];
    _selectedCertificate = nil;
    _filesArray = [self findFiles:@[P12EXTENSION, PFXEXTENSION]];
    
    if (_filesArray.count == 0) {
        _messageLabel.text = @"certificate_instructions".localized;
    }
    
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [self.availableCertificatesDescriptionLabel setText: @"available_certificates_description_label".localized];
    self.title = @"available_certificates".localized;
    
        // Back button
    self.backButton.title = @"back".localized;
    
        // Files app button
    [self.filesAppButton setAttributedTitle: @"files_app_button".localized.linkStyle  forState:UIControlStateNormal];
    
    if (@available(iOS 11, *)) {
        self.filesAppButton.hidden = NO;
        self.filesAppButtonHeightConstraint.constant = kFilesAppButtonNormalHeightConstraint;
    } else {
        self.filesAppButton.hidden = YES;
        self.filesAppButtonHeightConstraint.constant = kFilesAppButtonZeroHeightConstraint;
    }
    
        // Logo
    self.logo.accessibilityLabel = @"logo".localized;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    _selectedCertificate = nil;
    _filesArray = nil;
}

#pragma mark - User Interaction

- (IBAction)didClickCancelButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)filesAppButtonTapped:(id)sender {
    UIDocumentPickerViewController  *documentProviderMenu = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:@[@"public.data"] inMode:UIDocumentPickerModeImport];
    documentProviderMenu.delegate = self;
    documentProviderMenu.modalPresentationStyle = UIModalPresentationPopover;
    UIPopoverPresentationController *popPC = documentProviderMenu.popoverPresentationController;
    documentProviderMenu.popoverPresentationController.sourceRect = self.filesAppButton.frame;
    documentProviderMenu.popoverPresentationController.sourceView = self.view;
    popPC.permittedArrowDirections = UIPopoverArrowDirectionAny;
    [self presentViewController:documentProviderMenu animated:YES completion:nil];
}

#pragma mark - Certificates Methods

- (NSArray *)findFiles:(NSArray *)extensions
{
#if TARGET_IPHONE_SIMULATOR
    
    NSMutableArray *arrayCertsMut = [[NSMutableArray alloc] init];
    
    [arrayCertsMut addObject:ANF_PF_ACTIVO];
    [arrayCertsMut addObject:PF_ACTIVO_FIR_SHA1];
    [arrayCertsMut addObject:PRUEBAS_PORTAFIRMAS];
    
    return arrayCertsMut;
    
#else
    
    NSMutableArray *matches = [@[] mutableCopy];
    NSFileManager *fManager = [NSFileManager defaultManager];
    NSString *item;
    NSString *ext;
    NSArray *contents = [fManager contentsOfDirectoryAtPath:[NSHomeDirectory() stringByAppendingPathComponent:DOCUMENTS] error:nil];
    
    for (item in contents) {
        for (ext in extensions) {
            if ([[item pathExtension] isEqualToString:ext]) {
                [matches addObject:item];
            }
        }
    }
    
    return matches;
    
#endif /* if TARGET_IPHONE_SIMULATOR */
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _filesArray ? _filesArray.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kAOAvailableCertificatesTVCCellIdentifier];
    cell.textLabel.text = _filesArray[indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedCertificate = _filesArray[indexPath.row];
    if (!_selectedCertificate) {
        NSIndexPath *selectedRowIndexPath = [self.tableView indexPathForSelectedRow];
        _selectedCertificate = _filesArray[selectedRowIndexPath.row];
    }
    AORegisterCertificateVC *registerCertificateVC  = [_segue destinationViewController];
    registerCertificateVC.selectedCertificate = _selectedCertificate;
    registerCertificateVC.modalPresentationStyle = 17;
    [registerCertificateVC setDelegate:self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    _segue = segue;
}

#pragma mark - AORegisterCertificateVCDelegate

- (void)certificateAdded
{
    [self didClickCancelButton:nil];
}

- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentAtURL:(NSURL *)url {
    if (controller.documentPickerMode == UIDocumentPickerModeImport) {
        
        NSString* fileType = [url.lastPathComponent pathExtension];
        Boolean correctFileType = false ;
        NSString *alertMessage = [NSString stringWithFormat: @"files_app_alert_message_incorrect_file".localized, [url lastPathComponent]];
        if ([fileType  isEqualToString: P12EXTENSION] || [fileType  isEqualToString: PFXEXTENSION]) {
            correctFileType = true;
        }
        
        if (correctFileType) {
            NSFileManager *fileManager = [NSFileManager defaultManager];
            NSError *copyError = nil;
            NSURL* documentDirectory = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] objectAtIndex:0];
            NSURL* fileDirectory = [documentDirectory URLByAppendingPathComponent: url.lastPathComponent isDirectory:YES];
            [fileManager copyItemAtURL:url toURL: fileDirectory error:&copyError];
            if (!copyError)
            {
                alertMessage = [NSString stringWithFormat: @"files_app_alert_message_success".localized, [url lastPathComponent]];
            }
            else
            {
                alertMessage = [NSString stringWithFormat: @"files_app_alert_message_cannot_add_certificate".localized, [url lastPathComponent]];
            }
            _filesArray = [self findFiles:@[P12EXTENSION, PFXEXTENSION]];
            [self.tableView reloadData];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle: nil
                                                  message:alertMessage
                                                  preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle: @"files_app_alert_affirmative_button".localized style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alertController animated:YES completion:nil];
            
        });
    }
}

- (void)documentMenu:(nonnull UIDocumentPickerViewController  *)documentMenu didPickDocumentPicker:(nonnull UIDocumentPickerViewController *)documentPicker {
    documentPicker.delegate = self;
    [self presentViewController:documentPicker animated:YES completion:nil];
}

@end
