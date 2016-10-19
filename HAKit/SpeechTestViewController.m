//
//  SpeechTestViewController.m
//  HAKit
//
//  Created by 🐷 on 16/10/19.
//  Copyright © 2016年 🐷. All rights reserved.
//

#import "SpeechTestViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface SpeechTestViewController ()

@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;

@end

@implementation SpeechTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.synthesizer = [[AVSpeechSynthesizer alloc]init];
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"FlyElephant，这是一个测试，哈哈"];
    AVSpeechSynthesisVoice *voiceType = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN, zh-HK, zh-TW"];
    utterance.voice = voiceType;
    //设置语速
    utterance.rate *= 0.9;
    //设置音量
    utterance.volume = 0.6;
    
    [self.synthesizer speakUtterance:utterance];
    
    /* 
     
     *****  支持语言  *****
     
     Arabic (ar-SA)
     Chinese (zh-CN, zh-HK, zh-TW)
     Czech (cs-CZ)
     Danish (da-DK)
     Dutch (nl-BE, nl-NL)
     English (en-AU, en-GB, en-IE, en-US, en-ZA)
     Finnish (fi-FI)
     French (fr-CA, fr-FR)
     German (de-DE)
     Greek (el-GR)
     Hebrew (he-IL)
     Hindi (hi-IN)
     Hungarian (hu-HU)
     Indonesian (id-ID)
     Italian (it-IT)
     Japanese (ja-JP)
     Korean (ko-KR)
     Norwegian (no-NO)
     Polish (pl-PL)
     Portuguese (pt-BR, pt-PT)
     Romanian (ro-RO)
     Russian (ru-RU)
     Slovak (sk-SK)
     Spanish (es-ES, es-MX)
     Swedish (sv-SE)
     Thai (th-TH)
     Turkish (tr-TR)
     
     */
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.synthesizer stopSpeakingAtBoundary:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
