
<!-- rnb-text-begin -->

---
title: "Cleaning Hospital Admissions data"
output: html_notebook
---

# Overview

A local hospital asked the NTRHD to survey a random sample of its patients about their experience at their most recent admission. We need your help cleaning the data and doing a couple of descriptive analyses. 


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxubGlicmFyeShyZWFkcilcbmxpYnJhcnkoZHBseXIpXG5saWJyYXJ5KGx1YnJpZGF0ZSlcbmxpYnJhcnkoc3RyaW5ncilcbmBgYFxuYGBgIn0= -->

```r
```r
library(readr)
library(dplyr)
library(lubridate)
library(stringr)
```
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


# Task 1

Click the link below to download the raw data file to your computer:

[hospital_survey.csv](https://www.dropbox.com/s/aqnarnes5fh8udf/hospital_survey.csv?dl=1)

[Click here to view and/or download the data dictionary](https://www.dropbox.com/s/d2cq63eliif2bc7/Codebook%20for%20Hospital%20Survey%20Data.pdf?dl=0).

# Task 2

Import `hospital_survey.csv` into your R global environment as `hospital`.


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuaG9zcGl0YWwgPC0gcmVhZF9jc3YoXFwvVXNlcnMvYnJhZGNhbm5lbGwvRHJvcGJveC9EYXRhc2V0cy9Ib3NwaXRhbCBTdXJ2ZXkvaG9zcGl0YWxfc3VydmV5LmNzdlxcKVxuYGBgXG5gYGAifQ== -->

```r
```r
hospital <- read_csv(\/Users/bradcannell/Dropbox/Datasets/Hospital Survey/hospital_survey.csv\)
```
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiUGFyc2VkIHdpdGggY29sdW1uIHNwZWNpZmljYXRpb246XG5jb2xzKFxuICBpZCA9IFx1MDAxYlszMm1jb2xfZG91YmxlKClcdTAwMWJbMzltLFxuICBnZW5kZXIgPSBcdTAwMWJbMzJtY29sX2RvdWJsZSgpXHUwMDFiWzM5bSxcbiAgZG9iID0gXHUwMDFiWzMxbWNvbF9jaGFyYWN0ZXIoKVx1MDAxYlszOW0sXG4gIGluY29tZSA9IFx1MDAxYlszMm1jb2xfZG91YmxlKClcdTAwMWJbMzltLFxuICBhZGRhdGUgPSBcdTAwMWJbMzFtY29sX2NoYXJhY3RlcigpXHUwMDFiWzM5bSxcbiAgZGlzZGF0ZSA9IFx1MDAxYlszMW1jb2xfY2hhcmFjdGVyKClcdTAwMWJbMzltLFxuICBwaHlzaWNpYW4gPSBcdTAwMWJbMzFtY29sX2NoYXJhY3RlcigpXHUwMDFiWzM5bSxcbiAgaW5zID0gXHUwMDFiWzMxbWNvbF9jaGFyYWN0ZXIoKVx1MDAxYlszOW0sXG4gIHZpc2l0cyA9IFx1MDAxYlszMm1jb2xfZG91YmxlKClcdTAwMWJbMzltLFxuICBwcm8xID0gXHUwMDFiWzMybWNvbF9kb3VibGUoKVx1MDAxYlszOW0sXG4gIHBybzIgPSBcdTAwMWJbMzJtY29sX2RvdWJsZSgpXHUwMDFiWzM5bSxcbiAgZm9vZCA9IFx1MDAxYlszMm1jb2xfZG91YmxlKClcdTAwMWJbMzltLFxuICBjbGVhbiA9IFx1MDAxYlszMm1jb2xfZG91YmxlKClcdTAwMWJbMzltLFxuICBjaGVjazEgPSBcdTAwMWJbMzJtY29sX2RvdWJsZSgpXHUwMDFiWzM5bSxcbiAgY2hlY2syID0gXHUwMDFiWzMybWNvbF9kb3VibGUoKVx1MDAxYlszOW0sXG4gIHJlY28gPSBcdTAwMWJbMzJtY29sX2RvdWJsZSgpXHUwMDFiWzM5bVxuKVxuIn0= -->

