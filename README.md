# IRS eFile PDF Generator

## Recommended Specifications

It is recommended that you use at least 64 cores when running this script, memory is generally not an issue.

### Running the Script

To run this, simply run `fetch_irs_files.py` with max-workers set as high as possible.

### Adding New Tax Years

For info on how to import a new tax year, it is recommended that you look at the instructions in the [/mef](/mef) directory README. However, after running this, you **must** remove all the Jekyll front matter in the [/mef](/mef) directories (simply find and replace will do) and remove all instances of {{ github.site_url }}. Once this is done, the script will be ready to run.
