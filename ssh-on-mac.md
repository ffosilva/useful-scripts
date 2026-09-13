It is not possible to add private key to Keychain, but you can store passphrase for private key in Keychain. On OSX, the native ssh-add command has a special argument to save the private key's passphrase in the OSX Keychain, which means that your normal login will unlock it for use with ssh. On OSX Sierra and later, you also need to configure SSH to always use the Keychain (see Step 2 below).

Alternatively you can use a key without a passphrase, but if you prefer the security that's certainly acceptable with this workflow.

Step 1 - Store passphrase in the Keychain
In the latest version of MacOS (12.0 Monterey), just do this once:

ssh-add --apple-use-keychain ~/.ssh/[your-private-key]
Or in versions of MacOS older than 12.0 Monterey, use:

ssh-add -K ~/.ssh/[your-private-key]
Enter your key passphrase, and you won't be asked for it again.

(If this fails, make sure you are using Apple's version of /usr/bin/ssh-add and not something installed with brew etc.; check with which ssh-add)

Step 2 - Configure SSH-agent to always use the Keychain
(Note: In versions of OSX prior to Sierra, this is not necessary)

It seems that OSX Sierra removed the convenient behavior of persisting your keys between logins, and the update to ssh no longer uses the keychain by default. Because of this, you need to change one more thing for secure persistent key storage.

The solution is outlined in this github thread comment. Here's what you do:

Ensure you've completed Step 1 above to store the passphrase in the keychain.

If you haven't already, create an ~/.ssh/config file. In other words, in the .ssh directory in your home dir, make a file called config.

In that .ssh/config file, add the following lines:

Host *
    UseKeychain yes
    AddKeysToAgent yes
    IdentityFile ~/.ssh/id_rsa
Change ~/.ssh/id_rsa to the actual filename of your private key. If you have other private keys in your ~/.ssh directory, also add an IdentityFile line for each of them. For example, I have one additional line that reads IdentityFile ~/.ssh/id_ed25519 for a 2nd private key.

The UseKeychain yes is the key part, which tells SSH to look in your OSX keychain for the key passphrase.

Step 3 - Configure your shell to load the Keychain
Add the following to your ~/.zshrc file:

ssh-add --apple-load-keychain -q
(-q to not print success message)

That's it! Next time you load any ssh connection, it will try the private keys you've specified, and it will look for their passphrase in the OSX keychain. No passphrase typing required.
