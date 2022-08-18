#include <stdio.h>
#include <stdlib.h>

#include <utilities/dialogues/message.h>

int main(void)
{
    int sel = 0;
    utilities_MessageDialogue_show(&(struct utilities_MessageDialogue) {
                                                                                .window.title = "Test"
                                                                            }, &sel);
}
