# Notes CHJ Hartgerink
---
#March 11, 2015
1. Information below retrieved from [here](http://www.apa.org/pubs/databases/psycinfo/index.aspx?tab=2)
Abstracts   
    Virtually 100% of records from 1995 to present have abstracts
    99.6% of non-dissertation documents added from 1967 to present contain abstracts
2. Downloaded journal list from [here](http://www.apa.org/pubs/databases/psycinfo/coverage.aspx)
3. Much easier to do one set of searches and then go to print and copy paste into excel. Numbers can then be readily extracted (and includes the exact searches).

# May 6, 2015
1. Download day!
2. Download from [here](http://web.b.ebscohost.com/ehost/search/advanced?sid=e79d90bb-d764-4367-ba3b-d19d65d594e1%40sessionmgr198&vid=3&hid=110)
3. Criteria: (i) Publication type: Peer Reviewed Journal, (ii) year, (iii) abstract.
4. Note that searches that yield 0 results default to smart text searching. We delete these searches in the end, yielding skipping numbers in the search numbers (i.e., S58 can skip to S60 if zero results were in S59). See example in `archive/screenshot1.jpg`

# August 6, 2015
1. Talked about the project with Jelte. Considering that the coverage of abstracts as in `data/psycinfo abstract coverage.xls` is not stable over the years, we decided to do sensitivity analyses eliminating years with more than .1, .2, or .3 of abstracts missing (i.e., coverage >.9, >.8, >.7).
2. The file `data/psycinfo abstract coverage.xls` was received from PsycINFO directly. Email conversation available `archive/psycinfo emails.pdf`.

# August 14, 2015
1. Not running the regressions anymore, so point 1 from august 6, 2015 is redundant
2. Downloaded all abstracts from each search term, to sample from for checking coverage of the search.

# August 18, 2015
1. Note that retractions were not searched again because these were already manually checked!
2. Updated `critique_abstracts.xml` because it seemed that there was incorrect extraction, which I noted when coding.
3. Forgot that I used `.bib -> .xml`, so deleted them earlier today. Restored them now.

# October 12, 2015
1. Decided to drop the analyses on false positives and false negatives because CHJH added these on the fly and Jelte did not want them in there.

# April 18, 2016
1. Redownloaded all searches