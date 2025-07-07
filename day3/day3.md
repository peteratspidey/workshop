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
## there are 3 ways to run R scripts
1. via terminal using text editor
 1. open terminal
 2. run
 ```bash
 gedit test.r &
 ```
 3. text editor will open type urs commands of r
 4. close and save the file
 5. run the script using 
 ```bash
Rscript test.r
``` 

2. via R environment into terminal
   1. type `R` in terminal
   2. this will open R IDE
   3. type ur code here

3. using Rstudio

## installing packages
1. make a R script  and then run it
 example:- * open a file name packages.R
           * type install.packages("package_name")
           * save and close the file
           * run using `Rscript packages.R`
3. install packages in R IDE
 example:- * type `R` in to terminal and enter into R environment
           * type install.packages("package_name")
           * then use enter to run
## install some imp packages
1. ggplot2 - for plotting
2. BiocManager- link to install Bio packages related to NGS analysis
    * Biostrings - using biocmanager
    * ```r
      BiocManager::install("Biostrings")
      ```
3. to check if some package is installed or not
   `r
   library("package_name")
   ***if not output means package is installed, if not installed it will show error
4. if found some error try this
   ```bash
   sudo apt-get update
   sudo apt-get install libcurl4-openssl-dev libssl-dev libxml2-dev
   ```
5. check the installation
   ```r
   library(Biostrings)