```
Parsed with column specification:
cols(
  id = [32mcol_double()[39m,
  gender = [32mcol_double()[39m,
  dob = [31mcol_character()[39m,
  income = [32mcol_double()[39m,
  addate = [31mcol_character()[39m,
  disdate = [31mcol_character()[39m,
  physician = [31mcol_character()[39m,
  ins = [31mcol_character()[39m,
  visits = [32mcol_double()[39m,
  pro1 = [32mcol_double()[39m,
  pro2 = [32mcol_double()[39m,
  food = [32mcol_double()[39m,
  clean = [32mcol_double()[39m,
  check1 = [32mcol_double()[39m,
  check2 = [32mcol_double()[39m,
  reco = [32mcol_double()[39m
)
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


# Task 3

View the structure of hospital using the `str()` function.


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuc3RyKGhvc3BpdGFsKVxuYGBgXG5gYGAifQ== -->

```r
```r
str(hospital)
```
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoidGliYmxlIFsxMDAgw5cgMTZdIChTMzogc3BlY190YmxfZGYvdGJsX2RmL3RibC9kYXRhLmZyYW1lKVxuICQgaWQgICAgICAgOiBudW0gWzE6MTAwXSAxIDIgMyA0IDUgNiA3IDggOSAxMCAuLi5cbiAkIGdlbmRlciAgIDogbnVtIFsxOjEwMF0gMiAxIDEgMSAyIDEgMiAyIDIgMiAuLi5cbiAkIGRvYiAgICAgIDogY2hyIFsxOjEwMF0gXFxKdWx5IDA5XG4ifQ== -->

```
tibble [100 × 16] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ id       : num [1:100] 1 2 3 4 5 6 7 8 9 10 ...
 $ gender   : num [1:100] 2 1 1 1 2 1 2 2 2 2 ...
 $ dob      : chr [1:100] \July 09
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


## Question:

1. The `hospital` data frame contains ____ rows and ____ columns.

* The `hospital` data frame contains 100 rows and 16 columns.

# Task 4

As part of the data management process, please coerce the following columns from character type to date type: date of birth, date of admission to the hospital, date of discharge from the hospital.


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuaG9zcGl0YWwgPC0gaG9zcGl0YWwgJT4lXG4gIG11dGF0ZShcbiAgICBkb2IgICAgID0gYXMuRGF0ZShkb2IsIFxcJUIgJWRcbmBgYCJ9 -->

```r
```r
hospital <- hospital %>%
  mutate(
    dob     = as.Date(dob, \%B %d
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


## Notes to students

1. Notice the three lines of code inside the mutate function above are all identical aside from the column name. It's generally a good idea to try to remove this kind of repetition from your code. We will discuss this more in module on repeated operations.  

## Question

2. What is patient 37’s date of admission?


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuaG9zcGl0YWwgJT4lIFxuICBmaWx0ZXIoaWQgPT0gMzcpICU+JSBcbiAgcHVsbChhZGRhdGUpXG5gYGBcbmBgYCJ9 -->

```r
```r
hospital %>% 
  filter(id == 37) %>% 
  pull(addate)
```
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiWzFdIFxcMjAyMC0wMS0xMVxcXG4ifQ== -->

```
[1] \2020-01-11\
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


* Patient 37’s date of admission is 2020-01-11

# Task 5

Please create a new column in the `hospital` data frame that contains each patient's age in years, as of their last birthday, on the day they were admitted to the hospital. Please name this column `age`.


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuaG9zcGl0YWwgPC0gaG9zcGl0YWwgJT4lIFxuICBtdXRhdGUoYWdlID0gKGRvYiAlLS0lIGFkZGF0ZSkgJS8lIHllYXJzKDEpKVxuYGBgXG5gYGAifQ== -->

```r
```r
hospital <- hospital %>% 
  mutate(age = (dob %--% addate) %/% years(1))
```
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


# Task 6

Please create 8 new dummy variables in the `hospital` data frame based on categories from the type of insurance used column.


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuaG9zcGl0YWwgPC0gaG9zcGl0YWwgJT4lIFxuICBtdXRhdGUoXG4gICAgaW5zX25vbmUgPSBzdHJfZGV0ZWN0KGlucywgXFwwXFwpLCAjIE5vIGluc3VyYW5jZVxuICAgIGluc19lbXBsID0gc3RyX2RldGVjdChpbnMsIFxcMVxcKSwgIyBFbXBsb3llclxuICAgIGluc19wcml2ID0gc3RyX2RldGVjdChpbnMsIFxcMlxcKSwgIyBQcml2YXRlbHkgcHVyY2hhc2VkXG4gICAgaW5zX21kY3IgPSBzdHJfZGV0ZWN0KGlucywgXFwzXFwpLCAjIE1lZGljYXJlXG4gICAgaW5zX21kY2QgPSBzdHJfZGV0ZWN0KGlucywgXFw0XFwpLCAjIE1lZGljYWlkXG4gICAgaW5zX21pbCAgPSBzdHJfZGV0ZWN0KGlucywgXFw1XFwpLCAjIE1pbGl0YXJ5XG4gICAgaW5zX3ZhICAgPSBzdHJfZGV0ZWN0KGlucywgXFw2XFwpLCAjIFZBXG4gICAgaW5zX2locyAgPSBzdHJfZGV0ZWN0KGlucywgXFw3XFwpICAjIEluZGlhbiBIZWFsdGggU2VydmljZVxuICApXG5gYGBcbmBgYCJ9 -->

