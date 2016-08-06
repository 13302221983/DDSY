//
//  Macro.h
//  DiDiSongYou
//
//  Created by Wayne on 6/16/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

#define begin_run_background_thread dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^
#define end_run_background_thread );

#define begin_run_main dispatch_async(dispatch_get_main_queue(), ^
#define end_run_main );

#endif /* Macro_h */
