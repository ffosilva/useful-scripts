# How to Store Your SSH Private Key Passphrase in Your Apple Keychain

```bash
# for newer macOS
ssh-add --apple-use-keychain --apple-load-keychain ~/.ssh/id_ed25519

# for macOS Sierra or older
ssh-add -KA ~/.ssh/id_rsa

# add on .ssh/config
Host *.github.com
    UseKeychain yes
    AddKeysToAgent yes
    IdentityFile ~/.ssh/id_ed25519
```