```r
```r
hospital <- hospital %>% 
  mutate(
    ins_none = str_detect(ins, \0\), # No insurance
    ins_empl = str_detect(ins, \1\), # Employer
    ins_priv = str_detect(ins, \2\), # Privately purchased
    ins_mdcr = str_detect(ins, \3\), # Medicare
    ins_mdcd = str_detect(ins, \4\), # Medicaid
    ins_mil  = str_detect(ins, \5\), # Military
    ins_va   = str_detect(ins, \6\), # VA
    ins_ihs  = str_detect(ins, \7\)  # Indian Health Service
  )
```
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


# Task 7

View the structure of hospital using the `str()` function.


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuc3RyKGhvc3BpdGFsKVxuYGBgXG5gYGAifQ== -->

```r
```r
str(hospital)
```
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoidGliYmxlIFsxMDAgw5cgMjVdIChTMzogc3BlY190YmxfZGYvdGJsX2RmL3RibC9kYXRhLmZyYW1lKVxuICQgaWQgICAgICAgOiBudW0gWzE6MTAwXSAxIDIgMyA0IDUgNiA3IDggOSAxMCAuLi5cbiAkIGdlbmRlciAgIDogbnVtIFsxOjEwMF0gMiAxIDEgMSAyIDEgMiAyIDIgMiAuLi5cbiAkIGRvYiAgICAgIDogRGF0ZVsxOjEwMF0sIGZvcm1hdDogXFwxOTc2LTA3LTA5XFwgXFwxOTM3LTA4LTE0XFwgXFwxOTYwLTA5LTE4XFwgXFwxOTM2LTA4LTE1XFwgLi4uXG4gJCBpbmNvbWUgICA6IG51bSBbMToxMDBdIDgxMTA2IDYwMzMwIDk4MTMwIDk0OTIwIDQwODcxIC4uLlxuICQgYWRkYXRlICAgOiBEYXRlWzE6MTAwXSwgZm9ybWF0OiBcXDIwMjAtMDEtMjJcXCBcXDIwMjAtMDEtMjZcXCBcXDIwMjAtMDEtMjZcXCBcXDIwMjAtMDEtMzFcXCAuLi5cbiAkIGRpc2RhdGUgIDogRGF0ZVsxOjEwMF0sIGZvcm1hdDogXFwyMDIwLTAyLTE1XFwgXFwyMDIwLTAyLTEwXFwgXFwyMDIwLTAyLTE4XFwgXFwyMDIwLTAyLTIwXFwgLi4uXG4gJCBwaHlzaWNpYW46IGNociBbMToxMDBdIFxcUmVlc2VcXCBcXFNhbGF6YXJcXCBcXFJlZXNlXFwgXFxTdGVlbGVcXCAuLi5cbiAkIGlucyAgICAgIDogY2hyIFsxOjEwMF0gXFw3XFwgXFw2XFwgXFw1XFwgXFw0XFwgLi4uXG4gJCB2aXNpdHMgICA6IG51bSBbMToxMDBdIDUgOSA1IDEgNSAzIDcgNyA1IDggLi4uXG4gJCBwcm8xICAgICA6IG51bSBbMToxMDBdIDEgNSAzIDEgMyAyIDEgNCAzIDIgLi4uXG4gJCBwcm8yICAgICA6IG51bSBbMToxMDBdIDUgMyAyIDUgMyAyIDIgMyA1IDUgLi4uXG4gJCBmb29kICAgICA6IG51bSBbMToxMDBdIDQgMyAyIDEgMiA0IDQgMiAxIDEgLi4uXG4gJCBjbGVhbiAgICA6IG51bSBbMToxMDBdIDUgNSAyIDIgMiAzIDIgNCAxIDEgLi4uXG4gJCBjaGVjazEgICA6IG51bSBbMToxMDBdIDAgMSAxIDAgMCAwIDAgMSAwIDEgLi4uXG4gJCBjaGVjazIgICA6IG51bSBbMToxMDBdIDEgMCAxIDAgMSAwIDAgMCAxIDAgLi4uXG4gJCByZWNvICAgICA6IG51bSBbMToxMDBdIDAgMSAxIDEgMCAxIDAgMSAxIDAgLi4uXG4gJCBhZ2UgICAgICA6IG51bSBbMToxMDBdIDQzIDgyIDU5IDgzIDcyIDUzIDcxIDQ1IDcwIDY2IC4uLlxuICQgaW5zX25vbmUgOiBsb2dpIFsxOjEwMF0gRkFMU0UgRkFMU0UgRkFMU0UgRkFMU0UgRkFMU0UgRkFMU0UgLi4uXG4gJCBpbnNfZW1wbCA6IGxvZ2kgWzE6MTAwXSBGQUxTRSBGQUxTRSBGQUxTRSBGQUxTRSBGQUxTRSBGQUxTRSAuLi5cbiAkIGluc19wcml2IDogbG9naSBbMToxMDBdIEZBTFNFIEZBTFNFIEZBTFNFIEZBTFNFIEZBTFNFIEZBTFNFIC4uLlxuICQgaW5zX21kY3IgOiBsb2dpIFsxOjEwMF0gRkFMU0UgRkFMU0UgRkFMU0UgRkFMU0UgRkFMU0UgVFJVRSAuLi5cbiAkIGluc19tZGNkIDogbG9naSBbMToxMDBdIEZBTFNFIEZBTFNFIEZBTFNFIFRSVUUgVFJVRSBGQUxTRSAuLi5cbiAkIGluc19taWwgIDogbG9naSBbMToxMDBdIEZBTFNFIEZBTFNFIFRSVUUgRkFMU0UgRkFMU0UgRkFMU0UgLi4uXG4gJCBpbnNfdmEgICA6IGxvZ2kgWzE6MTAwXSBGQUxTRSBUUlVFIEZBTFNFIEZBTFNFIEZBTFNFIEZBTFNFIC4uLlxuICQgaW5zX2locyAgOiBsb2dpIFsxOjEwMF0gVFJVRSBGQUxTRSBGQUxTRSBGQUxTRSBGQUxTRSBGQUxTRSAuLi5cbiAtIGF0dHIoKiwgXFxzcGVjXFwpPVxuICAuLiBjb2xzKFxuICAuLiAgIGlkID0gXHUwMDFiWzMybWNvbF9kb3VibGUoKVx1MDAxYlszOW0sXG4gIC4uICAgZ2VuZGVyID0gXHUwMDFiWzMybWNvbF9kb3VibGUoKVx1MDAxYlszOW0sXG4gIC4uICAgZG9iID0gXHUwMDFiWzMxbWNvbF9jaGFyYWN0ZXIoKVx1MDAxYlszOW0sXG4gIC4uICAgaW5jb21lID0gXHUwMDFiWzMybWNvbF9kb3VibGUoKVx1MDAxYlszOW0sXG4gIC4uICAgYWRkYXRlID0gXHUwMDFiWzMxbWNvbF9jaGFyYWN0ZXIoKVx1MDAxYlszOW0sXG4gIC4uICAgZGlzZGF0ZSA9IFx1MDAxYlszMW1jb2xfY2hhcmFjdGVyKClcdTAwMWJbMzltLFxuICAuLiAgIHBoeXNpY2lhbiA9IFx1MDAxYlszMW1jb2xfY2hhcmFjdGVyKClcdTAwMWJbMzltLFxuICAuLiAgIGlucyA9IFx1MDAxYlszMW1jb2xfY2hhcmFjdGVyKClcdTAwMWJbMzltLFxuICAuLiAgIHZpc2l0cyA9IFx1MDAxYlszMm1jb2xfZG91YmxlKClcdTAwMWJbMzltLFxuICAuLiAgIHBybzEgPSBcdTAwMWJbMzJtY29sX2RvdWJsZSgpXHUwMDFiWzM5bSxcbiAgLi4gICBwcm8yID0gXHUwMDFiWzMybWNvbF9kb3VibGUoKVx1MDAxYlszOW0sXG4gIC4uICAgZm9vZCA9IFx1MDAxYlszMm1jb2xfZG91YmxlKClcdTAwMWJbMzltLFxuICAuLiAgIGNsZWFuID0gXHUwMDFiWzMybWNvbF9kb3VibGUoKVx1MDAxYlszOW0sXG4gIC4uICAgY2hlY2sxID0gXHUwMDFiWzMybWNvbF9kb3VibGUoKVx1MDAxYlszOW0sXG4gIC4uICAgY2hlY2syID0gXHUwMDFiWzMybWNvbF9kb3VibGUoKVx1MDAxYlszOW0sXG4gIC4uICAgcmVjbyA9IFx1MDAxYlszMm1jb2xfZG91YmxlKClcdTAwMWJbMzltXG4gIC4uIClcbiJ9 -->

