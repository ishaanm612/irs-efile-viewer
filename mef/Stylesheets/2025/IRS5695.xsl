<?xml version="1.0" encoding="UTF-8"?>
<!-- F5695 -TY24 - Edited by 5/13/2025 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS5695Style.xsl"/>
	<!--<xsl:include href="TestXPath.xsl"/>-->
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form5695Data" select="$RtnDoc/IRS5695"/>
	<xsl:template name="OneLineHomeAddress">
		<xsl:param name="TotalWidth"/>
		<xsl:param name="TargetNode"/>
	<div style="width:{$TotalWidth}; font-size:7pt;">
	<div style="width:33%; margin:0mm 1mm 0mm 0mm">
		<div>
			<xsl:call-template name="PopulateText">	
				<xsl:with-param name="TargetNode" 
				select="$TargetNode/AddressLine1Txt"/>
			</xsl:call-template>		<br/>				
			<xsl:call-template name="PopulateText">	
				<xsl:with-param name="TargetNode" 
				select="$TargetNode/AddressLine2Txt"/>
			</xsl:call-template>
		</div>
		<div style="width:100%;border-top:1px solid black">Number and Street</div>
	</div>
	<div style="width:14%; margin:0mm 1mm 0mm 0mm">							
		<div>
			<!--xsl:call-template name="PopulateText">	
				<xsl:with-param name="TargetNode" 
				select="$TargetNode/AddressLine2Txt"/>
			</xsl:call-template-->							
		</div>
	<div style="width:100%;border-top:1px solid black">Unit no.</div>
	</div>
	<div style="width:26%; margin:0mm 1mm 0mm 0mm">
		<div>
			<xsl:call-template name="PopulateText">	
				<xsl:with-param name="TargetNode" 
				select="$TargetNode/CityNm"/>
			</xsl:call-template>							
		</div>
	<div style="width:100%;border-top:1px solid black">City or town</div>
	</div>
	<div style="width:7%; margin:0mm 1mm 0mm 0mm">							
		<div>
			<xsl:call-template name="PopulateText">	
				<xsl:with-param name="TargetNode" 
				select="$TargetNode/StateAbbreviationCd"/>
			</xsl:call-template>							
		</div>
	<div style="width:100%;border-top:1px solid black">State</div>
	</div>
	<div style="width:10%; margin:0mm 1mm 0mm 1mm">							
		<div>
			<xsl:call-template name="PopulateText">	
				<xsl:with-param name="TargetNode" 
				select="$TargetNode/ZIPCd"/>
			</xsl:call-template>							
		</div>
	<div style="width:100%;border-top:1px solid black">ZIP code</div>
	</div>
	</div>
	</xsl:template>	
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form5695Data)"/>
					</xsl:call-template>
				</title>
				<!--  No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 5695"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS5695Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
			<!--<xsl:call-template name="TestXPath"/>-->
				<form name="IRS5695">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;height:19mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;height:19mm;border-right-width:2px;">
							<div style="">
								Form <span class="styFormNumber"> 5695</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form5695Data"/>
							</xsl:call-template>
							<br/>
							<br/>
							<span class="styAgency" style="padding-top:.5mm;">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:123.5mm;height:19mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:6mm;padding-top:2mm;">
								Residential Energy Credits
							</div>
							<div class="styGenericDiv" style="height:5mm;font-size:7pt;margin-left:9mm;">
								<div style="width:100%;height:5mm;font-weight:bold;padding-top:1mm;">
									<br/>
									Attach to Form 1040, 1040-SR, or 1040-NR.
					
									<br/>
									<span style="padding-top:1mm;">	Go to <a style="text-decoration:none;color:black;" href="www.irs.gov/Form5695" title="Link to IRS.gov">www.irs.gov/Form5695</a> for instructions and the latest information.</span>
								</div>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:19mm;border-left-width:2px;float:right;">
							<div class="styOMB" style="font-size:7pt;margin-bottom:-1mm ;">OMB No. 1545-0074</div>
							<div class="styTaxYear" style="margin-bottom:-1mm ;">20<span class="styTYColor">24</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:8pt;">75</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;border-bottom-width:;">
						<div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">
							Name(s) shown on return<br/>
							<xsl:choose>
								<xsl:when test="normalize-space($Form5695Data/NameLine1Txt) !=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5695Data/NameLine1Txt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div style="height:8mm;width:50mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							Your social security number
							<br/>
							<span style="font-weight:normal;text-align:left;width:100%">
								<xsl:choose>
									<xsl:when test="normalize-space($Form5695Data/SSN) !=''">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$Form5695Data/SSN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part I																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<div class="styBB" style="width:187mm;height:4.25mm;border-top-width:0px;">
						<div class="styPartName" style="font-size:9pt;">Part I</div>
						<div class="styPartDesc" style="font-size:9pt;padding-left:2mm;">Residential Clean Energy Credit <span style="font-weight:normal;">(See instructions before completing this part.)</span>
						</div>
					</div>
					<!-- Body -->
					<div class="styIRS5695LNDesc" style="height:23mm;width:187mm;font-size:9pt;padding-left:0px;border-bottom:1px solid black;">
						<div><b>Note:</b> Skip lines 1 through 11 if you only have a <b>credit carryforward from 2023.</b></div>
						<div> Enter the complete address of the home where you installed the property and/or technology, associated with lines 1 through 4 and 5b. For more than one home, see instructions.</div>
						<!-- Address - one line -->		
						<xsl:call-template name="OneLineHomeAddress">
							<xsl:with-param name="TotalWidth">183mm</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/ResidentialCleanEgyHomeAddress"/> 
						</xsl:call-template>
						<span style="float:right;">
							<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp"/>
							</xsl:call-template>
						</span>
					</div>
					<!-- (1) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:3mm;font-size:4pt;">
						<div class="styLNLeftNumBox" style="height:3mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:3mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="height:3mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="height:3mm;font-size:4pt;"/>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBoxSD" style="">1</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Qualified solar electric property costs</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="">1</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/SolarElecPropCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- (2) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:3mm;font-size:4pt;">
						<div class="styLNLeftNumBox" style="height:3mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:3mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="height:3mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="height:3mm;font-size:4pt;"/>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBoxSD" style="">2</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Qualified solar water heating property costs</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots">...................</span>
						</div>
						<div class="styLNRightNumBox" style="">2</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/SolarWaterHtPropCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- (3) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:3mm;font-size:4pt;">
						<div class="styLNLeftNumBox" style="height:3mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:3mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="height:3mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="height:3mm;font-size:4pt;"/>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBoxSD" style="">3</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Qualified small wind energy property costs</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots">...................</span>
						</div>
						<div class="styLNRightNumBox" style="">3</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/SmallWindPropCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- (4) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:3mm;font-size:4pt;">
						<div class="styLNLeftNumBox" style="height:3mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:3mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="height:3mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="height:3mm;font-size:4pt;"/>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBoxSD" style="">4</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Qualified geothermal heat pump property costs</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots">..................</span>
						</div>
						<div class="styLNRightNumBox" style="">4</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/GeothrmlHtPumpPropCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
										<!-- Line 5a -->
					<div class="styIRS5695LineItem" style="height:10mm;">
						<div class="styLNLeftNumBox" style="height:10mm;">5a</div>
						<div class="styLNDesc" style="height:6mm;">
							Qualified battery storage technology. Does the qualified battery storage technology have a capacity of
							at least 3 kilowatt hours? (See instructions.) If you checked the “No” box, you cannot claim a credit for
							qualified battery storage technology
							<span class="styIRS5695Dots" style="padding-right:7px;">........................</span>
						</div>
						<div class="styLNRightNumBox" style="width:7.8mm;height:10mm;padding-top:2mm;">
							<br/>5a</div>
						<div class="styLNAmountBox" style="text-align:left;height:10mm;padding-top:4mm;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/QlfyBatteryStorageTechInd"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<input type="checkbox" aria-label="Qualified battery storage Yes" class="styCkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/QlfyBatteryStorageTechInd"/>
									<xsl:with-param name="BackupName">IRS5695QlfyBatteryStorageTechInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<b>Yes</b>
							
							<span style="width:4mm;"/>
							<input type="checkbox" aria-label="Qualified battery storage No" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/QlfyBatteryStorageTechInd"/>
									<xsl:with-param name="BackupName">IRS5695QlfyBatteryStorageTechInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<b>No</b>
							
						</div>
					</div>
					<!-- Line 5b -->
					<div class="styIRS5695LineItem" style="height:6mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:2mm">b</div>
						<div class="styLNDesc" style="padding-top:2mm">
							<span style="float:left;">If you checked the "Yes" box, enter the qualified battery technology costs</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm">5b</div>
						<div class="styLNAmountBox" style="height:6mm;padding-top:2mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/QlfyBatteryStorageTechCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- (6a) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:3mm;font-size:4pt;">
						<div class="styLNLeftNumBox" style="height:3mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:3mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="height:3mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="height:3mm;font-size:4pt;"/>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBoxSD" style="">6a</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Add lines 1 through 5b</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="">6a</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/TotalEnergyCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- (6b) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:3mm;font-size:4pt;">
						<div class="styLNLeftNumBox" style="height:3mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:3mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="height:3mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="height:3mm;font-size:4pt;"/>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBoxSD" style="">6b</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Multiply line 6a by 30% (0.30)</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots">......................</span>
						</div>
						<div class="styLNRightNumBox" style="">6b</div> 
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/TotalEnergyCreditsStdPctCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7a ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:8mm">
						<div class="styLNLeftNumBoxSD" style="height:8mm;">7a</div>
						<div class="styLNDesc" style="height:8mm;">
								Qualified fuel cell property. Was qualified fuel cell property installed on, or in connection with, your
								<b>main <br/> home</b> located in the United States? (See instructions.)
							<!--Dotted Line-->
							<span class="styIRS5695Dots" style="padding-right:7px;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:3mm;border-bottom:1px solid black;">7a</div>
						<div class="styLNAmountBox" style="height:8mm;text-align:left;padding-top:2.5mm;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/QlfyFuelCellPropertyInUSInd"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<input type="checkbox" aria-label="Qualified fuel cell property Yes" class="styCkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/QlfyFuelCellPropertyInUSInd"/>
									<xsl:with-param name="BackupName">IRS5695QlfyFuelCellPropertyInUSInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<b>Yes</b>
							<span style="width:4mm;"/>
							<input type="checkbox" aria-label="Qualified fuel cell property No" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/QlfyFuelCellPropertyInUSInd"/>
									<xsl:with-param name="BackupName">IRS5695QlfyFuelCellPropertyInUSInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<b>No</b>
							
						</div>
					</div>
					<!-- Caution -->
					<div class="styIRS5695LineItem">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="height:6mm;">
							If you checked the "No" box, you cannot claim a credit for qualified fuel cell property. Skip <br/>lines 7b through 11.
						</div>
						<div class="styLNRightNumBoxNBB" style="height:6mm;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:6mm;"/>
					</div>
					<!-- (7b) /////////////////////////////////////////////////// -->
					<div class="styIRS5695LineItem" style="height:22mm;">
						<div class="styLNLeftLtrBox" style="height:22mm;padding-top:6mm;">b</div>
						<div class="styLNDesc" style="height:8mm; padding-top:6mm;">
							<div>Enter the complete address of the main home where you installed the fuel cell property.</div>
							<!-- Address////////////////////////////////////////////////////-->
							<xsl:call-template name="OneLineHomeAddress">
							<xsl:with-param name="TotalWidth">140mm</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/QlfyFuelCellPropertyHmAddress"/> 
							</xsl:call-template></div>
						<div class="styLNRightNumBoxNBB" style="height:22mm;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:22mm;"/>
					</div>
					<!-- Line 7c ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:5mm;">
						<div class="styLNLeftLtrBox" style="height:5mm;">c</div>
						<div class="styLNDesc" style="height:5mm;">
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/JointOccupancyInd"/>
						</xsl:call-template>
							If the special rule for joint occupants applies, check here 
							<input type="checkbox" aria-label="special rule for joint occupant" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/JointOccupancyInd"/>
								<xsl:with-param name="BackupName" select="ResidentialCleanEnergyCrGrpJointOccupancyInd"/>
							</xsl:call-template>
							</input>
							and attach a statement. (See instructions.) 
							<span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/JointOccupancyInd"/>
									</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:5mm;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:5mm;"/>
					</div>
					<!-- (8) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBoxSD" style="padding-top:2mm;">8</div>
						<div class="styLNDesc" style="width:98.05mm;padding-top:2mm;">
							<span style="float:left;">Qualified fuel cell property costs</span>
							<span class="styIRS5695Dots">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;padding-top:1mm;">8</div>
						<div class="styLNAmountBox" style="padding-right:2px;height:4.4mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/FuelCellPropCostAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- (9) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:98.05mm;"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style=""/>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="width:98.05mm;">
							<span style="float:left;">Multiply line 8 by 30% (0.30)</span>
							<span class="styIRS5695Dots">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;padding-top:1mm;">9</div>
						<div class="styLNAmountBox" style="padding-right:2px;height:4.4mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/FuelCellPropStdPctCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- (10) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:98.05mm;"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style=""/>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="width:98.05mm;">
								Kilowatt capacity of property on line 8 above 
							<span style="width:2mm;"/>
							<span style="width:25mm;border-bottom:1px solid black;text-align:center;font-family:Arial narrow;font-size:7pt;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/FuelCellPropKWCapNum"/>
								</xsl:call-template>
							</span>
							<span style="font-family:Arial;padding-left:4px;">x  $1,000</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox" style="padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/FuelCellPropKWCapAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- (11) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style=""/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div class="styIRS5695LineItem">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc">
							<span style="float:left;">Enter the smaller of line 9 or line 10</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots">.....................</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/FuelCellPropAllwblCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- (12) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div class="styIRS5695LineItem">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc">
							<span style="float:left;">Credit carryforward from 2023. Enter the amount, if any, from your 2023 Form 5695, line 16</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots">...</span>
						</div>
						<div class="styLNRightNumBox">12</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/PYCfwdRsdntlCleanEnergyCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- (13) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div class="styIRS5695LineItem">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc">
							<span style="float:left;">Add lines 6b, 11, and 12</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots">........................</span>
						</div>
						<div class="styLNRightNumBox">13</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/TotalOfEnergyCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- (14) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:8mm;">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc">
							Limitation based on tax liability. Enter the amount from the Residential Clean Energy Credit<br/>
							Limit Worksheet. (See instructions.)
							<!--Dotted Line-->
							<span class="styIRS5695Dots">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4.5mm;">14</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/TaxLessCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- (15) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:8mm;">
						<div class="styLNLeftNumBox" style="padding-top:mm;">15</div>
						<div class="styLNDesc" style="padding-top:mm;">
							<b>Residential Clean Energy Credit. </b>  Enter the smaller of line 13 or line 14. Also include <br/>
							<span style="float:left;">this amount on Schedule 3 (Form 1040), line 5a</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots" style="">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4.5mm;">15</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/ResidentialCleanEnergyCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- (16) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="border-bottom:2px solid black;height:7.7mm;">
						<div class="styLNLeftNumBox" style="padding-top:.5mm;">16</div>
						<div class="styLNDesc" style="width:98.05mm;padding-top:.5mm;">
								Credit carryforward to 2025. If line 15 is less than line 13, subtract <br/>
							<span style="float:left;">line 15 from line 13</span>
							<span class="styIRS5695Dots" style="padding-bottom:6mm;">................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="margin-top:3.5mm;">16</div>
						<div class="styLNAmountBoxNBB" style="margin-top:3.5mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialCleanEnergyCrGrp/CfwdRsdntlCleanEnergyCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;border-bottom-width:1px;"/>
						<div class="styLNAmountBoxNBB" style="height:7.5mm;"/>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm; padding-top:3px; border-top:1px solid black;">
						<span style="float:left;padding-top:.5mm;">
							<b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
							<span style="width:16.5mm;"/>
							Cat. No. 13540P
						</span>
						<span style="float:right;padding-top:.5mm;">Form <span class="styBoldText" style="font-size:8pt;"> 5695  </span> (2024)</span>
					</div>
					<span style="height:6.5mm;"/>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page Header -->
					<div class="styTBB" style="width:187mm;padding-top:5mm;">
						<div style="float:left;">
							Form 5695 (2024)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">
							Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part II	 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div class="styBB" style="width:187mm;height:4.25mm">
						<div class="styPartName" style="font-size:9pt;">Part II</div>
						<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;">Energy Efficient Home Improvement Credit</div>
					</div>
					<!-- Section A -->
					<div class="styBB" style="width:187mm;height:4.25mm">
						<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;">Section A—Qualified Energy Efficiency Improvements</div>
					</div>
					<!-- Line 17a -->
					<div class="styIRS5695LineItem" style="height:6mm;">
						<div class="styLNLeftNumBox" style="height:6mm;">17a</div>
						<div class="styLNDesc" style="height:6mm;">
							Are the qualified energy efficiency improvements installed in or on your main home located in the <br/>
							<span style="float:left;">United States? (See instructions.)</span>
							<span class="styIRS5695Dots" style="padding-right:7px;">....................
							</span>
						</div>
						<div class="styLNRightNumBox" style="width:7.8mm;height:6mm;padding-top:0mm;padding-bottom:2mm;">
							<br/>17a</div>
						<div class="styLNAmountBox" style="text-align:left;height:6mm;padding-top:1.5mm;padding-bottom:2mm;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/HomeLocatedInUSAInd"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<input type="checkbox" aria-label="qualified energy efficiency improvement installed Yes" class="styCkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/HomeLocatedInUSAInd"/>
									<xsl:with-param name="BackupName">IRS5695HomeLocatedInUSAInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<b>Yes</b>
							
							<span style="width:4mm;"/>
							<input type="checkbox" aria-label="qualified energy efficiency improvement installed No" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/HomeLocatedInUSAInd"/>
									<xsl:with-param name="BackupName">IRS5695HomeLocatedInUSAInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<b>No</b>
							
						</div>
					</div>
					<!-- Line 17b -->
					<div class="styIRS5695LineItem" style="height:5.2mm;">
						<div class="styLNLeftLtrBox" style="padding-top:2mm;">b</div>
						<div class="styLNDesc" style="padding-top:2mm;">
							<span style="float:left;">Are you the original user of the qualified energy efficiency improvements?</span>
							<span class="styIRS5695Dots" style="padding-right:7px;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="width:7.8mm; height:5.2mm;  padding-top:2mm;">17b</div>
						<div class="styLNAmountBox" style="text-align:left; height:5.2mm; ">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/OriginalUserInd"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<input type="checkbox" aria-label="original user of qualified energy efficiency improvement Yes" class="styCkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/OriginalUserInd"/>
									<xsl:with-param name="BackupName">IRS5695OriginalUserInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<b>Yes</b>
							<span style="width:4mm;"/>
							<input type="checkbox" aria-label="original user of qualified energy efficiency improvement No" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/OriginalUserInd"/>
									<xsl:with-param name="BackupName">IRS5695OriginalUserInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<b>No</b>
						</div>
					</div>
					<!-- Line 17c -->
					<div class="styIRS5695LineItem" style="height:5.2mm;">
						<div class="styLNLeftLtrBox" style="padding-top:2mm;">c</div>
						<div class="styLNDesc" style="padding-top:2mm;">
							<span style="float:left;">Are the components reasonably expected to remain in use for at least 5 years?</span>
							<span class="styIRS5695Dots" style="padding-right:7px;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="width:7.8mm;height:5.2mm;background-color:white;padding-top:2mm;">17c</div>
						<div class="styLNAmountBox" style="text-align:left;height:5.2mm;background-color:white;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/FiveYearUseExpectationInd"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<input type="checkbox" aria-label="Five Year Use Expectation Ind Yes" class="styCkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/FiveYearUseExpectationInd"/>
									<xsl:with-param name="BackupName">IRS5695FiveYearUseExpectationInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<b>Yes</b>
							<span style="width:4mm;"/>
							<input type="checkbox" aria-label="Five Year Use Expectation Ind No" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/FiveYearUseExpectationInd"/>
									<xsl:with-param name="BackupName">IRS5695FiveYearUseExpectationInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<b>No</b>
						</div>
					</div>
					<!-- Line 17c comments -->
					<div class="styIRS5695LineItem" style="height:8mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="height:8mm; padding-top:1mm;">
							If you checked the “No” box for line 17a, 17b, or 17c, you cannot claim the energy efficient home
							improvement credit. Do not complete Part II, Section A.
						</div>
						<div class="styShadingCell" style="width:8mm; height:8mm;border-right-width:1px;"/>
					</div>
					<!-- Line 17d -->
					<div class="styIRS5695LineItem" style="height:21mm;">
						<div class="styLNLeftLtrBox">d</div>
						<div class="styLNDesc">
							Enter the complete address of the main home where you made the qualifying improvements. <br/>
							<b>Caution: </b>You can only have one main home at a time. (See instructions.)
							<xsl:call-template name="OneLineHomeAddress">
							<xsl:with-param name="TotalWidth">140mm</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/HomeAddress"/> 
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:8mm;height:21mm;border-right-width:1px;"/>
					</div>
					<!-- Line 17e -->
					<div class="styIRS5695LineItem" style="height:5.2mm;">
						<div class="styLNLeftLtrBox" style="padding-top:2mm;">e</div>
						<div class="styLNDesc" style="padding-top:2mm;">
							<span style="float:left;">Were any of these improvements related to the construction of this main home?</span>
							<span class="styIRS5695Dots" style="padding-right:7px;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="width:7.8mm;height:5.2mm;background-color:white;padding-top:2mm;">17e</div>
						<div class="styLNAmountBox" style="text-align:left;height:5.2mm;background-color:white;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/ImprvRltdToConstMainHomeInd"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<input type="checkbox" aria-label="Improvements Related to the Construction of Main Home Yes" class="styCkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/ImprvRltdToConstMainHomeInd"/>
									<xsl:with-param name="BackupName">IRS5695ImprvRltdToConstMainHomeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<b>Yes</b>
							<span style="width:4mm;"/>
							<input type="checkbox" aria-label="Improvements Related to the Construction of Main Home Yes No" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/ImprvRltdToConstMainHomeInd"/>
									<xsl:with-param name="BackupName">IRS5695ImprvRltdToConstMainHomeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<b>No</b>
						</div>
					</div>
					<!-- LineX comment -->
					<div class="styIRS5695LineItem" style="height:12mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="height:12mm; padding-top:1mm;">
						If you checked the “Yes” box, you can only claim the energy efficient home improvement credit for
						qualifying improvements that were not related to the construction of the home. Do not include expenses
						related to the construction of your main home, even if the improvements were made after you moved
						into the home.
					</div>
						<div class="styShadingCell" style="width:8mm; height:12mm;border-right-width:1px;"/>
					</div>
					<!-- Line 18 -->
					<div class="styIRS5695LineItem" style="height:4mm;">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc" style="">
						Insulation or air sealing material or system.
					</div>
						<div class="styShadingCell" style="width:8mm;height:4mm;border-right-width:1px;"/>
					</div>
					<!-- Line 18a -->
					<div class="styIRS5695LineItem" style="height:11mm;">
						<div class="styLNLeftLtrBox">a</div>
						<div class="styLNDesc" style="width:98.05mm;">
							Enter the cost of insulation material or system (include air sealing material or system) 
							specifically and primarily designed to reduce                                                                                  
							 heat loss or gain of your home that meets 
							 the criteria established by the IECC. (See instructions.)  
							<!--<span class="styIRS5695Dots">................</span>-->
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:6mm;">18a</div>
						<div class="styLNAmountBox" style="height:11mm;padding-right:2px;padding-top:6mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/InsulationOrSysHtGnLossCostAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:8mm;height:11mm;border-right-width:1px;"/>
					</div>
					<!-- Line 18b -->
					<div class="styIRS5695LineItem" style="height:6mm;">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc">
				Multiply line 18a by 30% (0.30). Enter the results. Do <b>not</b> enter more than $1,200
				<span class="styIRS5695Dots">......</span>
						</div>
						<div class="styLNRightNumBox" style="width:7.6mm; height:6mm; padding-top:1mm">18b</div>
						<div class="styLNAmountBox" style="height:6mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/InsulationOrSysHtStdPctCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 19 -->
					<div class="styIRS5695LineItem" style="height:4mm;">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="">
		Exterior doors that meet the applicable Energy Star requirements. 
	</div>
						<div class="styShadingCell" style="width:8mm;height:4mm;border-right-width:1px;"/>
					</div>
					<!-- Line 19a -->
					<div class="styIRS5695LineItem" style="height:6mm;">
						<div class="styLNLeftLtrBox">a</div>
						<div class="styLNDesc" style="width:98.05mm;">
			Enter the cost of the most expensive door you bought  
			<span class="styIRS5695Dots">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:6mm; padding-top:2mm;">19a</div>
						<div class="styLNAmountBox" style="height:6mm;padding-right:2px;padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/MostExpnsExtrDoorCostAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:8mm;height:6mm;border-right-width:1px;"/>
					</div>
					<!-- Line 19b -->
					<div class="styIRS5695LineItem" style="height:6mm;">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc" style="width:98.05mm;">
			Multiply line 19a by 30% (0.30). Do <b>not</b> enter more than $250 
			<span class="styIRS5695Dots">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:6mm; padding-top:2mm;">19b</div>
						<div class="styLNAmountBox" style="height:6mm;padding-right:2px;padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/MostExpnsExtrDoorsStdPctCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:8mm;height:6mm;border-right-width:1px;"/>
					</div>
					<!-- Line 19c -->
					<div class="styIRS5695LineItem" style="height:6mm;">
						<div class="styLNLeftLtrBox">c</div>
						<div class="styLNDesc" style="width:98.05mm;">
			Enter the cost of all other qualifying exterior doors
			<span class="styIRS5695Dots">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:6mm; padding-top:2mm;">19c</div>
						<div class="styLNAmountBox" style="height:6mm;padding-right:2px;padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/OtherQlfyExtrDoorsCostAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:8mm;height:6mm;border-right-width:1px;"/>
					</div>
					<!-- Line 19d -->
					<div class="styIRS5695LineItem" style="height:6mm;">
						<div class="styLNLeftLtrBox">d</div>
						<div class="styLNDesc" style="width:98.05mm;">
			Multiply line 19c by 30% (0.30)  
			<span class="styIRS5695Dots">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:6mm; padding-top:2mm;">19d</div>
						<div class="styLNAmountBox" style="height:6mm;padding-right:2px;padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/OtherQlfyExtrDoorsStdPctCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:8mm;height:6mm;border-right-width:1px;"/>
					</div>
					<!-- Line 19e -->
					<div class="styIRS5695LineItem" style="height:6mm;">
						<div class="styLNLeftLtrBox">e</div>
						<div class="styLNDesc">
				Add lines 19b and 19d. Do <b>not</b> enter more than $500   
				<span class="styIRS5695Dots">..............</span>
						</div>
						<div class="styLNRightNumBox" style="width:7.6mm;height:6mm;padding-top:2mm">19e</div>
						<div class="styLNAmountBox" style="height:6mm; padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/TotalExtrDoorsCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 20 -->
					<div class="styIRS5695LineItem" style="height:4mm;">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc" style="">
		Windows and skylights that meet the Energy Star certification requirements.
	</div>
						<div class="styShadingCell" style="width:8mm;height:4mm;border-right-width:1px;"/>
					</div>
					<!-- Line 20a -->
					<div class="styIRS5695LineItem" style="height:6mm;">
						<div class="styLNLeftLtrBox">a</div>
						<div class="styLNDesc" style="width:98.05mm;">
			Enter the cost of exterior windows and skylights that meet 
			the Energy Star certification requirements. (See instructions.)
			<span class="styIRS5695Dots">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:6mm; padding-top:2mm;">20a</div>
						<div class="styLNAmountBox" style="height:6mm;padding-right:2px;padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/ExteriorWndwOrSkylightCostAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:8mm;height:6mm;border-right-width:1px;"/>
					</div>
					<!-- Line 20b -->
					<div class="styIRS5695LineItem" style="height:6mm;">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc">
				Multiply line 20a by 30% (0.30). Enter the results. Do <b>not</b> enter more than $600
				<span class="styIRS5695Dots">........</span>
						</div>
						<div class="styLNRightNumBox" style="width:7.6mm;height:6mm;padding-top:2mm">20b</div>
						<div class="styLNAmountBox" style="height:6mm; padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/ExtrWndwSkylightStdPctCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Section B -->
					<div class="styBB" style="width:187mm;height:4.25mm; border-top: 1px solid black">
						<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;">Section B—Residential Energy Property Expenditures</div>
					</div>
					<!-- Line 21a -->
					<div class="styIRS5695LineItem" style="height:6mm;">
						<div class="styLNLeftNumBox" style="height:6mm;">21a</div>
						<div class="styLNDesc" style="height:6mm;">
					Did you incur costs for qualified energy property installed on or in connection with a home located in
					<br/>
							<span style="float:left;">the United States? (See instructions.)</span>
							<span class="styIRS5695Dots" style="padding-right:7px;">...................	</span>
						</div>
						<div class="styLNRightNumBox" style="width:7.8mm;height:6mm;padding-top:0mm;padding-bottom:2mm;">
							<br/>21a</div>
						<div class="styLNAmountBox" style="text-align:left;height:6mm;padding-top:1.5mm;padding-bottom:2mm;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/QlfyEnergyPropCostsUSHomeInd"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<input type="checkbox" aria-label="incur cost for qualified energy property installed Yes" class="styCkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/QlfyEnergyPropCostsUSHomeInd"/>
									<xsl:with-param name="BackupName">IRS5695QlfyEnergyPropCostsUSHomeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<b>Yes</b>
							<span style="width:4mm;"/>
							<input type="checkbox" aria-label="incur cost for qualified energy property installed No" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/QlfyEnergyPropCostsUSHomeInd"/>
									<xsl:with-param name="BackupName">IRS5695QlfyEnergyPropCostsUSHomeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<b>No</b>
							
						</div>
					</div>
					<!-- Line 21b -->
					<div class="styIRS5695LineItem" style="height:5.2mm;">
						<div class="styLNLeftLtrBox" style="padding-top:2mm;">b</div>
						<div class="styLNDesc" style="padding-top:2mm;">
							<span style="float:left;">Was the qualified energy property originally placed into service by you?</span>
							<span class="styIRS5695Dots" style="padding-right:7px;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="width:7.8mm;height:5.2mm;background-color:white;padding-top:2mm;">21b</div>
						<div class="styLNAmountBox" style="text-align:left;height:5.2mm;background-color:white;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/OriginallyPlacedInServiceInd"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<input type="checkbox" aria-label="qualified energy property originally placed Yes" class="styCkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/OriginallyPlacedInServiceInd"/>
									<xsl:with-param name="BackupName">IRS5695OriginallyPlacedInServiceInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<b>Yes</b>
							<span style="width:4mm;"/>
							<input type="checkbox" aria-label="qualified energy property originally placed No" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/OriginallyPlacedInServiceInd"/>
									<xsl:with-param name="BackupName">IRS5695OriginallyPlacedInServiceInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<b>No</b>
						</div>
					</div>
					<!-- Start of table section -->
					<div>
					<!-- Line 21b comment -->
					<div class="styIRS5695LineItem" style="height:8mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="height:8mm; padding-top:1mm;">
			If you checked the “No” box for line 21a or 21b, you cannot claim the credit for your residential
			energy property costs. Skip lines 22 through 25 and line 29. Go to line 26.
				</div>
						<div class="styShadingCell" style="width:8mm; height:inherit;border-right-width:1px;"/>
					</div>
					<!-- Line 21c -->
					<div class="styIRS5695LineItem">
						<div class="styLNLeftLtrBox">c</div>
						<div class="styLNDesc" >
							Enter the complete address of each home where you installed qualified energy property.
						</div>
						<div class="styShadingCell" style="width:8mm;height:inherit;border-right-width:1px;"/>
					</div>
					<!-- address table -->
					<div style="">
          <xsl:variable name="rowCount" select="count($Form5695Data/EgyEffcntHmImprvCrGrp/QualifiedEnergyPropertyAddress)" />
          <xsl:variable name="height" select="($rowCount + 1) * 6" />
          <xsl:attribute name="style"><xsl:value-of select="concat('height:',$height,'mm;width:154mm;')" /></xsl:attribute>
					<div class="styShadingCell" style="width:8mm;height:inherit;border-right-width:1px;float: right;"></div>
						<table cellpadding="0" cellspacing="0" 
						style="margin-left:5mm;width:138mm; border-color:black;border-style:solid; border-width: 1px 0px 0px 1px">
							<tbody>
								<tr>
									<th class="styIRS5695TableCellHeader" width="33%">Number and street</th>
									<th class="styIRS5695TableCellHeader" width="14%">Unit no.</th>
									<th class="styIRS5695TableCellHeader" width="26%">City or town</th>
									<th class="styIRS5695TableCellHeader" width="7%">State</th>
									<th class="styIRS5695TableCellHeader" width="10%">ZIP code</th>
								</tr>
								<xsl:for-each select="$Form5695Data/EgyEffcntHmImprvCrGrp/QualifiedEnergyPropertyAddress">
								<tr>
									<td class="styIRS5695TableCell">
										<xsl:call-template name="PopulateText">	
											<xsl:with-param name="TargetNode" select="AddressLine1Txt"/>
										</xsl:call-template> <br/>
										<xsl:call-template name="PopulateText">	
											<xsl:with-param name="TargetNode" select="AddressLine2Txt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS5695TableCell">
										<!--xsl:call-template name="PopulateText">	
											<xsl:with-param name="TargetNode" select="AddressLine2Txt"/>
										</xsl:call-template-->
									</td>
									<td class="styIRS5695TableCell">
										<xsl:call-template name="PopulateText">	
											<xsl:with-param name="TargetNode" select="CityNm"/>
										</xsl:call-template>
									</td>
									<td class="styIRS5695TableCell">
										<xsl:call-template name="PopulateText">	
											<xsl:with-param name="TargetNode" select="StateAbbreviationCd"/>
										</xsl:call-template>
									</td>
									<td class="styIRS5695TableCell">
										<xsl:call-template name="PopulateText">	
											<xsl:with-param name="TargetNode" select="ZIPCd"/>
										</xsl:call-template>
									</td>
								</tr>
								</xsl:for-each>
							</tbody>
						</table>
						
					</div>

					<!-- Address////////////////////////////////////////////////////-->
					<!-- Line 22 -->
					<div class="styIRS5695LineItem" style="height:8mm;">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc" style="">
				Residential energy property costs (include labor costs for onsite preparation, assembly, and original
		installation). (See instructions.)
			</div>
						<div class="styShadingCell" style="width:8mm;height:8mm;border-right-width:1px;"/>
					</div>
					<!-- Line 22a -->
					<div class="styIRS5695LineItem" style="height:6mm;">
						<div class="styLNLeftLtrBox">a</div>
						<div class="styLNDesc" style="width:98.05mm;">
					Enter the cost of central air conditioners
					<span class="styIRS5695Dots">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:6mm; padding-top:2mm;">22a</div>
						<div class="styLNAmountBox" style="height:6mm;padding-right:2px;padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/CentralAirCondCostAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:8mm;height:6mm;border-right-width:1px;"/>
					</div>
					</div>
					<!-- End of table section -->
					<!-- Line 22b -->
					<div class="styIRS5695LineItem" style="height:6mm;">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc">
						Multiply line 22a by 30% (0.30). Enter the results. Do <b>not</b> enter more than $600
						<span class="styIRS5695Dots">.......</span>
						</div>
						<div class="styLNRightNumBox" style="width:7.6mm;height:6mm;padding-top:2mm">22b</div>
						<div class="styLNAmountBox" style="height:6mm; padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/CentralAirCondCostStdPctCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 23a -->
					<div class="styIRS5695LineItem" style="height:6mm;">
						<div class="styLNLeftNumBox">23a</div>
						<div class="styLNDesc" style="width:98.05mm;">
			Enter the cost of natural gas, propane, or oil water heaters
			<span class="styIRS5695Dots">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:6mm; padding-top:2mm;">23a</div>
						<div class="styLNAmountBox" style="height:6mm;padding-right:2px;padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/NatGasPrpnOilWtrHtrCostAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:8mm;height:6mm;border-right-width:1px;"/>
					</div>
					<!-- Line 23b -->
					<div class="styIRS5695LineItem" style="height:6mm;">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc">
						Multiply line 23a by 30% (0.30). Enter the results. Do <b>not</b> enter more than $600
						<span class="styIRS5695Dots">.......</span>
						</div>
						<div class="styLNRightNumBox" style="width:7.6mm;height:6mm;padding-top:2mm">23b</div>
						<div class="styLNAmountBox" style="height:6mm; padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/NatGasPrpnOilWtrHtrStdPctCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 24a -->
					<div class="styIRS5695LineItem" style="height:6mm;">
						<div class="styLNLeftNumBox">24a</div>
						<div class="styLNDesc" style="width:98.05mm;">
					Enter the cost of natural gas, propane, or oil furnace or hot water boilers
					
					</div>
						<div class="styLNRightNumBox" style="height:6mm; padding-top:2mm;">24a</div>
						<div class="styLNAmountBox" style="height:6mm;padding-right:2px;padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/NatGasPrpnOilHotWtrBlrCostAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:8mm;height:6mm;border-right-width:1px;"/>
					</div>
					<!-- Line 24b -->
					<div class="styIRS5695LineItem" style="height:6mm;">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc">
						Multiply line 24a by 30% (0.30). Enter the results. Do <b>not</b> enter more than $600
						<span class="styIRS5695Dots">.......</span>
						</div>
						<div class="styLNRightNumBox" style="width:7.6mm;height:6mm;padding-top:2mm; border-bottom:0">24b</div>
						<div class="styLNAmountBox" style="height:6mm; padding-top:2mm; border-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/NatGasPrpnOilHotWtrBlrPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm; padding-top:3px; border-top:2px solid black;">
						<span style="float:right;padding-top:.5mm;">Form <span class="styBoldText" style="font-size:8pt;"> 5695  </span> (2024)</span>
					</div>
					<span style="height:6.5mm;"/>
					<!-- END Page Break and Footer-->
					

					<!-- Section B—Residential Energy Property Expenditures (continued) -->	
					<!-- BEGIN Page Header -->
					<div class="styTBB" style="width:187mm;padding-top:5mm;">
						<div style="float:left;">
							Form 5695 (2024)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">
							Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- Section B -->
					<div class="styBB" style="width:187mm;height:4.25mm; border-top: 1px solid black">
						<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;">Section B—Residential Energy Property Expenditures <i>(continued)</i>
						</div>
					</div>
					
					<!-- Line 25a -->
					<div class="styIRS5695LineItem" style="height:8mm;">
						<div class="styLNLeftNumBox">25a</div>
						<div class="styLNDesc" style="width:98.05mm;">
					Enter the cost of improvements or replacement of panelboards,
					subpanelboards, branch circuits, or feeders
					</div>
						<div class="styLNRightNumBox" style="height:8mm; padding-top:3mm;">25a</div>
						<div class="styLNAmountBox" style="height:8mm;padding-right:2px;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/PanelboardCktFeederCostAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:8mm;height:8mm;border-right-width:1px;"/>
					</div>
					<!-- Line 25b -->
					<div class="styIRS5695LineItem" style="height:6mm;">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc">
						Multiply line 25a by 30% (0.30). Enter the results. Do <b>not</b> enter more than $600
						<span class="styIRS5695Dots">.......</span>
						</div>
						<div class="styLNRightNumBox" style="width:7.6mm;height:6mm;padding-top:2mm">25b</div>
						<div class="styLNAmountBox" style="height:6mm; padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/PanelboardCktFeederStdPctCrAmt"/>
							</xsl:call-template>
						</div>
					</div>	
					<!-- Line 26 -->
					<div class="styIRS5695LineItem" style="height:4mm;">
						<div class="styLNLeftNumBox">26</div>
						<div class="styLNDesc" style="">
							Home energy audits
						</div>
						<div class="styShadingCell" style="width:8mm;height:4mm;border-right-width:1px;"/>
					</div>
					<!-- Line 26a -->
						<div class="styIRS5695LineItem" style="height:8mm;">
							<div class="styLNLeftLtrBox" style="padding-top:2mm;">a</div>
							<div class="styLNDesc" style="padding-top:2mm;">
								Did you incur costs for a home energy audit that included an inspection of your main home located in
								the United States and a written report prepared by a certified home energy auditor? (See instructions.)
								
							</div>
							<div class="styLNRightNumBox" style="width:7.8mm; height:8mm;  padding-top:3.5mm;">26a</div>
							<div class="styLNAmountBox" style="text-align:left; height:8mm; padding-top:3mm; ">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/MainHomeEgyAuditCostInd"/>
								</xsl:call-template>
								<span style="width:1mm;"/>
								<input type="checkbox" aria-label="incur cost for a home energy audit Yes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/MainHomeEgyAuditCostInd"/>
										<xsl:with-param name="BackupName">IRS5695MainHomeEgyAuditCostInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm;"/>
								<b>Yes</b>
								<span style="width:4mm;"/>
								<input type="checkbox" aria-label="incur cost for a home energy audit No" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/MainHomeEgyAuditCostInd"/>
										<xsl:with-param name="BackupName">IRS5695MainHomeEgyAuditCostInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm;"/>
								<b>No</b>
							</div>
						</div>
					<!-- Instruction 26a -->	
					<div class="styIRS5695LineItem" style="height:4mm;">
						<div class="styLNLeftNumBox"></div>
						<div class="styLNDesc" style="">
							If you checked the “No” box, you cannot claim the home energy audit credit. Stop. Go to line 27.
						</div>
						<div class="styShadingCell" style="width:8mm;height:4mm;border-right-width:1px;"/>
					</div>	
					
					<!-- Line 26b -->
					<div class="styIRS5695LineItem" style="height:6mm;">
							<div class="styLNLeftLtrBox" style=" padding-top:2mm;">b</div>
							<div class="styLNDesc" style="width:98.05mm; padding-top:2mm;">
								Enter the cost of the home energy audits
								<span class="styIRS5695Dots">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm; padding-top:2mm;">26b</div>
							<div class="styLNAmountBox" style="height:6mm;padding-right:2px;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/MainHomeEgyAuditCostAmt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="width:8mm;height:6mm;border-right-width:1px;"/>
					</div>
					<!-- Line 26c -->
					<div class="styIRS5695LineItem" style="height:6mm;">
								<div class="styLNLeftLtrBox" >c</div>
								<div class="styLNDesc" >
									Multiply line 26b by 30% (0.30). Enter the results. Do <b>not</b> enter more than $150
									<span class="styIRS5695Dots">.......</span>
								</div>
								<div class="styLNRightNumBox" style="width:7.6mm;height:6mm;padding-top:2mm">26c</div>
								<div class="styLNAmountBox" style="height:6mm; padding-top:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/MainHomeEgyAuditStdPctCrAmt"/>
									</xsl:call-template>
							</div>
					</div>
					<!-- Line 27 -->
					<div class="styIRS5695LineItem" style="height:6mm;">
							<div class="styLNLeftNumBox">27</div>
							<div class="styLNDesc" style="width:98.05mm;">
								Add lines 18b, 19e, 20b, 22b, 23b, 24b, 25b, and 26c
								<span class="styIRS5695Dots">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm; padding-top:2mm;">27</div>
							<div class="styLNAmountBox" style="height:6mm;padding-right:2px;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/EgyEffcntImprvCreditSubtlAmt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="width:8mm;height:6mm;border-right-width:1px;"/>
					</div>
					<!-- Line 28 -->
					<div class="styIRS5695LineItem" style="height:6mm;">
								<div class="styLNLeftNumBox" >28</div>
								<div class="styLNDesc" >
									Enter the smaller of line 27 or $1,200 
									<span class="styIRS5695Dots">...................</span>
								</div>
								<div class="styLNRightNumBox" style="width:7.6mm;height:6mm;padding-top:2mm">28</div>
								<div class="styLNAmountBox" style="height:6mm; padding-top:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/EnergyEffcntImprvAllwblCostAmt"/>
									</xsl:call-template>
							</div>
					</div>
					<!-- Line 29 -->
					<div class="styIRS5695LineItem" style="height:4mm;">
						<div class="styLNLeftNumBox">29</div>
						<div class="styLNDesc" style="">
							Heat pumps and heat pump water heaters; biomass stoves and biomass boilers.
						</div>
						<div class="styShadingCell" style="width:8mm;height:4mm;border-right-width:1px;"/>
					</div>
					<!-- Line 29a -->
					<div class="styIRS5695LineItem" style="height:6mm;">
							<div class="styLNLeftLtrBox">a</div>
							<div class="styLNDesc" style="width:98.05mm;">
								Enter the cost of electric or natural gas heat pumps
								<span class="styIRS5695Dots">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm; padding-top:2mm;">29a</div>
							<div class="styLNAmountBox" style="height:6mm;padding-right:2px;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/ElecGasHtPumpCostAmt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="width:8mm;height:6mm;border-right-width:1px;"/>
					</div>
					<!-- Line 29b -->
					<div class="styIRS5695LineItem" style="height:6mm;">
							<div class="styLNLeftLtrBox">b</div>
							<div class="styLNDesc" style="width:98.05mm;">
								Enter the cost of electric or natural gas heat pump water heaters
								<span class="styIRS5695Dots">..</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm; padding-top:2mm;">29b</div>
							<div class="styLNAmountBox" style="height:6mm;padding-right:2px;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/ElecGasHtPumpWtrHeaterCostAmt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="width:8mm;height:6mm;border-right-width:1px;"/>
					</div>
					<!-- Line 29c -->
					<div class="styIRS5695LineItem" style="height:6mm;">
							<div class="styLNLeftLtrBox">c</div>
							<div class="styLNDesc" style="width:98.05mm;">
								Enter the cost of biomass stoves and biomass boilers
								<span class="styIRS5695Dots">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm; padding-top:2mm;">29c</div>
							<div class="styLNAmountBox" style="height:6mm;padding-right:2px;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/BmssStoveBoilerCostAmt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="width:8mm;height:6mm;border-right-width:1px;"/>
					</div>
					<!-- Line 29d -->
					<div class="styIRS5695LineItem" style="height:6mm;">
							<div class="styLNLeftLtrBox">d</div>
							<div class="styLNDesc" style="width:98.05mm;">
								Add lines 29a, 29b, and 29c
								<span class="styIRS5695Dots">.............</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm; padding-top:2mm;">29d</div>
							<div class="styLNAmountBox" style="height:6mm;padding-right:2px;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/HtPumpWtrHeaterBmssCostAmt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="width:8mm;height:6mm;border-right-width:1px;"/>
					</div>
					<!-- Line 29e -->
					<div class="styIRS5695LineItem" style="height:6mm;">
								<div class="styLNLeftLtrBox" >e</div>
								<div class="styLNDesc" >
									Multiply line 29d by 30% (0.30). Enter the results. Do <b>not</b> enter more than $2,000
									<span class="styIRS5695Dots">......</span>
								</div>
								<div class="styLNRightNumBox" style="width:7.6mm;height:6mm;padding-top:2mm">29e </div>
								<div class="styLNAmountBox" style="height:6mm; padding-top:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/HtPumpWtrHeaterBmssStdPctCrAmt"/>
									</xsl:call-template>
							</div>
					</div>
					<!-- Line 30 -->
					<div class="styIRS5695LineItem" style="height:6mm;">
								<div class="styLNLeftNumBox" >30</div>
								<div class="styLNDesc" >
									Add lines 28 and 29e
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 30 - Adjusted Credit Limit</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/AdjustedCreditLimitAmt/@adjustedCreditLimitCd"/>
									</xsl:call-template>
									<span class="styIRS5695Dots">.......................</span>
								</div>
								<div class="styLNRightNumBox" style="width:7.6mm;height:6mm;padding-top:2mm">30</div>
								<div class="styLNAmountBox" style="height:6mm; padding-top:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/AdjustedCreditLimitAmt"/>
									</xsl:call-template>
							</div>
					</div>
					<!-- Line 31 -->
					<div class="styIRS5695LineItem" style="height:8mm;">
								<div class="styLNLeftNumBox" >31</div>
								<div class="styLNDesc" >
									Limitation based on tax liability. Enter the amount from the Energy Efficient Home Improvement Credit Limit Worksheet. (See instructions.)   
									<span class="styIRS5695Dots">.....................</span>
								</div>
								<div class="styLNRightNumBox" style="width:7.6mm;height:8mm;padding-top:4mm">31</div>
								<div class="styLNAmountBox" style="height:8mm; padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/TaxesLessCreditsAmt"/>
									</xsl:call-template>
							</div>
					</div>
					<!-- Line 32 -->
					<div class="styIRS5695LineItem" style="height:8mm;">
								<div class="styLNLeftNumBox" >32</div>
								<div class="styLNDesc" >
									<b>Energy efficient home improvement credit.</b> Enter the smaller of line 30 or line 31. Also include this
									amount on Schedule 3 (Form 1040), line 5b
									<span class="styIRS5695Dots">.................</span>
								</div>
								<div class="styLNRightNumBox" style="width:7.6mm;height:8mm; padding-top:4mm; ">32</div>
								<div class="styLNAmountBox" style="height:8mm; padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/EgyEffcntHmImprvCrAmt"/>
									</xsl:call-template>
							</div>
					</div>
					<!-- Line 32a ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:5mm;">
						<div class="styLNLeftLtrBox" style="height:5mm;">a</div>
						<div class="styLNDesc" style="height:5mm;">
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/JointOccupancyInd"/>
						</xsl:call-template>
							If the special rule for joint occupants applies, check here
							<input type="checkbox" aria-label="special rule for joint occupant" class="styCkbox" >
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/JointOccupancyInd"/>
								<xsl:with-param name="BackupName" select="ResidentialCleanEnergyCrGrpJointOccupancyInd"/>
							</xsl:call-template>
							</input>
							and attach a statement. (See instructions.)
							<span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/JointOccupancyInd"/>
									</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;width:7.6mm;background-color:lightgrey;border-bottom:0"/>
						<div class="styLNAmountBox" style="height:5mm;border-bottom:0"/>
					</div>



					
					
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm; padding-top:3px; border-top:2px solid black;">
						<span style="float:right;padding-top:.5mm;">Form <span class="styBoldText" style="font-size:8pt;"> 5695  </span> (2024)</span>
					</div>
					<span style="height:6.5mm;"/>
					<!-- END Page Break and Footer-->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;clear:all;">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<xsl:variable name="TableWidth">100</xsl:variable>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form5695Data"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part II-Line 25 Married Tax Period More Than One Home Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/MarriedTPWMoreThanOneHomeCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 30 - Adjusted Credit Limit</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form5695Data/EgyEffcntHmImprvCrGrp/AdjustedCreditLimitAmt/@adjustedCreditLimitCd"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
