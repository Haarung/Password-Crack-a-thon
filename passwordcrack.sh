codepath@lab000000:~$ cd unit3
codepath@lab000000:~/unit3$ ls
cp_leak.txt  crackB.txt  crackChallenge.txt  lower.lst
crackA.txt   crackC.txt  crackfiles.zip      rockyou.txt
codepath@lab000000:~/unit3$ wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt
--2024-11-30 20:12:16--  https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt
Resolving github.com (github.com)... 140.82.112.3
Connecting to github.com (github.com)|140.82.112.3|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://objects.githubusercontent.com/github-production-release-asset-2e65be/97553311/d4f580f8-6b49-11e7-8f70-7f460f85ab3a?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20241130%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20241130T201216Z&X-Amz-Expires=300&X-Amz-Signature=ad43ad6b1542ba12eb41146aff07c254bdc11e38a358925bde74e38c221c3f8a&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3Drockyou.txt&response-content-type=application%2Foctet-stream [following]
--2024-11-30 20:12:16--  https://objects.githubusercontent.com/github-production-release-asset-2e65be/97553311/d4f580f8-6b49-11e7-8f70-7f460f85ab3a?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20241130%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20241130T201216Z&X-Amz-Expires=300&X-Amz-Signature=ad43ad6b1542ba12eb41146aff07c254bdc11e38a358925bde74e38c221c3f8a&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3Drockyou.txt&response-content-type=application%2Foctet-stream
Resolving objects.githubusercontent.com (objects.githubusercontent.com)... 185.199.109.133, 185.199.110.133, 185.199.111.133, ...
Connecting to objects.githubusercontent.com (objects.githubusercontent.com)|185.199.109.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 139921497 (133M) [application/octet-stream]
Saving to: ‘rockyou.txt.1’

rockyou.txt.1       100%[===================>] 133.44M   220MB/s    in 0.6s    

2024-11-30 20:12:17 (220 MB/s) - ‘rockyou.txt.1’ saved [139921497/139921497]

codepath@lab000000:~/unit3$ ls
cp_leak.txt  crackB.txt  crackChallenge.txt  lower.lst    rockyou.txt.1
crackA.txt   crackC.txt  crackfiles.zip      rockyou.txt
codepath@lab000000:~/unit3$ less -N ./rockyou.txt
codepath@lab000000:~/unit3$ john --single crackA.txt
Warning: detected hash type "md5crypt", but the string is also recognized as "md5crypt-long"
Use the "--format=md5crypt-long" option to force loading these as that type instead
Warning: detected hash type "md5crypt", but the string is also recognized as "md5crypt-opencl"
Use the "--format=md5crypt-opencl" option to force loading these as that type instead
Using default input encoding: UTF-8
Loaded 3 password hashes with 3 different salts (md5crypt, crypt(3) $1$ (and variants) [MD5 512/512 AVX512BW 16x3])
Will run 2 OpenMP threads
Press 'q' or Ctrl-C to abort, 'h' for help, almost any other key for status
kantograss       (bulbasaur)     
waterSquirtle    (squirtle)     
charizard22      (charmander)     
3g 0:00:00:00 DONE (2024-11-30 20:15) 9.091g/s 29081p/s 29090c/s 29090C/s charizardfire83..charmander23
Use the "--show" option to display all of the cracked passwords reliably
Session completed. 
codepath@lab000000:~/unit3$ john --show crackA.txt
squirtle:waterSquirtle:1001:1001:blastoise,,,water:/home/squirtle:/bin/bash
charmander:charizard22:1001:1001:charizard,,,fire:/home/charmander:/bin/bash
bulbasaur:kantograss:1001:1001:venusaur,kanto,,grass:/home/charmander:/bin/bash

