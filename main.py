import argparse
import os
import re
from lxml import etree


def remove_namespaces(xml_string):
    """Remove namespaces from XML string, similar to the JavaScript version"""
    import re

    # First remove xmlns:prefix="..." declarations
    xml_string = re.sub(r'\s*xmlns:[^=]+="[^"]*"', "", xml_string)
    # Then remove default xmlns="..." declarations
    xml_string = re.sub(r'\s*xmlns="[^"]*"', "", xml_string)
    # Also remove xsi:schemaLocation if present
    xml_string = re.sub(r'\s*xsi:schemaLocation="[^"]*"', "", xml_string)
    return xml_string


def format_tin(tin):
    if not tin or len(tin) < 9:
        return tin
    return f"{tin[:2]}-{tin[2:]}"


def format_date(date):
    if not date:
        return date
    return date.split("T")[0].replace(" ", "")


def get_xpath_value(dom, xpath):
    result = dom.xpath(xpath)
    if not result:
        return None
    if isinstance(result[0], etree._Element):
        return result[0].text
    return result[0]


def set_node_value(dom, node_name, value):
    node = dom.find(".//" + node_name)
    if node is not None and value is not None:
        node.text = value


def move_header_and_main_form(input_dom, template_dom, form_id):
    form_data = input_dom.find(".//" + form_id)
    form_header = input_dom.find(".//ReturnHeader")
    t_header = template_dom.find(".//ReturnHeader")
    t_data = template_dom.find(".//SubmissionDocument")
    if t_header is not None and form_header is not None:
        t_header.getparent().replace(t_header, form_header)
    if t_data is not None and form_data is not None:
        t_data.append(form_data)


def get_stylesheet_path(stylesheet_dir, year, form_id):
    return os.path.join(stylesheet_dir, year, f"{form_id}.xsl")


def main():
    parser = argparse.ArgumentParser(
        description="Transform IRS XML e-file to HTML using XSLT."
    )
    parser.add_argument("--input", required=True, help="Input IRS XML file")
    parser.add_argument("--output", required=True, help="Output HTML file")
    parser.add_argument("--form", required=False, help="Form ID (e.g., IRS990)")
    args = parser.parse_args()

    # Load and clean XML files (remove namespaces like the JavaScript version)
    with open(args.input, "r", encoding="utf-8") as f:
        input_xml_content = f.read()

    # Remove namespaces to match JavaScript behavior
    clean_input_xml = remove_namespaces(input_xml_content)
    # Parse from bytes to avoid encoding declaration issues
    input_dom = etree.fromstring(clean_input_xml.encode("utf-8"))

    template_dom = etree.parse(
        "/home/ec2-user/DonorAtlas/irs-efile-viewer/form_template.xml"
    )

    # Determine form_id
    if args.form:
        form_id = args.form
    else:
        # Try to auto-detect the form (namespaces are already removed)
        return_data = input_dom.find(".//ReturnData")
        form_id = None
        if return_data is not None:
            if len(return_data) > 0:
                # Get the first child element (which should be the main form)
                form_id = return_data[0].tag

        if not form_id:
            raise Exception("Could not determine form ID.")

    # Move header and main form
    move_header_and_main_form(input_dom, template_dom, form_id)

    # Set template properties
    props_to_transfer = [
        ("/Return/@returnVersion", "ReturnVersion", None),
        ("/Return/@returnVersion", "SubmissionVersion", None),
        ("//ReturnHeader/TaxYr", "TaxYear", None),
        ("//ReturnHeader/ReturnTs|//ReturnHeader/Timestamp", "SystemMode", format_date),
        (
            "//ReturnHeader/ReturnTypeCd|//ReturnHeader/ReturnType",
            "SubmissionType",
            None,
        ),
        ("//ReturnHeader/Filer/EIN", "TINLatest", format_tin),
        ("//ReturnHeader/Filer/EIN", "TIN", format_tin),
        (f"//{form_id}/@documentId", "DocumentId", None),
    ]
    for xpath, dest, transform in props_to_transfer:
        # lxml does not support | in XPath, so try both
        val = None
        if "|" in xpath:
            for xp in xpath.split("|"):
                try:
                    result = input_dom.xpath(xp.strip())
                    if result:
                        if isinstance(result[0], etree._Element):
                            val = result[0].text
                        else:
                            val = result[0]
                        break
                except:
                    continue
        else:
            try:
                result = input_dom.xpath(xpath)
                if result:
                    if isinstance(result[0], etree._Element):
                        val = result[0].text
                    else:
                        val = result[0]
            except:
                val = None
        if transform and val:
            val = transform(val)
        set_node_value(template_dom, dest, val)

    # Get year for stylesheet
    year_node = template_dom.find(".//ReturnVersion")
    year = (
        re.search(r"\d{4}", year_node.text).group(0)
        if year_node is not None and year_node.text
        else "2023"
    )
    stylesheet_path = get_stylesheet_path(
        "/home/ec2-user/DonorAtlas/irs-efile-viewer/mef/Stylesheets",
        year,
        form_id,
    )
    # if not os.path.exists(stylesheet_path):
    #     raise Exception(f"Stylesheet not found: {stylesheet_path}")

    # Transform
    print(stylesheet_path)
    xslt = etree.parse(stylesheet_path, base_url=stylesheet_path)
    transform = etree.XSLT(xslt)
    try:
        result = transform(template_dom)

        # Write output
        with open(args.output, "wb") as f:
            f.write(etree.tostring(result, pretty_print=True, method="html"))

        print(f"Output written to {args.output}")
    except etree.XSLTApplyError as e:
        print("Error applying XSLT: %s", e)
    except etree.XSLTParseError as e:
        print("Error parsing XSLT: %s", e)
    except Exception as e:
        print("Error: %s", e)


if __name__ == "__main__":
    main()
