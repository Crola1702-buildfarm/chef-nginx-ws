### Set Up

```bash
# Generate age key
$ age-keygen -o <path-to-key>

# Set keyfile as an env variable
$ export SOPS_AGE_KEY_FILE=<path-to-key>
```

### Encrypt

```bash
# mysecret.yaml should exist
sops -e --age <public-key> -i <file>
```

### Decrypt

```bash
# -i decrypts or encrypts in place
sops -d -i <encrypted-file>
```

### Template data

```json
{
	"id": "sops-key",
	"key": "MY SECRET API KEY"
}
```