<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8936ScheduleAStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8936ScheduleA"/>
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
				<meta name="Description" content="IRS Form 8936 Schedule A"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--<xsl:if test="not($Print) or $Print=''">-->
					<xsl:call-template name="AddOnStyle"/>
					<xsl:call-template name="IRS8936ScheduleAStyle"/>
					<!--</xsl:if>-->
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form8936ScheduleA">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:30mm;height:22mm;border-right:2px solid black;">
							<span class="styFN" style="font-size:9pt;">SCHEDULE A</span> 
							<br/>
							<span class="styFN" style="font-size:8pt;">(Form 8936)</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br/>
							<br/>
							<br/>
							<br/>
							<span class="styAgency">
								Department of the Treasury
								<br/>
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:124mm;height:22mm;">
							<span class="styFMT" style="font-size:13pt;padding-top:1mm;padding-bottom:1mm;">
								Clean Vehicle Credit Amount<br />
							</span>
							<br/><br/>
							<span class="styBoldText" style="font-size:7.5pt;padding-top:2mm;">
								Attach to your tax return. <br/>
								Go to <i>www.irs.gov/Form8936</i> for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:32mm;height:22mm;text-align:center;border-left:2px solid black;">
							<div class="styOMB" style="height:5mm;">OMB No. 1545-2137</div>
							<div class="styTaxYear"> 
								20<span class="styTYColor">23</span>
							</div>
							<div class="stySequence" style="padding-top:1mm; padding-left: 2mm;">
							  Attachment<br/>
							  Sequence No. <span class="styBoldText" style="font-size:8pt;">69A</span>
							</div>
						  </div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;width:187mm;">
						<div class="styNameBox" style="width:133mm;">
							Name(s) shown on return<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:50mm;padding-left:0.5mm;font-weight:normal;">
							<span style="width:0.5mm;height:1mm;"/> <strong> Identifying number</strong>
							<br/>
							<span style="width:53mm;padding-left:1mm;">
								<xsl:choose>
									<xsl:when test="$RtnHdrData/Filer/EIN">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- Part I -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="width:167mm;height:auto;font-weight:normal;">
							<strong>Vehicle Details</strong>
						</div>
					</div>
					<!-- Line 1a -->
					<div>
						<div class="styLNLeftNumBoxSD" style="padding-top:2mm;">1a</div>
						<div class="styLNDesc" style="height:5mm;padding-top:2mm;width:125mm">
							Year
							<span class="sty8936SchADotLn">.............................</span>
						</div>
						<div class="sty8936SchALine">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/VehicleDescriptionGrp/VehicleModelYr"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1b-->
					<div>
						<div class="styLNLeftNumBoxSD" style="padding-top:2mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="height:5mm;padding-top:2mm;width:125mm">
							Make
							<span class="sty8936SchADotLn">.............................</span>
						</div>
						<div class="sty8936SchALine">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/VehicleDescriptionGrp/VehicleMakeNameTxt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1c -->
					<div>
						<div class="styLNLeftNumBoxSD" style="padding-top:2mm;padding-left:4mm">c</div>
						<div class="styLNDesc" style="height:5mm;padding-top:2mm;width:125mm">
							Model
							<span class="sty8936SchADotLn">.............................</span>
						</div>
						<div class="sty8936SchALine">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/VehicleDescriptionGrp/VehicleModelNameTxt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div style="padding-top:2mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:2mm;">2</div>
						<div class="styLNDesc" style="height:5mm;padding-top:2mm;width:89mm">
							Vehicle identification number (VIN) (see instructions)
							<span class="sty8936SchADotLn">.....</span>
						</div>
						<div class="sty8936SchAVinBox">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/VIN"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div>
						<div class="styLNLeftNumBoxSD" style="padding-top:2mm;">3</div>
						<div class="styLNDesc" style="height:5mm;padding-top:2mm;width:125mm;">
							Enter date vehicle was placed in service (MM/DD/YYYY)
							<span class="sty8936SchADotLn">.............</span>
						</div>
						<div class="sty8936SchALine" style="text-align:center;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/VehiclePlacedInServiceDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div>
						<div class="styLNLeftNumBoxSD" style="padding-top:2mm;">4</div>
						<div class="styLNDesc" style="height:5mm;padding-top:2mm;width:167mm;">
							Was the vehicle used primarily outside the United States? Answer “No” if it was but an exception applies. See instructions.
						</div>
					</div>
					<div style="padding-left:8mm;">
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Vehicle Used Outside US Ind Yes">
						<xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/VehicleUsedOutsideUSInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAVehicleUsedOutsideUSInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelYes">
							 <xsl:with-param name="TargetNode" select="$FormData/VehicleUsedOutsideUSInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAVehicleUsedOutsideUSInd"/>
							</xsl:call-template>
							<strong>Yes. Stop here.</strong> You can’t claim a credit amount for a vehicle used primarily outside the United States.
						</label>
						<br/>
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Vehicle Used Outside US Ind No">
						<xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/VehicleUsedOutsideUSInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAVehicleUsedOutsideUSInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelNo">
							 <xsl:with-param name="TargetNode" select="$FormData/VehicleUsedOutsideUSInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAVehicleUsedOutsideUSInd"/>
							</xsl:call-template>
							<strong>No.</strong>
						</label>
					</div>
					<!-- Line 5 -->
					<div>
						<div class="styLNLeftNumBoxSD" style="padding-top:2mm;">5</div>
						<div class="styLNDesc" style="height:5mm;padding-top:2mm;width:167mm;">
							Does the VIN entered on line 2 belong to a <strong>new clean vehicle</strong> placed in service during the tax year? See instructions for definitions.
						</div>
					</div>
					<div style="padding-left:8mm;">
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="VIN New clean vehicle In Service TY Ind Yes">
						<xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/VINNewClnVehInServiceTYInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAVINNewClnVehInServiceTYInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelYes">
							 <xsl:with-param name="TargetNode" select="$FormData/VINNewClnVehInServiceTYInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAVINNewClnVehInServiceTYInd"/>
							</xsl:call-template>
							<strong>Yes.</strong> Go to Part II.
						</label>
						<br/>
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="VIN New clean vehicle In Service TY Ind No">
						<xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/VINNewClnVehInServiceTYInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAVINNewClnVehInServiceTYInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelNo">
							 <xsl:with-param name="TargetNode" select="$FormData/VINNewClnVehInServiceTYInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAVINNewClnVehInServiceTYInd"/>
							</xsl:call-template>
							<strong>No.</strong> Go to line 6.
						</label>
					</div>
					<!-- Line 6 -->
					<div>
						<div class="styLNLeftNumBoxSD" style="padding-top:2mm;">6</div>
						<div class="styLNDesc" style="height:5mm;padding-top:2mm;width:167mm;">
							Does the VIN entered on line 2 belong to a <strong>previously owned clean vehicle</strong> acquired after 2022 and placed in service during the tax year? See instructions for definitions.
						</div>
					</div>
					<div style="padding-top:3mm;padding-left:8mm;">
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Previously owned clean vehicle placed in service TY Ind Yes">
						<xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/PrevOwnClnVehInServiceTYInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAPrevOwnClnVehInServiceTYInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelYes">
							 <xsl:with-param name="TargetNode" select="$FormData/PrevOwnClnVehInServiceTYInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAPrevOwnClnVehInServiceTYInd"/>
							</xsl:call-template>
							<strong>Yes.</strong> Go to Part IV.
						</label>
						<br/>
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Previously owned clean vehicle placed in service TY Ind No">
						<xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/PrevOwnClnVehInServiceTYInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAPrevOwnClnVehInServiceTYInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelNo">
							 <xsl:with-param name="TargetNode" select="$FormData/PrevOwnClnVehInServiceTYInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAPrevOwnClnVehInServiceTYInd"/>
							</xsl:call-template>
							<strong>No.</strong> Go to line 7.
						</label>
					</div>
					<!-- Line 7 -->
					<div>
						<div class="styLNLeftNumBoxSD" style="padding-top:2mm;">7</div>
						<div class="styLNDesc" style="height:5mm;padding-top:2mm;width:167mm;">
							Does the VIN entered on line 2 belong to a <strong>qualified commercial clean vehicle</strong> acquired after 2022 and placed in service during the tax year? See instructions for definitions.
						</div>
					</div>
					<div style="padding-top:3mm;padding-left:8mm;">
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Qualified commercial clean vehicle placed in service TY Ind Yes">
						<xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/VINQlfyCmrclClnVehInSrvcTYInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAVINQlfyCmrclClnVehInSrvcTYInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelYes">
							 <xsl:with-param name="TargetNode" select="$FormData/VINQlfyCmrclClnVehInSrvcTYInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAVINQlfyCmrclClnVehInSrvcTYInd"/>
							</xsl:call-template>
							<strong>Yes.</strong> Go to Part V.
						</label>
						<br/>
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Qualified commercial clean vehicle placed in service TY Ind No">
						<xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/VINQlfyCmrclClnVehInSrvcTYInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAVINQlfyCmrclClnVehInSrvcTYInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelNo">
							 <xsl:with-param name="TargetNode" select="$FormData/VINQlfyCmrclClnVehInSrvcTYInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAVINQlfyCmrclClnVehInSrvcTYInd"/>
							</xsl:call-template>
							<strong>No. Stop here.</strong> You can’t use this schedule to figure a credit amount for a vehicle not described on line 5, 6, or 7.
						</label>
					</div>
					<!-- Part II -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="width:167mm;height:auto;font-weight:normal;">
							<strong>Credit Amount for Business/Investment Use Part of New Clean Vehicle</strong>
						</div>
					</div>
					<!-- Line 8 -->
					<div>
						<div class="styLNLeftNumBoxSD" style="padding-top:2mm;">8</div>
						<div class="styLNDesc" style="height:5mm;padding-top:2mm;width:167mm;">
							Did you acquire the vehicle for use or to lease to others, and not for resale? Answer “No” if you are leasing the vehicle from another person.
						</div>
					</div>
					<div style="padding-top:3mm;padding-left:8mm;">
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Acquire Vehicle For Use Or Lease And Not For Resale Ind Yes">
						<xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/AcqVehUseOrLeaseNotResaleInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAAcqVehUseOrLeaseNotResaleInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelYes">
							 <xsl:with-param name="TargetNode" select="$FormData/AcqVehUseOrLeaseNotResaleInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAAcqVehUseOrLeaseNotResaleInd"/>
							</xsl:call-template>
							<strong>Yes.</strong>
						</label>
						<br/>
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Acquire Vehicle For Use Or Lease And Not For Resale Ind No">
						<xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/AcqVehUseOrLeaseNotResaleInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAAcqVehUseOrLeaseNotResaleInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelNo">
							 <xsl:with-param name="TargetNode" select="$FormData/AcqVehUseOrLeaseNotResaleInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAAcqVehUseOrLeaseNotResaleInd"/>
							</xsl:call-template>
							<strong>No. Stop here.</strong> You can’t claim a credit amount for a vehicle you didn’t acquire for use or to lease to others, or acquired for resale.
						</label>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv" style="padding-top:3mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:3mm;">9</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Tentative credit amount (see instructions)
							<span class="sty8936SchADotLn">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br /><strong>9</strong></div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-top:3mm;">10</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Business/investment use percentage (see instructions)
							<span class="sty8936SchADotLn">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br /><strong>10</strong></div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUsePct" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>	
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="height:7mm;">
							Multiply line 9 by line 10. Include this credit amount on line 6 in Part II of Form 8936. If you
							entered 100% on line 10, stop here. Otherwise, go to Part III below
							<span class="sty8936SchADotLn">..................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;border-bottom:0px;"><br /><strong>11</strong></div>
						<div class="styLNAmountBox" style="height:7mm;border-bottom:0px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUseAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part III -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="width:167mm;height:auto;font-weight:normal;">
							<strong>Credit Amount for Personal Use Part of New Clean Vehicle</strong>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>	
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="height:7mm;">
							Subtract line 11 from line 9 in Part II. Stop here and include this credit amount on line 9 in Part III of Form 8936
							<span class="sty8936SchADotLn">................................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;border-bottom:0px;"><br /><strong>12</strong></div>
						<div class="styLNAmountBox" style="height:7mm;border-bottom:0px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PrsnlUseNewCleanVehicleCrAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Page 1 footer-->
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;"><b>For Paperwork Reduction Act Notice, see the Form 8936 instructions.</b></span>
						<span style="margin-left:20mm;font-size:8px;">Cat. No. 93602W</span>
						<span style="float:right;font-size:8px;"><b>Schedule A (Form 8936) 2023</b></span>
					</div>
					<!-- Page 2 -->
					<!-- Header -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						Schedule A (Form 8936) 2023
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<!-- Part IV -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc" style="width:167mm;height:auto;font-weight:normal;">
							<strong>Credit Amount for Previously Owned Clean Vehicle</strong>
						</div>
					</div>
					<!-- Line 13a -->
					<div>
						<div class="styLNLeftNumBox" style="padding-top:2mm;">13a</div>
						<div class="styLNDesc" style="height:5mm;padding-top:2mm;width:167mm;">
							Is the sales price of the vehicle more than $25,000?
						</div>
					</div>
					<div style="padding-left:8mm;">
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Vehicle price more than than specified amount Ind Yes">
						<xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/ClnVehSalePriceMoreSpcfdAmtInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAClnVehSalePriceMoreSpcfdAmtInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelYes">
							 <xsl:with-param name="TargetNode" select="$FormData/ClnVehSalePriceMoreSpcfdAmtInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAClnVehSalePriceMoreSpcfdAmtInd"/>
							</xsl:call-template>
							<strong>Yes. Stop here.</strong> The vehicle doesn’t qualify for the Part IV credit.
						</label>
						<br/>
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Vehicle price more than than specified amount Ind No">
						<xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/ClnVehSalePriceMoreSpcfdAmtInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAClnVehSalePriceMoreSpcfdAmtInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelNo">
							 <xsl:with-param name="TargetNode" select="$FormData/ClnVehSalePriceMoreSpcfdAmtInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAClnVehSalePriceMoreSpcfdAmtInd"/>
							</xsl:call-template>
							<strong>No.</strong>
						</label>
					</div>
					<!-- Line 13b -->
					<div>
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm;padding-top:2mm;">b</div>
						<div class="styLNDesc" style="height:5mm;padding-top:2mm;width:167mm;margin-left:0mm;">
							Did you acquire the vehicle for use and not for resale? Answer “No” if you are leasing the vehicle from another person.
						</div>
					</div>
					<div style="padding-left:8mm;">
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Acquire the vehicle for use and not for resale Ind Yes">
						<xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/AcqPrevOwnVehUseNotResaleInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAAcqPrevOwnVehUseNotResaleInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelYes">
							 <xsl:with-param name="TargetNode" select="$FormData/AcqPrevOwnVehUseNotResaleInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAAcqPrevOwnVehUseNotResaleInd"/>
							</xsl:call-template>
							<strong>Yes.</strong>
						</label>
						<br/>
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Acquire the vehicle for use and not for resale Ind No">
						<xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/AcqPrevOwnVehUseNotResaleInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAAcqPrevOwnVehUseNotResaleInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelNo">
							 <xsl:with-param name="TargetNode" select="$FormData/AcqPrevOwnVehUseNotResaleInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAAcqPrevOwnVehUseNotResaleInd"/>
							</xsl:call-template>
							<strong>No. Stop here.</strong> You can’t claim a credit amount for a vehicle you didn’t acquire for use or acquired for resale.
						</label>
					</div>
					<!-- Line 13c -->
					<div>
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm;padding-top:2mm;">c</div>
						<div class="styLNDesc" style="height:5mm;padding-top:2mm;width:167mm;">
							Can you be claimed as a dependent on another person’s tax return, such as your parent’s return?
						</div>
					</div>
					<div style="padding-left:8mm;">
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Claimed As Dependent Ind Yes">
						<xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/ClaimedAsDependentInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAClaimedAsDependentInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelYes">
							 <xsl:with-param name="TargetNode" select="$FormData/ClaimedAsDependentInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAClaimedAsDependentInd"/>
							</xsl:call-template>
							<strong>Yes. Stop here.</strong> You can’t claim a credit amount if you can be claimed as a dependent.
						</label>
						<br/>
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Claimed As Dependent Ind No">
						<xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/ClaimedAsDependentInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAClaimedAsDependentInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelNo">
							 <xsl:with-param name="TargetNode" select="$FormData/ClaimedAsDependentInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAClaimedAsDependentInd"/>
							</xsl:call-template>
							<strong>No.</strong> 
						</label>
					</div>
					<!-- Line 13d -->
					<div>
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm;padding-top:2mm;">d</div>
						<div class="styLNDesc" style="height:5mm;padding-top:2mm;width:167mm;">
							Is the vehicle a qualified fuel cell motor vehicle? See instructions.
						</div>
					</div>
					<div style="padding-left:8mm;">
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Qualified fuel cell motor vehicle Ind Yes">
						<xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/QlfyFuelCellMotorVehInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAQlfyFuelCellMotorVehInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelYes">
							 <xsl:with-param name="TargetNode" select="$FormData/QlfyFuelCellMotorVehInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAQlfyFuelCellMotorVehInd"/>
							</xsl:call-template>
							<strong>Yes.</strong> 
						</label>
						<br/>
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Qualified fuel cell motor vehicle Ind No">
						<xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/QlfyFuelCellMotorVehInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAQlfyFuelCellMotorVehInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelNo">
							 <xsl:with-param name="TargetNode" select="$FormData/QlfyFuelCellMotorVehInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAQlfyFuelCellMotorVehInd"/>
							</xsl:call-template>
							<strong>No.</strong> 
						</label>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv" style="padding-top:3mm;">
						<div class="styLNLeftNumBox" style="padding-top:3mm;">14</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Enter the sales price of the vehicle
							<span class="sty8936SchADotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br /><strong>14</strong></div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SalePriceAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-top:3mm;">15</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Multiply line 14 by 30% (0.30)
							<span class="sty8936SchADotLn">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br /><strong>15</strong></div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SalePriceBySpecifiedPctAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-top:3mm;">16</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Maximum vehicle credit amount
							<span class="sty8936SchADotLn">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br /><strong>16</strong></div>
						<div class="styLNAmountBox" style="height:7mm;text-align:center;"><br />
							$4000
						</div>
					</div>
					<!-- Line 17 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>	
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc" style="height:7mm;">
							Enter the smaller of line 15 or line 16. Stop here and include this credit amount on line 14 in Part IV of Form 8936
							<span class="sty8936SchADotLn">................................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;border-bottom:0px;"><br /><strong>17</strong></div>
						<div class="styLNAmountBox" style="height:7mm;border-bottom:0px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PrevOwnedCleanVehCreditAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part V -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part V</div>
						<div class="styPartDesc" style="width:167mm;height:auto;font-weight:normal;">
							<strong>Credit Amount for Qualified Commercial Clean Vehicle</strong>
						</div>
					</div>
					<!-- Line 18a -->
					<div>
						<div class="styLNLeftNumBox" style="padding-top:2mm;">18a</div>
						<div class="styLNDesc" style="height:5mm;padding-top:2mm;width:167mm;">
							Is the vehicle of a character subject to the allowance for depreciation? Answer “Yes” if the exception for certain tax-exempt entities discussed in the instructions applies.
						</div>
					</div>
					<div style="padding-top:3mm;padding-left:8mm;">
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Vehicle of a character subject to the allowance for depreciation Ind Yes">
						<xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/VehOfCharSubjToAllwncDeprecInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAVehOfCharSubjToAllwncDeprecInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelYes">
							 <xsl:with-param name="TargetNode" select="$FormData/VehOfCharSubjToAllwncDeprecInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAVehOfCharSubjToAllwncDeprecInd"/>
							</xsl:call-template>
							<strong>Yes.</strong> 
						</label>
						<br/>
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Vehicle of a character subject to the allowance for depreciation Ind No">
						<xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/VehOfCharSubjToAllwncDeprecInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAVehOfCharSubjToAllwncDeprecInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelNo">
							 <xsl:with-param name="TargetNode" select="$FormData/VehOfCharSubjToAllwncDeprecInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAVehOfCharSubjToAllwncDeprecInd"/>
							</xsl:call-template>
							<strong>No. Stop here.</strong> The vehicle is not a qualified commercial clean vehicle unless the exception applies.
						</label>
					</div>
					<!-- Line 18b -->
					<div>
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm;padding-top:2mm;">b</div>
						<div class="styLNDesc" style="height:5mm;padding-top:2mm;width:167mm;">
							Did you acquire the vehicle for use or to lease to others, and not for resale? Answer “No” if you are leasing the vehicle from another person.
						</div>
					</div>
					<div style="padding-top:3mm;padding-left:8mm;">
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Acquire the vehicle for use or to lease to others, and not for resale Ind Yes">
						<xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/AcqCmrclClnVehUseNotResaleInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAAcqCmrclClnVehUseNotResaleInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelYes">
							 <xsl:with-param name="TargetNode" select="$FormData/AcqCmrclClnVehUseNotResaleInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAAcqCmrclClnVehUseNotResaleInd"/>
							</xsl:call-template>
							<strong>Yes.</strong> 
						</label>
						<br/>
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Acquire the vehicle for use or to lease to others, and not for resale Ind No">
						<xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/AcqCmrclClnVehUseNotResaleInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAAcqCmrclClnVehUseNotResaleInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelNo">
							 <xsl:with-param name="TargetNode" select="$FormData/AcqCmrclClnVehUseNotResaleInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAAcqCmrclClnVehUseNotResaleInd"/>
							</xsl:call-template>
							<strong>No. Stop here.</strong> You can’t claim a credit amount for a vehicle you didn’t acquire for use or to lease to others, or acquired for resale.
						</label>
					</div>
					<!-- Line 18c -->
					<div>
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm;padding-top:2mm;">c</div>
						<div class="styLNDesc" style="height:5mm;padding-top:2mm;width:167mm;">
							Is the vehicle also powered by gas or diesel? See instructions.
						</div>
					</div>
					<div style="padding-left:8mm;">
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Vehicle Powered By Gas Or Diesel Ind Yes">
						<xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/VehiclePoweredByGasOrDieselInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAVehiclePoweredByGasOrDieselInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelYes">
							 <xsl:with-param name="TargetNode" select="$FormData/VehiclePoweredByGasOrDieselInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAVehiclePoweredByGasOrDieselInd"/>
							</xsl:call-template>
							<strong>Yes.</strong> 
						</label>
						<br/>
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Vehicle Powered By Gas Or Diesel Ind No">
						<xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/VehiclePoweredByGasOrDieselInd"/>
							<xsl:with-param name="BackupName">IRS8936SchAVehiclePoweredByGasOrDieselInd</xsl:with-param>
						</xsl:call-template>
						</input>
						<span style="width:2px;"/>
						<label>
							<xsl:call-template name="PopulateLabelNo">
							 <xsl:with-param name="TargetNode" select="$FormData/VehiclePoweredByGasOrDieselInd"/>
							 <xsl:with-param name="BackupName" select="IRS8936SchAVehiclePoweredByGasOrDieselInd"/>
							</xsl:call-template>
							<strong>No.</strong> 
						</label>
					</div>
					<!-- Line 19 -->
					<div class="styStdDiv" style="padding-top:3mm;">
						<div class="styLNLeftNumBox" style="padding-top:3mm;">19</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Enter the cost or other basis of the vehicle. See instructions
							<span class="sty8936SchADotLn">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br /><strong>19</strong></div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/VehicleCostOrOtherBasisAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 20 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-top:3mm;">20</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Section 179 expense deduction (see instructions)
							<span class="sty8936SchADotLn">..................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br /><strong>20</strong></div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Section179ExpenseDeductionAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 21 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-top:3mm;">21</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Subtract line 20 from line 19
							<span class="sty8936SchADotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br /><strong>21</strong></div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetSect179ExpenseDedAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 22 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-top:3mm;">22</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Multiply line 21 by 15% (0.15) [30% (0.30) if the answer on line 18c above is “No”]
							<span class="sty8936SchADotLn">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br /><strong>22</strong></div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetSect179ExpenseDedPctAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 23 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-top:3mm;">23</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Enter the incremental cost of the vehicle. See instructions
							<span class="sty8936SchADotLn">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br /><strong>23</strong></div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/VehicleIncrementalCostAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 24 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-top:3mm;">24</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Enter the smaller of line 22 or line 23
							<span class="sty8936SchADotLn">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br /><strong>24</strong></div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TentQlfyCmrclCleanVehicleCrAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 25 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>	
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">25</div>
						<div class="styLNDesc" style="height:7mm;">
							<strong>Maximum credit.</strong> Enter $7,500 ($40,000 if the vehicle’s gross vehicle weight rating (GVWR) is 14,000 pounds or more)
							<span class="sty8936SchADotLn">.............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br /><strong>25</strong></div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MaxQlfyCmrclCleanVehCrAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 26 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-top:3mm;">26</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Enter the smaller of line 24 or line 25. Include this credit amount on line 19 in Part V of Form 8936
							<span class="sty8936SchADotLn">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;border-bottom:0px;"><br /><strong>26</strong></div>
						<div class="styLNAmountBox" style="height:7mm;border-bottom:0px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyCmrclCleanVehicleCrAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Page 2 footer-->
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="float:right;font-size:8px;"><b>Schedule A (Form 8936) 2023</b></span>
					</div>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
