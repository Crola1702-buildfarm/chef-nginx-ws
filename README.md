# Description

This repository servers as a workspace to test chef configurations. 

This repo is intended to be used along with [packer-nginx-ws](https://github.com/Crola1702-buildfarm/packer-nginx-ws) for easy deploy into an AWS AMI

# How to use

## 2023/10/27

This configurataion contains a simple nginx server and a simple databag (encrypted externally using [sops](https://github.com/getsops/sops) and [age](https://github.com/FiloSottile/age))

The [`key_databag` databag](./crola-chef/data_bags/key_databag) is encrypted with my age key. 

You may want to use your own credentials in the process.
To do that, follow these steps:

### Generate age credentials

First, generate age credentials using the following [instructions](https://github.com/FiloSottile/age#readme).

After that, set `SOPS_AGE_KEY_FILE` environment variable:

```bash
export SOPS_AGE_KEY_FILE=[path-to-key]
```

### Encrypt the file 

Then, run the following commands:

```bash
cd crola-chef/data_bags/key_databag
cp sops-key.json.template sops-key.json # Create the new databag
vim sops-key.json # Edit databag to fit your needs
sops -e --age [public-key] -i sops-key.json # Encrypt the file
```

> To decrypt and modify you can use: `sops -d -i sops-key.json`


