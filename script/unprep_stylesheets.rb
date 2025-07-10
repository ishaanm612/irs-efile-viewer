#!/usr/bin/env ruby

def unprep_stylesheets
    root_directory = File.expand_path("..", __dir__)
    mef_directory = File.expand_path("mef", root_directory)
    Dir.chdir(mef_directory) do

        # Find and update all files that have Jekyll-style URLs
        # Dependency: ack
        files_with_jekyll_urls = `ack -l "\\{\\{ site\\.github\\.url \\}\\}/mef/"`.split(/\n/)
        for filename in files_with_jekyll_urls
            contents = File.read(filename)

            # replace Jekyll URLs back to relative URLs
            contents.gsub!(/\{\{ site\.github\.url \}\}\/mef\//, "file:///Users/ishaan/Documents/Projects/DonorAtlas/irs-efile-viewer/mef")

            # remove Jekyll front matter if it exists at the beginning
            if contents =~ /\A---\n---\n/
                contents = contents.sub(/\A---\n---\n/, "")
            end

            File.open(filename, "w") { |file| file << contents }
        end

        # Find and update all files that reference /rrprd and change back to /rrdprd
        # (Note: This reverses the typo fix, use with caution)
        # Dependency: ack
        # files_with_rrprd_urls = `ack -l -i "mef/rrprd/"`.split(/\n/)
        # for filename in files_with_rrprd_urls
        #     contents = File.read(filename)
        #     contents.gsub!(/mef\/rrprd\//i, "mef/rrdprd/")
        #     File.open(filename, "w") { |file| file << contents }
        # end

        # Additional cleanup: find any remaining files with Jekyll front matter and remove it
        puts "Checking for any remaining Jekyll front matter..."
        files_with_front_matter = `ack -l "^---$"`.split(/\n/)
        for filename in files_with_front_matter
            contents = File.read(filename)
            if contents =~ /\A---\n---\n/
                contents = contents.sub(/\A---\n---\n/, "")
                File.open(filename, "w") { |file| file << contents }
                puts "  Removed front matter from: #{filename}"
            end
        end
    end

    puts %{
All files have been un-prepped:
  - Jekyll URLs have been replaced back to relative URLs
  - Jekyll front matter has been removed
}
end

# Allow the script to be run directly
if __FILE__ == $0
    unprep_stylesheets
end 