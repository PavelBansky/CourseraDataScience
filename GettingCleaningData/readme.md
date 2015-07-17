
## Steps

- Download the [data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
- Extract the content and maintain the directory structure
- Plce the `run_analysis.R` into `UCI HAR Dataset`
- Change current directory to the `UCI HAR Dataset` folder `setwd("/UCI HAR Dataset")`
- Run `source("run_analysis.R")`
- The final data are produced in `tidy.txt`
- Codes are described [here](CodeBook.md)


## How script works

### Task 1

- training data and test data are read into `train.x`, `train.y` and `test.x`, `test.y` tables
- training data are merged and test data are merged together into `data.x` and `data.y` 
- training subjects and test subjects are read into `test.subject` and `training.subject`
- training subjects and test subjects are merged together into `data.subjects`

### Task 2

- features are read into `features`
- Only rows containing `-mean()` or `-std()` are selected
- `data.x` columns are labels with resulting `features`

### Task 3

- activites are read into `activities`
- numbers in `data.y` are replaced with `activities` based on index number

### Step 4

- all tables are merged together `data.x` + `data.y` + `data.subjects` resulting in `data.final`


### Step 5

- count means for each variable and store it in `data.avg`
- save `data.avg` into file `tidy.txt`


