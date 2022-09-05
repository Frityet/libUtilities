#include <stdio.h>
#include <stdlib.h>

#include <utilities/dialogues/message.h>

int main(void)
{
    char arr[102];
    
    int errc = utilities_MessageDialogue_show(&(struct utilities_MessageDialogue) {
                                                                                .window.title = "Test message",
                                                                                .message = "Hello, World!",
                                                                                .option_count = 2,
                                                                                .options = (const char *[]) {
                                                                                    "Au",
                                                                                    "Revoir!"
                                                                                }
                                                                            }, NULL);
}