```
tibble [100 × 25] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ id       : num [1:100] 1 2 3 4 5 6 7 8 9 10 ...
 $ gender   : num [1:100] 2 1 1 1 2 1 2 2 2 2 ...
 $ dob      : Date[1:100], format: \1976-07-09\ \1937-08-14\ \1960-09-18\ \1936-08-15\ ...
 $ income   : num [1:100] 81106 60330 98130 94920 40871 ...
 $ addate   : Date[1:100], format: \2020-01-22\ \2020-01-26\ \2020-01-26\ \2020-01-31\ ...
 $ disdate  : Date[1:100], format: \2020-02-15\ \2020-02-10\ \2020-02-18\ \2020-02-20\ ...
 $ physician: chr [1:100] \Reese\ \Salazar\ \Reese\ \Steele\ ...
 $ ins      : chr [1:100] \7\ \6\ \5\ \4\ ...
 $ visits   : num [1:100] 5 9 5 1 5 3 7 7 5 8 ...
 $ pro1     : num [1:100] 1 5 3 1 3 2 1 4 3 2 ...
 $ pro2     : num [1:100] 5 3 2 5 3 2 2 3 5 5 ...
 $ food     : num [1:100] 4 3 2 1 2 4 4 2 1 1 ...
 $ clean    : num [1:100] 5 5 2 2 2 3 2 4 1 1 ...
 $ check1   : num [1:100] 0 1 1 0 0 0 0 1 0 1 ...
 $ check2   : num [1:100] 1 0 1 0 1 0 0 0 1 0 ...
 $ reco     : num [1:100] 0 1 1 1 0 1 0 1 1 0 ...
 $ age      : num [1:100] 43 82 59 83 72 53 71 45 70 66 ...
 $ ins_none : logi [1:100] FALSE FALSE FALSE FALSE FALSE FALSE ...
 $ ins_empl : logi [1:100] FALSE FALSE FALSE FALSE FALSE FALSE ...
 $ ins_priv : logi [1:100] FALSE FALSE FALSE FALSE FALSE FALSE ...
 $ ins_mdcr : logi [1:100] FALSE FALSE FALSE FALSE FALSE TRUE ...
 $ ins_mdcd : logi [1:100] FALSE FALSE FALSE TRUE TRUE FALSE ...
 $ ins_mil  : logi [1:100] FALSE FALSE TRUE FALSE FALSE FALSE ...
 $ ins_va   : logi [1:100] FALSE TRUE FALSE FALSE FALSE FALSE ...
 $ ins_ihs  : logi [1:100] TRUE FALSE FALSE FALSE FALSE FALSE ...
 - attr(*, \spec\)=
  .. cols(
  ..   id = [32mcol_double()[39m,
  ..   gender = [32mcol_double()[39m,
  ..   dob = [31mcol_character()[39m,
  ..   income = [32mcol_double()[39m,
  ..   addate = [31mcol_character()[39m,
  ..   disdate = [31mcol_character()[39m,
  ..   physician = [31mcol_character()[39m,
  ..   ins = [31mcol_character()[39m,
  ..   visits = [32mcol_double()[39m,
  ..   pro1 = [32mcol_double()[39m,
  ..   pro2 = [32mcol_double()[39m,
  ..   food = [32mcol_double()[39m,
  ..   clean = [32mcol_double()[39m,
  ..   check1 = [32mcol_double()[39m,
  ..   check2 = [32mcol_double()[39m,
  ..   reco = [32mcol_double()[39m
  .. )
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


## Question

3. The hospital data frame contains ____ rows and ____ columns.

* The hospital data frame contains 100 rows and 25 columns.

# Task 8

Calculate the count and percentage of patients who used Medicare insurance (with or without other forms of insurance).


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuaG9zcGl0YWwgJT4lIFxuICBjb3VudChpbnNfbWRjcikgJT4lIFxuICBtdXRhdGUocGVyY2VudCA9IG4gLyBzdW0obikgKiAxMDApXG5gYGBcbmBgYCJ9 -->

```r
```r
hospital %>% 
  count(ins_mdcr) %>% 
  mutate(percent = n / sum(n) * 100)
```
```

<!-- rnb-source-end -->

<!-- rnb-frame-begin eyJtZXRhZGF0YSI6eyJjbGFzc2VzIjpbInNwZWNfdGJsX2RmIiwidGJsX2RmIiwidGJsIiwiZGF0YS5mcmFtZSJdLCJuY29sIjozLCJucm93IjoyfSwicmRmIjoiSDRzSUFBQUFBQUFBQTExUVRVL0RNQXgxdTRXeGlnMmsvWWxkMmdzWGR0dGg0Z2NnUUwyaExNMmdvbk9xTkJNYytlVXJUdVpJa0VNY1AzODlQei90NnZ1aUxnQmdBbE52QlJrUUw4K1A1UVBBTkNlUVVXTHUvMjlLcjBJbGdPL3dTUWdGQUF2R05iMGJla3VQdDYrWGd1MmFLLzhQRkNpUGVpRG5qdWw5OExyRjRlM1lLQnRaa1oxWnI2M1M2SkloYzJ1K3FqZ29iUEZEWmh6SGM4cW1PamxFdGhnc0d1bGtkYkRVVHlodG1abmV0UWFwS2ZlNlJkS2MyU1J3ZTBLL1NWT3FqeE4rbGh1K1U4YmlGK3puZi96SmhUSWZlWlRnVVZjYTMxdlVjZmRPN25YSFlFbUtnK0NxdHkzZGc1VlFkS2ljY1RMV0ZjcDBNUkswd2ZrWC80TzZWTzRCQUFBPSJ9 -->

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["ins_mdcr"],"name":[1],"type":["lgl"],"align":["right"]},{"label":["n"],"name":[2],"type":["int"],"align":["right"]},{"label":["percent"],"name":[3],"type":["dbl"],"align":["right"]}],"data":[{"1":"FALSE","2":"88","3":"88"},{"1":"TRUE","2":"12","3":"12"}],"options":{"columns":{"min":{},"max":[10],"total":[3]},"rows":{"min":[10],"max":[10],"total":[2]},"pages":{}}}
  </script>
</div>

<!-- rnb-frame-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


## Notes to students

1. Because there are 100 people and no missing data, the count and the percentage are the same.

## Question

4. What percentage of patients used Medicare insurance (with or without other forms of insurance)?

* 12 percent of patients used Medicare insurance (with or without other forms of insurance).

# Task 9

Please create a new column in the `hospital` data frame that contains the day of the week each patient was admitted. Please make sure the full name of the day is displayed. Please name this column `addmit_day`.


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuaG9zcGl0YWwgPC0gaG9zcGl0YWwgJT4lIFxuICBtdXRhdGUoYWRkbWl0X2RheSA9IHdkYXkoYWRkYXRlLCBsYWJlbCA9IFRSVUUsIGFiYnIgPSBGQUxTRSkpXG5gYGBcbmBgYCJ9 -->

```r
```r
hospital <- hospital %>% 
  mutate(addmit_day = wday(addate, label = TRUE, abbr = FALSE))
```
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


