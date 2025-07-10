<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS3800Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="Form3800Data" select="$RtnDoc/IRS3800"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form3800Data)"/>
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
				<meta name="Description" content="IRS Form 3800"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
					<xsl:call-template name="IRS3800Style"/>
					<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form3800" style="font-size:7pt;">
					<!-- BEGIN WARNING LINE -->
					<div class="styGenericDiv" style=" width:187mm;">
						<xsl:call-template name="DocumentHeader"/>
					</div>
					<!-- END WARNING LINE -->
					<!-- Begin Form Number and Name -->
					<div class="styTBB" style="width:187mm;height:21mm;">
						<div class="styFNBox" style="width:29mm;height:21mm;">
							<div style="height:13mm;">
               Form<span class="styFormNumber"> 3800</span>
								<br/>
								<!--General Dependency Push Pin-->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form3800Data"/>
								</xsl:call-template>
							</div>
							<div style="height:8mm;padding-top:.75mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service
								</span>
							</div>
						</div>
						<div class="styFTBox" style="width:128mm;height:21mm;">
							<div class="styMainTitle" style="padding-top:2mm;">General Business Credit</div>
							<div class="styFST" style="padding-top:6mm;">
								Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form3800" title="Link to irs.gov/Form3800">
									<i>www.irs.gov/Form3800</i>
								</a> for instructions and the latest information.
							</div>
							<div class="styFST" style="font-size:7pt;">
                 You must include all pages of Form 3800 with your return.
              </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:21mm;">
							<div class="styOMB">
                OMB No. 1545-0895
              </div>
							<div class="styTaxYear" style="height:9mm;padding-top:0;">20<span class="styTYColor">23</span>
							</div>
							<div style="text-align:left;padding-left:3mm;">Attachment Sequence No. <span class="styBoldText">22</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:150mm;font-size:7pt;font-weight:normal;">
              Name(s) shown on return<br/>
							<span>
								<xsl:call-template name="PopulateFilerName">
									<xsl:with-param name="TargetNode" select="$Form3800Data"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINBox" style="width:30mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
              Identifying number<br/>
							<br/>
							<span style="font-size: 7pt; font-weight: normal;text-align:left; vertical-align: bottom;">
								<xsl:call-template name="PopulateFilerTIN">
									<xsl:with-param name="TargetNode" select="$Form3800Data"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:0.5mm;font-size:8pt;">A</div>
						<div style="width:179mm;height:12mm;font-size:8pt;padding-top:0.5mm;">
							<div style="height:12mm;width:174mm;">
								<b>Corporate Alternative Minimum Tax (CAMT) and Base Erosion Anti-Abuse Tax (BEAT). </b> Are you both (a) an 
							"applicable corporation" within the meaning of IRC 59(k)(1) for the CAMT, and (b) an "applicable taxpayer" within the 
							meaning of IRC 59A(e) for the BEAT? See instructions 
							<span style="width:95mm;font-size:7pt;font-weight:normal;float:right;">
									<span class="styDotLn" style="float:left;">..................</span>
									<span style="float:right;">
										<input type="checkbox" class="styCkboxNM" alt="Are you both an applicable corporation within the meaning of IRC 59(k)(1) for the CAMT and (b) an applicable taxpayer within the meaning of IRC 59A(e) for the BEAT? Inddicator Yes">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form3800Data/CAMTAndBEATInd"/>
												<xsl:with-param name="BackupName" select="CAMTAndBEATInd"/>
											</xsl:call-template>
										</input>
										<span style="width:2px;"/>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form3800Data/CAMTAndBEATInd"/>
												<xsl:with-param name="BackupName" select="CAMTAndBEATInd"/>
											</xsl:call-template>
									Yes
								</label>
										<span style="width:10px;"/>
										<input type="checkbox" class="styCkboxNM" alt="Are you both an applicable corporation within the meaning of IRC 59(k)(1) for the CAMT and (b) an applicable taxpayer within the meaning of IRC 59A(e) for the BEAT? Inddicator No">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form3800Data/CAMTAndBEATInd"/>
												<xsl:with-param name="BackupName" select="CAMTAndBEATInd"/>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form3800Data/CAMTAndBEATInd"/>
												<xsl:with-param name="BackupName" select="CAMTAndBEATInd"/>
											</xsl:call-template>
									No
								</label>
									</span>
								</span>
							</div>
						</div>
					</div>
					<!-- Begin Part I (Tentative Credit) Section -->
					<div class="styBB" style="width:187mm;height:8mm;border-top-width:2px;">
						<div class="styPartName" style="background-color:black;height:4mm;">Part I</div>
						<div class="styPartDesc">
							<span style="width:158mm;">Current Year Credit for Credits Not Allowed Against Tentative Minimum Tax (TMT)</span>
							<div style="width:158mm;font-weight:normal">Go to Part III before Parts I and II. See instructions.</div>
						</div>
					</div>
					<!-- Part I, Line 1-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">General business credit from Part III, line 2, column (e) </span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;">...........</div>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/GeneralBusCrFromNnPssvActyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part I, Line 2-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:99mm;">
							<span style="float:left;">Passive activity credits from Part III, line 2, column (f) </span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;"/>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/CurrYearPassiveActyCreditsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
					</div>
					<!-- Part I, Line 3-->
					<div style="width:187mm;">
						<!-- extra space -->
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Enter the applicable passive activity credits allowed for 2023. See instructions </span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;">.........</div>
						</div>
						<div class="styLNRightNumBox" style="width:8mm;">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/PssvActyForGenBusCrAllowedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part I, Line 4-->
					<div style="width:187mm;">
						<!-- extra space -->
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Carryforward of general business credit to 2023.  See instructions for statement to attach. 
									<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form3800Data/CYGeneralBusCrCarryforwardAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;">.....</div>
						</div>
						<div class="styLNRightNumBox" style="width:8mm;">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/CYGeneralBusCrCarryforwardAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part I, Line 4 Checkbox -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">
								Check this box if the carryforward was changed or revised from the original reported amount
								</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:left;padding-left:3.2mm;">...</span>
							<div style="width:6mm;float:right;">
								<input type="checkbox" class="styCkbox" style="padding-top:1mm;" alt="Indicates allowed carryforward amount was changed or revised from original amount">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form3800Data/CYGeneralBusCrCarryforwardAmt/@carryforwardChgdOrRevsInd"/>
										<xsl:with-param name="BackupName">
									Indicates allowed carryforward amount was changed or revised from original amount
								</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form3800Data/CYGeneralBusCrCarryforwardAmt/@carryforwardChgdOrRevsInd"/>
										<xsl:with-param name="BackupName">
										Indicates allowed carryforward amount was changed or revised from original amount
									</xsl:with-param>
									</xsl:call-template>
								</label>
							</div>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
					</div>
					<!-- Part I, Line 5-->
					<div style="width:187mm;">
						<!-- extra space -->
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Carryback of general business credit from 2024. See instructions </span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;">..............</div>
						</div>
						<div class="styLNRightNumBox" style="width:8mm;">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/CarryBackGeneralBusinessCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part I, Line 6-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:139mm;">
							<!-- Revisit: Changing year 2002 to 2003 -->
							<!--Passive activity credits allowed for 2002-->
							<span style="float:left;">Add lines 1, 3, 4, and 5</span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;">...........................</div>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;">6</div>
						<div class="styLNAmountBoxNBB" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/CYCreditsNotAllwAgainstTMTAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Begin Part II Title -->
					<div class="styBB" style="width:187mm;border-top-width:2px;">
						<div class="styPartName" style="background-color:black;height:4mm;">Part II</div>
						<div class="styPartDesc">
							<span style="width:8px;"/>Allowable Credit
            </div>
					</div>
					<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
						<!-- Part II, Line 7 -->
						<div style="width:187mm">
							<div class="styLNLeftNumBoxSD">7</div>
							<div class="styLNDesc" style="width:114.8mm;">
		       Regular tax before credits:
								<ul style="padding-left:0;margin-left:4mm;margin-top:0;">
									<li style="padding-top:1mm;"> Individuals.  Enter the sum of the amounts from Form 1040, 1040-SR, or 1040-NR, line 
									16; and Schedule 2 (Form 1040), line 2.
									</li>
									<li style="padding-top:1mm;"> Corporations. Enter the amount from Form 1120, Schedule J, Part I, line 1; or the 
									applicable line of your return.
									</li>
									<li style="padding-top:1mm;"> Estates and trusts. Enter the sum of the amounts from Form 1041, Schedule G, lines 1a 
									and 1b, plus any Form 8978 amount included on line 1d; or the amount from the 
									applicable line of your return.
									</li>
								</ul>
							</div>
							<div class="styLNDesc" style="width:5mm;padding-top:4mm;">
								<img src="{$ImagePath}/3800_Bracket_Lger.gif" height="85mm;" alt="Curly Bracket Image"/>
							</div>
							<span class="styDotLn" style="height:21mm;width:19.2mm;padding-top:14mm;">.....</span>
							<div class="styLNRightNumBox" style="height:13mm;border-bottom-width:0px;background-color:lightgrey;padding-top:5mm;"/>
							<div class="styLNAmountBox" style="height:13mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:5mm;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/RegularTaxBeforeCreditsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:11mm;border-bottom-width:0px;background-color:lightgrey;padding-top:5mm;"/>
							<div class="styLNAmountBox" style="height:11mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:5mm;"/>
						</div>
						<!-- Part II, Line 8 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD">8</div>
							<div class="styLNDesc" style="width:114.8mm;height:3mm;">
                 Alternative minimum tax: 
								<ul style="padding-left:0;margin-left:4mm;margin-top:0;">
									<li style="padding-top:1mm;">
										Individuals. Enter the amount from Form 6251, line 11.
									</li>
									<li style="padding-top:1mm;">
										Corporations. Enter the amount from Form 4626, Part II, line 13.
									</li>
									<li style="padding-top:1mm;">
										Estates and trusts. Enter the amount from Schedule I (Form 1041), line 54.
									</li>
								</ul>
							</div>
							<div class="styLNDesc" style="width:5mm;">
								<img src="{$ImagePath}/3800_Bracket_Sm.gif" height="50mm" alt="Curly Bracket Image"/>
							</div>
							<span class="styDotLn" style="height:15mm;width:19.2mm;padding-top:5mm;">.....</span>
							<div class="styLNRightNumBox" style="height:5mm;border-bottom-width:0px;background-color:lightgrey;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:1mm;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/AlternativeMinimumTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;border-bottom-width:0px;background-color:lightgrey;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:8mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:1mm;"/>
						</div>
						<!-- Part II, Line 9 -->
						<div style="width:187mm;clear:none;height:4mm;">
							<div class="styLNLeftNumBoxSD">9</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Add lines 7 and 8 </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">.............................</div>
							</div>
							<div class="styLNRightNumBox">9</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/AdjustedRegTaxBeforeCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 10a -->
						<!-- The following form element does not have a matching element in the schema -->
						<div style="width:187mm;">
							<!--     Extra Space   -->
							<div class="styLNLeftNumBox" style="height:3mm;"/>
							<div class="styLNDesc" style="width:107mm;height:3mm;"/>
							<div class="styLNAmountBox" style="height:3mm;border-left-width:0px;border-bottom-width:0px;border-left-width:0px;"/>
							<div class="styLNRightNumBox" style="height:3mm;border-bottom-width:0px;padding-top:.5mm;background-color:lightgray;"/>
							<div class="styLNAmountBox" style="height:3mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:.5mm;"/>
							<!-- extra space -->
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">10a</div>
							<div class="styLNDesc" style="width:99mm;">
								<span style="float:left;">Foreign tax credit </span>
								<div class="styDotLn" style="float:right;">..................</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">10a</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/ForeignTaxCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
						</div>
						<!-- Part II, Line 10b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4.5mm">b</div>
							<div class="styLNDesc" style="width:99mm;">
								<span style="float:left;">Certain allowable credits (see instructions) </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">..........</div>
							</div>
							<div class="styLNRightNumBox">10b</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/CertainAllowableCreditsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
						</div>
						<!-- Part II, Line 10c -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4.5mm;">c</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Add lines 10a and 10b </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;">...........................</div>
							</div>
							<div class="styLNRightNumBox">10c</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/TotalTaxCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 11 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:6mm;padding-top:3mm;">11</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="height:6mm;padding-top:2.5mm;">
									<b>Net income tax.</b> Subtract line 10c from line 9. If zero, skip lines 12 through 15 and enter -0- on line 16</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;"/>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2.5mm;">11</div>
							<div class="styLNAmountBox" style="height:6mm;padding-top:2.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/NetIncomeTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--     Extra Space   -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;"/>
							<div class="styLNDesc" style="width:139mm;">
								<span style="height:4mm;"/>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;"/>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:4mm;"/>
						</div>
						<!-- extra space -->
						<!-- Part II, Line 12 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">12</div>
							<div class="styLNDesc" style="width:99mm;">
								<span style="float:left;">
									<b> Net regular tax.</b> Subtract line 10c from line 7.  If zero or less, enter -0- </span>
								<div class="styDotLn" style="float:right;">..</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/NetRegularTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
						</div>
						<!-- Part II, Line 13 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;">13</div>
							<div class="styLNDesc" style="height:8mm;width:99mm;">
								Enter 25% (0.25) of the excess, if any, of line 12 (line 11 for corporations) 
								<span style="float:left;">
								over $25,000. See instructions
								</span>
								<span class="styDotLn" style="float:right;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;">
								<div style="background-color: lightgrey;height:8mm;"/>
								<div style="height:8mm;padding-top:4mm;">13</div>
							</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/ExcessNetRegularTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:8mm;"/>
						</div>
						<!-- Part II, Line 14 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">14</div>
							<div class="styLNDesc" style="width:85.8mm;">
             Tentative minimum tax: 
								<ul style="padding-left:0;margin-left:4mm;margin-top:0;">
									<li style="padding-top:1mm;">
										Individuals. Enter the amount from Form 6251, line 9.
									</li>
									<li style="padding-top:1mm;">
										Corporations. Enter -0-.
									</li>
									<li style="padding-top:1mm;">
										Estates and trusts. Enter the amount from Schedule I (Form 1041), line 52.
									</li>
								</ul>
							</div>
							<div class="styLNDesc" style="width:5mm;">
								<img src="{$ImagePath}/3800_Bracket_Sm.gif" style="padding-top:4mm;" height="59mm" alt="Curly Bracket Image"/>
							</div>
							<span class="styDotLn" style="width:8.2mm;height:14mm;padding-top:9mm;">..</span>
							<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm;">
								14
							</div>
							<div class="styLNAmountBox" style="height:14mm;padding-top:10mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/TentativeMinimumTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:17mm;background-color:lightgrey"/>
							<div class="styLNAmountBoxNBB" style="height:17mm;"/>
						</div>
						<!-- Part II, Line 15.-->
						<div style="width:187mm;height:7mm;">
							<div class="styLNLeftNumBox" style="padding-top:3mm;">15</div>
							<div class="styLNDesc" style="width:139mm;padding-top:3mm;">
								<span style="float:left;">Enter the greater of line 13 or line 14 </span>
								<div class="styDotLn" style="float:right;">......................</div>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;">15</div>
							<div class="styLNAmountBox" style="height:7mm;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/AdjustedExcessNetRegularTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 16a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">16</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Subtract line 15 from line 11. If zero or less, enter -0- </span>
								<div class="styDotLn" style="float:right;">.................</div>
							</div>
							<div class="styLNRightNumBox">16</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/AdjustedNetIncomeTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 17 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">17</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Enter the <b>smaller</b> of line 6 or line 16
								<!--Pen and ink image -->
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Section 41(G) Indicator Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form3800Data/SmllrCYNotAllwTMTOrTotAdjAmt/@section383Or384IndicatorCd"/>
									</xsl:call-template>
								</span>
								<div class="styDotLn" style="float:right;">......................</div>
							</div>
							<div class="styLNRightNumBox">17</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/SmllrCYNotAllwTMTOrTotAdjAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 17 -->
						<div class="styBB" style="width:187mm;border-bottom-width:2px;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:139mm;">
								<span class="styBoldText">C corporations:</span> See the line 17 instructions if there has been an ownership change, acquisition, or reorganization. 
						</div>
							<div class="styLNRightNumBoxNBB" style="height:7.5mm;padding-top:0mm;width:8mm;background-color:lightgray;"/>
							<div class="styLNAmountBoxNBB" style="height:7.5mm;padding-top:0mm;width:32mm;"/>
						</div>
					</div>
					<!--Page 1 Footer -->
					<div class="styStdDiv pageEnd">
						<span style="font-weight:bold;">For Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="margin-left:24mm;">Cat. No. 12392F</span>
						<span style="float:right;">Form <b>3800</b> (2023)</span>
					</div>
					<!-- Page 2 Header -->
					<div style="width:187mm;clear:both;padding-bottom:.5mm;" class="styNBB">
						<div style="width:90mm;" class="styGenericDiv">Form 3800 (2023)</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">2</span>
						</div>
					</div>
					<!--  Begin Part II Title -->
					<div class="styBB" style="width:187mm;border-top-width:2px;">
						<div class="styPartName" style="background-color:black;height:4mm;">Part II</div>
						<div class="styPartDesc">
							<span style="width:8px;"/>Allowable Credit <span style="font-weight:normal;">
								<i>(Continued)</i>
							</span>
						</div>
					</div>
					<!--Part II Continue, Note Line -->
					<div class="styBB" style="width:187mm;border-bottom-width:1px;">
						<div class="styPartDesc" style="width:187mm;padding-left:0mm;font-weight:normal;height:4mm;">
							<b>Note:</b> If you are not required to report any amounts on lines 22 or 24 below, skip lines 18 through 25 and enter -0- on line 26.</div>
					</div>
					<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
						<!-- Part II, Line 18 -->
						<!--     Extra Space   -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:139mm;"/>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
						</div>
						<!-- extra space -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">18</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Multiply line 14 by 75% (0.75). See instructions </span>
								<div class="styDotLn" style="float:right;">...................</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">18</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/TentativeMinimunTaxTimesPctAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 19 -->
						<!--     Extra Space   -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:139mm;"/>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
						</div>
						<!-- extra space -->
						<!-- check here -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">19</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Enter the greater of line 13 or line 18 </span>
								<div class="styDotLn" style="float:right;">.....................</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">19</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/GreaterExcessOrTimesPctAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 20 -->
						<!--     Extra Space   -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:139mm;"/>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
						</div>
						<!-- extra space -->
						<!-- check here -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">20</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Subtract line 19 from line 11. If zero or less, enter -0- </span>
								<div class="styDotLn" style="float:right;">.................</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">20</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/NetIncmTaxLessGreaterExcessAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 21 -->
						<!--     Extra Space   -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:139mm;"/>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
						</div>
						<!-- extra space -->
						<!-- check here -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">21</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Subtract line 17 from line 20. If zero or less, enter -0- </span>
								<div class="styDotLn" style="float:right;">.................</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">21</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/SubSmllrFromNetLessGreaterAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 22 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:139mm;"/>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">22</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">
									Combine the amounts from line 3 of Part III, column (e), and line 2zz of Part IV, columns (e) and (f)
								</span>
								<div class="styDotLn" style="float:right;">..</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">22</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/TotEmpwrZoneGenBusCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 23 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:1mm;"/>
							<div class="styLNDesc" style="width:107mm;height:1mm;"/>
							<div class="styLNAmountBox" style="height:3mm;border-left-width:0px;border-bottom-width:0px;border-left-width:0px;"/>
							<div class="styLNRightNumBox" style="height:3mm;border-bottom-width:0px;padding-top:.5mm;background-color:lightgrey;width:8mm"/>
							<div class="styLNAmountBox" style="height:3mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:.5mm;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">23</div>
							<div class="styLNDesc" style="width:99mm;">
								<span style="float:left;">
									Passive activity credit from line 3 of Part III, column (f)
								</span>
								<div class="styDotLn" style="float:right;">......</div>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">23</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/GBCFromPssvActyAllPartsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:4mm;"/>
						</div>
						<!-- Part II, Line 24 -->
						<!--     Extra Space   -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:139mm;"/>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
						</div>
						<!-- extra space -->
						<!-- check here -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">24</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Enter the applicable passive activity credit allowed for 2023. See instructions</span>
								<div class="styDotLn" style="float:right;">.........</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">24</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/PassiveActyAllowedForTYAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 25 -->
						<!--     Extra Space   -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:139mm;"/>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
						</div>
						<!-- extra space -->
						<!-- check here -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">25</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Add lines 22 and 24</span>
								<div class="styDotLn" style="float:right;">...........................</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">25</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/TotalPassiveActivityCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 26-->
						<!--     Extra Space   -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:139mm;"/>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
						</div>
						<!-- extra space -->
						<!-- check here -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">26</div>
							<div class="styLNDesc" style="width:139mm;">
								Empowerment zone and renewal community employment credit allowed. Enter the smaller of line 21 or line 25
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">26</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/EmpwrZoneAndComEmploymentCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 27 -->
						<!--     Extra Space   -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:139mm;"/>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
						</div>
						<!-- extra space -->
						<!-- check here -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">27</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Subtract line 13 from line 11. If zero or less, enter -0- </span>
								<div class="styDotLn" style="float:right;">.................</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">27</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/NetIncomeTaxLessPctExcessAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 28 -->
						<!--     Extra Space   -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:139mm;"/>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
						</div>
						<!-- extra space -->
						<!-- check here -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">28</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Add lines 17 and 26 </span>
								<div class="styDotLn" style="float:right;">...........................</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">28</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/SumSmllrEmpwrZnEmplmnCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 29 -->
						<!--     Extra Space   -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:139mm;"/>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
						</div>
						<!-- extra space -->
						<!-- check here -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">29</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Subtract line 28 from line 27. If zero or less, enter -0- </span>
								<div class="styDotLn" style="float:right;">.................</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">29</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/NetSmllrAndEmpwrZnEmplmnCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 30 -->
						<!--     Extra Space   -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:139mm;"/>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
						</div>
						<!-- extra space -->
						<!-- check here -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">30</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Enter the general business credit from line 5 of Part III, column (e)</span>
								<div class="styDotLn" style="float:right;">.............</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">30</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/AllwGenBusCrFromNonPssvActyAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 31 -->
						<!--     Extra Space   -->
						<!-- Part II, Line 31-->
						<!--     Extra Space   -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:139mm;"/>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-bottom-width:0px;background-color:lightgrey;"/>
						</div>
						<!-- extra space -->
						<!-- check here -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">31</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Reserved</span>
								<span class="styDotLn" style="float:right;">...............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">31</div>
							<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;"/>
						</div>
						<!-- Part II, Line 32 -->
						<!-- The following form element does not have a matching element in the schema -->
						<div style="width:187mm;">
							<!--     Extra Space   -->
							<div class="styLNLeftNumBox" style="height:1mm;"/>
							<div class="styLNDesc" style="width:107mm;height:1mm;"/>
							<div class="styLNAmountBox" style="height:3mm;border-left-width:0px;border-bottom-width:0px;border-left-width:0px;"/>
							<div class="styLNRightNumBox" style="height:3mm;border-bottom-width:0px;padding-top:.5mm;background-color:lightgrey;width:8mm"/>
							<div class="styLNAmountBox" style="height:3mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:.5mm;"/>
							<!-- extra space -->
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-top:1mm">32</div>
							<div class="styLNDesc" style="width:99mm;padding-top:1mm;">
								<span style="float:left;">Passive activity credits from line 5 of Part III, column (f)</span>
								<span class="styDotLn" style="float:right;">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">32</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/GenBusEligSmllBusPssvActyCrAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:4mm;"/>
						</div>
						<!-- Part II, Line 33 -->
						<!--     Extra Space   -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:139mm;"/>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="border-bottom-width:0px;"/>
						</div>
						<!-- extra space -->
						<!-- check here -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">33</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Enter the applicable passive activity credits allowed for 2023. See instructions</span>
								<div class="styDotLn" style="float:right;">.........</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">33</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/OtherSpecifiedAllwGenBusCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 34 -->
						<!--     Extra Space   -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:139mm;"/>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
						</div>
						<!-- extra space -->
						<!-- check here -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">34</div>
							<div class="styLNDesc" style="width:139mm;">
								Carryforward of business credit to 2023. Enter the amount from line 5 of Part IV, column (f), and line 6 of 
								<span style="float:left;padding-top:1mm;">Part IV, column (g). See instructions for statement to attach
								<!-- Push Pin image -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form3800Data/AllwGenAndEligSmllBusCfwdCrAmt"/>
									</xsl:call-template>
								</span>
								<div class="styDotLn" style="float:right;">...............</div>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">34</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/AllwGenAndEligSmllBusCfwdCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 34 Checkbox -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">
								Check this box if the carryforward was changed or revised from the original reported amount
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:left;padding-left:3.2mm;">...</span>
								<div style="width:6mm;float:right;">
									<input type="checkbox" class="styCkbox" alt="Indicates allowed carryforward amount was changed or revised from original amount">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form3800Data/AllwGenAndEligSmllBusCfwdCrAmt/@carryforwardChgdOrRevsInd"/>
											<xsl:with-param name="BackupName">
									Indicates allowed carryforward amount was changed or revised from original amount
								</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form3800Data/AllwGenAndEligSmllBusCfwdCrAmt/@carryforwardChgdOrRevsInd"/>
											<xsl:with-param name="BackupName">
										Indicates allowed carryforward amount was changed or revised from original amount
									</xsl:with-param>
										</xsl:call-template>
									</label>
								</div>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
						</div>
						<!-- Part II, Line 35-->
						<!--     Extra Space   -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:139mm;"/>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="border-bottom-width:0px;"/>
						</div>
						<!-- extra space -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">35</div>
							<div class="styLNDesc" style="width:139mm;">
								Carryback of business credit from 2024. Enter the amount from line 5 of Part IV, column (e). See
							</div>
							<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-bottom-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;"> instructions
							</span>
								<div class="styDotLn" style="float:right;">..............................</div>
							</div>
							<div class="styLNRightNumBox">35</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/AllwGenAndEligSmllBusCybkCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 36 -->
						<!--     Extra Space   -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:139mm;"/>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
						</div>
						<!-- extra space -->
						<!-- check here -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">36</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Add lines 30, 33, 34, and 35</span>
								<div class="styDotLn" style="float:right;">.........................</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">36</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/TotAllwGenAndEligSmllBusCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 37 -->
						<!--     Extra Space   -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:139mm;"/>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-left-width:1px;"/>
						</div>
						<!-- extra space -->
						<!-- check here -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">37</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Enter the <b>smaller</b> of line 29 or line 36 </span>
								<div class="styDotLn" style="float:right;">.....................</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">37</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/SmllrGenBusCrOrTotGenEligCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 38 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:139mm;"/>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-left-width:1px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">38</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="styBoldText">
									<b>Credit allowed for the current year.</b>
								</span> Add lines 28 and 37. 
                 <!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form3800Data/CurrentYearCreditAllowedAmt"/>
								</xsl:call-template>
								<br/>
								Report the amount from line 38 (if smaller than the sum of Part I, line 6, and Part II, lines 25 and 36; see
								instructions) as indicated below or on the applicable line of your return.
							</div>
							<div class="styLNRightNumBox" style="height:10.9mm;border-bottom-width:0px;padding-top:1.5mm;"/>
							<div class="styLNAmountBox" style="height:10.9mm;border-bottom-width:0px;border-left-width:1px;padding-top:1.5mm;"/>
						</div>
						<div class="styBB" style="width:187mm;border-bottom-width:2px;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:75mm;">
								<ul style="padding-left:0;margin-left:4mm;margin-top:0;">
									<li>Individuals. Schedule 3 (Form 1040),  line 6a.
								</li>
									<li>Corporations. Form 1120, Schedule J, Part I, line 5c.
								</li>
									<li>Estates and trusts. Form 1041, Schedule G, line 2b.
								</li>
								</ul>
							</div>
							<div class="styLNDesc" style="width:5mm;">
								<img src="{$ImagePath}/3800_Bracket_Sm.gif" height="40mm" alt="Curly Bracket Image"/>
							</div>
							<span class="styDotLn" style="width:59mm;height:12mm;padding-top:4mm;">...............</span>
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">38</div>
							<div class="styLNAmountBox" style="height:8.5mm;padding-top:4mm;border-left-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/CurrentYearCreditAllowedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:0;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="border-bottom:0;background-color:lightgrey;"/>
						</div>
						<!--Page 2 Footer -->
					</div>
					<div class="styStdDiv pageEnd">
						<span style="font-weight:bold;"/>
						<span style="margin-left:24mm;"/>
						<span style="float:right;">Form <b>3800</b> (2023)</span>
					</div>
					<!-- =============================================================================================================== -->
					<!-- ========================================== Part III Table 1 START ============================================= -->
					<!-- =============================================================================================================== -->
					<!-- Page 3 Header -->
					<div style="width:256mm;clear:both;padding-bottom:.5mm;" class="styNBB">
						<div style="width:90mm;" class="styGenericDiv">Form 3800 (2023)</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">3</span>
						</div>
					</div>
					<div class="styBB" style="width:256mm;border-top-width:2px;">
						<div class="styGenericDiv" style="width:256mm;height:8mm;">
							<div class="styPartName" style="width:15mm;">Part III</div>
							<div class="styPartDesc" style="padding-left:3mm;width:235mm;font-weight:normal;">
								<b>Current Year General Business Credits (GBCs) </b> 
							(see instructions). If there is more than one credit amount to report on lines 1a through 1zz, 3, or 4a through 
							4z, enter the number of items you have for that line in column (c) and complete Part V.
							</div>
						</div>
					</div>
					<div class="styTableContainerLandscape" style="height:auto;display:block;border-bottom-width:1px;" id="PartIIITable1Ctn">
						<table class="styTable" cellspacing="0" name="PartIIITable1" id="PartIIITable1">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS3800PartIIITableCellHeader" style="width:8mm;border-bottom-width:0mm;border-right-width:0mm;"/>
									<th class="styIRS3800PartIIITableCellHeader" scope="col" style="width:50mm;">
										<b>(a)</b>
										<br/>Current year credits from:
									</th>
									<th class="styIRS3800PartIIITableCellHeader" scope="col">
										<b>(b)</b>
										<br/> Elective payment or transfer registration number
									</th>
									<th class="styIRS3800PartIIITableCellHeader" style="width:8mm;">
										<b>(c)</b>
										<br/> # items
									</th>
									<th class="styIRS3800PartIIITableCellHeader" scope="col">
										<b>(d)</b>
										<br/> Pass-through or transfer credit entity EIN
									</th>
									<th class="styIRS3800PartIIITableCellHeader" scope="col">
										<b>(e)</b>
										<br/> Credits from non-passive activities
									</th>
									<th class="styIRS3800PartIIITableCellHeader" scope="col">
										<b>(f)</b>
										<br/> Current and prior year passive activity credit allowed for the current year
									</th>
									<th class="styIRS3800PartIIITableCellHeader" scope="col">
										<b>(g)</b>
										<br/> Credit transfer election amount (enter amounts transferred out as a negative amount)
									</th>
									<th class="styIRS3800PartIIITableCellHeader" scope="col">
										<b>(h)</b>
										<br/> Gross elective payment election amount
									</th>
									<th class="styIRS3800PartIIITableCellHeader" scope="col">
										<b>(i)</b>
										<br/> Net elective payment election amount
									</th>
									<th class="styIRS3800PartIIITableCellHeader" scope="col" style="border-right-width:0px;">
										<b>(j)</b>
										<br/> Combine columns (e), (f), and (g), less column (i)
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Part III, line 1a -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form3468PartIICYCreditsGrp"/>
									<xsl:with-param name="RowNumber">1a</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 3468, Part II</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, line 1b -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form7207CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">b</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 7207</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
									<xsl:with-param name="ColH"/>
									<xsl:with-param name="ColI"/>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 1c -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form6765CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">c</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 6765</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 1d -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form3468PartIIICYCreditsGrp"/>
									<xsl:with-param name="RowNumber">d</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 3468, Part III</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
									<xsl:with-param name="ColH"/>
									<xsl:with-param name="ColI"/>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, line 1e -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8826CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">e</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 8826</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, line 1f -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8835PartIICYCreditsGrp"/>
									<xsl:with-param name="RowNumber">f</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8835, Part II</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, line 1g -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form7210CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">g</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 7210</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
									<xsl:with-param name="ColH"/>
									<xsl:with-param name="ColI"/>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, line 1h -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8820CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">h</xsl:with-param>
									<xsl:with-param name="Dots">.......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8820</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, line 1i -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8874CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">i</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 8874</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, line 1j -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8881PartICYCreditsGrp"/>
									<xsl:with-param name="RowNumber">j</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8881, Part I</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, line 1k -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8882CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">k</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 8882</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, line 1l -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8864CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">l</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8864 (diesel)</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, line 1m -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8896CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">m</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 8896</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, line 1n -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8906CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">n</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 8906</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, line 1o -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form3468PartIVCYCreditsGrp"/>
									<xsl:with-param name="RowNumber">o</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 3468, Part IV</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH"/>
									<xsl:with-param name="ColI"/>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, line 1p -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8908CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">p</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 8908</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 1q -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/ClnFuelSect45ZCYCreditsGrp"/>
									<xsl:with-param name="RowNumber">q</xsl:with-param>
									<xsl:with-param name="Dots">.......</xsl:with-param>
									<xsl:with-param name="ColA">Reserved (45Z)</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF">lightgrey</xsl:with-param>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part III, Line 1r -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8910CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">r</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 8910</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 1s -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8911PartIICYCreditsGrp"/>
									<xsl:with-param name="RowNumber">s</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8911, Part II</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
									<xsl:with-param name="ColH"/>
									<xsl:with-param name="ColI"/>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 1t -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8830CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">t</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 8830</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 1u -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form7213PartIICYCreditsGrp"/>
									<xsl:with-param name="RowNumber">u</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 7213, Part II</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
									<xsl:with-param name="ColH"/>
									<xsl:with-param name="ColI"/>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 1v -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form3468PartVCYCreditsGrp"/>
									<xsl:with-param name="RowNumber">v</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 3468, Part V</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF">lightgrey</xsl:with-param>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part III, Line 1w -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8932CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">w</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 8932</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 1x -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8933CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">x</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 8933</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
									<xsl:with-param name="ColH"/>
									<xsl:with-param name="ColI"/>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 1y -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8936PartIICYCreditsGrp"/>
									<xsl:with-param name="RowNumber">y</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8936, Part II</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 1z -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath"/>
									<xsl:with-param name="RowNumber">z</xsl:with-param>
									<xsl:with-param name="Dots">.........</xsl:with-param>
									<xsl:with-param name="ColA">Reserved</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF">lightgrey</xsl:with-param>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part III, Line 1aa -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8936PartVCYCreditsGrp"/>
									<xsl:with-param name="RowNumber">aa</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8936, Part V</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH"/>
									<xsl:with-param name="ColI"/>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 1 bb -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8904CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">bb</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 8904</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 1cc  -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form7213PartICYCreditsGrp"/>
									<xsl:with-param name="RowNumber">cc</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 7213, Part I</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 1dd -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8881PartIICYCreditsGrp"/>
									<xsl:with-param name="RowNumber">dd</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8881, Part II</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 1ee -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8881PartIIICYCreditsGrp"/>
									<xsl:with-param name="RowNumber">ee</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8881, Part III</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 1ff -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8864SAFCYCreditsGrp"/>
									<xsl:with-param name="RowNumber">ff</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8864, Line 8</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 1gg -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Reserved1ggCYCreditsGrp"/>
									<xsl:with-param name="RowNumber">gg</xsl:with-param>
									<xsl:with-param name="Dots">.......</xsl:with-param>
									<xsl:with-param name="ColA">Reserved (1gg)</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF">lightgrey</xsl:with-param>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part III, Line 1hh -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Reserved1hhCYCreditsGrp"/>
									<xsl:with-param name="RowNumber">hh</xsl:with-param>
									<xsl:with-param name="Dots">.......</xsl:with-param>
									<xsl:with-param name="ColA">Reserved (1hh)</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF">lightgrey</xsl:with-param>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part III, Line 1ii -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Reserved1iiCYCreditsGrp"/>
									<xsl:with-param name="RowNumber">ii</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Reserved (1ii)</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF">lightgrey</xsl:with-param>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part III, Line 1jj -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Reserved1jjCYCreditsGrp"/>
									<xsl:with-param name="RowNumber">jj</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Reserved (1jj)</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF">lightgrey</xsl:with-param>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part III, Line 1zz -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/GenBusCYOtherCreditsGrp"/>
									<xsl:with-param name="RowNumber">zz</xsl:with-param>
									<xsl:with-param name="Dots">.......</xsl:with-param>
									<xsl:with-param name="ColA"> Other credits</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 2 -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/GenBusCYCreditsSubTotGrp"/>
									<xsl:with-param name="RowNumber">2</xsl:with-param>
									<xsl:with-param name="Dots">.....</xsl:with-param>
									<xsl:with-param name="ColA">Add lines 1a through 1zz</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
									<xsl:with-param name="ColH"/>
									<xsl:with-param name="ColI"/>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
					<!--Page 3 Footer -->
					<div class="styStdDiv pageEnd" style="width:256mm;">
						<span style="font-weight:bold;"/>
						<span style="margin-left:24mm;"/>
						<span style="float:right;">Form <b>3800</b> (2023)</span>
					</div>
					<!-- =============================================================================================================== -->
					<!-- ========================================== Part III Table 1 END =============================================== -->
					<!-- =============================================================================================================== -->
					<!-- =============================================================================================================== -->
					<!-- ========================================== Part III Table 2 START ============================================= -->
					<!-- =============================================================================================================== -->
					<!-- Page 4 Header -->
					<div style="width:256mm;clear:both;padding-bottom:.5mm;" class="styNBB">
						<div style="width:90mm;" class="styGenericDiv">Form 3800 (2023)</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">4</span>
						</div>
					</div>
					<div class="styBB" style="width:256mm;border-top-width:2px;">
						<div class="styGenericDiv" style="width:256mm;height:8mm;">
							<div class="styPartName" style="width:15mm;">Part III</div>
							<div class="styPartDesc" style="padding-left:3mm;width:235mm;font-weight:normal;">
								<b>Current Year General Business Credits (GBCs) </b> 
							(see instructions). If there is more than one credit amount to report on lines 1a through 1zz, 3, or 4a through 
							4z, enter the number of items you have for that line in column (c) and complete Part V.  <i>(continued)</i>
							</div>
						</div>
					</div>
					<div class="styTableContainerLandscape" style="height:auto;display:block;" id="PartIIITable2Ctn">
						<table class="styTable" cellspacing="0" name="PartIIITable2" id="PartIIITable2">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS3800PartIIITableCellHeader" style="width:8mm;border-bottom-width:0mm;border-right-width:0mm;"/>
									<th class="styIRS3800PartIIITableCellHeader" scope="col" style="width:50mm;">
										<b>(a)</b>
										<br/>Current year credits from:
									</th>
									<th class="styIRS3800PartIIITableCellHeader" scope="col">
										<b>(b)</b>
										<br/> Elective payment or transfer registration number
									</th>
									<th class="styIRS3800PartIIITableCellHeader" style="width:8mm;">
										<b>(c)</b>
										<br/> # items
									</th>
									<th class="styIRS3800PartIIITableCellHeader" scope="col">
										<b>(d)</b>
										<br/> Pass-through or transfer credit entity EIN
									</th>
									<th class="styIRS3800PartIIITableCellHeader" scope="col">
										<b>(e)</b>
										<br/> Credits from non-passive activities
									</th>
									<th class="styIRS3800PartIIITableCellHeader" scope="col">
										<b>(f)</b>
										<br/> Current year and carryover passive activity credit
									</th>
									<th class="styIRS3800PartIIITableCellHeader" scope="col">
										<b>(g)</b>
										<br/> Credit transfer election amount (enter amounts transferred out as a negative amount)
									</th>
									<th class="styIRS3800PartIIITableCellHeader" scope="col">
										<b>(h)</b>
										<br/> Gross elective payment election amount
									</th>
									<th class="styIRS3800PartIIITableCellHeader" scope="col">
										<b>(i)</b>
										<br/> Net elective payment election amount
									</th>
									<th class="styIRS3800PartIIITableCellHeader" scope="col" style="border-right-width:0px;">
										<b>(j)</b>
										<br/> Combine columns (e), (f), and (g), less column (i)
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Part III, Line 3 -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8844CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">3</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 8844</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 4 -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath"/>
									<xsl:with-param name="RowNumber">4</xsl:with-param>
									<xsl:with-param name="Dots"/>
									<xsl:with-param name="ColA">Specified credits:</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF">lightgrey</xsl:with-param>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part III, Line 4a -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form3468PartVICYCreditsGrp"/>
									<xsl:with-param name="RowNumber">a</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 3468, Part VI</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
									<xsl:with-param name="ColH"/>
									<xsl:with-param name="ColI"/>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 4b -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form5884CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">b</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 5884</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 4c -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form6478CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">c</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 6478</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III  Line 4d -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8586CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">d</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 8586</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 4e -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8835PartIICYSpcfdCreditsGrp"/>
									<xsl:with-param name="RowNumber">e</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8835, Part II</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
									<xsl:with-param name="ColH"/>
									<xsl:with-param name="ColI"/>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 4f -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8846CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">f</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 8846</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 4g -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8900CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">g</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 8900</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 4h -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8941CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">h</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 8941</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 4i -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form6765ESBCYCreditsGrp"/>
									<xsl:with-param name="RowNumber">i</xsl:with-param>
									<xsl:with-param name="Dots">.....</xsl:with-param>
									<xsl:with-param name="ColA">Form 6765 ESB credit</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 4j -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form8994CYCreditsGrp"/>
									<xsl:with-param name="RowNumber">j</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 8994</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 4k -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Form3468PartVIICYCreditsGrp"/>
									<xsl:with-param name="RowNumber">k</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 3468, Part VII</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 4l -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Reserved4lCYCreditsGrp"/>
									<xsl:with-param name="RowNumber">l</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Reserved (4l)</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF">lightgrey</xsl:with-param>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part III, Line 4m -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Reserved4mCYCreditsGrp"/>
									<xsl:with-param name="RowNumber">m</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Reserved (4m)</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF">lightgrey</xsl:with-param>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part III, Line 4z -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/GenBusOtherSpecifiedCYCrGrp"/>
									<xsl:with-param name="RowNumber">z</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Other specified credits</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
									<xsl:with-param name="ColH">lightgrey</xsl:with-param>
									<xsl:with-param name="ColI">lightgrey</xsl:with-param>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 5 -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/GenBusCYCreditsSubTot2Grp"/>
									<xsl:with-param name="RowNumber">5</xsl:with-param>
									<xsl:with-param name="Dots">.....</xsl:with-param>
									<xsl:with-param name="ColA">Add lines 4a through 4z</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
									<xsl:with-param name="ColH"/>
									<xsl:with-param name="ColI"/>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
								<!-- Part III, Line 6  -->
								<xsl:call-template name="Part3TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/TotGenBusCYCreditAmtGrp"/>
									<xsl:with-param name="RowNumber">6</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Add lines 2, 3, and 5</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
									<xsl:with-param name="ColH"/>
									<xsl:with-param name="ColI"/>
									<xsl:with-param name="ColJ"/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
					<!--Page 3 Footer -->
					<div class="styStdDiv pageEnd" style="width:256mm;">
						<span style="font-weight:bold;"/>
						<span style="margin-left:24mm;"/>
						<span style="float:right;">Form <b>3800</b> (2023)</span>
					</div>
					<!-- =============================================================================================================== -->
					<!-- ========================================== Part III Table 2 END =============================================== -->
					<!-- =============================================================================================================== -->
					<!-- =============================================================================================================== -->
					<!-- ========================================== Part IV Table 1 START ============================================== -->
					<!-- =============================================================================================================== -->
					<!-- Page 5 Header -->
					<div style="width:187mm;clear:both;padding-bottom:.5mm;" class="styNBB">
						<div style="width:90mm;" class="styGenericDiv">Form 3800 (2023)</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">5</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:2px;border-bottom-width:0px;">
						<div class="styGenericDiv" style="width:187mm;height:8mm;">
							<div class="styPartName" style="width:15mm;">Part IV</div>
							<div class="styPartDesc" style="padding-left:3mm;width:170mm;">
                Carryovers of General Business Credits (GBCs) or Eligible Small Business Credits (ESBCs)
					<span class="styNormalText"> (see instructions)</span>
							</div>
						</div>
					</div>
					<div class="styTableContainer" id="PartIVTable1Ctn" style="height:auto;display:block;border-bottom-width:2px;">
						<table class="styTable" cellspacing="0" name="PartIVTable1" id="PartIVTable1">
							<thead class="styTableThead">
								<tr style="min-height:13mm;">
									<th class="styIRS3800PartIVTableCellHeader" style="width:8mm;border-right-width:0px;" scope="col"/>
									<th class="styIRS3800PartIVTableCellHeader" style="width:63mm;" scope="col">
										<b>(a)</b>
										<br/>Credits carried over to tax year 2023 
									</th>
									<th class="styIRS3800PartIVTableCellHeader" style="width:10mm;" scope="col">
										<b>(b)</b>
										<br/>Check if non-passive
									</th>
									<th class="styIRS3800PartIVTableCellHeader" style="width:10mm;" scope="col">
										<b>(c)</b>
										<br/>Year
									</th>
									<th class="styIRS3800PartIVTableCellHeader" scope="col">
										<b>(d)</b>
										<br/>Pass-through entity EIN
									</th>
									<th class="styIRS3800PartIVTableCellHeader" scope="col">
										<b>(e)</b>
										<br/>Credit carrybacks to current year
									</th>
									<th class="styIRS3800PartIVTableCellHeader" scope="col">
										<b>(f)</b>
										<br/>Carryforwards (excluding ESBCs)
									</th>
									<th class="styIRS3800PartIVTableCellHeader" style="border-right-width:0px;" scope="col">
										<b>(g)</b>
										<br/>Eligible small business credit (ESBC) carryforwards 
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- Part IV, Line 1a -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm3468PartIICYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">1a</xsl:with-param>
									<xsl:with-param name="Dots">.....</xsl:with-param>
									<xsl:with-param name="ColA">Form 3468, Part II (coal, gasification)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 1b -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm7207CYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">b</xsl:with-param>
									<xsl:with-param name="Dots">....</xsl:with-param>
									<xsl:with-param name="ColA">Form 7207 (manufacturing production)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 1c -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm6765CYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">c</xsl:with-param>
									<xsl:with-param name="Dots">.........</xsl:with-param>
									<xsl:with-param name="ColA">Form 6765 (research)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 1d -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm3468PartIIICYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">d</xsl:with-param>
									<xsl:with-param name="Dots">....</xsl:with-param>
									<xsl:with-param name="ColA">Form 3468, Part III (advanced energy)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 1e -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8826CYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">e</xsl:with-param>
									<xsl:with-param name="Dots">.......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8826 (disabled access)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 1f -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8835PartIICYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">f</xsl:with-param>
									<xsl:with-param name="Dots">....</xsl:with-param>
									<xsl:with-param name="ColA">Form 8835, Part II (renewable electricity)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 1g -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm7210CYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">g</xsl:with-param>
									<xsl:with-param name="Dots">.......</xsl:with-param>
									<xsl:with-param name="ColA">Form 7210 (clean hydrogen)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 1h -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8820CYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">h</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 8820 (orphan drug)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 1i -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8874CYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">i</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 8874 (new markets)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 1j -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8881PartICYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">j</xsl:with-param>
									<xsl:with-param name="Dots">....</xsl:with-param>
									<xsl:with-param name="ColA">Form 8881, Part I (pension plan startup)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 1k -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8882CYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">k</xsl:with-param>
									<xsl:with-param name="Dots">....</xsl:with-param>
									<xsl:with-param name="ColA">Form 8882 (employer-provided child care)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 1l -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8864BiodieselCYCreditsGrp"/>
									<xsl:with-param name="RowNumber">l</xsl:with-param>
									<xsl:with-param name="Dots">...</xsl:with-param>
									<xsl:with-param name="ColA">Form 8864 (biodiesel and renewable diesel)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 1m -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8896CYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">m</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8896 (low sulfur diesel fuel)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 1n -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8906CYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">n</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 8906 (distilled spirits)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 1o -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm3468PartIVCYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">o</xsl:with-param>
									<xsl:with-param name="Dots">...</xsl:with-param>
									<xsl:with-param name="ColA">Form 3468, Part IV (advanced manufacturing)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 1p -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8908CYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">p</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8908 (energy-efficient home)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 1q -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath"/>
									<xsl:with-param name="RowNumber">q</xsl:with-param>
									<xsl:with-param name="Dots">.............</xsl:with-param>
									<xsl:with-param name="ColA">Reserved</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF">lightgrey</xsl:with-param>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 1r -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8910CYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">r</xsl:with-param>
									<xsl:with-param name="Dots">.....</xsl:with-param>
									<xsl:with-param name="ColA">Form 8910 (alternative motor vehicle)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 1s -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8911PartIICYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">s</xsl:with-param>
									<xsl:with-param name="Dots">...</xsl:with-param>
									<xsl:with-param name="ColA">Form 8911, Part II (alternative fuel refueling)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 1t -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8830CYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">t</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8830 (enhanced oil recovery)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 1u -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm7213PartIICYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">u</xsl:with-param>
									<xsl:with-param name="Dots">.</xsl:with-param>
									<xsl:with-param name="ColA">Form 7213, Part II (zero-emission nuclear production)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 1v -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath"/>
									<xsl:with-param name="RowNumber">v</xsl:with-param>
									<xsl:with-param name="Dots">.......</xsl:with-param>
									<xsl:with-param name="ColA">Form 3468, Part V (Reserved)</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF">lightgrey</xsl:with-param>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 1w -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8932CYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">w</xsl:with-param>
									<xsl:with-param name="Dots">.......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8932 (differential wage)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 1x -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8933CYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">x</xsl:with-param>
									<xsl:with-param name="Dots">....</xsl:with-param>
									<xsl:with-param name="ColA">Form 8933 (carbon oxide sequestration)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 1y -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8936PartIICYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">y</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8936, Part II (clean vehicle)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 1z -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath"/>
									<xsl:with-param name="RowNumber">z</xsl:with-param>
									<xsl:with-param name="Dots">.............</xsl:with-param>
									<xsl:with-param name="ColA">Reserved</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF">lightgrey</xsl:with-param>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 1aa -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8936PartVCYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">aa</xsl:with-param>
									<xsl:with-param name="Dots">...</xsl:with-param>
									<xsl:with-param name="ColA">Form 8936, Part V (commercial clean vehicle)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 1bb -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8904CYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">bb</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8904 (oil and gas production)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 1cc -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm7213PartICYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">cc</xsl:with-param>
									<xsl:with-param name="Dots">..</xsl:with-param>
									<xsl:with-param name="ColA">Form 7213, Part I (advanced nuclear production)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 1dd -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8881PartIICYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">dd</xsl:with-param>
									<xsl:with-param name="Dots">...</xsl:with-param>
									<xsl:with-param name="ColA">Form 8881, Part II (pension auto enrollment)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 1ee -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8881PartIIICYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">ee</xsl:with-param>
									<xsl:with-param name="Dots">.....</xsl:with-param>
									<xsl:with-param name="ColA">Form 8881, Part III (military spouse)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 1ff -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8864SAFCYCyovCrGrp"/>
									<xsl:with-param name="RowNumber">ff</xsl:with-param>
									<xsl:with-param name="Dots">...</xsl:with-param>
									<xsl:with-param name="ColA">Form 8864 (sustainable aviation fuel mixture)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 1gg -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath"/>
									<xsl:with-param name="RowNumber">gg</xsl:with-param>
									<xsl:with-param name="Dots">.............</xsl:with-param>
									<xsl:with-param name="ColA">Reserved</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF">lightgrey</xsl:with-param>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 1hh -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath"/>
									<xsl:with-param name="RowNumber">hh</xsl:with-param>
									<xsl:with-param name="Dots">.............</xsl:with-param>
									<xsl:with-param name="ColA">Reserved</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF">lightgrey</xsl:with-param>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 1ii -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath"/>
									<xsl:with-param name="RowNumber">ii</xsl:with-param>
									<xsl:with-param name="Dots">.............</xsl:with-param>
									<xsl:with-param name="ColA">Reserved</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF">lightgrey</xsl:with-param>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 1jj -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath"/>
									<xsl:with-param name="RowNumber">jj</xsl:with-param>
									<xsl:with-param name="Dots">.............</xsl:with-param>
									<xsl:with-param name="ColA">Reserved</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF">lightgrey</xsl:with-param>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 1zz -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/CYCyovOtherBusCreditsGrp"/>
									<xsl:with-param name="RowNumber">zz</xsl:with-param>
									<xsl:with-param name="Dots">..............</xsl:with-param>
									<xsl:with-param name="ColA">Other</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2 -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath"/>
									<xsl:with-param name="RowNumber">2</xsl:with-param>
									<xsl:with-param name="Dots"/>
									<xsl:with-param name="ColA">Credits for which only carryforwards are allowed:</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF">lightgrey</xsl:with-param>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 2a -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm5884ACYCfwdAllwCrGrp"/>
									<xsl:with-param name="RowNumber">a</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 5884-A (employee retention)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2b -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8586CYCfwdAllwCrGrp"/>
									<xsl:with-param name="RowNumber">b</xsl:with-param>
									<xsl:with-param name="Dots">...</xsl:with-param>
									<xsl:with-param name="ColA">Form 8586 (low-income housing)(pre-2008)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2c -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8845CYCfwdAllwCrGrp"/>
									<xsl:with-param name="RowNumber">c</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8845 (Indian employment)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2d -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8907CYCfwdAllwCrGrp"/>
									<xsl:with-param name="RowNumber">d</xsl:with-param>
									<xsl:with-param name="Dots">....</xsl:with-param>
									<xsl:with-param name="ColA">Form 8907 (nonconventional source fuel)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2e -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8909CYCfwdAllwCrGrp"/>
									<xsl:with-param name="RowNumber">e</xsl:with-param>
									<xsl:with-param name="Dots">....</xsl:with-param>
									<xsl:with-param name="ColA">Form 8909 (energy efficient appliance)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2f  -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8923CYCfwdAllwCrGrp"/>
									<xsl:with-param name="RowNumber">f</xsl:with-param>
									<xsl:with-param name="Dots">....</xsl:with-param>
									<xsl:with-param name="ColA">Form 8923 (mine rescue team training)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2g  -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8834PartICYCfwdAllwCrGrp"/>
									<xsl:with-param name="RowNumber">g</xsl:with-param>
									<xsl:with-param name="Dots">...</xsl:with-param>
									<xsl:with-param name="ColA">Form 8834 (qualified plug-in electric vehicle)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2h -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8931CYCfwdAllwCrGrp"/>
									<xsl:with-param name="RowNumber">h</xsl:with-param>
									<xsl:with-param name="Dots">...</xsl:with-param>
									<xsl:with-param name="ColA">Form 8931 (agricultural chemicals security)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2i  -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm1065BCYCfwdAllwCrGrp"/>
									<xsl:with-param name="RowNumber">i</xsl:with-param>
									<xsl:with-param name="Dots">...</xsl:with-param>
									<xsl:with-param name="ColA">Form 1065-B (GBCs from electing partnership)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2j -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm5884CYCfwdAllwCrGrp"/>
									<xsl:with-param name="RowNumber">j</xsl:with-param>
									<xsl:with-param name="Dots">....</xsl:with-param>
									<xsl:with-param name="ColA">Form 5884 (work opportunity pre-2007)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2k -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm6478CYCfwdAllwCrGrp"/>
									<xsl:with-param name="RowNumber">k</xsl:with-param>
									<xsl:with-param name="Dots">.....</xsl:with-param>
									<xsl:with-param name="ColA">Form 6478 (alcohol fuel pre-2005)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2l -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8846CYCfwdAllwCrGrp"/>
									<xsl:with-param name="RowNumber">l</xsl:with-param>
									<xsl:with-param name="Dots">....</xsl:with-param>
									<xsl:with-param name="ColA">Form 8846 (employer taxes pre-2007)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
					<!--Page 5 Footer -->
					<div class="styStdDiv pageEnd" style="width:187mm;">
						<span style="font-weight:bold;"/>
						<span style="margin-left:24mm;"/>
						<span style="float:right;">Form <b>3800</b> (2023)</span>
					</div>
					<!-- =============================================================================================================== -->
					<!-- ========================================== Part IV Table 1 START ============================================== -->
					<!-- =============================================================================================================== -->
					<!-- Page 6 Header -->
					<div style="width:187mm;clear:both;padding-bottom:.5mm;" class="styNBB">
						<div style="width:90mm;" class="styGenericDiv">Form 3800 (2023)</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">6</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:2px;border-bottom-width:0px;">
						<div class="styGenericDiv" style="width:187mm;height:8mm;">
							<div class="styPartName" style="width:15mm;">Part IV</div>
							<div class="styPartDesc" style="padding-left:3mm;width:170mm;">
                Carryovers of General Business Credits (GBCs) or Eligible Small Business Credits (ESBCs)
					<span class="styNormalText"> (see instructions) <i> (continued) </i>
								</span>
							</div>
						</div>
					</div>
					<div class="styTableContainer" id="PartIVTable2Ctn" style="height:auto;display:block;border-bottom-width:2px;">
						<table class="styTable" cellspacing="0" name="PartIVTable2" id="PartIVTable2">
							<thead class="styTableThead">
								<tr style="min-height:13mm;">
									<th class="styIRS3800PartIVTableCellHeader" style="width:8mm;border-right-width:0px;" scope="col"/>
									<th class="styIRS3800PartIVTableCellHeader" style="width:63mm;" scope="col">
										<b>(a)</b>
										<br/>Credits carried over to tax year 2023 
									</th>
									<th class="styIRS3800PartIVTableCellHeader" style="width:10mm;" scope="col">
										<b>(b)</b>
										<br/>Check if non-passive
									</th>
									<th class="styIRS3800PartIVTableCellHeader" style="width:10mm;" scope="col">
										<b>(c)</b>
										<br/>Year
									</th>
									<th class="styIRS3800PartIVTableCellHeader" scope="col">
										<b>(d)</b>
										<br/>Pass-through entity EIN
									</th>
									<th class="styIRS3800PartIVTableCellHeader" scope="col">
										<b>(e)</b>
										<br/>Credit carrybacks to current year
									</th>
									<th class="styIRS3800PartIVTableCellHeader" scope="col">
										<b>(f)</b>
										<br/>Carryforwards (excluding ESBCs)
									</th>
									<th class="styIRS3800PartIVTableCellHeader" style="border-right-width:0px;" scope="col">
										<b>(g)</b>
										<br/>Eligible small business credit (ESBC) carryforwards 
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- Part IV Line 2m -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8900CYCfwdAllwCrGrp"/>
									<xsl:with-param name="RowNumber">m</xsl:with-param>
									<xsl:with-param name="Dots">..</xsl:with-param>
									<xsl:with-param name="ColA">Form 8900 (railroad track maintenance pre-2008)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2n -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/CYCfwdAllwCrTransAKPipelineGrp"/>
									<xsl:with-param name="RowNumber">n</xsl:with-param>
									<xsl:with-param name="Dots">....</xsl:with-param>
									<xsl:with-param name="ColA">Trans-Alaska pipeline liability fund credit</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2o -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/CYCfwdAllwCrEmplrAffctHrrcnGrp"/>
									<xsl:with-param name="RowNumber">o</xsl:with-param>
									<xsl:with-param name="Dots">.........</xsl:with-param>
									<xsl:with-param name="ColA">Form 5884-A, Section A (employers affected by
Hurricane Katrina, Rita, or Wilma)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2p -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/CYCfwdAllwCrHrrcnKtrnHsngGrp"/>
									<xsl:with-param name="RowNumber">p</xsl:with-param>
									<xsl:with-param name="Dots">.</xsl:with-param>
									<xsl:with-param name="ColA">Form 5884-A, Section B (Hurricane Katrina housing)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2q -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/CYCfwdAllwCrMwdDsstrEmplrGrp"/>
									<xsl:with-param name="RowNumber">q</xsl:with-param>
									<xsl:with-param name="Dots">...........</xsl:with-param>
									<xsl:with-param name="ColA">Form 5884-A, Section A (affected Midwestern disaster
area employers)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2r -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/CYCfwdAllwCrEmplrHsngGrp"/>
									<xsl:with-param name="RowNumber">r</xsl:with-param>
									<xsl:with-param name="Dots">...</xsl:with-param>
									<xsl:with-param name="ColA">Form 5884-A, Section B (employer housing)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2s -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm5884BCYCfwdAllwCrGrp"/>
									<xsl:with-param name="RowNumber">s</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 5884-B (new hire retention)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2t -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8847CYCfwdAllwCrGrp"/>
									<xsl:with-param name="RowNumber">t</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 8847 (contributions to selected community
development corporations)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2u -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8861CYCfwdAllwCrGrp"/>
									<xsl:with-param name="RowNumber">u</xsl:with-param>
									<xsl:with-param name="Dots">.......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8861 (welfare to work)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2v -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8884CYCfwdAllwCrGrp"/>
									<xsl:with-param name="RowNumber">v</xsl:with-param>
									<xsl:with-param name="Dots"/>
									<xsl:with-param name="ColA">Form 8884 (New York Liberty Zone business employee)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2w -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8942CYCfwdAllwCrGrp"/>
									<xsl:with-param name="RowNumber">w</xsl:with-param>
									<xsl:with-param name="Dots">.......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8942 (therapeutic drug)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2yy -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/CYCfwdAllwOtherBusCreditsGrp"/>
									<xsl:with-param name="RowNumber">yy</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">yy Other credits (see instructions)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 2zz -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/CYCyovCfwdGBCSubTotGrp"/>
									<xsl:with-param name="RowNumber">zz</xsl:with-param>
									<xsl:with-param name="Dots">...</xsl:with-param>
									<xsl:with-param name="ColA">Add lines 1a through 1zz and 2a through 2yy</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 3 -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8844CYCrovCrGrp"/>
									<xsl:with-param name="RowNumber">3</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8844 (empowerment zone)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 4 -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath"/>
									<xsl:with-param name="RowNumber">4</xsl:with-param>
									<xsl:with-param name="Dots"/>
									<xsl:with-param name="ColA">Specified credits:</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF">lightgrey</xsl:with-param>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 4a -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm3468PartVICYSpcfdCrGrp"/>
									<xsl:with-param name="RowNumber">a</xsl:with-param>
									<xsl:with-param name="Dots">........</xsl:with-param>
									<xsl:with-param name="ColA">Form 3468, Part VI (energy)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 4b -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm5884CYSpcfdCrGrp"/>
									<xsl:with-param name="RowNumber">b</xsl:with-param>
									<xsl:with-param name="Dots">.......</xsl:with-param>
									<xsl:with-param name="ColA">Form 5884 (work opportunity)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 4c -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm6478CYSpcfdCrGrp"/>
									<xsl:with-param name="RowNumber">c</xsl:with-param>
									<xsl:with-param name="Dots">.......</xsl:with-param>
									<xsl:with-param name="ColA">Form 6478 (biofuel producer)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 4d -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8586CYSpcfdCrGrp"/>
									<xsl:with-param name="RowNumber">d</xsl:with-param>
									<xsl:with-param name="Dots">..</xsl:with-param>
									<xsl:with-param name="ColA">Form 8586 (low-income housing)(post-2007)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 4e -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8835CYSpcfdCrGrp"/>
									<xsl:with-param name="RowNumber">e</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8835 (renewable electricity)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 4f -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8846CYSpcfdCrGrp"/>
									<xsl:with-param name="RowNumber">f</xsl:with-param>
									<xsl:with-param name="Dots">.......</xsl:with-param>
									<xsl:with-param name="ColA">Form 8846 (employer taxes)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 4g -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8900CYSpcfdCrGrp"/>
									<xsl:with-param name="RowNumber">g</xsl:with-param>
									<xsl:with-param name="Dots">....</xsl:with-param>
									<xsl:with-param name="ColA">Form 8900 (railroad track maintenance)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 4h -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8941CYSpcfdCrGrp"/>
									<xsl:with-param name="RowNumber">h</xsl:with-param>
									<xsl:with-param name="Dots">....</xsl:with-param>
									<xsl:with-param name="ColA">Form 8941 (employer health insurance)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 4i -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm6765ESBCYSpcfdCrGrp"/>
									<xsl:with-param name="RowNumber">i</xsl:with-param>
									<xsl:with-param name="Dots">......</xsl:with-param>
									<xsl:with-param name="ColA">Form 6765 ESB credit (research)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 4j -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm8994CYSpcfdCrGrp"/>
									<xsl:with-param name="RowNumber">j</xsl:with-param>
									<xsl:with-param name="Dots">....</xsl:with-param>
									<xsl:with-param name="ColA">Form 8994 (paid family and medical leave)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 4k -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/Frm3468PartVIICYSpcfdCrGrp"/>
									<xsl:with-param name="RowNumber">k</xsl:with-param>
									<xsl:with-param name="Dots">..</xsl:with-param>
									<xsl:with-param name="ColA">Form 3468, Part VII (rehabilitation)(post-2007)</xsl:with-param>
									<xsl:with-param name="ColB"/>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 4l -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath"/>
									<xsl:with-param name="RowNumber">l</xsl:with-param>
									<xsl:with-param name="Dots">............</xsl:with-param>
									<xsl:with-param name="ColA">Reserved (4l)</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF">lightgrey</xsl:with-param>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 4m -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath"/>
									<xsl:with-param name="RowNumber">m</xsl:with-param>
									<xsl:with-param name="Dots">...........</xsl:with-param>
									<xsl:with-param name="ColA">Reserved (4m)</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE">lightgrey</xsl:with-param>
									<xsl:with-param name="ColF">lightgrey</xsl:with-param>
									<xsl:with-param name="ColG">lightgrey</xsl:with-param>
								</xsl:call-template>
								<!-- Part IV Line 4z -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/CYOtherSpcfdCreditsGrp"/>
									<xsl:with-param name="RowNumber">z</xsl:with-param>
									<xsl:with-param name="Dots">.........</xsl:with-param>
									<xsl:with-param name="ColA">Other specified credits</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC"/>
									<xsl:with-param name="ColD"/>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 5 -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/CYOtherSpcfdCreditsSubTotGrp"/>
									<xsl:with-param name="RowNumber">5</xsl:with-param>
									<xsl:with-param name="Dots">.........</xsl:with-param>
									<xsl:with-param name="ColA">Add lines 4a through 4z</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
								<!-- Part IV Line 6 -->
								<xsl:call-template name="Part4TableRows">
									<xsl:with-param name="GroupPath" select="$Form3800Data/TotCYGBCOrESBCAmtGrp"/>
									<xsl:with-param name="RowNumber">6</xsl:with-param>
									<xsl:with-param name="Dots">.........</xsl:with-param>
									<xsl:with-param name="ColA">Add lines 2zz, 3, and 5</xsl:with-param>
									<xsl:with-param name="ColB">lightgrey</xsl:with-param>
									<xsl:with-param name="ColC">lightgrey</xsl:with-param>
									<xsl:with-param name="ColD">lightgrey</xsl:with-param>
									<xsl:with-param name="ColE"/>
									<xsl:with-param name="ColF"/>
									<xsl:with-param name="ColG"/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
					<!--Page 5 Footer -->
					<div class="styStdDiv pageEnd" style="width:187mm;">
						<span style="font-weight:bold;"/>
						<span style="margin-left:24mm;"/>
						<span style="float:right;">Form <b>3800</b> (2023)</span>
					</div>
					<!-- =============================================================================================================== -->
					<!-- ========================================== Part IV Table 1 END ================================================ -->
					<!-- =============================================================================================================== -->
					<!-- =============================================================================================================== -->
					<!-- ===============================================Part V START =================================================== -->
					<!-- =============================================================================================================== -->
					<!-- Page 7 Header -->
					<div style="width:256mm;clear:both;padding-bottom:.5mm;" class="styNBB">
						<div style="width:90mm;" class="styGenericDiv">Form 3800 (2023)</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">7</span>
						</div>
					</div>
					<xsl:variable name="PartVGroups" select="$Form3800Data/GBCBreakdownCYAggrgtAmtGrp/*[contains(name(),'Grp')]"/>
					<xsl:variable name="PartVGroupCount" select="count($PartVGroups)"/>
					<div class="styBB" style="width:256mm;border-top-width:2px;">
						<div class="styGenericDiv" style="width:256mm;">
							<div class="styPartName" style="width:15mm;">Part V</div>
							<div class="styPartDesc" style="padding-left:3mm;width:200mm;">
							Breakdown of Aggregate Amounts on Part III for Facility-by-Facility, Multiple Pass-Through Entities, etc.
							<span class="styNormalText"> (see instructions)</span>
							</div>
							<div style="float:right;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form3800Data/GBCBreakdownCYAggrgtAmtGrp/*[contains(name(),'Grp')]"/>
									<xsl:with-param name="containerHeight" select="38"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'PartVTableCtn' "/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styTableContainerLandscape" style="height:auto;display:block;" id="PartVTableCtn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" cellspacing="0" name="PartVTable" id="PartVTable">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS3800PartVTableCellHeader" style="width:12mm;border-bottom:none;"/>
									<th class="styIRS3800PartVTableCellHeader" scope="col">
										<b>(a)</b>
										<br/> Line number from Part III
									</th>
									<th class="styIRS3800PartVTableCellHeader" scope="col" style="width:36mm;">
										<b>(b)</b>
										<br/> Elective payment or transfer registration number
									</th>
									<th class="styIRS3800PartVTableCellHeader" scope="col">
										<b>(c)</b>
										<br/> Pass-through or transfer credit entity EIN
									</th>
									<th class="styIRS3800PartVTableCellHeader" scope="col">
										<b>(d)</b>
										<br/> Current year credits from non-passive activities
									</th>
									<th class="styIRS3800PartVTableCellHeader" scope="col">
										<b>(e)</b>
										<br/> Current year credits from passive activity before passive activity credit limitation
									</th>
									<th class="styIRS3800PartVTableCellHeader" scope="col">
										<b>(f)</b>
										<br/> Credit transfer election amount
									</th>
									<th class="styIRS3800PartVTableCellHeader" scope="col">
										<b>(g)</b>
										<br/> Gross elective payment election amount
									</th>
									<th class="styIRS3800PartVTableCellHeader" scope="col">
										<b>(h)</b>
										<br/> Net elective payment election amount
									</th>
									<th class="styIRS3800PartVTableCellHeader" scope="col" style="border-right-width:0px;">
										<b>(i)</b>
										<br/> Carryover of passive activity credit allowable in current year
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="($Print != $Separated) or	(($Print = $Separated) and ($PartVGroupCount &lt;=38))">
									<xsl:for-each select="$Form3800Data/GBCBreakdownCYAggrgtAmtGrp/*[contains(name(),'Grp')]">
										<tr style="min-height:4mm;">
											<td class="styTableCell" style="width:12mm;vertical-align:top;text-align:right;padding-right:5mm;border-bottom:none;">
												<xsl:if test="position() = last() and position() &gt;= 38">
													<xsl:attribute name="style">width:12mm;vertical-align:top;text-align:right;padding-right:5mm;</xsl:attribute>
												</xsl:if>
												<b>
													<xsl:value-of select="position()"/>
												</b>
											</td>
											<td class="styIRS3800PartVTableCell">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="@lineNumberTxt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS3800PartVTableCell" style="width:36mm;">
												<xsl:choose>
													<xsl:when test="ElectivePaymentRegistrationNum">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ElectivePaymentRegistrationNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="TransferRegistrationNum"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styIRS3800PartVTableCell" style="text-align:center;">
												<xsl:choose>
													<xsl:when test="PassThroughEntityEIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="PassThroughEntityEIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:if test="TransferCreditEntityEIN">
													<br/>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="TransferCreditEntityEIN"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styIRS3800PartVTableAmountCell">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GeneralBusCrFromNnPssvActyAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS3800PartVTableAmountCell">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PassiveActivityCrBeforeLmtAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS3800PartVTableAmountCell">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CreditTransferElectionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS3800PartVTableAmountCell">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="GrossElectivePymtElectionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS3800PartVTableAmountCell">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NetElectivePymtElectionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styIRS3800PartVTableAmountCell" style="border-right-width:0px;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="PYPssvActivityCrAllwblCYAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="($PartVGroupCount &lt; 38)">
									<xsl:call-template name="PartVBlankRows">
										<xsl:with-param name="numRows" select="38 - $PartVGroupCount"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="($Print = $Separated) and ($PartVGroupCount &gt; 38)">
									<xsl:call-template name="PartVBlankRows">
										<xsl:with-param name="numRows" select="38"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form3800Data/GBCBreakdownCYAggrgtAmtGrp/*[contains(name(),'Grp')]"/>
						<xsl:with-param name="containerHeight" select="38"/>
						<xsl:with-param name="headerHeight" select="1"/>
						<xsl:with-param name="containerID" select=" 'PartVTableCtn' "/>
					</xsl:call-template>
					<!--Page 7 Footer -->
					<div class="styStdDiv pageEnd" style="width:256mm;">
						<span style="font-weight:bold;"/>
						<span style="margin-left:24mm;"/>
						<span style="float:right;">Form <b>3800</b> (2023)</span>
					</div>
					<!-- =============================================================================================================== -->
					<!-- ===============================================Part V END ===================================================== -->
					<!-- =============================================================================================================== -->
					<!-- =============================================================================================================== -->
					<!-- ===============================================Part 6 START =================================================== -->
					<!-- =============================================================================================================== -->
					<xsl:variable name="PartVIGroups" select="$Form3800Data/*[contains(name(),'AggrgtGrp') or contains(name(),'AggrgGrp')]"/>
					<xsl:variable name="PartVIGroupCount" select="count($PartVIGroups)"/>
					<!-- Page 5 Header -->
					<div style="width:187mm;clear:both;padding-bottom:.5mm;" class="styNBB">
						<div style="width:90mm;" class="styGenericDiv">Form 3800 (2023)</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">8</span>
						</div>
					</div>
					<!-- Begin Part VI - Breakdown of Aggregate Amounts in Part IV -->
					<div style="width:187mm;border-top-width:2px;" class="styBB">
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styPartName" style="width:15mm;">Part VI</div>
							<div class="styPartDesc" style="padding-left:3mm;width:100mm;">
                Breakdown of Aggregate Amounts in Part IV <span class="styNormalText"> (see instructions)</span>
							</div>
							<div style="float:right;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form3800Data/*[contains(name(),'AggrgtGrp') or contains(name(),'AggrgGrp')]"/>
									<xsl:with-param name="containerHeight" select="50"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'PartVITableCtn' "/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styTableContainer" style="height:auto;display:block;" id="PartVITableCtn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" cellspacing="0" name="PartVITable" id="PartVITable">
							<thead class="styTableThead">
								<tr style="min-height:13mm;">
									<th class="styTableCellHeader" style="width:12mm;border:none;" scope="col"/>
									<th class="styTableCellHeader" style="width:32mm;" scope="col">
										(a)<br/>Line number <br/> from Part IV 
									</th>
									<th class="styTableCellHeader" style="width:15mm;" scope="col">
										(b)<br/>Check if non-passive
									</th>
									<th class="styTableCellHeader" style="width:15mm;" scope="col">
										(c)<br/>Year
									</th>
									<th class="styTableCellHeader" style="width:26mm;" scope="col">
										(d)<br/>Pass-through entity EIN
									</th>
									<th class="styTableCellHeader" style="width:28mm;" scope="col">
										(e)<br/>Credit carrybacks to current year
									</th>
									<th class="styTableCellHeader" style="width:28mm;" scope="col">
										(f)<br/>Carryforwards (excluding ESBCs)
									</th>
									<th class="styTableCellHeader" style="width:31mm;border-right-width:0px;" scope="col">
										(g)<br/>Eligible small business credit (ESBC) carryforwards 
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or	(($Print = $Separated) and (count($Form3800Data/Frm3468PartIICYCyovCrAggrgtGrp) &gt;50)) ">
									<xsl:for-each select="$Form3800Data/*[contains(name(),'AggrgtGrp')]">
										<tr style="min-height:4mm;">
											<td class="styTableCell" style="width:12mm;vertical-align:top;text-align:right;padding-right:5mm;border:none;">
												<xsl:if test="position() = last() and position() &gt;= 50">
													<xsl:attribute name="style">width:12mm;vertical-align:top;text-align:right;padding-right:5mm;border-width:0px 0px 1px 0px;</xsl:attribute>
												</xsl:if>
												<span style="font-weight:bold;text-align:right;">
													<xsl:value-of select="position()"/>
												</span>
											</td>
											<td class="styTableCell" style="width:32mm;vertical-align:top;text-align:left;">
												<xsl:if test="position() = last() and position() &gt;= 50">
													<xsl:attribute name="style">width:32mm;vertical-align:top;text-align:left;border-bottom-width:1px;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="./@lineNumberTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;vertical-align:middle;">
												<xsl:if test="position() = last() and position() &gt; 50">
													<xsl:attribute name="style">width:15mm;text-align:center;vertical-align:middle;border-bottom-width:1px;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NonpassiveInd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;vertical-align:middle;">
												<xsl:if test="position() = last() and position() &gt; 50">
													<xsl:attribute name="style">width:15mm;text-align:center;vertical-align:middle;border-bottom-width:1px;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Yr"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:26mm;text-align:center;vertical-align:middle;">
												<xsl:if test="position() = last() and position() &gt; 50">
													<xsl:attribute name="style">width:26mm;text-align:center;vertical-align:middle;border-bottom-width:1px; </xsl:attribute>
												</xsl:if>
												<xsl:choose>
													<xsl:when test="PassThroughEntityEIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="PassThroughEntityEIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCell" style="width:28mm;">
												<xsl:if test="position() = last() and position() &gt;50">
													<xsl:attribute name="style">width:28mm;border-bottom-width:1px; </xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CarryBackGeneralBusinessCrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:28mm;">
												<xsl:if test="position() = last() and position() &gt;50">
													<xsl:attribute name="style">width:28mm;border-bottom-width:1px; </xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CYGeneralBusCrCarryforwardAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="border-right-width:0px;">
												<xsl:if test="position() = last() and position() &gt;50">
													<xsl:attribute name="style">border-right-width:0px;border-bottom-width:1px; </xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ESBCCarryforwardAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="($PartVIGroupCount &lt; 50)">
									<xsl:call-template name="PartVIBlankRows">
										<xsl:with-param name="numRows" select="50 - $PartVIGroupCount"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="($Print = $Separated) and ($PartVIGroupCount &gt; 50)">
									<xsl:call-template name="PartVIBlankRows">
										<xsl:with-param name="numRows" select="50"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form3800Data/*[contains(name(),'AggrgtGrp') or contains(name(),'AggrgGrp')]"/>
						<xsl:with-param name="containerHeight" select="50"/>
						<xsl:with-param name="headerHeight" select="1"/>
						<xsl:with-param name="containerID" select=" 'PartVITableCtn' "/>
					</xsl:call-template>
					<!--Page 8 Footer -->
					<div class="styStdDiv pageEnd" style="width:187mm;">
						<span style="font-weight:bold;"/>
						<span style="margin-left:24mm;"/>
						<span style="float:right;">Form <b>3800</b> (2023)</span>
					</div>
					<!-- =============================================================================================================== -->
					<!-- ===============================================Part 6 END ===================================================== -->
					<!-- =============================================================================================================== -->
					<div class="styGenericDiv" style="width:187mm;clear:all;">
						<!--ADDITIONAL DATA SECTION-->
						<div class="styLeftOverTitleLine" id="LeftoverData">
							<div class="styLeftOverTitle">
        Additional Data      
      </div>
							<div class="styLeftOverButtonContainer">
								<input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
							</div>
						</div>
						<table class="styLeftOverTbl">
							<xsl:call-template name="PopulateCommonLeftover">
								<xsl:with-param name="TargetNode" select="$Form3800Data"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Line 17 - sec383 or sec384 Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form3800Data/SmllrCYNotAllwTMTOrTotAdjAmt/@section383Or384IndicatorCd"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
						</table>
						<!-- =============================================================================================================== -->
						<!-- ============================================ Part V SRD Table ================================================= -->
						<!-- =============================================================================================================== -->
						<xsl:if test="($Print = $Separated) and ($PartVGroupCount &gt; 38)">
							<div class="styGenericDiv" style="width:256mm;font-size:8pt;font-weight:bold;padding-top:4mm;padding-bottom:1mm;">
								Part V - Breakdown of Aggregate Amounts on Part III for Facility-by-Facility, Multiple Pass-Through Entities, etc.
							</div>
							<table class="styDepTblLandscape" cellspacing="0" name="PartVSRDTable" id="PartVSRDTable">
								<thead class="styTableThead">
									<tr class="styDepTblHdr" style="font-size:7pt;">
										<th class="styDepTblCell" style="width:12mm;"/>
										<th class="styDepTblCell" scope="col" style="vertical-align:middle;">
											<b>(a)</b>
											<br/> Line number from Part III
									</th>
										<th class="styDepTblCell" scope="col" style="width:36mm;vertical-align:middle;">
											<b>(b)</b>
											<br/> Elective payment or transfer registration number
									</th>
										<th class="styDepTblCell" scope="col" style="width:26mm;vertical-align:middle;">
											<b>(c)</b>
											<br/> Pass-through or transfer credit entity EIN
									</th>
										<th class="styDepTblCell" scope="col" style="width:26mm;vertical-align:middle;">
											<b>(d)</b>
											<br/> Current year credits from non-passive activities
									</th>
										<th class="styDepTblCell" scope="col" style="width:26mm;vertical-align:middle;">
											<b>(e)</b>
											<br/> Current year credits from passive activity before passive activity credit limitation
									</th>
										<th class="styDepTblCell" scope="col" style="width:26mm;vertical-align:middle;">
											<b>(f)</b>
											<br/> Credit transfer election amount
									</th>
										<th class="styDepTblCell" scope="col" style="width:26mm;vertical-align:middle;">
											<b>(g)</b>
											<br/> Gross elective payment election amount
									</th>
										<th class="styDepTblCell" scope="col" style="width:26mm;vertical-align:middle;">
											<b>(h)</b>
											<br/> Net elective payment election amount
									</th>
										<th class="styDepTblCell" scope="col" style="width:26mm;vertical-align:middle;">
											<b>(i)</b>
											<br/> Carryover of passive activity credit allowable in current year
									</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="$Form3800Data/GBCBreakdownCYAggrgtAmtGrp/*[contains(name(),'Grp')]">
										<tr style="font-size:7pt;">
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styDepTblCell" style="width:12mm;text-align:right;padding-right:3mm;">
												<b>
													<xsl:value-of select="position()"/>
												</b>
											</td>
											<td class="styDepTblCell" style="text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="@lineNumberTxt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="width:36mm;text-align:left;">
												<xsl:choose>
													<xsl:when test="ElectivePaymentRegistrationNum">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ElectivePaymentRegistrationNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="TransferRegistrationNum"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styDepTblCell">
												<xsl:choose>
													<xsl:when test="PassThroughEntityEIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="PassThroughEntityEIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:if test="TransferCreditEntityEIN">
													<br/>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="TransferCreditEntityEIN"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GeneralBusCrFromNnPssvActyAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PassiveActivityCrBeforeLmtAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CreditTransferElectionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GrossElectivePymtElectionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NetElectivePymtElectionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PYPssvActivityCrAllwblCYAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<br/>
							<br/>
						</xsl:if>
						<!-- =============================================================================================================== -->
						<!-- ============================================ Part VI SRD Table ================================================ -->
						<!-- =============================================================================================================== -->
						<xsl:if test="($Print = $Separated) and ($PartVIGroupCount &gt; 50)">
							<div class="styStdDiv pageEnd"/>
							<div class="styGenericDiv" style="width:187mm;font-size:8pt;font-weight:bold;padding-bottom:1mm;">
								Part VI - Breakdown of Aggregate Amounts in Part IV
							</div>
							<table class="styDepTbl" cellspacing="0" name="PartVISRDTable" id="PartVISRDTable">
								<thead class="styTableThead">
									<tr class="styDepTblHdr" style="font-size:7pt;">
										<th class="styDepTblCell" style="width:12mm;" scope="col"/>
										<th class="styDepTblCell" style="width:32mm;vertical-align:middle;" scope="col">
										(a)<br/>Line number <br/> from Part IV 
									</th>
										<th class="styDepTblCell" style="width:15mm;vertical-align:middle;" scope="col">
										(b)<br/>Check if non-passive
									</th>
										<th class="styDepTblCell" style="width:15mm;vertical-align:middle;" scope="col">
										(c)<br/>Year
									</th>
										<th class="styDepTblCell" style="width:26mm;vertical-align:middle;" scope="col">
										(d)<br/>Pass-through entity EIN
									</th>
										<th class="styDepTblCell" style="width:28mm;vertical-align:middle;" scope="col">
										(e)<br/>Credit carrybacks to current year
									</th>
										<th class="styDepTblCell" style="width:28mm;vertical-align:middle;" scope="col">
										(f)<br/>Carryforwards (excluding ESBCs)
									</th>
										<th class="styDepTblCell" style="width:31mm;border-right-width:0px;vertical-align:middle;" scope="col">
										(g)<br/>Eligible small business credit (ESBC) carryforwards 
									</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="$Form3800Data/*[contains(name(),'AggrgtGrp')]">
										<tr style="font-size:7pt;">
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styDepTblCell" style="width:12mm;vertical-align:top;text-align:right;padding-right:5mm;">
												<span style="font-weight:bold;text-align:right;">
													<xsl:value-of select="position()"/>
												</span>
											</td>
											<td class="styDepTblCell" style="width:32mm;vertical-align:top;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="./@lineNumberTxt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="width:15mm;text-align:center;vertical-align:middle;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NonpassiveInd"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="width:15mm;text-align:center;vertical-align:middle;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Yr"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="width:26mm;text-align:center;vertical-align:middle;">
												<xsl:choose>
													<xsl:when test="PassThroughEntityEIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="PassThroughEntityEIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styDepTblCell" style="width:28mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CarryBackGeneralBusinessCrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="width:28mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CYGeneralBusCrCarryforwardAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="width:28mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ESBCCarryforwardAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<br/>
							<br/>
						</xsl:if>
					</div>
				</form>
			</body>
		</html>
	</xsl:template>
	<!-- Template for Part III - Table-->
	<xsl:template name="Part3TableRows">
		<xsl:param name="GroupPath"/>
		<xsl:param name="RowNumber"/>
		<xsl:param name="Dots"/>
		<xsl:param name="ColA"/>
		<xsl:param name="ColB"/>
		<xsl:param name="ColC"/>
		<xsl:param name="ColD"/>
		<xsl:param name="ColE"/>
		<xsl:param name="ColF"/>
		<xsl:param name="ColG"/>
		<xsl:param name="ColH"/>
		<xsl:param name="ColI"/>
		<xsl:param name="ColJ"/>
		<tr style="min-height:4mm;">
			<td class="styLNLeftNumBox" style="width:8mm;padding-left:2.5mm;">
				<xsl:if test="contains($RowNumber,'1') or contains($RowNumber,'2') or contains($RowNumber,'3') or
						 contains($RowNumber,'4') or contains($RowNumber,'5') or contains($RowNumber,'6') or 
						 contains($RowNumber,'7') or contains($RowNumber,'8') or contains($RowNumber,'9')">
					<xsl:attribute name="style">width:8mm;padding-left:1mm;</xsl:attribute>
				</xsl:if>
				<xsl:if test="(($RowNumber ='2') or ($RowNumber ='6'))">
					<xsl:attribute name="style">width:8mm;padding-left:1mm;border-bottom:1px solid black;</xsl:attribute>
				</xsl:if>
				<b>
					<xsl:value-of select="$RowNumber"/>
				</b>
			</td>
			<!-- Column (a) -->
			<td class="styIRS3800PartIIITableCell" style="width:50mm;text-align:left;vertical-align:top;">
				<xsl:if test="$RowNumber ='4'">
					<xsl:attribute name="style">text-align:left;width:50mm;vertical-align:top;font-weight:bold;</xsl:attribute>
				</xsl:if>
				<xsl:value-of select="$ColA"/>
				<xsl:if test="$GroupPath != ''">
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$GroupPath"/>
					</xsl:call-template>
				</xsl:if>
				<span class="styDotLn" style="float:right;">
					<xsl:value-of select="$Dots"/>
				</span>
			</td>
			<!-- Column (b) -->
			<td class="styIRS3800PartIIITableCell" style="width:24mm;text-align:left; vertical-align:top;">
				<xsl:choose>
					<xsl:when test="$ColB ='lightgrey'">
						<xsl:attribute name="style">width:24mm;background-color:lightgrey;</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="$GroupPath/TransferRegistrationNum != ''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$GroupPath/TransferRegistrationNum"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$GroupPath/ElectivePaymentRegistrationNum"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<!-- Column (c) -->
			<td class="styIRS3800PartIIITableCell" style="width:8mm;text-align:center;vertical-align:top;">
				<xsl:choose>
					<xsl:when test="$ColC ='lightgrey'">
						<xsl:attribute name="style">width:8mm;background-color:lightgrey;</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$GroupPath/CYGeneralBusinessCrItemCnt"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<!-- Column (d) -->
			<td class="styIRS3800PartIIITableCell" style="text-align:center;">
				<xsl:choose>
					<xsl:when test="$ColD ='lightgrey'">
						<xsl:attribute name="style">background-color:lightgrey;</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="$GroupPath/PassThroughEntityEIN">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$GroupPath/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$GroupPath/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:if test="$GroupPath/TransferCreditEntityEIN">
							<br/>
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$GroupPath/TransferCreditEntityEIN"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<!-- Column (e) -->
			<td class="styIRS3800PartIIITableCell">
				<xsl:choose>
					<xsl:when test="$ColE ='lightgrey'">
						<xsl:attribute name="style">background-color:lightgrey;</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$GroupPath/GeneralBusCrFromNnPssvActyAmt"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<!-- Column (f) -->
			<td class="styIRS3800PartIIITableCell">
				<xsl:choose>
					<xsl:when test="$ColF ='lightgrey'">
						<xsl:attribute name="style">background-color:lightgrey;</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$GroupPath/CYAndPYPassiveActyCrAllwCYAmt"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<!-- Column (g) -->
			<td class="styIRS3800PartIIITableCell">
				<xsl:choose>
					<xsl:when test="$ColG ='lightgrey'">
						<xsl:attribute name="style">background-color:lightgrey;</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$GroupPath/CreditTransferElectionAmt"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<!-- Column (h) -->
			<td class="styIRS3800PartIIITableCell">
				<xsl:choose>
					<xsl:when test="$ColH ='lightgrey'">
						<xsl:attribute name="style">background-color:lightgrey;</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$GroupPath/GrossElectivePymtElectionAmt"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<!-- Column (i) -->
			<td class="styIRS3800PartIIITableCell">
				<xsl:choose>
					<xsl:when test="$ColI ='lightgrey'">
						<xsl:attribute name="style">background-color:lightgrey;</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$GroupPath/NetElectivePymtElectionAmt"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<!-- Column (j) -->
			<td class="styIRS3800PartIIITableCell" style="border-right-width:0px;">
				<xsl:choose>
					<xsl:when test="$ColJ ='lightgrey'">
						<xsl:attribute name="style">background-color:lightgrey;border-right-width:0px;</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$GroupPath/TotalGeneralBusCreditsAmt"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>
	<!-- =============================================================== -->
	<!-- Template for Part IV - Table-->
	<xsl:template name="Part4TableRows">
		<xsl:param name="GroupPath"/>
		<xsl:param name="RowNumber"/>
		<xsl:param name="Dots"/>
		<xsl:param name="ColA"/>
		<xsl:param name="ColB"/>
		<xsl:param name="ColC"/>
		<xsl:param name="ColD"/>
		<xsl:param name="ColE"/>
		<xsl:param name="ColF"/>
		<xsl:param name="ColG"/>
		<tr style="min-height:4mm;">
			<td class="styLNLeftNumBox" style="width:8mm;padding-left:2.5mm;">
				<xsl:if test="contains($RowNumber,'1') or contains($RowNumber,'2') or contains($RowNumber,'3') or
						 contains($RowNumber,'4') or contains($RowNumber,'5') or contains($RowNumber,'6') or 
						 contains($RowNumber,'7') or contains($RowNumber,'8') or contains($RowNumber,'9')">
					<xsl:attribute name="style">width:8mm;padding-left:1mm;</xsl:attribute>
				</xsl:if>
				<b>
					<xsl:value-of select="$RowNumber"/>
				</b>
			</td>
			<!-- Column (a) -->
			<td class="styIRS3800PartIVTableCell" style="width:63mm;text-align:left;vertical-align:top;border-top-width:0px;">
				<xsl:if test="(($RowNumber ='2') or ($RowNumber ='4'))">
					<xsl:attribute name="style">width:63mm;text-align:left;vertical-align:top;border-top-width:0px;font-weight:bold;</xsl:attribute>
				</xsl:if>
				<xsl:if test="(($ColA ='Form 3468, Part II (coal, gasification)') or ($ColA ='Form 8900 (railroad track maintenance pre-2008)'))">
					<xsl:attribute name="style">width:63mm;text-align:left;vertical-align:top;border-top-width:1px;</xsl:attribute>
				</xsl:if>
				<xsl:value-of select="$ColA"/>
				<span class="styDotLn" style="float:right;">
					<xsl:value-of select="$Dots"/>
				</span>
			</td>
			<!-- Column (b) -->
			<td class="styIRS3800PartIVTableCell" style="width:10mm;text-align:center;">
				<xsl:choose>
					<xsl:when test="$ColB ='lightgrey'">
						<xsl:attribute name="style">width:10mm;background-color:lightgrey;</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="$GroupPath/NonpassiveInd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$GroupPath/NonpassiveInd"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="$GroupPath/NonPassiveInd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$GroupPath/NonPassiveInd"/>
								</xsl:call-template>
							</xsl:when>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<!-- Column (c) -->
			<td class="styIRS3800PartIVTableCell" style="width:10mm;text-align:center;">
				<xsl:choose>
					<xsl:when test="$ColC ='lightgrey'">
						<xsl:attribute name="style">width:10mm;background-color:lightgrey;</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$GroupPath/Yr"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<!-- Column (d) -->
			<td class="styIRS3800PartIVTableCell" style="text-align:center;">
				<xsl:choose>
					<xsl:when test="$ColD ='lightgrey'">
						<xsl:attribute name="style">background-color:lightgrey;</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="$GroupPath/PassThroughEntityEIN">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$GroupPath/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="$GroupPath/MissingEINReasonCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$GroupPath/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:when>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<!-- Column (e) -->
			<td class="styIRS3800PartIVTableCell">
				<xsl:choose>
					<xsl:when test="$ColE ='lightgrey'">
						<xsl:attribute name="style">background-color:lightgrey;</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$GroupPath/CarryBackGeneralBusinessCrAmt"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<!-- Column (f) -->
			<td class="styIRS3800PartIVTableCell">
				<xsl:choose>
					<xsl:when test="$ColF ='lightgrey'">
						<xsl:attribute name="style">background-color:lightgrey;</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$GroupPath/CYGeneralBusCrCarryforwardAmt"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<!-- Column (g) -->
			<td class="styIRS3800PartIVTableCell" style="border-right-width:0px;">
				<xsl:choose>
					<xsl:when test="$ColG ='lightgrey'">
						<xsl:attribute name="style">background-color:lightgrey;border-right-width:0px;</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$GroupPath/ESBCCarryforwardAmt"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>
	<!-- Template for Part V - Blank Rows-->
	<xsl:template name="PartVBlankRows">
		<xsl:param name="numRows" select="count(38 - $Form3800Data/GBCBreakdownCYAggrgtAmtGrp/*[contains(name(),'Grp')])"/>
		<xsl:if test="$numRows &gt; 0">
			<tr style="min-height:4mm;">
				<td class="styTableCell" style="width:12mm;vertical-align:top;text-align:right;padding-right:5mm;padding-bottom:0.5mm;border-bottom-width:0px;">
					<xsl:if test="($numRows = 1)">
						<xsl:attribute name="style">width:12mm;vertical-align:top;text-align:right;padding-right:5mm;</xsl:attribute>
					</xsl:if>
					<span class="styLNLeftNumBox">
						<xsl:value-of select="38 - ($numRows) + 1"/>
					</span>
				</td>
				<td class="styTableCell" style="width:26mm;vertical-align:top;text-align:left;">
					<xsl:if test="(38 - ($numRows) + 1) = 1">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form3800Data/GBCBreakdownCYAggrgtAmtGrp/*[contains(name(),'Grp')]"/>
						</xsl:call-template>
					</xsl:if>
				</td>
				<td class="styTableCell" style="width:36mm;"/>
				<td class="styTableCell" style="width:26mm;"/>
				<td class="styTableCell" style="width:26mm;"/>
				<td class="styTableCell" style="width:26mm;"/>
				<td class="styTableCell" style="width:26mm;"/>
				<td class="styTableCell" style="width:26mm;"/>
				<td class="styTableCell" style="width:26mm;"/>
				<td class="styTableCell" style="border-right:none;"/>
			</tr>
			<xsl:call-template name="PartVBlankRows">
				<xsl:with-param name="numRows" select="$numRows - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="PartVIBlankRows">
		<xsl:param name="numRows" select="count(50 - $Form3800Data/*[contains(name(),'AggrgtGrp') or contains(name(),'AggrgGrp')])"/>
		<xsl:if test="$numRows &gt; 0">
			<tr style="min-height:4mm;">
				<td class="styTableCell" style="width:12mm;border:none;vertical-align:top;text-align:right;padding-right:5mm;padding-bottom:0.5mm;">
					<xsl:if test="($numRows = 1)">
						<xsl:attribute name="style">width:12mm;border-right:none;vertical-align:top;text-align:right;padding-right:5mm;</xsl:attribute>
					</xsl:if>
					<span class="styLNLeftNumBox">
						<xsl:value-of select="50 - ($numRows) + 1"/>
					</span>
				</td>
				<td class="styTableCell" style="width:32mm;vertical-align:top;text-align:left;">
					<xsl:if test="(50 - ($numRows) + 1) = 1">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form3800Data/*[contains(name(),'AggrgtGrp') or contains(name(),'AggrgGrp')]"/>
						</xsl:call-template>
					</xsl:if>
				</td>
				<td class="styTableCell" style="width:15mm;"/>
				<td class="styTableCell" style="width:15mm;"/>
				<td class="styTableCell" style="width:26mm;"/>
				<td class="styTableCell" style="width:28mm;"/>
				<td class="styTableCell" style="width:28mm;"/>
				<td class="styTableCell" style="border-right:none;"/>
			</tr>
			<xsl:call-template name="PartVIBlankRows">
				<xsl:with-param name="numRows" select="$numRows - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>