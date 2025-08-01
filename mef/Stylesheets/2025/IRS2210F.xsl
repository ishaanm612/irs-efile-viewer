<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Annemarie Ford on 4/17/2025 - 2210-F UWR 998367 --> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS2210FStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form2210FData" select="$RtnDoc/IRS2210F"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form2210FData)"/>
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
				<meta name="Description" content="IRS Form 2210"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				<!-- <xsl:if test="not($Print) or $Print=''"> -->
						<xsl:call-template name="IRS2210FStyle"/>
						<xsl:call-template name="AddOnStyle"/>
				<!-- </xsl:if> -->
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form2210F">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;height:19mm;">
		<div class="styFNBox" style="width:32mm;height:19mm;padding:bottom:0mm;">
                         Form<span style="width:1mm;"></span>
                            <span class="styFormNumber">2210-F</span>
                            <br/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form2210FData"/>
								</xsl:call-template>
							<div class="styAgency" style="padding-top:4mm;height:0mm;padding:bottom:0mm;">Department of the Treasury<br/>
						Internal Revenue Service 
                            </div>
						</div>
		<div class="styFTBox" style="width:124mm;height:19mm;">           
			<div class="styMainTitle" style="padding:bottom:0mm;">
				Underpayment of Estimated Tax by<br/>Farmers and Fishers
			</div>
			<div class="styFBT" style="font-size:7pt;height:5mm;padding-top:0mm;margin-top:0mm;">
				 Attach to Form 1040, 1040-SR, 1040-NR, or 1041.<br/>
			    Go to <i>www.irs.gov/Form2210F</i> for instructions and the latest information.
			</div>
		</div>
	<div class="styTYBox" style="width:31mm; height:19mm">
							<div class="styOMB">OMB No. 1545-0140</div>
							<div>
								<span class="styTaxYear" style="font-size:21pt;">20<span class="styTYColor">25</span></span>
							</div>
							<div class="stySequence">Attachment<br/>Sequence No. <b style="font-size:8pt">06A</b>
							</div>
						</div>
					</div>
					<!-- Name(s) shown on return -->
				<div class="styBB" style="width:187mm;">
					<div class="styFNBox" style="width:140mm;height:9mm;">
                    Name(s) shown on tax return<br/>
                    <!-- 1040x Return Header Attached -->
                    <xsl:if test="$RtnHdrData/Filer/NameLine1Txt">
                    <span style="padding-left:2mm;padding-top:3mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select= "$RtnHdrData/Filer/NameLine1Txt"/> 
							</xsl:call-template>
					 </span >
					</xsl:if>
					<!-- If 1041 Return Header Attached -->		
					<xsl:if test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select= "$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
							</xsl:call-template>
					</xsl:if>
					<xsl:if test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select= "$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>
							</xsl:call-template>
					</xsl:if>
				</div>
					<!-- Identifying Number -->
				<div style="padding-left:1mm;"/>
					<b> Identifying number</b><br/>
						<!-- 1040 Return Header Attached -->
						<xsl:if test="$RtnHdrData/Filer/PrimarySSN">
						<span style="padding-left:2mm;padding-top:3mm;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select= "$RtnHdrData/Filer/PrimarySSN"/>
								</xsl:call-template>
						 </span >
						</xsl:if>
						<xsl:if test="$RtnHdrData/Filer/EIN">
							    <br/>
						 <span style="padding-left:2mm;">
								<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select= "$RtnHdrData/Filer/EIN"/>
								</xsl:call-template>
						 </span >
						</xsl:if>
				</div>
					<!--  start instructions -->
					<div style="width:187mm;height:10mm;border-bottom:1px solid black;padding bottom:1mm;">
						<b>Generally, you don't need to file Form 2210-F.</b> The IRS will figure any penalty you owe and send you a bill. File Form 2210-F <b>only</b> if one or both of the boxes in Part I apply to you. If you don't need to file Form 2210-F, you still can use it to figure your penalty. Enter the amount from line 16 on the penalty line of your return, but don't attach Form 2210-F.
					</div>
					<!-- Part I -->
					<!-- Part I - Header -->
					<div style="width:187mm;height:4.5mm;border-style:solid; border-bottom-width:1px;border-top-width:1px;
          border-right-width:0px;border-left-width:0px;">
						<span class="styPartName" style="height:4mm;width:15mm;font-size:13;">Part I</span>
						<div class="styPartDesc" style="width:167mm;font-weight:normal;" >
							<span style="font-size:10pt;vertical-align:top;"/>
							<b>Reasons for Filing.</b>  Check applicable boxes.  If neither applies, <b>don't file Form 2210-F.</b>
						</div>
					</div>
					<!-- End Part I Header -->
					<!-- Part I body -->
					<div  style="width:187mm;height:auto;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;">
						<!-- Line A -->
						<div style="width:187mm;padding-top:1mm;height:7mm;">
							<div class="styLNLeftLtrBox" style="font-size:7pt;height:auto;aligh-text:top;padding-top:0mm; padding-left: 2.25mm">A
                            </div>
							<input type="checkbox" alt="Penalty Waiver Request" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form2210FData/PenaltyWaiverRequestInd"/>
									<xsl:with-param name="BackupName">IRS2210FPenaltyWaiverRequestInd</xsl:with-param>
								</xsl:call-template>
							</input>
								<!--xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form2210FData/PenaltyWaiverRequestInd" />
								</xsl:call-template-->
								You request a <b>waiver.</b> In certain circumstances, the IRS will waive all or part of the penalty. See <i>
								Waiver of Penalty</i> in the instructions.                         
						</div>
						<!-- Line B -->
						<div style="width:187mm;padding-top:0mm;height:8mm;">
							<div class="styLNLeftLtrBox" style="font-size:7pt;height:5mm;aligh-text:top; padding-top:0mm; padding-left: 2.25mm;">B
                            </div>
							<input type="checkbox" alt="Joint Return" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form2210FData/JointReturnInd"/>
									<xsl:with-param name="BackupName">IRS2210FJointReturnInd</xsl:with-param>
								</xsl:call-template>
							</input>	
								<!--xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form2210FData/JointReturnInd"/>
									<xsl:with-param name="BackupName">IRS2210FJointReturnInd</xsl:with-param>
								</xsl:call-template-->
								You filed or are filing a joint return for either 2024 or 2025, but not for both years, and line 10 below is smaller than line 7 below.    
						</div>
					</div>
					<!-- Part II -->
					<!-- Part II - Header -->
					<div style="width:187mm;height:4.5mm;border-style:solid; border-bottom-width:1px;border-top-width:1px;
          border-right-width:0px;border-left-width:0px;float:left;padding-top:0mm;">
						<span class="styPartName" style="height:4mm;width:15mm;font-size:13;">Part II</span>
						<span class="styPartDesc" style="width:167mm;font-weight:normal;">
							<span style="font-size:10pt;vertical-align:top;"/>
							<b>Figure Your Underpayment</b>
						</span>
					</div>
					<!-- End Part II Header -->
					<!-- Part II body -->
					<div  style="width:187mm;border-bottom:1px solid black;float:left;">
					<!-- Line 1 -->
					<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:7mm;padding-bottom:0mm;padding-left: 2.25mm">1
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:7mm;padding-bottom:0mm;">
							   Enter your 2025 tax after credits from Form 1040, 1040-SR, or 1040-NR, line 22, or Form 1041, Schedule G, line 3
                            <span class="styIRS2210DotLn" style="float:right">..............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm; border-bottom-width:1px;">1</div>
							<div class="styLNAmountBox" style="width:36mm;height:7mm;padding-top:3mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/CurrentYearTaxAfterCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">2
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Other taxes, including self-employement tax and, if applicable, Additional Medicare Tax and/or Net Investment Income Tax (see instructions)</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;padding-bottom:0mm;bottom-border-width:1px;padding-top:3mm;">2</div>
							<div class="styLNAmountBox" style="width:36mm;height:7mm;padding-bottom:0mm;bottom-border-width:1px;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/OtherTaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 3 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">3
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Add lines 1 and 2. If less than $1,000, you don't owe a penalty; <b>don't file Form 2210-F</b></span>
								<span class="styIRS2210DotLn" style="float:right">.....</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">3</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/TotalTaxAfterCrAndOtherTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 4 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:3mm;padding-bottom:0mm;padding-left: 2.25mm">4
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:3mm;padding-bottom:0mm;">
							   Refundable credits (see instructions).
							   <span class="styIRS2210DotLn" style="float:right">.....................</span> 
                            </div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">4</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/RefundableCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 5 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">5
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Reserved for future use</span>
								<span class="styIRS2210DotLn" style="float:right">.........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">5</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;background-color:lightgrey">
								<!--<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/FarmOrFishermanCrSubtotalAmt"/>
								</xsl:call-template>-->
							</div>
						</div>
						<!-- Line 6 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">6
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							   Current year tax. Subtract line 4 from line 3. If less than $1,000, <b>stop;</b> you don't owe a penalty <b>don't</b>
                            </div>
							<div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">
									 <b>file Form 2210-F</b>
								</span>
								<span class="styIRS2210DotLn" style="float:right">..........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm; border-bottom-width:1px;">6</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/CurrentYearTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line7 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-left:2.5mm;">7
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:91.1mm;height:4mm;">
								<span style="float:left">Multiply line 6 by 66 2/3% (0.667)</span>
								<!--Dotted Line-->
								<span class="styIRS2210DotLn" style="float:right">...........</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:4mm;">7
                            </div>
							<div class="styLNAmountBox" style="width:35.91mm;height:4mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/CurrentYearTaxCalculatedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;background-color:lightgrey;border-bottom:none;height:4.5mm;"/>
							<div style="float:left;clear;none;border-left:1px solid black;width:35.9mm;height:4.5mm;"/>
						</div>
						<!-- Line 8 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">8
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Withholding taxes. <b>Don't</b> include any estimated tax payments on this line (see instructions)</span>
								<span class="styIRS2210DotLn" style="float:right">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">8</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/WithholdingTaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 9 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">9
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Subtract line 8 from line 6. If less than $1,000, you don't owe a penalty; <b>don't file Form 2210-F</b></span>
								<span class="styIRS2210DotLn" style="float:right">..</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">9</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/NetTaxDueAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 10 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:.5mm">10
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							   Enter the tax shown on your 2024 tax return (see instructions if your 2025 filing status changed to
                            </div>
							<div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">
									 or from married filing jointly)
								</span>
								<span class="styIRS2210DotLn" style="float:right">........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm; border-bottom-width:1px;">10</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/PriorYearTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 11 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:.5mm">11
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left"><b>Required annual payment.</b> Enter the <b>smaller</b> of line 7 or line 10</span>
								<span class="styIRS2210DotLn" style="float:right">............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">11</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/RequiredAnnualPaymentAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Note -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:3mm;padding-bottom:0mm;padding-left: 2.25mm">
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:3mm;padding-bottom:0mm;">
							   <b>Note:</b> If line 8 is equal to or more than line 11, stop here; you don't owe the penalty. <b>Don't file</b>
                            </div>
							<div class="styLNRightNumBox" style="height:3mm;background-color: lightgrey; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:3mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:3mm;padding-bottom:0mm;padding-left: 2.25mm">
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:3mm;padding-bottom:0mm;">
							   <b>Form 2210-F</b> unless you checked box <b>B</b> above.
                            </div>
							<div class="styLNRightNumBox" style="height:3.5mm;background-color: lightgrey; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:3.5mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<!-- Line 12 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:3mm;padding-bottom:0mm;padding-left:.5mm">12
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:3mm;padding-bottom:0mm;">
							   Enter the estimated tax payments you made by January 17, 2026, and any federal income tax
                            </div>
							<div class="styLNRightNumBox" style="height:3mm;background-color: lightgrey; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:3mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">
									and excess social security or tier 1 railroad retirement tax withheld during 2024
								</span>
								<span class="styIRS2210DotLn" style="float:right">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm; border-bottom-width:1px;">12</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/EstTaxPaymentsAndOtherTaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 13 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:.5mm">13
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							   <b>Underpayment.</b> Subtract line 12 from line 11. If the result is zero or less, stop here; you don't
                            </div>
							<div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">
									 owe the penalty. <b>Don't file Form 2210-F</b> unless you checked box <b>B</b> above
								</span>
								<span class="styIRS2210DotLn" style="float:right">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm; border-bottom:none">13</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/UnderpaymentAmt"/>
								</xsl:call-template>
							</div>
						</div>

					</div>
					<!-- Part III -->
					<!-- Part III - Header -->
