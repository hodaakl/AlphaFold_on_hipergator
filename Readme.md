# AlphaFold_on_hipergator 

This repo contains guidance on how to run AlphaFold on hpg. 

Hpg has its own version of AF that you can use, but it takes much longer to run and the results are not significantly better than the results from the local installation. <br>

Note: you can install this on your own computer too, but it is better to have gpu , this is why if you have gpu allocation on hpg this will be useful. 
----------

1. First install the local version of alpha fold on hiper gator using the link -- follow steps at "FOR LINUX" section. 
https://github.com/YoshitakaMo/localcolabfold


2. After installation you can see flags at

```bash
colabfold_batch -- help
```
3. To submit a sequence , use the file "AF_submit_job.sh" for reference. Read through the lines after 
```bash
#!/bin/bash
```
and change what is necessary - your username , account etc 
---------------------------
## Changing the MSA used in the prediction. 