# Task 10. 

Calculate the count and percentage of patients who reported that they would recommend this hospital to their friends and family by day of admission. 


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuaG9zcGl0YWwgJT4lIFxuICBtdXRhdGUocmVjb19mID0gZmFjdG9yKHJlY28sIGMoMCwgMSksIGMoXFxOb1xcLCBcXFllc1xcKSkpICU+JSBcbiAgZ3JvdXBfYnkoYWRkbWl0X2RheSkgJT4lIFxuICBjb3VudChyZWNvX2YpICU+JSBcbiAgbXV0YXRlKHBlcmNlbnQgPSBuIC8gc3VtKG4pICogMTAwKSAlPiUgXG4gIGZpbHRlcihyZWNvX2YgPT0gXFxZZXNcXCkgJT4lIFxuICBhcnJhbmdlKGRlc2MocGVyY2VudCkpXG5gYGBcbmBgYCJ9 -->

```r
```r
hospital %>% 
  mutate(reco_f = factor(reco, c(0, 1), c(\No\, \Yes\))) %>% 
  group_by(addmit_day) %>% 
  count(reco_f) %>% 
  mutate(percent = n / sum(n) * 100) %>% 
  filter(reco_f == \Yes\) %>% 
  arrange(desc(percent))
```
```

<!-- rnb-source-end -->