<div style="width:187mm;height:4.5mm;border-style:solid; border-bottom-width:1px;border-top-width:1px;
          border-right-width:0px;border-left-width:0px;float:left;">
						<span class="styPartName" style="height:4mm;width:18mm;font-size:13;">Part III</span>
						<span class="styPartDesc" style="width:167mm;font-weight:normal;">
							<span style="font-size:10pt;vertical-align:center;"/>
							<b>Figure the Penalty</b>
						</span>
					</div>
					<!-- END Part III Header-->
					<div class="styBB" style="width:187mm;border-bottom:2px solid black;">	
						<!-- Spacer Row -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-left: 2.25mm"/>
                        	<div class="styLNDesc" style="font-size:7pt;width:135mm;height:5mm;"/>
							<div class="styLNRightNumBox" style="height:5mm;border-bottom:none;"></div>
							<div class="styLNAmountBox" style="width:36mm;height:5mm;border-bottom:none;"/>
						</div>
						<!-- Line 14 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-bottom:0mm;padding-left:.5mm">14
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Enter the date the amount on line 13 was paid or April 15, 2026, whichever is earlier</span>
								<span class="styIRS2210DotLn" style="float:right">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;padding-bottom:0mm;bottom-border-width:1px;">14</div>
							<div class="styLNAmountBox" style="width:36mm;height:5mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateMonth">
									<xsl:with-param name="TargetNode" select="$Form2210FData/EarlierOfPaymentOrTaxDueDt"/>
								</xsl:call-template>/<xsl:call-template name="PopulateDay">
									<xsl:with-param name="TargetNode" select="$Form2210FData/EarlierOfPaymentOrTaxDueDt"/>
								</xsl:call-template>
								/26
							</div>
						</div>
						<!-- Spacer Row -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-left: 2.25mm"/>
                        	<div class="styLNDesc" style="font-size:7pt;width:135mm;height:5mm;"/>
							<div class="styLNRightNumBox" style="height:5mm;border-bottom:none;"></div>
							<div class="styLNAmountBox" style="width:36mm;height:5mm;border-bottom:none;"/>
						</div>
						<!-- Line 15 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-bottom:0mm;padding-left:.5mm">15
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Number of days <b>from</b> January 15, 2026, <b>to</b> the date on line 14</span>
								<span class="styIRS2210DotLn" style="float:right">.............</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;padding-bottom:0mm;bottom-border-width:1px;">15</div>
							<div class="styLNAmountBox" style="width:36mm;height:5mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2210FData/PenaltyDayCnt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Spacer Row 
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-left: 2.25mm"/>
                        	<div class="styLNDesc" style="font-size:7pt;width:135mm;height:5mm;"/>
							<div class="styLNRightNumBox" style="height:5mm;border-bottom:none;"></div>
							<div class="styLNAmountBox" style="width:36mm;height:5mm;border-bottom:none;"/>
						</div>-->
						<!-- Line 16 -->
						<div style="width:187mm; height: 12mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-bottom:0mm;padding-left:.5mm">16</div>
							
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-bottom:0mm;">
								<!-- subline 1 -->
								<div>
								<b style="float:left;">Penalty.</b>
								<div style="height:6mm;text-align:center;vertical-align:super;float:left;margin:0mm 5mm;">
									Underpayment<br/>
									on line 13
								</div>
								<div style="float:left;">x</div>
								<div style="height:6mm;text-align:center;vertical-align:super;float:left;margin:0mm 5mm;">
									<span style="text-decoration:underline;">Number of days on line 15</span><br/>
									365
								</div>
								<div style="height:6mm;float:left;">x X.XX </div>
								<!--<div style="height:6mm;float:left;margin-left:5mm">.</div>-->
								<div style="height:6mm;float:left;margin-left:1mm"></div>
								</div>
								<!-- subline 2 -->
							<div >
                        	<div class="styLNDesc" style="font-size:7pt; width:115mm; padding-left:3.5mm;">
                        	 <li>Enter here and on Form 1040, 1040-SR, or 1040-NR, line 38, or Form 1040, line 27.</li>
                        	</div>
                        	<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form2210FData/PenaltyAmt"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Penalty Waiver Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form2210FData/PenaltyAmt/@requestedPenaltyWaiverAmt"/>
							</xsl:call-template>
							<span class="styIRS2210DotLn" style="float:right">...</span>
							<!--div style="float:right;"> ..... <img src="{$ImagePath}/2210_Bullet.gif" alt="Right Arrow"></img></div-->
						</div>
						</div>
						<!-- end of text -->
							
							<div class="styLNRightNumBox" style="height:12.5mm; bottom-border-width: 0px;">
								<div style="background-color:lightgrey; height:7mm; width:100%"></div>						
								<div>16</div>
							</div>
							<div class="styLNAmountBox" style="width:36mm; height:12.5mm; padding-top:7mm; bottom-border-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/PenaltyAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:0mm;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
						</div>
						<div style="float:right;">
							  Cat. No. 11745A
							   <span style="width:25mm;"/>  
							  Form <span class="styBoldText" style="font-size:8pt;">2210-F</span> (2025)
                           </div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form2210FData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$Form2210FData/PenaltyAmt/@requestedPenaltyWaiverAmt"/>
							<xsl:with-param name="Desc">Line 16 - Penalty Waiver Amount</xsl:with-param>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- Additional Data Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
