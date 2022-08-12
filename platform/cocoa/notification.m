#include "utilities/notification.h"

//#include <UserNotifications/UserNotifications.h>
//#include <Foundation/NSArray.h>

#include "common.m.h"

int utilities_Notification_show(const struct utilities_Notification *notification, int *resp)
{
    block long retc = 0;
//    UNUserNotificationCenter *center = UNUserNotificationCenter.currentNotificationCenter;
//    [center requestAuthorizationWithOptions: UNAuthorizationOptionBadge
//                          completionHandler: ^(BOOL is_error, NSError *err) {
//                                if (is_error) retc = err.code;
//                                retc = 0;
//                          }];
//
//    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
//    content.title = cstring_to_nsstring(notification->title);
//    content.body = notification->description == NULL ? @"" : cstring_to_nsstring(notification->description);
//
////    NSMutableArray<UNNotificationAction *> *actions = [NSMutableArray arrayWithCapacity: notification->option_count];
////    for (size_t i = 0; i < notification->option_count; i++)
////        [actions addObject: [UNNotificationAction actionWithIdentifier: [NSString stringWithFormat: @"net.frityet.libUtilities.%@.%s", content.title, notification->options[i]]
////                                                                 title: cstring_to_nsstring(notification->options[i])
////                                                               options: UNNotificationActionOptionNone]];
//
//
//    UNNotificationRequest *req = [UNNotificationRequest requestWithIdentifier: [NSString stringWithFormat: @"net.frityet.libUtilities.%@", content.title]
//                                                                      content: content
//                                                                      trigger: nil];
//
//    [center addNotificationRequest: req
//             withCompletionHandler: nil];

    return (int)retc;
}
