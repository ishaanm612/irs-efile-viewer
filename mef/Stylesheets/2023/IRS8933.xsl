<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8933Style.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8933"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 8933"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
					<xsl:call-template name="IRS8933Style"/>
					<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8933">
					<xsl:call-template name="DocumentHeader"/>
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$RtnDoc/BinaryAttachment"/>
					</xsl:call-template>
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$RtnDoc/GeneralDependencySmall"/>
					</xsl:call-template>
					<div class="styStdDiv">
						<div class="styFNBox" style="width:39mm;height:18mm;">
							Form <span class="styFN" style="font-size:18pt;">8933</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>(Rev. October 2023)<br/>
							<span class="styAgency" style="padding-top:1mm;"> Department of the Treasury <br/>Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:114mm;height:18mm;">
							<span class="styFMT" style="font-size:12pt;padding-top:1mm;">Carbon Oxide Sequestration Credit</span>
							<br/>
							<span class="styFMT" style="font-size:7.5pt;padding-top:1mm;">Attach to your tax return.</span>
							<br/>
							<span style="font-weight:bold;">Go to <span style="font-style:italic;font-size:7.5pt;">www.irs.gov/Form8933 </span> for instructions and the latest information.</span>
						</div>
						<div class="styTYBox" style="width:33mm;height:18mm;">
							<div class="styOMB" style="font-size:7.5pt;border-bottom-width:1px; padding-top:2mm;padding-bottom:2mm;height:9mm;">OMB No. 1545-2132</div>
							<div style="text-align:left;width:100%; padding-left: 3mm; height:9mm;padding-top:3mm;">Attachment<br/>Sequence No. <span class="styBoldText">165</span>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styNameBox" style="width:145mm;height:auto;padding-bottom:1mm;font-size:7pt;">
							Name(s) shown on return<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:40mm;height:auto;padding-bottom:1mm;font-size:7pt;padding-left:2mm;">
							Identifying number<br/>
							<span class="styEINFld" style="width:40mm; text-align:left;padding-top:3mm;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="font-size:9pt;font-weight:bold;">Part I</div>
						<div class="styPartDesc" style="font-size:9pt;font-weight:bold;">Information About You</div>
					</div>
					<div class="styStdDiv" style="font-size:10pt;font-weight:bold;">Check the applicable box(es). See instructions before completing this form.</div>
					<!--Part 1 Line 1-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:175mm;font-weight:normal;">
							You have obtained an analysis of lifecycle greenhouse gas emissions (LCA) approved by the IRS
							<span class="sty8933DotLn">............</span>
						</div>
						<input type="checkbox" class="styCkboxNM" style="float:right;" alt="Lifecycle greenhouse gas emissions (LCA)">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/LCAInd"/>
								<xsl:with-param name="BackupName">F8933/LCAInd</xsl:with-param>
							</xsl:call-template>
						</input>
					</div>
					<!--Part 1 Line 2-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:175mm;font-weight:normal;">
							You captured qualified carbon oxide during the tax year
							<span class="sty8933DotLn">........................</span>
						</div>
						<input type="checkbox" class="styCkboxNM" style="float:right;" alt="Capture Qualified Carbon Oxide Ind">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/CaptureQualifiedCarbonOxideInd"/>
								<xsl:with-param name="BackupName">F8933/CaptureQualifiedCarbonOxideInd</xsl:with-param>
							</xsl:call-template>
						</input>
					</div>
					<!--Part 1 Line 3-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:175mm;font-weight:normal;">
							You physically disposed, used as a tertiary injectant in a qualified enhanced oil or natural gas recovery project, or utilized captured qualified
						</div>
						<div class="styLNDesc" style="width:183mm;font-weight:normal;padding-left:8mm;">
							 carbon oxide during the tax year
							<span class="sty8933DotLn">................................</span>
						</div>
						<input type="checkbox" class="styCkboxNM" style="padding-top:3mm;float:right;" alt="physically disposed captured qualified carbon oxide">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/PhysclDisposCptrQlfyCrbnOxdInd"/>
								<xsl:with-param name="BackupName">F8933/PhysclDisposCptrQlfyCrbnOxdInd</xsl:with-param>
							</xsl:call-template>
						</input>
					</div>
					<!--Part 1 Line 4-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:175mm;font-weight:normal;">
							You elected to allow another taxpayer to claim the carbon oxide sequestration credit that you would’ve otherwise been entitled to
							<span class="sty8933DotLn">..</span>
						</div>
						<input type="checkbox" class="styCkboxNM" style="float:right;" alt="elected to allow another taxpayer to claim the carbon oxide sequestration credit">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/ElectTPClmCrbnOxdSqstrtnCrInd"/>
								<xsl:with-param name="BackupName">F8933/ElectTPClmCrbnOxdSqstrtnCrInd</xsl:with-param>
							</xsl:call-template>
						</input>
					</div>
					<!--Part 1 Line 5-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:175mm;font-weight:normal;">
							You elected to allow another taxpayer to claim the carbon oxide sequestration credit that you would’ve otherwise been entitled to
							<span class="sty8933DotLn">..</span>
						</div>
						<input type="checkbox" class="styCkboxNM" style="float:right;" alt="taxpayer elected to allow you to claim the carbon oxide sequestration credit">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/TPElectClmCrbnOxdSqstrtnCrInd"/>
								<xsl:with-param name="BackupName">F8933/TPElectClmCrbnOxdSqstrtnCrInd</xsl:with-param>
							</xsl:call-template>
						</input>
					</div>
					<!--Part 1 Line 6-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:175mm;font-weight:normal;">
							Reserved for future use
							<span class="sty8933DotLn">...................................</span>
						</div>
						<input type="checkbox" class="styCkboxNM" disabled="disabled" style="float:right;" alt="Line 6 check box unavailable"/>
					</div>
					<!--Part 1 Line 7-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width:175mm;font-weight:normal;">
							Reserved for future use
							<span class="sty8933DotLn">...................................</span>
						</div>
						<input type="checkbox" class="styCkboxNM" disabled="disabled" style="float:right;" alt="Line 7 check box unavailable"/>
					</div>
					<!--Part 1 Line 8-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="width:175mm;font-weight:normal;">
							Reserved for future use
							<span class="sty8933DotLn">...................................</span>
						</div>
						<input type="checkbox" class="styCkboxNM" disabled="disabled" style="float:right;" alt="Line 8 check box unavailable"/>
					</div>
					<!-- Part II -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="font-size:9pt;font-weight:bold;">Part II</div>
						<div class="styPartDesc" style="font-size:9pt;font-weight:bold;">Information About Facility (see instructions)</div>
					</div>
					<!--Line 1-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:60mm;">IRS-issued registration number of the facility: </div>
						<div class="styLNDesc" style="width:118mm;border-bottom:1px dashed black;margin-bottom:1px;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityIRSIssdRegistrationNum"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 2-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:63mm;">Facility’s EPA e-GGRT ID number(s), if available: </div>
						<div class="styLNDesc" style="width:115mm;border-bottom:1px dashed black;margin-bottom:1px;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityEPAeGGRTIdNum"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 3-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:85mm;">Type and description of facility you are claiming (see instructions): </div>
						<!--<div class="styLNDesc" style="width:186mm;border-bottom:1px dashed black;margin-bottom:1px;text-align:left;min-height:3mm;height:auto;padding-left:9mm;">-->
						<div class="styLNDesc" style="width:186mm;border-bottom:1px dashed black;min-height:3mm;height:auto;padding-left:9mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityDesc"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 4-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:170mm;">Location of facility, including coordinates (latitude and longitude) </div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
						<div class="styLNDesc" style="width:48mm;">Address of the facility (if applicable):</div>
						<div class="styLNDesc" style="width:130mm;min-height:3.5mm;height:auto;border-bottom:1px dashed black;margin-bottom:1px;">
							<xsl:call-template name="PopulateUSAddressTemplate">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityUSAddress"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="margin-top:1mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:50mm;">Coordinates (if applicable). &nbsp; Latitude: </div>
						<div class="styLNDesc" style="width:50mm;height:auto;">
							<div style="width:100%;border:1px solid black;text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:24mm;padding-left:8mm;">Longitude: </div>
						<div class="styLNDesc" style="width:50mm;height:auto;">
							<div style="width:100%;border:1px solid black;text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:56mm;">Date construction began (MM/DD/YYYY): </div>
						<div class="styLNDesc" style="width:38mm;border-bottom:1px solid black;margin-bottom:1px;text-align:center;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityConstructionStartDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:56mm;">Date placed in service (MM/DD/YYYY): </div>
						<div class="styLNDesc" style="width:38mm;border-bottom:1px solid black;margin-bottom:1px;text-align:center;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityPlacedInServiceDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width:100mm;">Total metric tons of carbon oxide captured during the calendar year: </div>
						<div class="styLNAmountBox" style="width:45mm;border-top-width:1px;border-right-width:1px;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalMetricTonsCrbnOxdCptrQty"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part III -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="font-size:9pt;font-weight:bold;">Part III</div>
						<div class="styPartDesc" style="font-size:9pt;font-weight:bold;">Credit Calculation</div>
					</div>
					<div class="styStdDiv" style="font-size:10pt;font-weight:bold;">Section A—Facilities at Which Qualified Carbon Oxide Qualifies for a Credit Under Section </div>
					<div class="styStdDiv" style="font-size:10pt;font-weight:bold;padding-left:22mm;">45Q(a)(1) or (2) for Which an Election Was Made Under Section 45Q(b)(3)</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:140mm;height:14mm;">
							Qualified carbon oxide captured using carbon capture equipment originally placed in service 
							at a qualified facility on or after February 9, 2018, and before 2023, disposed of in secure
							geological storage, and not used as a tertiary injectant in a qualified enhanced oil or natural gas
							recovery project, nor utilized as described in section 45Q(f)(5).	
						</div>
						<div class="styLNRightNumBox" style="height:14mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:14mm;border-bottom-width:0px;background-color:lightgrey"/>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:7mm;padding-left:5mm">a </div>
						<div class="styLNDesc" style="width:102mm;height:7mm;">
							<span style="float: left; clear: none;">Metric tons captured and disposed of and for which you didn’t elect for another taxpayer to claim the carbon oxide sequestration credit
								<span class="sty8933DotLn">.......</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm">1a </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:7mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdNotUsedUtlzSectAGrp/MtrcTonNotUsedUtlzCptrSectAQty"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:7mm;border-bottom-width:0px"/>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">b </div>
						<div class="styLNDesc" style="width:102mm;height:4mm;">
							<span style="float: left; clear: none;">Inflation-adjusted credit rate (see instructions)</span>
							<span class="sty8933DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">1b </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdNotUsedUtlzSectAGrp/InfltnAdjNotUsedUtlzRtSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:0px"/>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">c </div>
						<div class="styLNDesc" style="width:140mm;height:4mm;">
							<span style="float: left; clear: none;font-size:6.5pt;">Multiply line 1a by line 1b. See instructions for attaching Model Certificates CF, DISP-Operator, and DISP-Owner</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Part III - Line 1c - Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdNotUsedUtlzSectAGrp/MtrcTonNotUsedUtlzCrSectAAmt/@desc"/>
								<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:1px">1c</div>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdNotUsedUtlzSectAGrp/MtrcTonNotUsedUtlzCrSectAAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 2-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:140mm;height:14mm;">
							Qualified carbon oxide captured using carbon capture equipment originally placed in service 
							at a qualified facility on or after February 9, 2018, and before 2023, disposed of in secure
							geological storage, and not used as a tertiary injectant in a qualified enhanced oil or natural gas
							recovery project.	
						</div>
						<div class="styLNRightNumBox" style="height:14mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:14mm;border-bottom-width:0px;background-color:lightgrey"/>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:7mm;padding-left:5mm">a </div>
						<div class="styLNDesc" style="width:102mm;height:7mm;">
							<span style="float: left; clear: none;">Metric tons captured and disposed of and for which you didn’t elect for another taxpayer to claim the carbon oxide sequestration credit
								<span class="sty8933DotLn">.......</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;">2a </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:7mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUsedSectAGrp/MtrcTonUsedCptrSectAQty"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:7mm;border-bottom-width:0px"/>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">b </div>
						<div class="styLNDesc" style="width:102mm;height:4mm;">
							<span style="float: left; clear: none;">Inflation-adjusted credit rate (see instructions)</span>
							<span class="sty8933DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">2b </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUsedSectAGrp/InfltnAdjUsedCrRtSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:0px"/>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">c </div>
						<div class="styLNDesc" style="width:140mm;height:4mm;">
							<span style="float: left; clear: none;font-size:6.5pt;">Multiply line 2a by line 2b. See instructions for attaching Model Certificates CF, EOR-Operator, and EOR-Owner</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Part III - Line 2c - Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUsedSectAGrp/MtrcTonUsedCrSectAAmt/@desc"/>
								<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:1px">2c</div>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUsedSectAGrp/MtrcTonUsedCrSectAAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 3-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:140mm;height:14mm;">
							Qualified carbon oxide captured using carbon capture equipment originally placed in service 
							at a qualified facility on or after February 9, 2018, and before 2023, utilized as described in section 45Q(f)(5).	
						</div>
						<div class="styLNRightNumBox" style="height:14mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:14mm;border-bottom-width:0px;background-color:lightgrey"/>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:7mm;padding-left:5mm">a </div>
						<div class="styLNDesc" style="width:102mm;height:7mm;">
							<span style="float: left; clear: none;">Metric tons captured and disposed of and for which you didn’t elect for another taxpayer to claim the carbon oxide sequestration credit
								<span class="sty8933DotLn">.......</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;">3a </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:7mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonCptrUtlzSectAQty"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:7mm;border-bottom-width:0px"/>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">b </div>
						<div class="styLNDesc" style="width:102mm;height:4mm;">
							<span style="float: left; clear: none;">Inflation-adjusted credit rate (see instructions)</span>
							<span class="sty8933DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">3b </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/InfltnAdjUtlzCrRtSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:0px"/>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm;">c </div>
						<div class="styLNDesc" style="width:140mm;height:4mm;">
							<span style="float: left; clear: none;font-size:7pt;">Multiply line 3a by line 3b. See instructions for attaching Model Certificates CF and UTZ</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Part III - Line 3c - Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt/@desc"/>
								<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:1px;">3c</div>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					<div class="pageEnd" style="width:187mm;padding-top:1mm;clear:all;float:none;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
							<span style="width:13mm;"/>                        
							  Cat. No. 37748H 
						</div>
						<div style="float:right;">
							<!--<span style="width:40px;"/>-->  
						 Form <span class="styBoldText" style="font-size:8pt;">8933</span> (Rev. 10-2023)
						</div>
					</div>
					
					<!--Begin Page 2 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;float:none;">
						<div style="float:left;">Form 8933 (Rev. 10-2023)<span style="width:110mm;"/></div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>
					</div>
					<!-- Part III -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="font-size:9pt;font-weight:bold;">Part III</div>
						<div class="styPartDesc" style="font-size:9pt;font-weight:bold;">Credit Calculation (continued)</div>
					</div>
					<div class="styStdDiv" style="font-size:9pt;font-weight:bold;">Section A—Facilities at Which Qualified Carbon Oxide Qualifies for a Credit Under Section </div>
					<div class="styStdDiv" style="font-size:9pt;font-weight:bold;padding-left:22mm;">45Q(a)(1) or (2) for Which an Election Was Made Under Section 45Q(b)(3)(continued)</div>
					<!--Line 4-->
					<div class="styStdDiv" style="border-top:1px solid black;width:185mm;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:139mm;height:10mm;">
							Qualified carbon oxide captured using carbon capture equipment originally placed in service at a qualified facility after 2022, 
							disposed of in secure geological storage, and not used as a tertiary injectant in a qualified enhanced oil or 
							natural gas recovery project, nor utilized as described in section 45Q(f)(5).
						</div>
						<div class="styLNRightNumBox" style="height:10mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:10mm;border-bottom-width:0px;background-color:lightgrey"/>
					</div>
					<!--Line 4a-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:5mm">a </div>
						<div class="styLNDesc" style="width:53mm;height:8mm;">
							<span style="float: left; clear: none;">
								<input type="checkbox" class="styCkbox" alt="Qualified opportunity fund No">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd"/>
										<xsl:with-param name="BackupName">F8933QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:normal;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd"/>
										<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
									<span style="width: 1mm; font-weight:normal;"/>Satisfies prevailing wage and <br/>
									<span style="width: 6mm;"/>apprenticeship requirements*.
								</label>
							</span>
						</div>
						<div class="styLNDesc" style="width:34mm;padding-top:3mm;height:auto;">
							<div style="width:105%;border:1px solid black;text-align:center;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd/@stsfyPrvlWgNotUsedAftrSectAQty"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:14mm;padding-left:4mm;padding-top:4mm">X $85</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:3mm;">4a </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd/@stsfyPrvlWgNotUsedAftrSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:8mm;border-bottom-width:0px"/>
					</div>
					<!--Line 4b-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:5mm">b </div>
						<div class="styLNDesc" style="width:53mm;height:9mm;">
							<span style="float: left; clear: none;">
								<input type="checkbox" class="styCkbox" alt="Qualified opportunity fund No">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd"/>
										<xsl:with-param name="BackupName">F8933QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:normal;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd"/>
										<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
									<span style="width: 1mm; font-weight:normal;"/>Doesn’t satisfy prevailing wage and<br/>
									<span style="width: 6mm;"/> apprenticeship requirements*.
							</label>
							</span>
						</div>
						<div class="styLNDesc" style="width:34mm;padding-top:4mm;height:auto;">
							<div style="width:105%;border:1px solid black;text-align:center;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd/@dstsfyPrvlNotUsedAftrSectAQty"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:14mm;padding-left:4mm;padding-top:4mm">X $17</div>
						<div class="styLNRightNumBox" style="height:9mm;padding-top:3mm;">4b </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:9mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd/@dstsfyPrvlNotUsedAftrSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:9mm;border-bottom-width:0px;"/>
					</div>
					<!--Line 4c-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm;">c </div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float: left; clear: none;font-size:7pt;">Add lines 4a and 4b. See instructions for attaching Model Certificates CF, DISP-Operator, and DISP Owner</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Part III - Line 4c - Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt/@desc"/>
								<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:1px">4c</div>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					<!--Line 5 Part III-->
					
					<!--Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:139mm;height:10mm;">
							Qualified carbon oxide captured using carbon capture equipment originally placed in service at a qualified facility after 2022, 
							disposed of in secure geological storage, and used as a tertiary injectant in a qualified enhanced oil or 
							natural gas recovery project.
						</div>
						<div class="styLNRightNumBox" style="height:10mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:10mm;border-bottom-width:0px;background-color:lightgrey"/>
					</div>
					<!--Line 5a-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:5mm">a </div>
						<div class="styLNDesc" style="width:53mm;height:8mm;">
							<span style="float: left; clear: none;">
								<input type="checkbox" class="styCkbox" alt="Qualified opportunity fund No">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd"/>
										<xsl:with-param name="BackupName">F8933QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:normal;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd"/>
										<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
									<span style="width: 1mm; font-weight:normal;"/>Satisfies prevailing wage and <br/>
									<span style="width: 6mm;"/>apprenticeship requirements*.
								</label>
							</span>
						</div>
						<div class="styLNDesc" style="width:34mm;padding-top:3mm;height:auto;">
							<div style="width:105%;border:1px solid black;text-align:center;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd/@stsfyPrvlWgNotUsedAftrSectAQty"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:14mm;padding-left:4mm;padding-top:4mm">X $60</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:3mm;">5a </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd/@stsfyPrvlWgNotUsedAftrSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:8mm;border-bottom-width:0px"/>
					</div>
					<!--Line 5b-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:9mm;padding-left:5mm">b </div>
						<div class="styLNDesc" style="width:53mm;height:9mm;">
							<span style="float: left; clear: none;">
								<input type="checkbox" class="styCkbox" alt="Qualified opportunity fund No">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd"/>
										<xsl:with-param name="BackupName">F8933QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:normal;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd"/>
										<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
									<span style="width: 1mm; font-weight:normal;"/>Doesn’t satisfy prevailing wage and<br/>
									<span style="width: 6mm;"/> apprenticeship requirements*.
							</label>
							</span>
						</div>
						<div class="styLNDesc" style="width:34mm;padding-top:4mm;height:auto;">
							<div style="width:100%;border:1px solid black;text-align:center;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd/@dstsfyPrvlNotUsedAftrSectAQty"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:14mm;padding-left:4mm;padding-top:4mm">X $12</div>
						<div class="styLNRightNumBox" style="height:9mm;padding-top:3mm;">5b </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:9mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd/@dstsfyPrvlNotUsedAftrSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:9mm;border-bottom-width:0px"/>
					</div>
					<!--Line 5c-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">c </div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float: left; clear: none;font-size:7pt;">Add lines 5a and 5b. See instructions for attaching Model Certificates CF, EOR-Operator, and EOR-Owner</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Part III - Line 4c - Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt/@desc"/>
								<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:1px">5c</div>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End Line 5 Part III-->
					
					
					<!--Line 6 Part III-->
					
					<!--Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:139mm;height:10mm;">
							Qualified carbon oxide captured using carbon capture equipment originally placed in service at a qualified facility after 2022, 
							and utilized as described in section 45Q(f)(5).
						</div>
						<div class="styLNRightNumBox" style="height:10mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:10mm;border-bottom-width:0px;background-color:lightgrey"/>
					</div>
					<!--Line 6a-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:5mm">a </div>
						<div class="styLNDesc" style="width:53mm;height:8mm;">
							<span style="float: left; clear: none;">
								<input type="checkbox" class="styCkbox" alt="Qualified opportunity fund No">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd"/>
										<xsl:with-param name="BackupName">F8933QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:normal;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd"/>
										<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
									<span style="width: 1mm; font-weight:normal;"/>Satisfies prevailing wage and <br/>
									<span style="width: 6mm;"/>apprenticeship requirements*.
								</label>
							</span>
						</div>
						<div class="styLNDesc" style="width:34mm;padding-top:3mm;height:auto;">
							<div style="width:105%;border:1px solid black;text-align:center;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd/@stsfyPrvlWgNotUsedAftrSectAQty"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:14mm;padding-left:4mm;padding-top:4mm">X $60</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:3mm;">5a </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd/@stsfyPrvlWgNotUsedAftrSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:8mm;border-bottom-width:0px"/>
					</div>
					<!--Line 6b-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:9mm;padding-left:5mm">b </div>
						<div class="styLNDesc" style="width:53mm;height:9mm;">
							<span style="float: left; clear: none;">
								<input type="checkbox" class="styCkbox" alt="Qualified opportunity fund No">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd"/>
										<xsl:with-param name="BackupName">F8933QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:normal;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd"/>
										<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
									<span style="width: 1mm; font-weight:normal;"/>Doesn’t satisfy prevailing wage and<br/>
									<span style="width: 6mm;"/> apprenticeship requirements*.
							</label>
							</span>
						</div>
						<div class="styLNDesc" style="width:34mm;padding-top:4mm;height:auto;">
							<div style="width:105%;border:1px solid black;text-align:center;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd/@dstsfyPrvlNotUsedAftrSectAQty"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:14mm;padding-left:4mm;padding-top:4mm">X $12</div>
						<div class="styLNRightNumBox" style="height:9mm;padding-top:3mm;">6b </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:9mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd/@dstsfyPrvlNotUsedAftrSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:9mm;border-bottom-width:0px"/>
					</div>
					<!--Line 6c-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">c </div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float: left; clear: none;font-size:7pt;">Add lines 6a and 6b. See instructions for attaching Model Certificates CF and UTZ</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Part III - Line 6c - Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt/@desc"/>
								<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:1px">6c</div>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End Line 6 Part III-->

					<div class="styStdDiv" style="font-size:7.5pt;font-weight:normal;">
					 * Check the box and enter metric tons captured and disposed of and for which you didn’t elect for another taxpayer to claim the credit.</div>

					<div class="styStdDiv" style="font-size:9pt;font-weight:bold;border-top:1px solid black; ">
					Section B—Qualified Facilities Under Section 45Q(a)(3) or (4) for Which No Election Was Made</div> 
					<div class="styStdDiv" style="font-size:9pt;font-weight:bold;padding-left:22mm;border-bottom:1px solid black;">Under Section 45Q(b)(3)</div>
					
					<!--Line 7-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width:140mm;height:17mm;font-size:7pt;font-weight:bold;">
							Qualified carbon oxide captured using carbon capture equipment originally placed in service at
							a qualified facility on or after February 9, 2018, and before 2023, during the 12-year period
							beginning on the date the equipment was originally placed in service, disposed of in secure
							geological storage, and not used as a tertiary injectant in a qualified enhanced oil or natural gas
							recovery project, nor utilized as described in section 45Q(f)(5).
						</div>
						<div class="styLNRightNumBox" style="height:17mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:17mm;border-bottom-width:0px;background-color:lightgrey"/>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:7mm;padding-left:5mm">a </div>
						<div class="styLNDesc" style="width:102mm;height:7mm;">
							<span style="float: left; clear: none;">Metric tons captured and disposed of and for which you didn’t elect for another taxpayer to claim the carbon oxide sequestration credit
								<span class="sty8933DotLn">.......</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;">7a </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:7mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdNotUsedUtlzSectAGrp/MtrcTonNotUsedUtlzCptrSectAQty"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:7mm;border-bottom-width:0px"/>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">b </div>
						<div class="styLNDesc" style="width:102mm;height:4mm;">
							<span style="float: left; clear: none;">Section 45Q(a)(3) applicable dollar amount (see instructions)</span>
							<span class="sty8933DotLn">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">7b </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdNotUsedUtlzSectAGrp/InfltnAdjNotUsedUtlzRtSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:0px"/>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">c </div>
						<div class="styLNDesc" style="width:140mm;height:4mm;">
							<span style="float: left; clear: none;font-size:6.5pt;">Multiply line 7a by line 7b. See instructions for attaching Model Certificates CF, DISP-Operator, and DISP-Owner</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Part III - Line 7c - Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdNotUsedUtlzSectAGrp/MtrcTonNotUsedUtlzCrSectAAmt/@desc"/>
								<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:1px">7c</div>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdNotUsedUtlzSectAGrp/MtrcTonNotUsedUtlzCrSectAAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					<!--Line 8-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="width:140mm;height:17mm;font-size:7pt;font-weight:bold;">
							Qualified carbon oxide captured using carbon capture equipment originally placed in service at
							a qualified facility on or after February 9, 2018, and before 2023, during the 12-year period
							beginning on the date the equipment was originally placed in service, disposed of in secure
							geological storage, and not used as a tertiary injectant in a qualified enhanced oil or natural gas
							recovery project.
						</div>
						<div class="styLNRightNumBox" style="height:17mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:17mm;border-bottom-width:0px;background-color:lightgrey"/>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:7mm;padding-left:5mm">a </div>
						<div class="styLNDesc" style="width:102mm;height:7mm;">
							<span style="float: left; clear: none;">Metric tons captured and disposed of and for which you didn’t elect for another taxpayer to claim the carbon oxide sequestration credit
								<span class="sty8933DotLn">.......</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm">8a </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:7mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdNotUsedUtlzSectAGrp/MtrcTonNotUsedUtlzCptrSectAQty"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:7mm;border-bottom-width:0px"/>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">b </div>
						<div class="styLNDesc" style="width:102mm;height:4mm;">
							<span style="float: left; clear: none;">Section 45Q(a)(4) applicable dollar amount (see instructions)</span>
							<span class="sty8933DotLn">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">8b </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdNotUsedUtlzSectAGrp/InfltnAdjNotUsedUtlzRtSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:0px"/>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">c </div>
						<div class="styLNDesc" style="width:140mm;height:4mm;">
							<span style="float: left; clear: none;font-size:6.5pt;">Multiply line 8a by line 8b. See instructions for attaching Model Certificates CF, EOR-Operator, and EOR-Owner</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Part III - Line 8c - Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdNotUsedUtlzSectAGrp/MtrcTonNotUsedUtlzCrSectAAmt/@desc"/>
								<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;">8c</div>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdNotUsedUtlzSectAGrp/MtrcTonNotUsedUtlzCrSectAAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					<div class="pageEnd" style="width:187mm;padding-top:1mm;clear:all;float:none; border-top:1px solid black;">
						<div style="float:right;">
							<!--<span style="width:40px;"/>-->  
						 Form <span class="styBoldText" style="font-size:8pt;">8933</span> (Rev. 10-2023)
						</div>
					</div>
					
					<!--Begin Page 3 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;float:none;">
						<div style="float:left;">Form 8933 (Rev. 10-2023)<span style="width:110mm;"/></div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span></div>
					</div>
					<!-- Part III -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="font-size:9pt;font-weight:bold;">Part III</div>
						<div class="styPartDesc" style="font-size:9pt;font-weight:bold;">Credit Calculation (continued)</div>
					</div>
					<div class="styStdDiv" style="font-size:9pt;font-weight:bold;">Section B—Qualified Facilities Under Section 45Q(a)(3) or (4) for Which No Election Was Made Under </div>
					<div class="styStdDiv" style="font-size:9pt;font-weight:bold;padding-left:22mm;">Section 45Q(b)(3) (continued)</div>
					
					<!--Line 9-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="width:140mm;height:17mm;font-size:7.5pt;font-weight:bold;">
							Qualified carbon oxide captured using carbon capture equipment originally placed in service at
							a qualified facility on or after February 9, 2018, and before 2023, during the 12-year period
							beginning on the date the equipment was originally placed in service, and utilized as described
							in section 45Q(f)(5).
						</div>
						<div class="styLNRightNumBox" style="height:17mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:17mm;border-bottom-width:0px;background-color:lightgrey"/>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:7mm;padding-left:5mm">a </div>
						<div class="styLNDesc" style="width:102mm;height:7mm;">
							<span style="float: left; clear: none;">Metric tons captured and disposed of and for which you didn’t elect for another taxpayer to claim the carbon oxide sequestration credit
								<span class="sty8933DotLn">.......</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm">9a </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:7mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdNotUsedUtlzSectAGrp/MtrcTonNotUsedUtlzCptrSectAQty"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:7mm;border-bottom-width:0px"/>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">b </div>
						<div class="styLNDesc" style="width:102mm;height:4mm;">
							<span style="float: left; clear: none;">Section 45Q(a)(4) applicable dollar amount (see instructions)</span>
							<span class="sty8933DotLn">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">9b </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdNotUsedUtlzSectAGrp/InfltnAdjNotUsedUtlzRtSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:0px"/>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">c </div>
						<div class="styLNDesc" style="width:140mm;height:4mm;">
							<span style="float: left; clear: none;font-size:6.5pt;">Multiply line 9a by line 9b. See instructions for attaching Model Certificates CF and UTZ</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Part III - Line 8c - Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdNotUsedUtlzSectAGrp/MtrcTonNotUsedUtlzCrSectAAmt/@desc"/>
								<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;">9c</div>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdNotUsedUtlzSectAGrp/MtrcTonNotUsedUtlzCrSectAAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					<!--Line 10-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">10</div>
						<div class="styLNDesc" style="width:140mm;height:17mm;font-weight:bold;">
							Qualified carbon oxide captured using carbon capture equipment originally placed in service 
							at a qualified facility after 2022, during the 12-year period beginning on the date the equipment
							was originally placed in service, disposed of in secure geological storage, and not used as a
							tertiary injectant in a qualified enhanced oil or natural gas recovery project, nor utilized as
							described in section 45Q(f)(5).
						</div>
						<div class="styLNRightNumBox" style="height:17mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:17mm;border-bottom-width:0px;background-color:lightgrey"/>
					</div>
					<!--Line 10a-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:5mm">a </div>
						<div class="styLNDesc" style="width:53mm;height:8mm;">
							<span style="float: left; clear: none;">
								<input type="checkbox" class="styCkbox" alt="Qualified opportunity fund No">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd"/>
										<xsl:with-param name="BackupName">F8933QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:normal;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd"/>
										<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
									<span style="width: 1mm; font-weight:normal;"/>Satisfies prevailing wage and <br/>
									<span style="width: 6mm;"/>apprenticeship requirements*.
								</label>
							</span>
						</div>
						<div class="styLNDesc" style="width:34mm;padding-top:3mm;height:auto;">
							<div style="width:105%;border:1px solid black;text-align:center;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd/@stsfyPrvlWgNotUsedAftrSectAQty"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:14mm;padding-left:4mm;padding-top:4mm">X $85</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:3mm;">10a </div>
						<div class="styLNAmountBox" style="width:31mm;border-bottom-width:1px;height:8mm;padding-top:4mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd/@stsfyPrvlWgNotUsedAftrSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:8mm;border-bottom-width:0px"/>
					</div>
					<!--Line 10b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:5mm">b </div>
						<div class="styLNDesc" style="width:53mm;height:9mm;">
							<span style="float: left; clear: none;">
								<input type="checkbox" class="styCkbox" alt="Qualified opportunity fund No">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd"/>
										<xsl:with-param name="BackupName">F8933QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:normal;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd"/>
										<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
									<span style="width: 1mm; font-weight:normal;"/>Doesn’t satisfy prevailing wage and<br/>
									<span style="width: 6mm;"/> apprenticeship requirements*.
							</label>
							</span>
						</div>
						<div class="styLNDesc" style="width:34mm;padding-top:4mm;height:auto;">
							<div style="width:105%;border:1px solid black;text-align:center;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd/@dstsfyPrvlNotUsedAftrSectAQty"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:14mm;padding-left:4mm;padding-top:3mm">X $17</div>
						<div class="styLNRightNumBox" style="height:9mm;padding-top:4mm;">10b </div>
						<div class="styLNAmountBox" style="width:31mm;border-bottom-width:1px;height:9mm;padding-top:3mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd/@dstsfyPrvlNotUsedAftrSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:9mm;border-bottom-width:0px"/>
					</div>
					<!--Line 10c-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">c </div>
						<div class="styLNDesc" style="width:140mm;height:4mm;">
							<span style="float: left; clear: none;font-size:7pt;">Add lines 10a and 10b. See instructions for attaching Model Certificates CF, DISP-Operator, and DISP Owner</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Part III - Line 4c - Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt/@desc"/>
								<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:1px">10c</div>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					<!--Line 11-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">11</div>
						<div class="styLNDesc" style="width:140mm;height:17mm;font-weight:bold;">
							Qualified carbon oxide captured using carbon capture equipment originally placed in service 
							at a qualified facility after 2022, during the 12-year period beginning on the date the equipment
							was originally placed in service, disposed of in secure geological storage, and used as a
							tertiary injectant in a qualified enhanced oil or natural gas recovery project.
						</div>
						<div class="styLNRightNumBox" style="height:17mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:17mm;border-bottom-width:0px;background-color:lightgrey"/>
					</div>
					<!--Line 11a-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:5mm">a </div>
						<div class="styLNDesc" style="width:53mm;height:8mm;">
							<span style="float: left; clear: none;">
								<input type="checkbox" class="styCkbox" alt="Qualified opportunity fund No">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd"/>
										<xsl:with-param name="BackupName">F8933QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:normal;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd"/>
										<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
									<span style="width: 1mm; font-weight:normal;"/>Satisfies prevailing wage and <br/>
									<span style="width: 6mm;"/>apprenticeship requirements*.
								</label>
							</span>
						</div>
						<div class="styLNDesc" style="width:36mm;padding-top:3mm;height:auto;">
							<div style="width:100%;border:1px solid black;text-align:center;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd/@stsfyPrvlWgNotUsedAftrSectAQty"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:14mm;padding-left:4mm;padding-top:4mm">X $60</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">11a </div>
						<div class="styLNAmountBox" style="width:29mm;border-bottom-width:1px;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd/@stsfyPrvlWgNotUsedAftrSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:8mm;border-bottom-width:0px"/>
					</div>
					<!--Line 11b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:5mm">b </div>
						<div class="styLNDesc" style="width:53mm;height:9mm;">
							<span style="float: left; clear: none;">
								<input type="checkbox" class="styCkbox" alt="Qualified opportunity fund No">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd"/>
										<xsl:with-param name="BackupName">F8933QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:normal;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd"/>
										<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
									<span style="width: 1mm; font-weight:normal;"/>Doesn’t satisfy prevailing wage and<br/>
									<span style="width: 6mm;"/> apprenticeship requirements*.
							</label>
							</span>
						</div>
						<div class="styLNDesc" style="width:34mm;padding-top:4mm;height:auto;">
							<div style="width:105%;border:1px solid black;text-align:center;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd/@dstsfyPrvlNotUsedAftrSectAQty"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:16mm;padding-left:4mm;padding-top:4mm;">X $12</div>
						<div class="styLNRightNumBox" style="height:9mm;padding-top:4mm;">11b </div>
						<div class="styLNAmountBox" style="width:29mm;border-bottom-width:1px;height:9mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd/@dstsfyPrvlNotUsedAftrSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:9mm;border-bottom-width:0px"/>
					</div>
					<!--Line 11c-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">c </div>
						<div class="styLNDesc" style="width:140mm;height:4mm;">
							<span style="float: left; clear: none;font-size:7pt;">Add lines 11a and 11b. See instructions for attaching Model Certificates CF, EOR-Operator, and EOR Owner</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Part III - Line 4c - Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt/@desc"/>
								<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:1px">11c</div>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					<!--Line 12 Part III-->
					
					<!--Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">12</div>
						<div class="styLNDesc" style="width:140mm;height:17mm;font-weight:bold;">
							Qualified carbon oxide captured using carbon capture equipment originally placed in service at
							a qualified facility after 2022, during the 12-year period beginning on the date the equipment
							was originally placed in service, and utilized as described in section 45Q(f)(5).
						</div>
						<div class="styLNRightNumBox" style="height:17mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:17mm;border-bottom-width:0px;background-color:lightgrey"/>
					</div>
					<!--Line 12a-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:5mm">a </div>
						<div class="styLNDesc" style="width:53mm;height:8mm;">
							<span style="float: left; clear: none;">
								<input type="checkbox" class="styCkbox" alt="Qualified opportunity fund No">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd"/>
										<xsl:with-param name="BackupName">F8933QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:normal;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd"/>
										<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
									<span style="width: 1mm; font-weight:normal;"/>Satisfies prevailing wage and <br/>
									<span style="width: 6mm;"/>apprenticeship requirements*.
								</label>
							</span>
						</div>
						<div class="styLNDesc" style="width:34mm;padding-top:3mm;height:auto;">
							<div style="width:105%;border:1px solid black;text-align:center;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd/@stsfyPrvlWgNotUsedAftrSectAQty"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:14mm;padding-left:4mm;padding-top:4mm;">X $60</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">12a </div>
						<div class="styLNAmountBox" style="width:31mm;border-bottom-width:1px;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd/@stsfyPrvlWgNotUsedAftrSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:8mm;border-bottom-width:0px;"/>
					</div>
					<!--Line 12b-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:9mm;padding-left:5mm">b </div>
						<div class="styLNDesc" style="width:53mm;height:9mm;">
							<span style="float: left; clear: none;">
								<input type="checkbox" class="styCkbox" alt="Qualified opportunity fund No">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd"/>
										<xsl:with-param name="BackupName">F8933QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:normal;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd"/>
										<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
									<span style="width: 1mm; font-weight:normal;"/>Doesn’t satisfy prevailing wage and<br/>
									<span style="width: 6mm;"/> apprenticeship requirements*.
							</label>
							</span>
						</div>
						<div class="styLNDesc" style="width:35mm;padding-top:4mm;height:auto;">
							<div style="width:100%;border:1px solid black;text-align:center;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd/@dstsfyPrvlNotUsedAftrSectAQty"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:13mm;padding-left:4mm;padding-top:4mm;">X $12</div>
						<div class="styLNRightNumBox" style="height:9mm;padding-top:4mm;">12b </div>
						<div class="styLNAmountBox" style="width:31mm;border-bottom-width:1px;height:9mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd/@dstsfyPrvlNotUsedAftrSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:9mm;border-bottom-width:0px"/>
					</div>
					<!--Line 12c-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">c </div>
						<div class="styLNDesc" style="width:140mm;height:4mm;">
							<span style="float: left; clear: none;font-size:7pt;">Add lines 12a and 12b. See instructions for attaching Model Certificates CF and UTZ</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Part III - Line 6c - Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt/@desc"/>
								<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:1px">12c</div>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End Line 12 Part III-->

					<div class="styStdDiv" style="font-size:7.5pt;font-weight:normal;">
					 * Check the box and enter metric tons captured and disposed of and for which you didn’t elect for another taxpayer to claim the credit.</div>

					<div class="styStdDiv" style="font-size:8.5pt;font-weight:bold;border-top:1px solid black; border-bottom:1px solid black;">
					Section C—Qualified Direct Air Capture (DAC) Facilities Under Section 45Q(d) Placed in Service After 2022</div> 
					<!--<div class="styStdDiv" style="font-size:9pt;font-weight:bold;padding-left:22mm;border-bottom:1px solid black;">Under Section 45Q(b)(3)</div>-->
					
					<!--Line 13-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">13</div>
						<div class="styLNDesc" style="width:139mm;height:17mm;font-weight:bold;">
							Qualified carbon oxide captured using DAC equipment originally placed in service at 
							a qualified DAC facility after 2022, during the 12-year period beginning on the date
							the equipment was originally placed in service, disposed of in secure geological storage, and
							not used as a tertiary injectant in a qualified enhanced oil or natural gas recovery project, nor
							utilized as described in section 45Q(f)(5).
						</div>
						<div class="styLNRightNumBox" style="height:17mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:17mm;border-bottom-width:0px;background-color:lightgrey"/>
					</div>
					<!--Line 13a-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:5mm">a </div>
						<div class="styLNDesc" style="width:53mm;height:8mm;">
							<span style="float: left; clear: none;">
								<input type="checkbox" class="styCkbox" alt="Qualified opportunity fund No">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd"/>
										<xsl:with-param name="BackupName">F8933QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:normal;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd"/>
										<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
									<span style="width: 1mm; font-weight:normal;"/>Satisfies prevailing wage and <br/>
									<span style="width: 6mm;"/>apprenticeship requirements*.
								</label>
							</span>
						</div>
						<div class="styLNDesc" style="width:34mm;padding-top:3mm;height:auto;">
							<div style="width:105%;border:1px solid black;text-align:center;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd/@stsfyPrvlWgNotUsedAftrSectAQty"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:14mm;padding-left:4mm;padding-top:4mm">X $180</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">13a </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd/@stsfyPrvlWgNotUsedAftrSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:8mm;border-bottom-width:0px"/>
					</div>
					<!--Line 13b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:5mm">b </div>
						<div class="styLNDesc" style="width:53mm;height:9mm;">
							<span style="float: left; clear: none;">
								<input type="checkbox" class="styCkbox" alt="Qualified opportunity fund No">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd"/>
										<xsl:with-param name="BackupName">F8933QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:normal;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd"/>
										<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
									<span style="width: 1mm; font-weight:normal;"/>Doesn’t satisfy prevailing wage and<br/>
									<span style="width: 6mm;"/> apprenticeship requirements*.
							</label>
							</span>
						</div>
						<div class="styLNDesc" style="width:34mm;padding-top:4mm;height:auto;">
							<div style="width:105%;border:1px solid black;text-align:center;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd/@dstsfyPrvlNotUsedAftrSectAQty"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:14mm;padding-left:4mm;padding-top:4mm">X $36</div>
						<div class="styLNRightNumBox" style="height:9mm;padding-top:4mm;">13b </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:9mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd/@dstsfyPrvlNotUsedAftrSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:9mm;border-bottom-width:0px"/>
					</div>
					<!--Line 13c-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">c </div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float: left; clear: none;font-size:7pt;">Add lines 13a and 13b. See instructions for attaching Model Certificates CF, DISP-Operator, and DISP Owner</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Part III - Line 4c - Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt/@desc"/>
								<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:1px">13c</div>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt"/>
							</xsl:call-template>
						</div>
					</div>
										
					<div class="pageEnd" style="width:187mm;padding-top:1mm;clear:all;float:none; border-top:1px solid black;">
						<div style="float:right;">
							<!--<span style="width:40px;"/>-->  
						 Form <span class="styBoldText" style="font-size:8pt;">8933</span> (Rev. 10-2023)
						</div>
					</div>
					
					<!--Begin Page 4 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;float:none;">
						<div style="float:left;">Form 8933 (Rev. 10-2023)<span style="width:110mm;"/></div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span></div>
					</div>
					
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="font-size:9pt;font-weight:bold;">Part III</div>
						<div class="styPartDesc" style="font-size:9pt;font-weight:bold;">Credit Calculation (continued)</div>
					</div>
					<div class="styStdDiv" style="font-size:9pt;font-weight:bold;border-bottom:1px solid black;">Section C—Qualified Direct Air Capture (DAC) Facilities Under Section 45Q(d) Placed in Service After 2022 (continued) </div>
					<!--<div class="styStdDiv" style="font-size:9pt;font-weight:bold;padding-left:22mm;">45Q(a)(1) or (2) for Which an Election Was Made Under Section 45Q(b)(3)(continued)</div>-->
					
					<!--Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">14</div>
						<div class="styLNDesc" style="width:139mm;height:15mm;font-weight:bold;">
							Qualified carbon oxide captured using DAC equipment originally placed in service at
							a qualified DAC facility after 2022, during the 12-year period beginning on the date
							the equipment was originally placed in service, disposed of in secure geological storage, and
							used as a tertiary injectant in a qualified enhanced oil or natural gas recovery project.
						</div>
						<div class="styLNRightNumBox" style="height:15mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:15mm;border-bottom-width:0px;background-color:lightgrey"/>
					</div>
					<!--Line 14a-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:5mm">a </div>
						<div class="styLNDesc" style="width:53mm;height:8mm;">
							<span style="float: left; clear: none;">
								<input type="checkbox" class="styCkbox" alt="Qualified opportunity fund No">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd"/>
										<xsl:with-param name="BackupName">F8933QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:normal;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd"/>
										<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
									<span style="width: 1mm; font-weight:normal;"/>Satisfies prevailing wage and <br/>
									<span style="width: 6mm;"/>apprenticeship requirements*.
								</label>
							</span>
						</div>
						<div class="styLNDesc" style="width:34mm;padding-top:3mm;height:auto;">
							<div style="width:105%;border:1px solid black;text-align:center;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd/@stsfyPrvlWgNotUsedAftrSectAQty"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:14mm;padding-left:4mm;padding-top:4mm">X $130</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">14a </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd/@stsfyPrvlWgNotUsedAftrSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:8mm;border-bottom-width:0px"/>
					</div>
					<!--Line 14b-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:9mm;padding-left:5mm">b </div>
						<div class="styLNDesc" style="width:53mm;height:9mm;">
							<span style="float: left; clear: none;">
								<input type="checkbox" class="styCkbox" alt="Qualified opportunity fund No">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd"/>
										<xsl:with-param name="BackupName">F8933QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:normal;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd"/>
										<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
									<span style="width: 1mm; font-weight:normal;"/>Doesn’t satisfy prevailing wage and<br/>
									<span style="width: 6mm;"/> apprenticeship requirements*.
							</label>
							</span>
						</div>
						<div class="styLNDesc" style="width:34mm;padding-top:4mm;height:auto;">
							<div style="width:105%;border:1px solid black;text-align:center;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd/@dstsfyPrvlNotUsedAftrSectAQty"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:14mm;padding-left:4mm;padding-top:4mm">X $26</div>
						<div class="styLNRightNumBox" style="height:9mm;padding-top:4mm;">14b </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:9mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd/@dstsfyPrvlNotUsedAftrSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:9mm;border-bottom-width:0px"/>
					</div>
					<!--Line 14c-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">c </div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float: left; clear: none;font-size:7pt;">Add lines 14a and 14b. See instructions for attaching Model Certificates CF, EOR-Operator, and EOR-Owner</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Part III - Line 4c - Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt/@desc"/>
								<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:1px">14c</div>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End Line 14 Part III-->
					
					
					<!--Line 15 Part III-->
					<!--Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">15</div>
						<div class="styLNDesc" style="width:139mm;height:14mm;font-weight:bold;">
							Qualified carbon oxide captured using DAC equipment originally placed in service at
							a qualified DAC facility after 2022, during the 12-year period beginning on the date
							the equipment was originally placed in service, and utilized as described in section 45Q(f)(5).
						</div>
						<div class="styLNRightNumBox" style="height:14mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:14mm;border-bottom-width:0px;background-color:lightgrey"/>
					</div>
					<!--Line 15a-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:5mm">a </div>
						<div class="styLNDesc" style="width:53mm;height:8mm;">
							<span style="float: left; clear: none;">
								<input type="checkbox" class="styCkbox" alt="Qualified opportunity fund No">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd"/>
										<xsl:with-param name="BackupName">F8933QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:normal;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd"/>
										<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
									<span style="width: 1mm; font-weight:normal;"/>Satisfies prevailing wage and <br/>
									<span style="width: 6mm;"/>apprenticeship requirements*.
								</label>
							</span>
						</div>
						<div class="styLNDesc" style="width:34mm;padding-top:3mm;height:auto;">
							<div style="width:105%;border:1px solid black;text-align:center;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd/@stsfyPrvlWgNotUsedAftrSectAQty"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:14mm;padding-left:4mm;padding-top:4mm">X $130</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">15a </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/StsfyPrvlWgNotUsedAftrSectAInd/@stsfyPrvlWgNotUsedAftrSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:8mm;border-bottom-width:0px"/>
					</div>
					<!--Line 15b-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:9mm;padding-left:5mm">b </div>
						<div class="styLNDesc" style="width:53mm;height:9mm;">
							<span style="float: left; clear: none;">
								<input type="checkbox" class="styCkbox" alt="Qualified opportunity fund No">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd"/>
										<xsl:with-param name="BackupName">F8933QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:normal;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd"/>
										<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundNoInd</xsl:with-param>
									</xsl:call-template>
									<span style="width: 1mm; font-weight:normal;"/>Doesn’t satisfy prevailing wage and<br/>
									<span style="width: 6mm;"/> apprenticeship requirements*.
							</label>
							</span>
						</div>
						<div class="styLNDesc" style="width:34mm;padding-top:4mm;height:auto;">
							<div style="width:105%;border:1px solid black;text-align:center;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd/@dstsfyPrvlNotUsedAftrSectAQty"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:14mm;padding-left:4mm;padding-top:4mm">X $26</div>
						<div class="styLNRightNumBox" style="height:9mm;padding-top:4mm;">15b </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:9mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdNotUsedAftr22SectAGrp/DstsfyPrvlWgNotUsedAftSectAInd/@dstsfyPrvlNotUsedAftrSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:9mm;border-bottom-width:0px"/>
					</div>
					<!--Line 15c-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">c </div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float: left; clear: none;font-size:7pt;">Add lines 15a and 15b. See instructions for attaching Model Certificates CF and UTZ</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Part III - Line 6c - Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt/@desc"/>
								<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:1px">6c</div>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End Line 15 Part III-->

					<div class="styStdDiv" style="font-size:7.5pt;font-weight:normal;">
					 * Check the box and enter metric tons captured and disposed of and for which you didn’t elect for another taxpayer to claim the credit.</div>

					<div class="styStdDiv" style="font-size:9pt;font-weight:bold;border-top:1px solid black; border-bottom:1px solid black;">
					Section D—Other Information</div> 
					
					
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">16</div>
						<div class="styLNDesc" style="width:139mm;height:5.5mm;">Check the box if you're making the election under section 45Q(b)(3)
							<span style="float: right; clear: none;">
								<input type="checkbox" class="styCkbox" alt="Qualified opportunity fund No">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section45Qb3ElectionInd"/>
										<xsl:with-param name="BackupName">F8933Section45Qb3ElectionInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:5.5mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:5.5mm;border-bottom-width:0px;background-color:lightgrey"/>
					</div>
					
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">17</div>
						<div class="styLNDesc" style="width:139mm;height:5.5mm;">Check the box if you're making the election under section 45Q(b)(6)
							<span style="float: right; clear: none;">
								<input type="checkbox" class="styCkbox" alt="Qualified opportunity fund No">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section45Qb6ElectionInd"/>
										<xsl:with-param name="BackupName">F8933Section45Qb6ElectionInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:5.5mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:5.5mm;border-bottom-width:0px;background-color:lightgrey"/>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">18</div>
						<div class="styLNDesc" style="width:139mm;height:5.5mm;">Check the box if you're making the election under section 45Q(b)(9)
							<span style="float: right; clear: none;">
								<input type="checkbox" class="styCkbox" alt="Qualified opportunity fund No">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section45Qb6ElectionInd"/>
										<xsl:with-param name="BackupName">F8933Section45Qb6ElectionInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:5.5mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:5.5mm;border-bottom-width:0px;background-color:lightgrey"/>
					</div>
					
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">19</div>
						<div class="styLNDesc" style="width:139mm;height:15mm;font-weight:bold;">
							Carbon oxide sequestration credit that another taxpayer elected under section 45Q(f)(3)(B) to allow you to 
								claim. See instructions for attaching Model Certificates ELECT, EOR-Owner, DISP-Owner, and UTZ. Provide 
								basic information for the three largest elections (in dollars) on lines 19a, 19b, and 19c; report all others on line 19e.
						</div>
						<div class="styLNRightNumBox" style="height:15mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:15mm;border-bottom-width:0px;background-color:lightgrey"/>
					</div>
					
					<div class="styStdDiv">					
							<div class="styLNLeftNumBox" style="width:8mm;"/>
							<div style="width: 106mm;">
								<span class="styTableCellHeader"  style="height:12mm;width:25mm;padding-top:2mm;border-style:solid;border-color:black;border-width:1px 1px 1px 1px;">
									(i) EIN of electing<br/>taxpayer
								</span>
								<span class="styTableCellHeader"  style="height:12mm;width:25mm;padding-top:2mm;border-style:solid;border-color:black;border-width:1px 1px 1px 0px;">
									(ii) Metric tons<br/>elected
								</span>						
								<span class="styTableCellHeader"  style="height:12mm;width:28mm;padding-top:2mm;border-style:solid;border-color:black;border-width:1px 1px 1px 0px;">
									(iii) Credit<br/>rates
								</span>						
								<div class="styTableCellHeader"  style="height:12mm;width:28mm;padding-top:1mm;border-style:solid;border-color:black;border-width:1px 1px 1px 0px;">
									(iv) Credit elected.<br/>Multiply column (ii)<br/>by column (iii).
								</div>
							</div>
							<div style="width: 72mm;float:right;clear:right;">							
								<div class="styLNAmountBox" style="height:12mm;border-bottom-width:0px;border-left-width:0px;"/>
								<div class="styLNRightNumBox" style="height:12mm;background-color:lightgrey;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="height:12mm;border-bottom-width:0px;"/>
							</div>
						</div>
						
						<div style="height:5.3mm;width:187mm;word-break:break-all;">
     							
							<div class="styLNLeftNumBox" style="height:5.3mm;width:8mm;padding-top:2mm;padding-left:5mm;float:left;clear:none;">a</div>
							<div style="width: 106mm;">
								<span class="styTableCellHeader"  style="height:5.3mm;width:25mm;padding-top:2mm;border-style:solid;border-color:black;border-width:0px 1px 1px 1px;">
									<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/LargestCOSCElectClmGrp/EIN"/>
								</xsl:call-template>
								</span>
								<div class="styTableCellHeader"  style="height:5.3mm;width:25mm;font-size: 6pt;border-style:solid;border-color:black;border-width:0px 1px 1px 0px;">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LargestCOSCElectClmGrp/MetricTonsCapturedQty"/>
								</xsl:call-template>
								</div>						
								<span class="styTableCellHeader"  style="height:5.3mm;width:28mm;padding-top:2mm;border-style:solid;border-color:black;border-width:0px 1px 1px 0px;">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LargestCOSCElectClmGrp/CreditRateAmt"/>
								</xsl:call-template>
								</span>						
								<div class="styTableCellHeader"  style="height:5.3mm;width:28mm;padding-top:2mm;border-style:solid;border-color:black;border-width:0px 1px 1px 0px;">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LargestCOSCElectClmGrp/CreditElectedAmt"/>
								</xsl:call-template>
								</div>
							</div>
							<div style="width: 72mm;float:right;clear:right;">							
								<div class="styLNAmountBox" style="height:12mm;border-bottom-width:0px;border-left-width:0px;"/>
								<div class="styLNRightNumBox" style="height:12mm;background-color:lightgrey;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="height:12mm;border-bottom-width:0px;"/>
							</div>
						</div>
						
						<div style="height:5.3mm;width:187mm;word-break:break-all;">
     							
							<div class="styLNLeftNumBox" style="height:5.3mm;width:8mm;padding-top:2mm;padding-left:5mm;float:left;clear:none;">b</div>
							<div style="width: 106mm;">
								<span class="styTableCellHeader"  style="height:5.3mm;width:25mm;padding-top:2mm;border-style:solid;border-color:black;border-width:0px 1px 1px 1px;">
									<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/LargestCOSCElectClmGrp/EIN"/>
								</xsl:call-template>
								</span>
								<div class="styTableCellHeader"  style="height:5.3mm;width:25mm;font-size: 6pt;border-style:solid;border-color:black;border-width:0px 1px 1px 0px;">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LargestCOSCElectClmGrp/MetricTonsCapturedQty"/>
								</xsl:call-template>
								</div>						
								<span class="styTableCellHeader"  style="height:5.3mm;width:28mm;padding-top:2mm;border-style:solid;border-color:black;border-width:0px 1px 1px 0px;">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LargestCOSCElectClmGrp/CreditRateAmt"/>
								</xsl:call-template>
								</span>						
								<div class="styTableCellHeader"  style="height:5.3mm;width:28mm;padding-top:2mm;border-style:solid;border-color:black;border-width:0px 1px 1px 0px;">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LargestCOSCElectClmGrp/CreditElectedAmt"/>
								</xsl:call-template>
								</div>
							</div>
							<div style="width: 72mm;float:right;clear:right;">							
								<div class="styLNAmountBox" style="height:12mm;border-bottom-width:0px;border-left-width:0px;"/>
								<div class="styLNRightNumBox" style="height:12mm;background-color:lightgrey;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="height:12mm;border-bottom-width:0px;"/>
							</div>
						</div>
						
						<div style="height:5.3mm;width:187mm;word-break:break-all;">
     							
							<div class="styLNLeftNumBox" style="height:5.3mm;width:8mm;padding-top:2mm;padding-left:5mm;float:left;clear:none;">c</div>
							<div style="width: 106mm;">
								<span class="styTableCellHeader"  style="height:5.3mm;width:25mm;padding-top:2mm;border-style:solid;border-color:black;border-width:0px 1px 1px 1px;">
									<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/LargestCOSCElectClmGrp/EIN"/>
								</xsl:call-template>
								</span>
								<div class="styTableCellHeader"  style="height:5.3mm;width:25mm;font-size: 6pt;border-style:solid;border-color:black;border-width:0px 1px 1px 0px;">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LargestCOSCElectClmGrp/MetricTonsCapturedQty"/>
								</xsl:call-template>
								</div>						
								<span class="styTableCellHeader"  style="height:5.3mm;width:28mm;padding-top:2mm;border-style:solid;border-color:black;border-width:0px 1px 1px 0px;">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LargestCOSCElectClmGrp/CreditRateAmt"/>
								</xsl:call-template>
								</span>						
								<div class="styTableCellHeader"  style="height:5.3mm;width:28mm;padding-top:2mm;border-style:solid;border-color:black;border-width:0px 1px 1px 0px;">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LargestCOSCElectClmGrp/CreditElectedAmt"/>
								</xsl:call-template>
								</div>
							</div>
							<div style="width: 72mm;float:right;clear:right;">							
								<div class="styLNAmountBox" style="height:12mm;border-bottom-width:0px;border-left-width:0px;"/>
								<div class="styLNRightNumBox" style="height:12mm;background-color:lightgrey;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="height:12mm;border-bottom-width:0px;"/>
							</div>
						</div>
						
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">d </div>
						<div class="styLNDesc" style="width:101mm;height:4mm;">
							<span style="float: left; clear: none;">Add lines 19a, 19b, and 19c in column (iv)</span>
							<span class="sty8933DotLn">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-top:1px solid black;">19d </div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:4.5mm;border-top:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdNotUsedUtlzSectAGrp/InfltnAdjNotUsedUtlzRtSectAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:0px"/>
					</div>
					
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:7mm;padding-left:5mm">e </div>
						<div class="styLNDesc" style="width:101mm;height:7mm;">
							<span style="float: left; clear: none;">Report all other carbon oxide sequestration credit that another taxpayer elected under section 45Q(f)(3)(B) to allow you to claim. See instructions
								<span class="sty8933DotLn">..</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm">19e</div>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:7mm;padding-top:3mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdNotUsedUtlzSectAGrp/MtrcTonNotUsedUtlzCptrSectAQty"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:30mm;height:7mm;border-bottom-width:0px"/>
					</div>
					
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">f </div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float: left; clear: none;font-size:7pt;">Add lines 19d and 19e.</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Part III - Line 6c - Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt/@desc"/>
								<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:1px">19f</div>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">20</div>
						<div class="styLNDesc" style="width:139mm;height:6mm;">Carbon oxide sequestration credit from partnerships and S corporations (see instructions)</div>
						<div class="styLNRightNumBox" style="height:6mm;background-color:lightgrey;border-bottom-width:1px;padding-top:3mm">20</div>
						<div class="styLNAmountBox" style="width:30mm;height:6mm;border-bottom-width:1px;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">21</div>
						<div class="styLNDesc" style="width:139mm;height:8mm;">Add lines 1c, 2c, 3c, 4c, 5c, 6c, 7c, 8c, 9c, 10c, 11c, 12c, 13c, 14c, 15c, 19f, and 20.
						Partnerships and S corporations, report this amount on Schedule K. All others, report this amount on Form 3800, Part III, line 1x
						</div>
						<div class="styLNRightNumBox" style="height:8mm;background-color:lightgrey;border-bottom-width:1px;padding-top:4mm">21</div>
						<div class="styLNAmountBox" style="width:30mm;height:8mm;border-bottom-width:1px;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">22</div>
						<div class="styLNDesc" style="width:139mm;height:8mm;">Carbon oxide sequestration credit recaptured. See instructions for attaching Model Certificate 
						RECAPTURE and for reporting this amount on the appropriate line of your return
						</div>
						<div class="styLNRightNumBox" style="height:8mm;background-color:lightgrey;border-bottom-width:1px;padding-top:4mm;">22</div>
						<div class="styLNAmountBox" style="width:30mm;height:8mm;border-bottom-width:1px;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="pageEnd" style="width:187mm;padding-top:1mm;clear:all;float:none; border-top:1px solid black;">
						<div style="float:right;">
							<!--<span style="width:40px;"/>-->  
						 Form <span class="styBoldText" style="font-size:8pt;">8933</span> (Rev. 10-2023)
						</div>
					</div>
					
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!--Part III - Line 1c - Description-->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part III - Line 1c - Description</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdNotUsedUtlzSectAGrp/MtrcTonNotUsedUtlzCrSectAAmt/@desc"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!--Part III - Line 2c - Description-->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part III - Line 2c - Description</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUsedSectAGrp/MtrcTonUsedCrSectAAmt/@desc"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!--Part III - Line 3c - Description-->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part III - Line 3c - Description</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/QlfyCrbnOxdUtlzSectAGrp/MtrcTonUtlzCrSectAAmt/@desc"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>