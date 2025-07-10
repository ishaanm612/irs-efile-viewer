import argparse
import os
import re
from lxml import etree

def format_tin(tin):
    if not tin or len(tin) < 9:
        return tin
    return f"{tin[:2]}-{tin[2:]}"

def format_date(date):
    if not date:
        return date
    return date.split('T')[0].replace(' ', '')

def get_xpath_value(dom, xpath):
    result = dom.xpath(xpath)
    if not result:
        return None
    if isinstance(result[0], etree._Element):
        return result[0].text
    return result[0]

def set_node_value(dom, node_name, value):
    node = dom.find('.//' + node_name)
    if node is not None and value is not None:
        node.text = value

def move_header_and_main_form(input_dom, template_dom, form_id):
    form_data = input_dom.find('.//' + form_id)
    form_header = input_dom.find('.//ReturnHeader')
    t_header = template_dom.find('.//ReturnHeader')
    t_data = template_dom.find('.//SubmissionDocument')
    if t_header is not None and form_header is not None:
        t_header.getparent().replace(t_header, form_header)
    if t_data is not None and form_data is not None:
        t_data.append(form_data)

def get_stylesheet_path(stylesheet_dir, year, form_id):
    return os.path.join(stylesheet_dir, year, f"{form_id}.xsl")

def main():
    parser = argparse.ArgumentParser(description="Transform IRS XML e-file to HTML using XSLT.")
    parser.add_argument('--input', required=True, help='Input IRS XML file')
    parser.add_argument('--template', required=True, help='Template XML file')
    parser.add_argument('--output', required=True, help='Output HTML file')
    parser.add_argument('--stylesheets', required=True, help='Directory containing XSLT stylesheets')
    parser.add_argument('--form', required=False, help='Form ID (e.g., IRS990)')
    args = parser.parse_args()

    # Load XML files
    input_dom = etree.parse(args.input)
    template_dom = etree.parse(args.template)

    # Determine form_id
    if args.form:
        form_id = args.form
    else:
        # Try to auto-detect the form
        return_data = input_dom.find('.//ReturnData')
        form_id = return_data[0].tag if return_data is not None and len(return_data) > 0 else None
        if not form_id:
            raise Exception("Could not determine form ID.")

    # Move header and main form
    move_header_and_main_form(input_dom, template_dom, form_id)

    # Set template properties
    props_to_transfer = [
        ('/Return/@returnVersion', 'ReturnVersion', None),
        ('/Return/@returnVersion', 'SubmissionVersion', None),
        ('//ReturnHeader/TaxYr', 'TaxYear', None),
        ('//ReturnHeader/ReturnTs|//ReturnHeader/Timestamp', 'SystemMode', format_date),
        ('//ReturnHeader/ReturnTypeCd|//ReturnHeader/ReturnType', 'SubmissionType', None),
        ('//ReturnHeader/Filer/EIN', 'TINLatest', format_tin),
        ('//ReturnHeader/Filer/EIN', 'TIN', format_tin),
        (f'//{form_id}/@documentId', 'DocumentId', None)
    ]
    for xpath, dest, transform in props_to_transfer:
        # lxml does not support | in XPath, so try both
        if '|' in xpath:
            for xp in xpath.split('|'):
                val = get_xpath_value(input_dom, xp)
                if val:
                    break
        else:
            val = get_xpath_value(input_dom, xpath)
        if transform and val:
            val = transform(val)
        set_node_value(template_dom, dest, val)

    # Get year for stylesheet
    year_node = template_dom.find('.//ReturnVersion')
    year = re.search(r'\d{4}', year_node.text).group(0) if year_node is not None and year_node.text else '2023'
    stylesheet_path = get_stylesheet_path(args.stylesheets, year, form_id)
    if not os.path.exists(stylesheet_path):
        raise Exception(f"Stylesheet not found: {stylesheet_path}")

    # Transform
    xslt = etree.parse(stylesheet_path)
    transform = etree.XSLT(xslt)
    result = transform(template_dom)

    # Write output
    with open(args.output, 'wb') as f:
        f.write(etree.tostring(result, pretty_print=True, method='html'))

    print(f"Output written to {args.output}")

if __name__ == '__main__':
    main()