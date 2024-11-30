# Password-Crack-a-thon
![image](https://github.com/user-attachments/assets/03004e4b-dcac-4bef-b18c-6891e89a3452)

Cracking Passwords with John the Ripper 🔓
This project explores John the Ripper, a powerful, free, and open-source password cracker. Whether you're a cybersecurity enthusiast or a curious learner, this hands-on lab introduces key password-cracking techniques and the underlying concepts of hashes and wordlists.

🚀 Overview

John the Ripper (or "John" to its friends) is a versatile tool for identifying password storage schemes and applying brute force or educated guessing to crack them. Learn to:

Run John in different cracking modes.
Explore the efficiency of brute-force vs. wordlist attacks.
Use real-world tools like rockyou.txt for password guessing.
🎯 Goals
By the end of this project, you will:

Understand password hashing and its limitations.
Run John against hashed Linux password files.
Experiment with cracking techniques like single-crack, wordlist, and incremental modes.

📂 Resources

Wordlists: Leverage common password datasets like rockyou.txt.
Sample Files: Practice on crackA.txt, crackB.txt, and more.

🧠 Key Takeaways

Hashes can't be reversed, but educated guesses can work wonders.
Different cracking modes target specific password patterns.
Distributed cracking accelerates complex tasks.

🛠️ Try it Yourself

Install John the Ripper:

bash
Copy code
sudo snap install john-the-ripper
Crack Some Passwords:

Single-crack: john --single crackA.txt
Wordlist mode: john --wordlist=lower.lst crackB.txt
Incremental mode: john --incremental crackC.txt
View Results:

bash
Copy code
john --show crackA.txt

📖 Learn More

Explore advanced features using this resorce https://www.openwall.com/john/doc/RULES.shtml 
