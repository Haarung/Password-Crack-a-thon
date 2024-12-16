Before diving into this project, I plan to implement the single crack, wordlist, and incremental modes using John the Ripper, a password cracking tool. John is typically run locally on a test machine, but it also supports distributing the cracking process across multiple systems, allowing the algorithm to run on more processors and avoid duplicated efforts (for example, if one machine is already testing 'Password1234', the others won't repeat the attempt). I’m using this initial project to assess John’s limitations by running it against a hashed Linux password file and comparing the speeds of brute-force and educated guessing methods. The startercode.sh file will include both the implemented code and the results from today’s work.

I will split this project into 4 steps!

Step 0: Setting up

The first task is to verify that John is installed on my Ubuntu VM. While I’ll assume it’s not installed, I will execute the following command to install it: (sudo apt-get purge john -y && sudo snap install john-the-ripper && sudo reboot).

![image](https://github.com/user-attachments/assets/544db1ed-d03c-4ff5-bc7b-03de0134d029)
this reboot will close your ssh/rdp session. Connect to your VM again and the updates should be in place. 👋 Hello, John!

Step 1: Now lets find some password hashes to crack!

Unless the developer really messed up 👀, passwords will be stored and passed as hashes, never in plain text.

As a reminder, hashes are one-way calculations done against a file that always have the same result for the same file. This means something neat if you're a secure resource.

You don't need to store my password, just its hash! For example, let's say I make an account on your server: username: admin password: chinchillaFriend42 Rather than risk storing my password directly, you just make a note that my user's password, chinchillaFriend42, hashes to 6ccf. Later, I try to log in, and submit a password: chinchillaEnemy42, which hashes to 29da By comparing the hashes, you can figure out if I entered the correct password! (In this case, I did not, since 6ccf does not equal 29da. Alas!)

I have a folder called "unit3," and I will now navigate to it within my Ubuntu VM by using the command (cd unit3). Inside Unit 3, I will find all the files we'll be using for this project. I'll display the list of files and locate the crackfiles.zip file by running (ls crackfiles.zip).

![image](https://github.com/user-attachments/assets/9c1c5c2f-43d2-48a9-ac44-976105c762e2)

Then I will go ahead and unzip the folder (you can use the unzip command) and take a look at the files (using ls). 

![image](https://github.com/user-attachments/assets/1a20e351-12bd-449e-bd82-c33dce999c91)

Step 2: Explore the wordlists

In this step, I will add some popular wordlists to my Ubuntu boxes, and explore a bit.

Remember john (and other tools) crack password hashes by making educated guesses.
To make that easier, people create text files full of the most commonly used passwords -- Literally, a password-list.

Some versions of linux come with wordlists pre-installed, but we aren't so lucky. Let's go ahead and download a new wordlist from the internet:(wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt)

![image](https://github.com/user-attachments/assets/34445244-fbc3-4a3e-ae10-be0f42cd3172)

Awesome! We have the rockyou.txt wordlist, which is what real-world password crackers use! I will now use the ls command to view the files:
![image](https://github.com/user-attachments/assets/98c93f34-f17d-4257-aa80-d9a08aaa2469)

Next, I'll examine the rockyou wordlist by executing the command: (less -N ./rockyou.txt). The -N option displays line numbers. If you'd prefer not to see line numbers, you can simply run less without this flag. Below is a view of the well-known rockyou wordlist:

![image](https://github.com/user-attachments/assets/9fc1288b-1af9-4b5e-8360-df5e81dcb13e)
Now that I'm in this directory, I'll have some fun searching using the & key. Let me try typing &puppy and see what results I get:
![image](https://github.com/user-attachments/assets/85976274-dae3-462d-b77d-918f52ddb38b)

For this project, I will not be using rockyou.txt. Why? Because it's big, and takes a long time to run. Instead, I will use a much smaller wordlist, the provided lower.lst. Feel free to check it out too with less -N lower.lst!
![image](https://github.com/user-attachments/assets/1bda5724-253c-4c06-af64-93e1bec75df0)

Step 3: Cracking passwords with John

This is the step you've been waiting for! It's time to crack the passwords in the provided file. We're going to do this in a few different ways:

- Run John against our files in single crack mode

- Run John against our files in wordlist crack mode
- Stop and resume John in the middle of a crack.
- Run John against our files in incremental mode (brute-force)
- Stop John WITHOUT saving our place in the algorithm

SINGLE CRACK MODE (crackA.txt)

Single crack is a mode that uses information about the user (stored in the GECOS fields) to make educated guesses about the password.

For example, if the username is admin, single-crack mode will guess passwords like admin, admin1, ADMIN, admin=, etc...
GECOS fields aren't commonly used today, but they could also contain information like the user's full name, email address, and phone numbers.

If this data exists, John will use elements from all these fields to make guesses.

I'll work with the crackA.txt file. To begin, I'll run the John command in single crack mode using: (john --single crackA.txt). Below are the results:

![image](https://github.com/user-attachments/assets/e4be0771-fc6b-4995-9253-11559893b1ba)

I just successfully cracked all three pokemon's passwords! I will run john --show crackA.txt to view them.

![image](https://github.com/user-attachments/assets/3f965c93-edbc-4234-8fef-aff2939d9975)


