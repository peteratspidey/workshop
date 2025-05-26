# intro to R

## Installation can be done via [CRAN](https://cran.r-project.org)
***all steps are mentioned there***
* `Rstudio` GUI based
* `Rbase` CLI based 
  

### for installing via terminal 
```bash
sudo apt update -qq
```
### install two helper packages we need
```bash
sudo apt install --no-install-recommends software-properties-common dirmngr
```
`--no install recommends` install only the main packages, not extra recommended ones 
`dirmngr` - A background service used by GPG (GNU Privacy Guard).
          - Handles key management, especially for fetching and verifying public keys from key servers.
          - Required when adding secure package repositories (e.g., via apt-key or when importing GPG keys).

### add the signing key (by Michael Rutter) for these repos
# To verify key, run 
```bash
gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
```
### Fingerprint: E298A3A825C0D65DFD57CBB651716619E084DAB9
```bash
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
```
### add the repo from CRAN -- lsb_release adjusts to 'noble' or 'jammy' or ... as needed
```bash
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
```
### install R itself
```bash
sudo apt install --no-install-recommends r-base
```