3 password hashes cracked, 0 left
codepath@lab000000:~/unit3$ john --wordlist=lower.lst crackB.txt
Warning: detected hash type "md5crypt", but the string is also recognized as "md5crypt-long"
Use the "--format=md5crypt-long" option to force loading these as that type instead
Warning: detected hash type "md5crypt", but the string is also recognized as "md5crypt-opencl"
Use the "--format=md5crypt-opencl" option to force loading these as that type instead
Using default input encoding: UTF-8
Loaded 3 password hashes with 3 different salts (md5crypt, crypt(3) $1$ (and variants) [MD5 512/512 AVX512BW 16x3])
Will run 2 OpenMP threads
Press 'q' or Ctrl-C to abort, 'h' for help, almost any other key for status
paper            (jim)     
1g 0:00:00:00 DONE (2024-11-30 20:16) 1.887g/s 51639p/s 136607c/s 136607C/s yon..zymase
Use the "--show" option to display all of the cracked passwords reliably
Session completed. 
codepath@lab000000:~/unit3$ john --wordlist=lower.lst crackB.txt --rules=l33t
Warning: detected hash type "md5crypt", but the string is also recognized as "md5crypt-long"
Use the "--format=md5crypt-long" option to force loading these as that type instead
Warning: detected hash type "md5crypt", but the string is also recognized as "md5crypt-opencl"
Use the "--format=md5crypt-opencl" option to force loading these as that type instead
Using default input encoding: UTF-8
Loaded 3 password hashes with 3 different salts (md5crypt, crypt(3) $1$ (and variants) [MD5 512/512 AVX512BW 16x3])
Cracked 1 password hash (is in /home/codepath/snap/john-the-ripper/639/.john/john.pot), use "--show"
Remaining 2 password hashes with 2 different salts
Will run 2 OpenMP threads
Press 'q' or Ctrl-C to abort, 'h' for help, almost any other key for status
Enabling duplicate candidate password suppressor
b33t             (dwight)     
1g 0:00:00:12 DONE (2024-11-30 20:19) 0.08251g/s 93076p/s 95928c/s 95928C/s 14m3nt4ti0n$..Z3410u$
Use the "--show" option to display all of the cracked passwords reliably
Session completed. 
codepath@lab000000:~/unit3$ john --wordlist=lower.lst crackB.txt --rules=shifttoggle
Warning: detected hash type "md5crypt", but the string is also recognized as "md5crypt-long"
Use the "--format=md5crypt-long" option to force loading these as that type instead
Warning: detected hash type "md5crypt", but the string is also recognized as "md5crypt-opencl"
Use the "--format=md5crypt-opencl" option to force loading these as that type instead
Using default input encoding: UTF-8
Loaded 3 password hashes with 3 different salts (md5crypt, crypt(3) $1$ (and variants) [MD5 512/512 AVX512BW 16x3])
Cracked 2 password hashes (are in /home/codepath/snap/john-the-ripper/639/.john/john.pot), use "--show"
Remaining 1 password hash
Will run 2 OpenMP threads
Press 'q' or Ctrl-C to abort, 'h' for help, almost any other key for status
Enabling duplicate candidate password suppressor
tEaPoT           (pam)     
1g 0:00:00:06 DONE (2024-11-30 20:20) 0.1464g/s 154949p/s 154949c/s 154949C/s tAiLcOat..tHrEaDy
Use the "--show" option to display all of the cracked passwords reliably
Session completed. 
codepath@lab000000:~/unit3$ john --show crackB.txt
jim:paper
pam:tEaPoT
dwight:b33t

3 password hashes cracked, 0 left
codepath@lab000000:~/unit3$ john --show crackA.txt
squirtle:waterSquirtle:1001:1001:blastoise,,,water:/home/squirtle:/bin/bash
charmander:charizard22:1001:1001:charizard,,,fire:/home/charmander:/bin/bash
bulbasaur:kantograss:1001:1001:venusaur,kanto,,grass:/home/charmander:/bin/bash

