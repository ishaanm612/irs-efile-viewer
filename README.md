# IRS eFile PDF Generator

## Recommended Specifications

- **CPU:** Minimum of 64 cores recommended (limited returns for more cores)
- **Disk Space:** For an average tax year, it is strongly recommended that you have at least 400GB of free space on your disk to accomodate the generation of HTML files.
- **Expected Runtime:** For an average tax year of 700k filings, around 2 hours is expected with the above specifications.

## Project Overview

### Purpose

The main function of this repo is to take pre-existing IRS XML files and use the XSL stylesheets published by the IRS to convert them into HTML files of the filings, and upload them to S3. The actual transformation part of this is handled by [transform_utils](transform_utils.py), and the fetching, parallelized transformations, and upload are handled by [fetch_irs_files](fetch_irs_files.py).

---

### Structure

#### IRS Stylesheets and Resources

The [mef/](mef/) directory contains stylesheet data provided by the IRS that is used in the transformation process

#### eFile Viewer (deprecated)

The [js/](js/), [css/](css/), [img](img/), [script/](script/), [\_site](_site/), and [vendor/](vendor/) directories are from the original [irs-efile-viewer](https://github.com/betson/irs-efile-viewer) repository. These files are mainly used to conduct the transformations on the frontend and display them in website format. They are not used in this repo, but it is recommended to leave them as is.

#### Main Files/Directories

The main scripts are [fetch_irs_files](fetch_irs_files.py) and [transform_utils](transform_utils.py), with the raw XML files loaded into [data/](data/), and output files being sent to [output/](output/) (and temporary html files going into [output/html_forms/](output/html_forms/))

---

### Configuration

There are several absolute paths configured in both [fetch_irs_files.py](fetch_irs_files.py) (namely destdir), and in [transform_utils.py](transform_utils.py) (stylesheet paths, standalone transformation, etc). In order for the pipeline to function properly, you **_must_** change these to suit your system's path structure.

---

### Running the Script

To run this, simply run [fetch_irs_files.py](fetch_irs_files.py) with max-workers set as high as possible. To change the years that the script is run on, you should adjust the YEARS variable, support is included for tax years 2018-2025 (2025 is partially populated) as of writing this (07/2025). If you wish to run this on different years, you should first run the send_data_to_s3 script from the [IRS 990 Pipeline](https://github.com/DonorAtlas/IRS990-Pipeline) repo. Once you have done that, you can simply add that to the tax year and run the script as shown above.

**Notes:**

- There are several absolute paths configured in both [fetch_irs_files.py](fetch_irs_files.py) (namely dest\_dir), and in [transform_utils.py](transform_utils.py) (stylesheet paths, standalone transformation, etc). In order for the pipeline to function properly, you **_must_** change these to suit your system's path structure.

---

### Adding New Tax Years

For info on how to import a new tax year, it is recommended that you look at the instructions in the [/mef](/mef) directory README. However, after running this, you **must** remove all the Jekyll front matter in the [/mef](/mef) directories (simply find and replace will do) and remove all instances of {{ github.site_url }}. Once this is done, the script will be ready to run.