<!-- rnb-frame-begin eyJtZXRhZGF0YSI6eyJjbGFzc2VzIjpbImdyb3VwZWRfZGYiLCJ0YmxfZGYiLCJ0YmwiLCJkYXRhLmZyYW1lIl0sIm5jb2wiOjQsIm5yb3ciOjd9LCJyZGYiOiJINHNJQUFBQUFBQUFBM1ZTVFU3Q1FCU2V0cFMvQ0NGeUJkMllRRUtNaVltSmFhSmlNQUdNWU1RVkdkdEJHc3NNbWJZcU84OWdQQVd1M0hnQ2J1SGFIUmR3QTc1cFoySWgwblRtL2M2YjczM3pyazU3Ky9sZUhpRmtvSlRZVGRpUWVkMnRWdzRSU3VsZ2FCRElDZmtNNFRJb2tHY1VRR1pFcHBRYXJEUXNQYW9VNWF3Y1RudmtrWGcrYUtYb2hQUjJRdXJnaWJLYUxHRmx1aUh4Lzh6Y0RYRm8wcEh0RGtPZXNOTjE3aWFpSFJ5RVhOaXJPRXpidzc2Q29hdXJHSGNJSjQ2cU5NQjJ3RGhvaTBTbit1WWxidENYYTBYMUZwT2FjVXY4T01sUVNkcC9WeUYxbFloc1NUMHJpVTNIcEtLaThGdVgyNDJkMThhdTFYNDcrQzVNVHF6bTNoUytkK3RpR3N2ejhzY1IvTmJaNlBNTGZ1dDRObS9ONXUwTktQSU9EbkIxd1BHSXJOR1Y0K3lwU3NIdlMzajZDMnpMNWZKbm5WZVZWSXB3eXJyWWNVWnUwRTg4RWljMjZ3L1VSRkgxQUdQQ2JVS0RtSWVWd2hrMkRseEdvYlJlbHZPV2hLN3hOVWNwcEFLS1U3R0hJWDJvMUdvQ2h4eFFKSnZRSkxkS2w4TnFLbDVNaFpiUWU1Y1MxYUtINzRnbmpTSVFFN1ZjSFhNWGdNdUd3ZXRYQXhaZ2xaZTNtYWM4OFNNdmZnR0FpWG1FY3dNQUFBPT0ifQ== -->

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["addmit_day"],"name":[1],"type":["ord"],"align":["right"]},{"label":["reco_f"],"name":[2],"type":["fctr"],"align":["left"]},{"label":["n"],"name":[3],"type":["int"],"align":["right"]},{"label":["percent"],"name":[4],"type":["dbl"],"align":["right"]}],"data":[{"1":"Thursday","2":"Yes","3":"9","4":"64.28571"},{"1":"Saturday","2":"Yes","3":"12","4":"63.15789"},{"1":"Sunday","2":"Yes","3":"7","4":"58.33333"},{"1":"Friday","2":"Yes","3":"8","4":"53.33333"},{"1":"Monday","2":"Yes","3":"6","4":"46.15385"},{"1":"Tuesday","2":"Yes","3":"6","4":"42.85714"},{"1":"Wednesday","2":"Yes","3":"4","4":"30.76923"}],"options":{"columns":{"min":{},"max":[10],"total":[4]},"rows":{"min":[10],"max":[10],"total":[7]},"pages":{}}}
  </script>
