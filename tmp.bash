# 1) create a temp copy with absolute file:// URLs
# 2) run wkhtmltopdf with local-file access allowed
touch bobX.html
tmp=bobX.html && \
sed "s|\"/mef/|\"file:///home/ec2-user/DonorAtlas/irs-efile-viewer/mef/|g" \
    bob.html > "$tmp" && \
wkhtmltopdf --enable-local-file-access \
            --allow /home/ec2-user/DonorAtlas/irs-efile-viewer \
            -s Legal \
            "$tmp" bob.pdf
# rm "$tmp "