3 password hashes cracked, 0 left
codepath@lab000000:~/unit3$ john --incremental=digits --min-length=4 --max-length=6 crackC.txt
Warning: detected hash type "md5crypt", but the string is also recognized as "md5crypt-long"
Use the "--format=md5crypt-long" option to force loading these as that type instead
Warning: detected hash type "md5crypt", but the string is also recognized as "md5crypt-opencl"
Use the "--format=md5crypt-opencl" option to force loading these as that type instead
Using default input encoding: UTF-8
Loaded 3 password hashes with 3 different salts (md5crypt, crypt(3) $1$ (and variants) [MD5 512/512 AVX512BW 16x3])
Will run 2 OpenMP threads
Press 'q' or Ctrl-C to abort, 'h' for help, almost any other key for status
496821           (pinball)     
1g 0:00:00:18 DONE (2024-11-30 20:23) 0.05339g/s 59263p/s 170621c/s 170621C/s 68055..68716
Use the "--show" option to display all of the cracked passwords reliably
Session completed. 
codepath@lab000000:~/unit3$ john --mask=?d?u?l?l crackC.txt
Warning: detected hash type "md5crypt", but the string is also recognized as "md5crypt-long"
Use the "--format=md5crypt-long" option to force loading these as that type instead
Warning: detected hash type "md5crypt", but the string is also recognized as "md5crypt-opencl"
Use the "--format=md5crypt-opencl" option to force loading these as that type instead
Using default input encoding: UTF-8
Loaded 3 password hashes with 3 different salts (md5crypt, crypt(3) $1$ (and variants) [MD5 512/512 AVX512BW 16x3])
Cracked 1 password hash (is in /home/codepath/snap/john-the-ripper/639/.john/john.pot), use "--show"
Remaining 2 password hashes with 2 different salts
Will run 2 OpenMP threads
Press 'q' or Ctrl-C to abort, 'h' for help, almost any other key for status
8Bit             (pacman)     
1g 0:00:00:01 DONE (2024-11-30 20:24) 0.7143g/s 125542p/s 164765c/s 164765C/s 6Xxq..7Qqq
Use the "--show" option to display all of the cracked passwords reliably
Session completed. 
codepath@lab000000:~/unit3$ john --mask=?l?l?l?l?d! crackC.txt
Warning: detected hash type "md5crypt", but the string is also recognized as "md5crypt-long"
Use the "--format=md5crypt-long" option to force loading these as that type instead
Warning: detected hash type "md5crypt", but the string is also recognized as "md5crypt-opencl"
Use the "--format=md5crypt-opencl" option to force loading these as that type instead
Using default input encoding: UTF-8
Loaded 3 password hashes with 3 different salts (md5crypt, crypt(3) $1$ (and variants) [MD5 512/512 AVX512BW 16x3])
Cracked 2 password hashes (are in /home/codepath/snap/john-the-ripper/639/.john/john.pot), use "--show"
Remaining 1 password hash
Will run 2 OpenMP threads
Press 'q' or Ctrl-C to abort, 'h' for help, almost any other key for status
bugs7!           (frogger)     
1g 0:00:00:24 DONE (2024-11-30 20:25) 0.04052g/s 172115p/s 172115c/s 172115C/s yngs7!..rjgs7!
Use the "--show" option to display all of the cracked passwords reliably
Session completed. 
codepath@lab000000:~/unit3$ john --show crackC.txt
pinball:496821
pacman:8Bit
frogger:bugs7!

3 password hashes cracked, 0 left
codepath@lab000000:~/unit3$ john crackA.txt
Warning: detected hash type "md5crypt", but the string is also recognized as "md5crypt-long"
Use the "--format=md5crypt-long" option to force loading these as that type instead
Warning: detected hash type "md5crypt", but the string is also recognized as "md5crypt-opencl"
Use the "--format=md5crypt-opencl" option to force loading these as that type instead
Using default input encoding: UTF-8
Loaded 3 password hashes with 3 different salts (md5crypt, crypt(3) $1$ (and variants) [MD5 512/512 AVX512BW 16x3])
Cracked 3 password hashes (are in /home/codepath/snap/john-the-ripper/639/.john/john.pot), use "--show"
No password hashes left to crack (see FAQ)
codepath@lab000000:~/unit3$ john --show crackA.txt
squirtle:waterSquirtle:1001:1001:blastoise,,,water:/home/squirtle:/bin/bash
charmander:charizard22:1001:1001:charizard,,,fire:/home/charmander:/bin/bash
bulbasaur:kantograss:1001:1001:venusaur,kanto,,grass:/home/charmander:/bin/bash

3 password hashes cracked, 0 left
codepath@lab000000:~/unit3$
