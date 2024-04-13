hdc file send D:\download\traced_opt-125m.pt /data/app/el2/100/base/com.boogiepop.myapplication/haps/entry/files
hdc file send E:\codes\code-2023-2\ipads\HarmonyFlow\entry\src\main\resources\rawfile\merges.txt /data/app/el2/100/base/com.boogiepop.myapplication/haps/entry/files
hdc file send E:\codes\code-2023-2\ipads\HarmonyFlow\entry\src\main\resources\rawfile\vocab.json /data/app/el2/100/base/com.boogiepop.myapplication/haps/entry/files
hdc shell
cd /data/app/el2/100/base/com.boogiepop.myapplication/haps/entry/files
chown 20010049:20010049 traced_opt-125m.pt
chown 20010049:20010049 vocab.json
chown 20010049:20010049 merges.txt