</div>

<!-- rnb-frame-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


## Notes to students

1. You didn't have to coerce `reco` to a factor. I just think it looks better and I feel like I'm less likely to make a mistake when interpreting my results. 

2. You didn't have to filter out the "No" categories from the results above. I just think it makes the results easier to read. If you do filter out the "No"s, make sure you do so _after_ calculating the percent.

3. You didn't have to arrange your results. I just feel like doing so makes me less likely to make a mistake when interpreting my results.

## Question

5. Patients admitted on which day most frequently reported (as a percentage) that they would recommend this hospital to their friends and family?

* Patients admitted on Thursdays most frequently reported (64%) that they would recommend this hospital to their friends and family.

# Task 11. 

For each physician, please calculate the mean response value to the survey question, “How would you rate the professionalism of your physicians during your stay?”


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuaG9zcGl0YWwgJT4lIFxuICBncm91cF9ieShwaHlzaWNpYW4pICU+JSBcbiAgc3VtbWFyaXNlKG1lYW5fc2F0ID0gbWVhbihwcm8yKSkgJT4lIFxuICBhcnJhbmdlKGRlc2MobWVhbl9zYXQpKVxuYGBgXG5gYGAifQ== -->

```r
```r
hospital %>% 
  group_by(physician) %>% 
  summarise(mean_sat = mean(pro2)) %>% 
  arrange(desc(mean_sat))
```
```

<!-- rnb-source-end -->

<!-- rnb-frame-begin eyJtZXRhZGF0YSI6eyJjbGFzc2VzIjpbInRibF9kZiIsInRibCIsImRhdGEuZnJhbWUiXSwibmNvbCI6MiwibnJvdyI6Nn0sInJkZiI6Ikg0c0lBQUFBQUFBQUExMVJPMDdEUUJEZG1OaXhMUkpGQ2hlZ29VRTJBaHBLUjBJUkJaVUR3cUpCWTJlVFdEanJ5THNSbjRxZWtwNkNZM0FnUk1VQktHSm1uZDBrZUNUUHpyeW5OeitINTlHcEc3bUVrQjNTbE41RVI4enJxNEYzUmtqVHdLU0JoQ1BmUjZSN0dFaXdpNStsaU5hd2Y5bS83WWNxdFlhQzBveXVTY2pnR1FxVm1pR2xuRzZTWkpOYzVISE1NZWpJR3NFZXFTellUWCtpd2Z0WDRQcXZIOStmUjRGOStOYTlPZGdQYk1WYjQ4cHFzNW9NWnBTck9RMEZPdlBwRTArVEZKZ0M3QmtGZHNkQjFOUk9rVC80dWtKYlZuaEJWNWJsYjcxTmtnSFhiVFRvamtDQVB5NVFqOW15Sm1ubGM1SG1ERVZHcjdyaGYzR2pxQUhkQlpPVGpMeGt1bUQzM3ZHSjdGRHhLOXVPMnlxMnRtSmoxZDhvYXovTm9teVNzdlh4TTRocHBrZkV4VGxNTk5mQmExVEg4T2RGeW9UZUVsSHVpMXlBbHJsSm5tbWsycHNzL3dCRmZrR1FYZ0lBQUE9PSJ9 -->

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["physician"],"name":[1],"type":["chr"],"align":["left"]},{"label":["mean_sat"],"name":[2],"type":["dbl"],"align":["right"]}],"data":[{"1":"SALAZAR","2":"5.000000"},{"1":"Steele","2":"3.551724"},{"1":"Salazar","2":"3.272727"},{"1":"Reese","2":"3.021277"},{"1":"Recse","2":"3.000000"},{"1":"Hobbs","2":"2.800000"}],"options":{"columns":{"min":{},"max":[10],"total":[2]},"rows":{"min":[10],"max":[10],"total":[6]},"pages":{}}}
  </script>
