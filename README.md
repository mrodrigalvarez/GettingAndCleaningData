## Getting and Cleaning Data Project

This readme gives an overview of the project structure and the achievements.

## Script

### `run_analysis.R`

This file contains the R code required to produce the tidy dataset as per the project specification.

 * First of all, downloads the data for the project (stored as `dataset.zip`), if it is necessary, and 
   extracts it into the working directory. The zip has a single root directory `UCI HAR Dataset`.
 * Reads the raw data from several files, performs the merging and cleaning needed, and writes the
   tidy dataset as `tidy.txt` in the working directory.

It requires the [reshape2](http://cran.r-project.org/web/packages/reshape2/index.html) R package.

## Code Book

### `CodeBook.md`

Describes the variables, the data, and transformations that performed to clean up the data.