</div>

<!-- rnb-frame-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


## Notes to students

1. I didn't create a task specifically instructing you to clean the physician names. However, I'm hoping the first time you ran the analysis above, you thought the results looked weird. If you go check the data dictionary, you should see that there are only four possible valid physician names. 


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuaG9zcGl0YWwgJT4lIFxuICBtdXRhdGUoXG4gICAgcGh5c2ljaWFuID0gc3RyX3RvX2xvd2VyKHBoeXNpY2lhbiksXG4gICAgcGh5c2ljaWFuID0gc3RyX3JlcGxhY2UocGh5c2ljaWFuLCBcXHJlY3NlXFwsIFxccmVlc2VcXClcbiAgKSAlPiUgXG4gIGdyb3VwX2J5KHBoeXNpY2lhbikgJT4lIFxuICBzdW1tYXJpc2UobWVhbl9zYXQgPSBtZWFuKHBybzIpKSAlPiUgXG4gIGFycmFuZ2UoZGVzYyhtZWFuX3NhdCkpXG5gYGBcbmBgYCJ9 -->

```r
```r
hospital %>% 
  mutate(
    physician = str_to_lower(physician),
    physician = str_replace(physician, \recse\, \reese\)
  ) %>% 
  group_by(physician) %>% 
  summarise(mean_sat = mean(pro2)) %>% 
  arrange(desc(mean_sat))
```
```

<!-- rnb-source-end -->

<!-- rnb-frame-begin eyJtZXRhZGF0YSI6eyJjbGFzc2VzIjpbInRibF9kZiIsInRibCIsImRhdGEuZnJhbWUiXSwibmNvbCI6MiwibnJvdyI6NH0sInJkZiI6Ikg0c0lBQUFBQUFBQUExMVJTMnJETUJCVlhOdUpUUklDdlVYQmhwSk5sMTZVTExzb0xXUlh4bzRTaXlxU3NSVDZXZlVrUFVCN2paNmxxOUlUbERnalJ5cEJnejJlZVk4M1R4cmZYaS9uNlRJbGhKeVIwT1FJRTRudTd4YlpGU0ZoZ00wQWljUjhuNUUreDhLQU0zeERTOFJLVThxcDdZWUtPTHhDYTl1b3BWUTVMcXBsV1Nvc3BrWmVqTm52Y3ZIK1hZeHZ2bjd3S1VZWEh4aWZSYnp1dy9PUEJHeXBzdDZCQlpPbWZsR3NZaUFzTU5wU0VBOEt0S2RPV3ZtVXV3a1RNK0VOVTlkMWY3NU54VUU1R3dlbUs5Q1FyMXZVWTdmM0pFUFphQ1lGaWdLem45Z1REMW9QbU8yRU9ja3FxK3FkZU13dTU4YWg1NDl4V2s5c0haN1V3ZEUvNk96YzJQMElLalpNL0MrYlEwbTVPeUplWE1IR2NWUGNScitNdkdtWjBPNldpS3BjU3cxT2xsYVNPNlMvTjlrZkFPcTY1Z0F5QWdBQSJ9 -->

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["physician"],"name":[1],"type":["chr"],"align":["left"]},{"label":["mean_sat"],"name":[2],"type":["dbl"],"align":["right"]}],"data":[{"1":"steele","2":"3.551724"},{"1":"salazar","2":"3.538462"},{"1":"reese","2":"3.020833"},{"1":"hobbs","2":"2.800000"}],"options":{"columns":{"min":{},"max":[10],"total":[2]},"rows":{"min":[10],"max":[10],"total":[4]},"pages":{}}}
  </script>
</div>

<!-- rnb-frame-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


## Question

5. Patients treated by which physician reported the highest mean response to the “How would you rate the professionalism of your physicians during your stay?” survey question?

* Patients treated by Dr. Steele reported the highest mean response to the “How would you rate the professionalism of your physicians during your stay?” survey question (3.6).

## Notes to students

1. Even though `pro2` is sequentially numbered (i.e., values = 1 through 5), it isn't really a numeric variable. These are categories that have been assigned to numbers. Can we really say that a "No Opinion" is 2 better than a "Poor"? No, we can't. In cases like this, it can be a bad idea to analyze your data as though it were continuous. I just asked you to do it above because it is a convenient way for me to check to see if you did the data management correctly. Please do as I say, not as I do! 😂

<!-- rnb-text-end -->

