<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSpy v2023 rel. 2 (x64) (http://www.altova.com) by IRS User (IRS Software Management) -->
<!-- Last modified SS: 10.4 MD1  01/06/2025 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040SSStyle.xsl"/>
	<xsl:param name="Form1040SSData" select="$RtnDoc/IRS1040SS"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:template name="PopulateYesNoGroup_SS">
		<xsl:param name="TargetNode"/>
		<xsl:param name="BackupName"/>
		<xsl:param name="AltName"/>
		<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
		<span>
			<xsl:call-template name="PopulateSpan">
				<xsl:with-param name="TargetNode" select="$TargetNode"/>
			</xsl:call-template>
			<input type="checkbox" class="styCkbox">
				<xsl:attribute name="alt"><xsl:value-of select="$AltName"/> Yes</xsl:attribute>
				<xsl:call-template name="PopulateYesCheckbox">
					<xsl:with-param name="TargetNode" select="$TargetNode"/>
					<xsl:with-param name="BackupName" select="$BackupName"/>
				</xsl:call-template>
			</input>
		</span>
		<span class="styBoldText">Yes</span>
		<!--</label>-->
		<span style="width: 2mm;"/>
		<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
		<span>
			<xsl:call-template name="PopulateSpan">
				<xsl:with-param name="TargetNode" select="$TargetNode"/>
			</xsl:call-template>
			<input type="checkbox" class="styCkbox">
				<xsl:attribute name="alt"><xsl:value-of select="$AltName"/> No</xsl:attribute>
				<xsl:call-template name="PopulateNoCheckbox">
					<xsl:with-param name="TargetNode" select="$TargetNode"/>
					<xsl:with-param name="BackupName" select="$BackupName"/>
				</xsl:call-template>
			</input>
		</span>
		<span class="styBoldText">No</span>
		<!--</label>-->
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template name="PopulateYesNoGroup_PR">
		<xsl:param name="TargetNode"/>
		<xsl:param name="BackupName"/>
		<xsl:param name="AltName"/>
		<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
		<span>
			<xsl:call-template name="PopulateSpan">
				<xsl:with-param name="TargetNode" select="$TargetNode"/>
			</xsl:call-template>
			<input type="checkbox" class="styCkbox">
				<xsl:attribute name="alt"><xsl:value-of select="$AltName"/> Si</xsl:attribute>
				<xsl:call-template name="PopulateYesCheckbox">
					<xsl:with-param name="TargetNode" select="$TargetNode"/>
					<xsl:with-param name="BackupName" select="$BackupName"/>
				</xsl:call-template>
			</input>
		</span>
		<!--<label>
			<xsl:call-template name="PopulateSpan">
				<xsl:with-param name="TargetNode" select="$TargetNode"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLabelYes">
				<xsl:with-param name="TargetNode" select="$TargetNode"/>
				<xsl:with-param name="BackupName" select="$BackupName"/>
			</xsl:call-template>-->
			<span class="styBoldText">Si</span>
		<!--</label>-->
		<span style="width: 2mm;"/>
		<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
		<span>
			<xsl:call-template name="PopulateSpan">
				<xsl:with-param name="TargetNode" select="$TargetNode"/>
			</xsl:call-template>
			<input type="checkbox" class="styCkbox">
				<xsl:attribute name="alt"><xsl:value-of select="$AltName"/> No</xsl:attribute>
				<xsl:call-template name="PopulateNoCheckbox">
					<xsl:with-param name="TargetNode" select="$TargetNode"/>
					<xsl:with-param name="BackupName" select="$BackupName"/>
				</xsl:call-template>
			</input>
		</span>
		<!--<label>
			<xsl:call-template name="PopulateSpan">
				<xsl:with-param name="TargetNode" select="$TargetNode"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLabelNo">
				<xsl:with-param name="TargetNode" select="$TargetNode"/>
				<xsl:with-param name="BackupName" select="$BackupName"/>
			</xsl:call-template>-->
			<span class="styBoldText">No</span>
		<!--</label>-->
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- 12/3/2024 SS - commented out by request turn back to Language parameter	

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$Form1040SSData/SpanishLanguageInd = 'X'">
				<xsl:call-template name="IRS1040PR"/>
			</xsl:when>		
			<xsl:otherwise>
				<xsl:call-template name="IRS1040SS"/>
			</xsl:otherwise>
	</xsl:choose>
	</xsl:template>
-->
	
	<xsl:template match="/">
		<xsl:if test="$Language='ENGLISH'">
			<xsl:call-template name="IRS1040SS"/>
		</xsl:if>
		<xsl:if test="$Language='SPANISH'">
			<xsl:call-template name="IRS1040PR"/>
		</xsl:if>
	</xsl:template>	
		
	<!-- RegularLine template -->
	<xsl:template name="RegularLine">
		<xsl:param name="Number"/>
		<xsl:param name="Letter"/>
		<xsl:param name="Description"/>
		<xsl:param name="Dots"/>
		<xsl:param name="TargetNode"/>
		<xsl:param name="Rows">1</xsl:param>
		<xsl:param name="Height" select="concat($Rows * 4,'mm')"/>

		<xsl:variable name="PaddingTop" select="concat(4 * ($Rows - 1),'mm')"/>
		<xsl:variable name="LineNumber">
		<xsl:choose>
			<xsl:when test="not($Letter)"><xsl:value-of select="$Number"/></xsl:when>
			<xsl:when test="$Letter = 'a'"><xsl:value-of select="$Number"/>a</xsl:when>
			<xsl:when test="$Letter != 'a'"><xsl:value-of select="$Letter"/></xsl:when>
		</xsl:choose>
		</xsl:variable>
		<xsl:variable name="DataNumber" select="concat($Number,$Letter)"/>
		
			<div class="styIRS1040SSPRLineItem" >
				<xsl:attribute name="style">height:<xsl:value-of select="$Height"/>;</xsl:attribute>		
				<div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;"><xsl:value-of select="$LineNumber"/></div>
				<div class="styIRS1040SSPRLNDesc" style="width:142mm;">
				  <xsl:copy-of select="$Description"/>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;"><xsl:copy-of select="$Dots"/></span>
				</div>
				<div class="styIRS1040SSPRCleanDiv" >
					<xsl:attribute name="style">
						width:37mm;padding:0px 0px 0px 0px;float:right; height:<xsl:value-of select="$Height"/>; 
					</xsl:attribute>
					<div class="styIRS1040SSPRCleanDiv" >
					            <xsl:attribute name="style">width:100%;float:right;height:<xsl:value-of select="$Height"/>;</xsl:attribute>
								<xsl:call-template name="CreateBox_1040SS">
									<xsl:with-param name="Number" select="$DataNumber"/>
									<xsl:with-param name="TargetNode" select="$TargetNode"/>
									<xsl:with-param name="AmountBoxStyle">padding-top:<xsl:value-of select="$PaddingTop"/></xsl:with-param>
									<xsl:with-param name="NumberBoxStyle">padding-top:<xsl:value-of select="$PaddingTop"/></xsl:with-param>
									<xsl:with-param name="Height" select="$Height"/>
								</xsl:call-template>
					</div>
				</div>
			</div>
	</xsl:template>	 
	<!-- LeftShiftedLine template-->  
    <xsl:template name="LeftShiftedLine">
		
		<xsl:param name="Number"/>
		<xsl:param name="Letter"/>
		<xsl:param name="Description"/>
		<xsl:param name="Dots"/>
		<xsl:param name="TargetNode"/>
		<xsl:param name="Rows">1</xsl:param>
		<xsl:param name="Height" select="concat($Rows * 4,'mm')"/>

		<xsl:variable name="PaddingTop" select="concat(4 * ($Rows - 1),'mm')"/>
		<xsl:variable name="LineNumber">
		<xsl:choose>
			<xsl:when test="not($Letter)"><xsl:value-of select="$Number"/></xsl:when>
			<xsl:when test="$Letter = 'a'"><xsl:value-of select="$Number"/>a</xsl:when>
			<xsl:when test="$Letter != 'a'"><xsl:value-of select="$Letter"/></xsl:when>
		</xsl:choose>
		</xsl:variable>
		<xsl:variable name="DataNumber" select="concat($Number,$Letter)"/>
				
		<div class="styIRS1040SSPRLineItem">
			<xsl:attribute name="style">height:<xsl:value-of select="$Height"/>;</xsl:attribute>
			<div class="styIRS1040SSPRLNLeftNumBox"><xsl:value-of select="$LineNumber"/></div>
			<div class="styIRS1040SSPRLNDesc" style="width:105mm;">
				<xsl:copy-of select="$Description"/>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;"><xsl:copy-of select="$Dots"/></span>
			</div>
			<div class="styIRS1040SSPRCleanDiv">
				<xsl:attribute name="style">
					width:75mm;padding:0px 0px 0px 0px;float:right; height:<xsl:value-of select="$Height"/>; 
				</xsl:attribute>
				<div class="styIRS1040SSPRCleanDiv">
					<xsl:attribute name="style">width:37mm;	float:right;height:<xsl:value-of select="$Height"/>;</xsl:attribute>
					<xsl:call-template name="CreateBox_1040SS">
						<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px; padding:0 0 0 0;</xsl:with-param>
						<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px; padding:0 0 0 0;background-color:lightgrey;</xsl:with-param>
						<xsl:with-param name="Height" select="$Height"/>	
					</xsl:call-template>
				</div>
				<div class="styIRS1040SSPRCleanDiv">
					<xsl:attribute name="style">width:37mm;	float:right;height:<xsl:value-of select="$Height"/>;</xsl:attribute>
					<xsl:call-template name="CreateBox_1040SS">
						<xsl:with-param name="Number" select="$DataNumber"/>
						<xsl:with-param name="TargetNode" select="$TargetNode"/>
						<xsl:with-param name="AmountBoxStyle">padding-top:<xsl:value-of select="$PaddingTop"/></xsl:with-param>
						<xsl:with-param name="NumberBoxStyle">padding-top:<xsl:value-of select="$PaddingTop"/></xsl:with-param>
						<xsl:with-param name="Height" select="$Height"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
    </xsl:template>
	
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template name="IRS1040SS">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1040SSData)"/>
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
				<meta name="Desc" content="IRS Form 1040SSPR"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040SSStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="IRS1040SSPR" style="font-family:arial;">
					<xsl:if test="$Form1040SSData/CorrectedReturnInd='X'">
						<span style="padding-right:10mm; color:red; font-size:10pt;font-weight:bold;"> CORRECTED </span>
					</xsl:if>
					<xsl:if test="$Form1040SSData/SupersededReturnInd='X'">
						<span style="padding-right:10mm; color:red; font-size:10pt;font-weight:bold;"> SUPERSEDED </span>
					</xsl:if>
					<xsl:if test="$Form1040SSData/ChangeDt != '' ">
						<span style="padding-right:10mm; color:red; font-size:10pt;font-weight:bold;"> Date of Change: <xsl:value-of select="$Form1040SSData/ChangeDt"/> </span>
					</xsl:if>
				    <xsl:if test="$Form1040SSData/AddressChangeInd='X'">
						<span style="color:red; font-size:10pt;font-weight:bold;"> ADDRESS CHANGE </span>
					</xsl:if>
					
					<xsl:if test="$Form1040SSData/PrimaryDeathDt != '' "><br/>
						<span style="padding-right:10mm; color:red; font-size:10pt;font-weight:bold;">Primary Deceased: 
						<xsl:value-of select="$RtnHdrData/Filer/PrimaryNameControlTxt"/> Date of Death: 
						<xsl:value-of select="$Form1040SSData/PrimaryDeathDt"/> </span>
					</xsl:if>
					<xsl:if test="$Form1040SSData/SpouseDeathDt != '' "><br/>
						<span style="padding-right:10mm; color:red; font-size:10pt;font-weight:bold;">Spouse Deceased: 
						<xsl:value-of select="$RtnHdrData/Filer/SpouseNameControlTxt"/> Date of Death: 
						<xsl:value-of select="$Form1040SSData/SpouseDeathDt"/> </span>
					</xsl:if>
					
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;height:20mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;">
								Form <span class="styFormNumber" style="font-size:15pt;">1040-SS</span>
							</div>
							<br/>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1040SSData"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Special Condition Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040SSData/SpecialConditionDesc[1]"/>
							</xsl:call-template>
							<xsl:if test="$Form1040SSData/PrimaryDeathDt">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Top Left Margin - Primary Date of Death</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040SSData/PrimaryDeathDt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$Form1040SSData/SpouseDeathDt">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Top Left Margin - Spouse Date of Death</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040SSData/SpouseDeathDt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Non Paid Preparer Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040SSData/NonPaidPreparerCd"/>
							</xsl:call-template>
							<!--<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Refund product code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040SSData/RefundProductCd"/>
							</xsl:call-template>-->
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Power Of Attorney Signed By</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040SSData/PowerOfAttorneySignedByInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Power Of Attorney Name</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040SSData/PowerOfAttorneyNm"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Personal Representative Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040SSData/PersonalRepresentativeInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Surviving Spouse Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040SSData/SurvivingSpouseInd"/>
							</xsl:call-template>
							<!--<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Refund Product Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040SSData/RefundtProductCd[1]"/>
							</xsl:call-template>-->
							<br/>
							<span class="styAgency" style="padding-top:3.25mm;">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:9mm;font-size:10pt;">
								U.S. Self-Employment Tax Return<br/>
								<span style="font-size:9pt;">(Including the Additional Child Tax Credit for Bona Fide Residents of Puerto Rico)</span>
                
							</div>
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;width:100%;">
								<span style="text-align:center;font-weight:bold;width:100%;">
									<div style="width:100%;height:5mm;padding-left:5px;">
										<div style="width:100%;height:5mm;">
                      U.S. Virgin Islands, Guam, American Samoa, the Commonwealth of the Northern
                      Mariana Islands, or Puerto Rico. For the year Jan. 1-Dec. 31, 2024,<br/>
                      or other tax year beginning
                      <span style="width:25mm;padding-left:3px;text-align:center;">
												<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
											</span>
                      , and ending
                      <span style="width:25mm;padding-left:3px;text-align:center;">
												<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
											</span>.
                    </div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;border-left-width:2px;height:20mm;">
							<div class="styOMB" style="height:4mm;font-size:7pt;">OMB No. 1545-0074</div>
							<div class="styTY" style="padding-top:2mm;">20<span class="styTYColor">24</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<div class="styBB" style="width:187mm;height:55mm;">

						<div class="styIRS1040SSPRCleanDiv" style="width:100%;height:100%;">
							<!-- Line 1 -->
							<div class="styIRS1040SSPRCleanDiv" style="width:100%;height:16%;border-bottom-width:1px;">
								<div class="styIRS1040SSPRCleanDiv" style="width:38%;height:100%;border-right-width:1px;">
									<div class="styIRS1040SSPRLNDesc" style="width:100%;auto;font-size:7pt;padding:0mm 0mm 0mm 1mm;">
                    Your first name and initial
                  <span style="width:.5mm;padding:.5mm 0mm 0mm 1mm;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Header - Header - In Care Of Name</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
										</xsl:call-template>
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">Name</xsl:with-param>
											<xsl:with-param name="BackupName">RtnHdrDataFilerName</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS1040SSPRCleanDiv" style="width:38%;height:100%;border-right-width:1px;">
									<div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                    Last name
                  </div>
								</div>
								<div class="styIRS1040SSPRCleanDiv" style="width:23.9%;height:100%;">
									<div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										<b>Your social security number</b>
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
											<xsl:with-param name="EINChanged">true</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
							</div>
							<!-- Line 2 -->
							<div class="styIRS1040SSPRCleanDiv" style="width:100%;height:16%;border-bottom-width:1px;">
								<div class="styIRS1040SSPRCleanDiv" style="width:38%;height:100%;border-right-width:1px;">
									<div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:0mm 0mm 0mm 1mm;">
                    If a joint return, spouse's first name and initial
                    <span style="width:.5mm;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
										</xsl:call-template>
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">SpouseName</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS1040SSPRCleanDiv" style="width:38%;height:100%;border-right-width:1px;">
									<div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                    Last name
                  </div>
								</div>
								<div class="styIRS1040SSPRCleanDiv" style="width:23.9%;height:100%;">
									<div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										<b>Spouse's social security number</b>
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
											<xsl:with-param name="EINChanged">true</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
							</div>
							<!-- Line 3 -->
							<div class="styIRS1040SSPRCleanDiv" style="width:100%;height:16%;border-bottom-width:1px;">
								<div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                  Home address (number, street, and apt. no., or rural route)
                </div>
								<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
									<xsl:if test="$RtnHdrData/Filer/USAddress">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine1</xsl:with-param>
										</xsl:call-template>
										<span style="width:2mm;"/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine2</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine1</xsl:with-param>
										</xsl:call-template>
										<span style="width:2mm;"/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine2</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
							<!-- Line 4 -->
							<div class="styIRS1040SSPRCleanDiv" style="width:100%;height:18%;border-bottom-width:1px;">
								<div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                  City, town or post office, commonwealth or territory, and ZIP code
                </div>
								<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
									<xsl:choose>
										<xsl:when test="$RtnHdrData/Filer/ForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
							<!-- Line 5 -->
							<div class="styIRS1040SSPRCleanDiv" style="width:100%;height:18%;border-bottom-width:1px;">
								<div class="styIRS1040SSPRCleanDiv" style="width:95mm;height:100%;border-right-width:1px;">
									<div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                    Foreign country name
                  </div>
									<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
											<xsl:with-param name="MainForm" select="true()"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS1040SSPRCleanDiv" style="width:57mm;height:100%;border-right-width:1px;">
									<div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                    Foreign province/state/county
                  </div>
									<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS1040SSPRCleanDiv" style="width:25mm;height:100%;">
									<div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
                    Foreign postal code
                  </div>
									<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
							</div>
							<!-- Line 6 -->
							<div class="styIRS1040SSPRCleanDiv" style="width:100%;height:16%;">
								<div class="styIRS1040SSPRCleanDiv" style="width:187mm;height:100%;">
									<div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
At any time during 2024, did you: (a) receive (as a reward, award, or payment for property or services); or (b) sell, exchange, or otherwise dispose of a digital<br/> asset (or a financial interest in a digital asset)? (See instructions) 
<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..................</span>
                   	<xsl:call-template name="PopulateYesNoGroup_SS">
											<xsl:with-param name="TargetNode" select="$Form1040SSData/VirtualCurAcquiredDurTYInd"/>
											<xsl:with-param name="BackupName">Form1040SSData/VirtualCurAcquiredDurTYInd</xsl:with-param>
											<xsl:with-param name="AltName">VirtualCurAcquiredDurTY</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part I                                                -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:12mm;height:4mm;font-size:9pt;background-color:black">Part I</div>
						<div class="styPartDesc" style="padding-left:2mm;font-size:9pt;padding-top:.25mm;">
						  Total Tax and Credits <span style="font-weight: normal">(see instructions)</span> 
					</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (1) ////////////////////////////////////////////////////-->
						<div class="styIRS1040SSPRLineItem" style="height:13mm;">
							<div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">1</div>
							<div class="styIRS1040SSPRLNDesc" style="width:181mm;">
								<b>Filing status.</b> Check the box for your filing status. <br/>
								<!--<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
								</xsl:call-template>-->
								<input type="checkbox" alt="Single" class="styCkbox" style="margin:.5mm 0mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[1]</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:.25mm;"/>
								<!--<label style="padding-right:2mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[1]</xsl:with-param>
									</xsl:call-template>-->
									  Single
								<!--</label>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
								</xsl:call-template>-->
								<input type="checkbox" alt="Married filing jointly" class="styCkbox" style="margin:.5mm 0mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[2]</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:.25mm;"/>
								<!--<label style="padding-right:2mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[2]</xsl:with-param>
									</xsl:call-template>-->
								Married filing jointly
								<!--</label>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
								</xsl:call-template>-->
								<input type="checkbox" alt="Married filing separately" class="styCkbox" style="margin:.5mm 0mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[3]</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:.25mm;"/>
								<!--<label>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[3]</xsl:with-param>
									</xsl:call-template>-->
									  Married filing separately (MFS) 
									<!--</label>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
								</xsl:call-template>-->
								<input type="checkbox" alt="Head of household" class="styCkbox" style="margin:.5mm 0mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'4'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[4]</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:.25mm;"/>
								<!--<label style="padding-right:2mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[4]</xsl:with-param>
									</xsl:call-template>-->
									  Head of household
								<!--</label>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
								</xsl:call-template>-->
								<input type="checkbox" alt="Qualifying surviving spouse" class="styCkbox" style="margin:.5mm 0mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'5'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[5]</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:.25mm;"/>
								<!--<label style="padding-right:2mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[5]</xsl:with-param>
									</xsl:call-template>-->
									  Qualifying surviving spouse 
									<!--</label>-->
								<br/>
                
				If you checked the MFS box, enter spouse's social security no. above and full name here: 
                  
								<span style="width:55mm;border-width:0px 0px 1px 0px;border-style:solid;border-color:black;font-size:7pt;margin-left:2mm;">
									<xsl:choose>
									<xsl:when test="$Form1040SSData/NRALiteralCd='NRA'">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1040SSData/NRALiteralCd"/>
										</xsl:call-template>
									</xsl:when>								
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1040SSData/SpouseNm"/>
										</xsl:call-template>
									</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
						</div>
						<!-- (2) ////////////////////////////////////////////////////-->
						<div class="styIRS1040SSPRLineItem" style="height:10mm;">
							<div class="styIRS1040SSPRLNLeftNumBox" style="padding:0mm 1.5mm .75mm 0mm;">2</div>
							<div class="styIRS1040SSPRLNDesc" style="width:180mm;padding:0mm 0mm 1mm 2.5mm;">
								<b>Qualifying children.</b> Complete <b>only</b> if you are a bona fide resident of Puerto Rico and you are claiming the additional child tax credit.
                <br/>If more than four qualifying children, see instructions and check here 
                <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...................</span>
                 <input type="checkbox" alt="MoreDependents" class="styCkbox" style="margin:.5mm 0mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/MoreDependentsInd"/>
										<xsl:with-param name="BackupName">Form1040SSDataMoreDependentsInd[1]</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styGenericDiv" style="width:3.2mm;height:4mm;float:right;clear:none;">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/QualifyingChildInfoGrp"/>
									<xsl:with-param name="containerHeight" select="6"/>
									<xsl:with-param name="containerID" select=" 'QualifyingChildInfoGrpDiv' "/>
									<xsl:with-param name="headerHeight" select="1"/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-bottom-width:.1px">
						<!-- (Table) ///////////////////////////////////////////////-->
						<div class="styIRS1040SSPRLineItem" style="width:187mm;height:auto;">
							<div id="QualifyingChildInfoGrpDiv" class="styTableContainerNBB" style="width:187mm;clear:all;height:auto;">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" cellspacing="0">
									<thead class="styTableThead">
										<xsl:call-template name="QualifyingChildrenTableHeaders_1040SS"/>
									</thead>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form1040SSData/QualifyingChildInfoGrp">
											<xsl:if test="($Print != $Separated) or (count($Form1040SSData/QualifyingChildInfoGrp) &lt;=6)">
												<xsl:call-template name="QualifyingChildrenTableRows_1040SS">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="count($Form1040SSData/QualifyingChildInfoGrp) &lt; 1 or ((count($Form1040SSData/QualifyingChildInfoGrp) &gt;4) and ($Print = $Separated))">
											<xsl:call-template name="QualifyingChildrenTableRows_1040SS">
												<xsl:with-param name="AddAdditionalDataMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="count($Form1040SSData/QualifyingChildInfoGrp) &lt; 2 or ((count($Form1040SSData/QualifyingChildInfoGrp) &gt;4) and ($Print = $Separated))">
											<xsl:call-template name="QualifyingChildrenTableRows_1040SS"/>
										</xsl:if>
										<xsl:if test="count($Form1040SSData/QualifyingChildInfoGrp) &lt; 3 or ((count($Form1040SSData/QualifyingChildInfoGrp) &gt;4) and ($Print = $Separated))">
											<xsl:call-template name="QualifyingChildrenTableRows_1040SS"/>
										</xsl:if>
										<xsl:if test="count($Form1040SSData/QualifyingChildInfoGrp) &lt; 4 or ((count($Form1040SSData/QualifyingChildInfoGrp) &gt;4) and ($Print = $Separated))">
											<xsl:call-template name="QualifyingChildrenTableRows_1040SS"/>
										</xsl:if>
									</tbody>
								</table>
							</div>
							<!-- Set Initial Height of Above Table -->
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$Form1040SSData/QualifyingChildInfoGrp"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="headerRowCount" select="1"/>
								<xsl:with-param name="containerID" select=" 'QualifyingChildInfoGrpDiv' "/>
							</xsl:call-template>
							<!-- End Set Initial Height of Above Table -->
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- (3) ////////////////////////////////////////////////////-->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">3</xsl:with-param>
						<xsl:with-param name="Description">Self-employment tax from Schedule SE (Form 1040),  line 12. Attach Schedule SE (Form 1040) and applicable schedules.</xsl:with-param>
						<xsl:with-param name="Dots">.......</xsl:with-param>
						<xsl:with-param name="Rows">2</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/SelfEmploymentTaxAmt"/>
						</xsl:call-template>
						<!-- (4) ////////////////////////////////////////////////////-->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">4</xsl:with-param>
						<xsl:with-param name="Description">Household employment taxes. Attach Schedule H (Form 1040)
						<span style="width:2mm"/>
						<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1040SSData/HouseholdEmploymentTaxAmt"/>
						</xsl:call-template>
						</xsl:with-param>
						<xsl:with-param name="Dots">..</xsl:with-param>
						<xsl:with-param name="Rows">1</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/HouseholdEmploymentTaxAmt"/>
						</xsl:call-template>
						<!-- (5) ////////////////////////////////////////////////////-->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">5</xsl:with-param>
						<xsl:with-param name="Description">Additional Medicare Tax.  Attach Form 8959
						<span style="width:2mm"/>
						<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalAMRRTTaxAmt"/>
						</xsl:call-template>
						</xsl:with-param>
						<xsl:with-param name="Dots">.........</xsl:with-param>
						<xsl:with-param name="Rows">1</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalAMRRTTaxAmt"/>
						</xsl:call-template>
						<!-- (6) ////////////////////////////////////////////////////-->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">6</xsl:with-param>
						<xsl:with-param name="Description">Other taxes</xsl:with-param>
						<xsl:with-param name="Dots">.............
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 6 - Repayment Of Advance Payment Received In Error Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalOtherTaxAdditionsGrp/RepymtOfAdvncPymtRcvdInErrGrp/RepymtOfAdvncPymtRcvdInErrCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 6 - Repayment Of Advance Payment Received In Error Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAdditionsGrp/RepymtOfAdvncPymtRcvdInErrGrp/RepymtOfAdvncPymtRcvdInErrAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 6 - Social Security Medicare Tax Unreported Tip Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalOtherTaxAdditionsGrp/SocSecMedicareTaxUnrptdTipGrp/SocSecMedicareTaxUnrptdTipAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 6 - Tax On Tips Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalOtherTaxAdditionsGrp/SocSecMedicareTaxUnrptdTipGrp/TaxOnTipsCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Tax On Tips Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalOtherTaxAdditionsGrp/UncollectedSocSecTaxOnTipsGrp/UncollectedTaxCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Tax On Tips Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalOtherTaxAdditionsGrp/UncollectedSocSecTaxOnTipsGrp/UncollectedSocSecTaxOnTipsAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Medicare Tax Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalOtherTaxAdditionsGrp/UncollectedSocSecMedTaxGrp/UncollectedTaxCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Medicare Tax Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalOtherTaxAdditionsGrp/UncollectedSocSecMedTaxGrp/UncollectedSocSecMedTaxAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Medicare Tax GTLI Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalOtherTaxAdditionsGrp/UncollectedSocSecMedTaxGTLIGrp/UncollectedTaxCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 6 - Uncollected Social Security Medicare Tax GTLI Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalOtherTaxAdditionsGrp/UncollectedSocSecMedTaxGTLIGrp/UncollectedSocSecMedTaxGTLIAmt"/>
								</xsl:call-template>												
						</xsl:with-param>
						<xsl:with-param name="Rows">1</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalOtherTaxAdditionsGrp/TotalOtherTaxesAmt"/>
						</xsl:call-template>

						<!-- (7) ////////////////////////////////////////////////////-->
						<div class="styIRS1040SSPRLineItem" style="height:4mm;">
							<div class="styIRS1040SSPRLNLeftNumBox">7</div>
							<div class="styIRS1040SSPRLNDesc" style="width:auto;">
								<b>Total tax.</b> Add lines 3 through 6. 
                    <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">....................</span>
								</div>
							<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040SS">
										<xsl:with-param name="Number">7</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (8) ////////////////////////////////////////////////////-->
						<div class="styIRS1040SSPRLineItem" style="height:4mm;">
							<div class="styIRS1040SSPRLNLeftNumBox">8</div>
							<div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding-top:.75mm;">
                    2024 estimated tax payments 
                    <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........</span>
							</div>
							<div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040SS">
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040SS">
										<xsl:with-param name="Number">8</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040SSData/EstimatedTaxPaymentsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (9) ////////////////////////////////////////////////////-->
						<div class="styIRS1040SSPRLineItem" style="height:4mm;">
							<div class="styIRS1040SSPRLNLeftNumBox">9</div>
							<div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding-top:.65mm;">
                    Excess social security tax withheld 
                    <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.......</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/ExSocSecTaxWithheldAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040SS">
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040SS">
										<xsl:with-param name="Number">9</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040SSData/ExSocSecTaxWithheldAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (10) ////////////////////////////////////////////////////-->
						<div class="styIRS1040SSPRLineItem" style="height:4mm;">
							<div class="styIRS1040SSPRLNLeftNumBox">10</div>
							<div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding-top:.75mm;">
                    Additional child tax credit from Part II, line 19
                    <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........</span>
							</div>
							<div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040SS">
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040SS">
										<xsl:with-param name="Number">10</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/AdditionalChildTaxCreditAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (11a) ////////////////////////////////////////////////////-->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">11</xsl:with-param>
						<xsl:with-param name="Letter">a</xsl:with-param>
						<xsl:with-param name="Description">Additional Medicare Tax withheld. Attach Form 8959
						<span style="width:2mm"/>
						<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1040SSData/AddlMedcrRRTTaxWithholdingAmt"/>
						</xsl:call-template>
						</xsl:with-param>
						<xsl:with-param name="Dots">.....</xsl:with-param>
						<xsl:with-param name="Rows">11a</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/AddlMedcrRRTTaxWithholdingAmt"/>
						</xsl:call-template>
						<!-- (11b) ////////////////////////////////////////////////////-->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">11</xsl:with-param>
						<xsl:with-param name="Letter">b</xsl:with-param>
						<xsl:with-param name="Description">Amount paid with request for extension of time to file
						<span style="width:2mm"/>
						<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1040SSData/RequestForExtensionAmt"/>
						</xsl:call-template>
						</xsl:with-param>
						<xsl:with-param name="Dots">....</xsl:with-param>
						<xsl:with-param name="Rows">11a</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/RequestForExtensionAmt"/>
						</xsl:call-template>


						<!-- (12) ////////////////////////////////////////////////////-->
						<div class="styIRS1040SSPRLineItem" style="height:4mm;">
							<div class="styIRS1040SSPRLNLeftNumBox">12</div>
							<div class="styIRS1040SSPRLNDesc" style="width:auto;height:4mm;padding-top:.75mm;">
								<b>Total payments and credits.</b> Add lines 8 through 11b.
                   <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">............</span>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 12 - Request for Extension Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalPaymentsAmt/@requestForExtensionCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 12 - Request for Extension Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalPaymentsAmt/@requestForExtensionAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 12 - Additional Medicare Tax Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040SSData/AddnlMedicareTaxWithheldGrp/AdditionalMedicareTaxCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 12 - Additional Medicare Withholding Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040SSData/AddnlMedicareTaxWithheldGrp/AddlMedcrRRTTaxWithholdingAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040SS">
										<xsl:with-param name="Number">12</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalPaymentsAmt"/>
										<xsl:with-param name="AmountBoxStyle"> border-width:0px 0px 1px 1px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle"> border-width:0px 0px 1px 1px;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (13) ////////////////////////////////////////////////////-->
						<div class="styIRS1040SSPRLineItem" style="height:4mm;">
							<div class="styIRS1040SSPRLNLeftNumBox">13</div>
							<div class="styIRS1040SSPRLNDesc" style="width:auto; height:4mm;">
                    If line 12 is more than line 7, subtract line 7 from line 12. This is the amount you <b>overpaid</b>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....</span>
							</div>
							<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040SS">
										<xsl:with-param name="Number">13</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040SSData/OverpaidAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (14a) ////////////////////////////////////////////////////-->
						<div class="styIRS1040SSPRLineItem">
							<div class="styIRS1040SSPRLNLeftNumBox" style="padding-right:0px;">14a</div>
							<div class="styIRS1040SSPRLNDesc" style="width:auto;padding-top:.5mm;">
                    Amount of line 13 you want <b>refunded to you.</b> If Form 8888 is attached, check here
                  <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...</span>
							</div>
							<xsl:choose>
								<xsl:when test="$Form1040SSData/Form8888Ind/@referenceDocumentId">
									<span style="width:.25mm;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/Form8888Ind"/>
									</xsl:call-template>
									<span style="width:.25mm;"/>
								</xsl:when>
								<xsl:otherwise>
									<span style="width:.25mm"/>
								</xsl:otherwise>
							</xsl:choose>
							<span style="width:.5mm"/>
							<span style="width:.5mm"/>
							<input type="checkbox" alt="Form8888Ind" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/Form8888Ind"/>
									<xsl:with-param name="BackupName">Form1040SSDataForm8888Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/Form8888Ind"/>
									<xsl:with-param name="BackupName">Form1040SSDataForm8888Ind</xsl:with-param>
								</xsl:call-template>
							</label>
							<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040SS">
										<xsl:with-param name="Number">14a</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040SSData/RefundAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (14b-14c) ////////////////////////////////////////////////////-->
						<div class="styIRS1040SSPRLineItem" style="padding-left:150mm;height:3mm;">
							<xsl:call-template name="CreateBox_1040SS">
								<xsl:with-param name="AmountBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040SSPRLineItem" style="height:4mm;">
							<div class="styIRS1040SSPRLNLeftNumBox" style="padding:1mm 0mm .5mm 0mm;">b</div>
							<div class="styIRS1040SSPRLNDesc" style="width:25mm;padding:.5mm 0mm 1mm 1mm;;">
                Routing Number
              </div>
							<span class="styLNCtrNumBox" style="width:50mm;height:4mm;border-width:1px 1px 1px 1px;text-align:center;margin-top:.5mm;padding:.5mm 0mm 0mm 0mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/RoutingTransitNum"/>
								</xsl:call-template>
							</span>
							<span style="width:1mm;"/>
							
							<span style="width:.5mm;"/>
							<span class="styBoldText">c</span> Type:
							<span style="width:.5mm;"/>
							<input class="styCkbox" alt="Checking" type="checkbox">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
									<xsl:with-param name="BackupName">Form1040SSDataBankAccountTypeCd</xsl:with-param>
								</xsl:call-template>
							</input>
							<!--<label>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/BankAccountTypeCd"/>
								</xsl:call-template>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
									<xsl:with-param name="BackupName">Form1040SSDataBankAccountTypeCd</xsl:with-param>
								</xsl:call-template>-->
                  Checking
							<!--</label>-->
							<span style="width:.5mm;"/>
							<input class="styCkbox" alt="Savings" type="checkbox">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
									<xsl:with-param name="BackupName">Form1040SSDataBankAccountTypeCd</xsl:with-param>
								</xsl:call-template>
							</input>
							<!--<label>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/BankAccountTypeCd"/>
								</xsl:call-template>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
									<xsl:with-param name="BackupName">Form1040SSDataBankAccountTypeCd</xsl:with-param>
								</xsl:call-template>-->
                  Savings
                <!--</label>-->
							<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040SS">
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (14d) ////////////////////////////////////////////////////-->
						<div class="styIRS1040SSPRLineItem" style="height:4mm;">
							<div class="styIRS1040SSPRLNLeftNumBox" style="padding:2.5mm 0mm 0mm 0mm;">d</div>
							<div class="styIRS1040SSPRLNDesc" style="width:25mm;padding:2.25mm 0mm 0mm 1mm;">
                Account Number
              </div>
							<span class="styLNCtrNumBox" style="width:90mm;height:4mm;border-width:1px 1px 1px 1px;text-align:center;margin-top:1.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/DepositorAccountNum"/>
								</xsl:call-template>
							</span>
							<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040SS">
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styIRS1040SSPRLineItem" style="padding-left:150mm;height:4mm;">
							<xsl:call-template name="CreateBox_1040SS">
								<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (15) ////////////////////////////////////////////////////-->
						<div class="styIRS1040SSPRLineItem" style="height:4mm;">
							<div class="styIRS1040SSPRLNLeftNumBox">15</div>
							<div class="styIRS1040SSPRLNDesc" style="width:auto;padding-top:.65mm;">
                    Amount of line 13 you want <b>applied to 2025 estimated tax</b>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....</span>
								
							</div>
							<div class="styIRS1040SSPRCleanDiv" style="width:75mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040SS">
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040SS">
										<xsl:with-param name="Number">15</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040SSData/AppliedToEsTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (16) ////////////////////////////////////////////////////-->
						<div class="styIRS1040SSPRLineItem" style="height:4mm;">
							<div class="styIRS1040SSPRLNLeftNumBox">16</div>
							<div class="styIRS1040SSPRLNDesc" style="width:auto;padding-bottom:.5mm;">
								<b>Amount you owe.</b> If line 7 is more than line 12, subtract line 12 from line 7
                    <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........</span>
								
							</div>
							<div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040SS">
										<xsl:with-param name="Number">16</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040SSData/OwedAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Third Party Designee -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="styBB" style="width:187mm;border-top-width:1.25px;">
						<div class="styIRS1040SSPRLineItem" style="height:12mm;">
							<!-- Header -->
							<div style="width:22mm;float:left;">
								<div style="padding-top:1mm;padding-bottom:0mm;">
									<span class="styMainTitle" style="font-size:11pt;">
                   Third Party</span>
									<span style="font-weight:bold;font-size:11pt;padding-top:.25mm;">  
                   Designee                
                </span>
								</div>
							</div>
							<!-- Body -->
							<div style="float:left;width:165mm;">
								<div style="font-size:7pt;float:left;padding:.75mm 0mm 0mm 3mm;">
						 Do you want to allow another person to discuss this return with the IRS? See instructions.
				</div>
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<div style="float:left;padding:0mm 0mm 2mm .25mm;">
									<!-- Checkbox -->
									<input type="checkbox" alt="ThirdPartyDesigneeIndYes" class="styCkbox" style="margin:.25mm .25mm;">
										<!--<xsl:if test="$Form1040SSData/ThirdPartyDesigneeInd">-->
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1040SSData/ThirdPartyDesigneeInd"/>
												<xsl:with-param name="BackupName">IRS1040SSThirdPartyDesigneeInd</xsl:with-param>
											</xsl:call-template>
										<!--</xsl:if>-->
									</input>
									<!--<label>
										<!-<xsl:if test="$Form1040SSData/ThirdPartyDesigneeInd">->
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form1040SSData/ThirdPartyDesigneeInd"/>
												<xsl:with-param name="BackupName">IRS1040SSThirdPartyDesigneeInd</xsl:with-param>
											</xsl:call-template>->
										<!-</xsl:if>-->
										<b>Yes.</b> Complete the following.
									<!--</label>-->
								</div>
								<div style="float:left;padding-left:1.5mm;">
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<input type="checkbox" alt="ThirdPartyDesigneeIndNo" class="styCkbox" style="margin:.25mm .25mm;">
										<!--<xsl:if test="$Form1040SSData/ThirdPartyDesigneeInd">-->
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1040SSData/ThirdPartyDesigneeInd"/>
												<xsl:with-param name="BackupName">IRS1040SSThirdPartyDesigneeInd</xsl:with-param>
											</xsl:call-template>
										<!--</xsl:if>-->
									</input>
									<!--<label>
										<!-<xsl:if test="$Form1040SSData/ThirdPartyDesigneeInd">->
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form1040SSData/ThirdPartyDesigneeInd"/>
												<xsl:with-param name="BackupName">IRS1040SSThirdPartyDesigneeInd</xsl:with-param>
											</xsl:call-template>->
										<!-</xsl:if>-->
										<span class="styBoldText">No</span>
									<!--</label>-->
								</div>
								<div style="height:2mm;float:left;width:165mm;">
									<div style="height:10mm;float:left;clear:none;width:22mm;font-size:7pt;padding:0mm 0mm 4mm 3mm;">Designee's<br/>
										<span style="padding-top:.5mm;">name</span>
										<span style="width:3.5mm;"/>
										
									</div>
									<div style="width:47mm;float:left;clear:none;padding:3.5mm 0mm 0mm 0mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1040SSData/ThirdPartyDesigneeNm"/>
										</xsl:call-template>
									</div>
									<div style="float:left;width:13mm;padding-left:.5mm;font-size:7pt;">
                Phone<br/>
										<span style="padding-top:.5mm;"> no</span>
										<span style="width:2.5mm;"/>
										
									</div>
									<div style="float:left;width:27mm;padding-top:2mm;">
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$Form1040SSData/ThirdPartyDesigneePhoneNum"/>
										</xsl:call-template>
									</div>
									<div style="float:left;width:32mm;padding-bottom:1mm;padding-left:5mm;font-size:7pt;">
				Personal Identification 
                <span style="padding-top:.5mm;">Number (PIN)</span>
										<span style="width:6.75mm;"/>
										
									</div>
									<div class="styLNCtrNumBox" style="float:right;width:20mm;border-top-width:1px;margin-top:1.5mm;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$Form1040SSData/ThirdPartyDesigneePIN"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Sign Here -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="styBB" style="width:187mm;float:none;">
						<div class="styIRS1040SSPRLineItem" style="height:28.5mm;">
							<!-- Header -->
							<div class="styIRS1040SSPRCleanDiv" style="width:22mm;height:100%;">
								<span class="styBoldText" style="font-size:11pt;">Sign<br/>Here</span>
								<div class="styIRS1040SSPRCleanDiv" style="width:22mm;padding-top:2mm;">
                    Joint Return?<br/>
                    See instructions.<br/>
                    Keep a copy<br/>
                    for your<br/>
                    records.
                  </div>
							</div>
							<!-- Body -->
							<div class="styIRS1040SSPRCleanDiv" style="width:165mm;height:100%;">
								<div class="styIRS1040SSPRLNDesc" style="width:100%;height:8.5mm;padding:0mm 0mm 0mm 3mm;font-size:7pt;">
                  Under penalties of perjury, I declare that I have examined this return and accompanying schedules and statements, and to the best of my knowledge
                  and belief, they are true, correct, and complete. Declaration of preparer (other than the taxpayer) is based on all information of which the preparer has
                  any knowledge.
                </div>
								<!-- Container -->
								<div class="styIRS1040SSPRCleanDiv" style="width:100%;">
									<!-- Line 1 -->
									<!--<img src="{$ImagePath}/1040SS_Bullet_Lg.gif" alt="Large right arrow" width="19" height="49" style="float:left;margin:3.25mm -4mm;padding-left:2mm;"/>-->
									<div class="styIRS1040SSPRCleanDiv" style="width:162mm;margin-left:3mm;height:10mm;border-bottom-width:1px;border-color:black;">
										<!-- Your Signature -->
										<div class="styIRS1040SSPRLNDesc" style="width:48mm;height:9.5mm;border-right-width:1px;border-color:black;padding-left:0mm;font-size:7pt;">
                      Your signature<br/>
											<span style="width:100%;padding-top:6px;">
												<xsl:call-template name="PopulatePin">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignaturePIN"/>
													<xsl:with-param name="BackupName">RtnHdrDataPrimarySignature</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
										<!-- Date -->
										<div class="styIRS1040SSPRLNDesc" style="width:16mm;height:9.5mm;border-right-width:1px;border-color:black;padding-left:0px;font-size:7pt;">
											<span style="width:100%;padding-left:4px;">Date</span>
											<span style="width:100%;padding-top:6px;text-align:center;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDt"/>
													<xsl:with-param name="BackupName">RtnHdrDataPrimarySignatureDate</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
										<!-- Daytime phone number -->
										<div class="styIRS1040SSPRLNDesc" style="width:34mm; height:9.5mm;border-right-width:1px;border-color:black;padding-left:0px;font-size:7pt;">
											<span style="width:100%;padding-left:4px;">Daytime phone number</span>
											<span style="width:100%;padding-top:6px;text-align:center;">
												<xsl:choose>
													<xsl:when test="$RtnHdrData/Filer/PhoneNum">
														<xsl:call-template name="PopulatePhoneNumber">
															<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PhoneNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignPhoneNum"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</span>
										</div>
										<!-- Identity protection Pin -->
										<div class="styIRS1040SSPRLNDesc" style="width:62mm;height:4mm;border-color:black;padding-left:0px;font-size:7pt;">
											<span style="width:100%;padding-left:4px;">If the IRS sent you an Identity Protection PIN, enter it here (see instructions)</span>
											<div class="styLNCtrNumBox" style="float:right;width:26mm;border-top-width:1px;margin:-2mm -2mm;">
												<span style="width:100%;padding-top:1px;text-align:center;">
													<xsl:call-template name="PopulatePin">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/IdentityProtectionPIN"/>
														<xsl:with-param name="BackupName">RtnHdrDataIdentityProtectionPIN"</xsl:with-param>
													</xsl:call-template>
												</span>
											</div>
										</div>
									</div>
									<!-- Line 2 -->
									<!-- Spouse's signature -->
									<div class="styIRS1040SSPRLNDesc" style="width:85mm;height:9mm;border-right-width:1px;border-color:black;padding-left:3mm;font-size:7pt;">
                      Spouse's signature. If a joint return, <b>both</b> must sign.<br/>
                      
										<xsl:choose>
										 <xsl:when test="$Form1040SSData/SurvivingSpouseInd">
										  <span style="width:100%;padding-top:6px;">
											  Filing as a surviving spouse
										  </span>
										</xsl:when>
										<xsl:otherwise>
										<span style="width:100%;padding-top:6px;">
											<xsl:call-template name="PopulatePin">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignaturePIN"/>
												<xsl:with-param name="BackupName">RtnHdrDataSpouseSignature</xsl:with-param>
											</xsl:call-template>
										</span>
										</xsl:otherwise>
										</xsl:choose>	
									</div>
									<!-- Date -->
									<div class="styIRS1040SSPRLNDesc" style="width:16mm;height:9mm;border-right-width:1px;border-color:black;padding-left:0px;font-size:7pt;">
										<span style="width:100%;padding-left:4px;">Date</span>
										<span style="width:100%;padding-top:6px;text-align:center;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDt"/>
												<xsl:with-param name="BackupName">RtnHdrDataSpouseSignatureDate</xsl:with-param>
											</xsl:call-template>
										</span>
									</div>
									<!-- Identity protection Pin -->
									<div class="styIRS1040SSPRLNDesc" style="width:62mm;height:4mm;border-color:black;padding-left:0px;font-size:7pt;">
										<span style="width:100%;padding-left:4px;">If the IRS sent your spouse an Identity Protection PIN, enter it here (see instructions)</span>
										<div class="styLNCtrNumBox" style="float:right;width:26mm;border-top-width:1px;margin:-2mm -2mm;">
											<span style="width:100%;padding-top:1px;text-align:center;">
												<xsl:call-template name="PopulatePin">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseIdentityProtectionPIN"/>
													<xsl:with-param name="BackupName">RtnHdrDataSpouseIdentityProtectionPIN"</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Paid Preparer Use Only -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="styTBB" style="width:187mm;font-size:6.5pt;font-family:arial;float:none;">
						<div style="width:20mm;padding-top:2mm;float:left;">
							<span class="styMainTitle" style="font-size:11pt;">
                Paid
                Preparer
                Use Only
              </span>
						</div>
						<div style="width:166.5mm;float:left;border-width:0px 0px 0px 1px; border-color:black;border-style:solid;">
							<div style="width:166.5mm;height:8mm;float:left;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;height:100%">
								<div class="styFNBox" style="width:52mm;height:8mm;padding:.25mm 0mm .5mm 1mm;">
                Preparer's name<br/>
									<div style="padding-top:1mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerPersonName</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:43.5mm;height:8mm;padding:.25mm 0mm .5mm 1mm;border-right-width:1 solid black;">
                Preparer's signature
              </div>
								<div class="styFNBox" style="width:20mm;height:8mm;padding:.25mm 0mm .5mm 1mm;">Date <br/>
									<div style="padding-top:1mm;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationDateSigned</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:27mm;height:8mm;padding:0mm 0mm .5mm 1mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
										</xsl:call-template>
                    Check 
                    <input class="styCkbox" alt="If self-employed" type="checkbox" style="width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:1mm"/>if<br/>self-employed 
                  </label>
								</div>
								<div class="styFNBox" style="width:15mm;height:8mm;padding:.25mm 0mm .5mm 1mm;border-right:none;">PTIN<br/>
									<div style="padding-top:1mm;">
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerSSN</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPTIN</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/STIN">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">STIN</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSTIN</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
							</div>
							<div style="width:166.5mm;float:left;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styFNBox" style=";width:115.5mm;height:8mm">
									<span class="styGenericDiv" style="padding:1.5mm 0mm 0mm 1mm;">Firm's name 
                  <span style="width:2.4mm;"/>
										
										<span style="width:1mm;"/>
									</span>
									<div style="width:90mm;height:8mm;padding-top:1.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName2</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:32mm;height:4mm;padding:1.5mm 0mm 0mm 1mm;border-right:none;">Firm's EIN
                <span style="width:.5mm;"/>
									
									<span style="width:1mm;"/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerFirmIDNumber</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReason">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationMissingEINReason</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:164mm;float:left;">
								<div class="styFNBox" style="width:115.5mm;height:12mm;">
									<div class="styGenericDiv" style="padding:1.5mm 0mm 0mm 1mm">Firm's address 
                  
									</div>
									<div class="styGenericDiv" style="width:57mm;height:9mm;padding:1.5mm 0mm 0mm 1mm">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine2</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
											</xsl:call-template>,
					  <span style="width:.25mm;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressState</xsl:with-param>
											</xsl:call-template>,
					  <span style="width:.25mm;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressZip</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
											</xsl:call-template>,
                      <span style="width:.25mm;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrState</xsl:with-param>
											</xsl:call-template>,
					  <span style="width:.25mm;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCd</xsl:with-param>
											</xsl:call-template>,
					  <span style="width:.25mm;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountryCd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styFNBox" style="width:32mm;height:4mm;padding:1.5mm 0mm 0mm 1mm;border-right:none;"> Phone no. 
                <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">Phone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPhone</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPhone</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:.25mm;">
						<div style="float:left;">
							<span class="styBoldText">
                For Disclosure, Privacy Act, and Paperwork Reduction Act Notice,<br/>see instructions.
              </span>
						</div>
						<div style="float:left; padding-left:10mm; font-size:7pt; font-style:italic; ">
            www.irs.gov/Form1040SS
            </div>
						<div style="float:right; font-size:7pt;">
              Cat. No. 17184B
              <span style="width:50px;"/>  
              Form <span class="styBoldText" style="font-size:8pt;">1040-SS</span> (2024)
            </div>
					</div>
					<p style="page-break-before: always"/>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page Header -->
		<div style="width:187mm;padding-top:.5mm;">
			<div style="float:right;">
				Version A, Cycle 6
			</div>
		</div>
					<div class="styTBB" style="width:187mm;padding-top:1.5mm;">
						<div style="float:left;">
              Form 1040-SS (2024)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">
              Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					
					<!-- ====== Begin Part II =====================================-->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					
					<!-- Header -->
					<div style="width:187mm; padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:11mm;height:4mm;font-size:9pt;">Part II</div>
						<div class="styPartDesc" style="padding:.25mm 0mm 0mm 2mm;font-size:8.5pt;">
						Bona Fide Residents of Puerto Rico Claiming Additional Child Tax Credit 
						<span style="font-weight: normal">(see instructions)</span>
						</div>
					</div>
					
						<!-- Body -->
						<div class="styBB" style="width:187mm;">

						<!-- II Line 1 -->
						<div class="styIRS1040SSPRLineItem" style="height:14mm" >
						<div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">1</div>
						<div class="styIRS1040SSPRLNDesc" style="width:142mm;">
						Do you have one or more qualifying children under age 17 with the required social security number?<br/>
						<input type="checkbox" class="styCkbox" alt="QualifyingChildInd No">
							<xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/QualifyingChildInd"/>
							<xsl:with-param name="BackupName" select="IRS1040SSPRQualifyingChildInd"/>
							</xsl:call-template>
						</input>
						<span class="styBoldText">No.</span> 
						Stop. You can’t claim the credit.<br/>
						<input type="checkbox" class="styCkbox" alt="QualifyingChildInd Yes">
							<xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/QualifyingChildInd"/>
							<xsl:with-param name="BackupName" select="IRS1040SSPRQualifyingChildInd"/>
							</xsl:call-template>
						</input>
						<span class="styBoldText">Yes.</span>
						Go to line 2.					
						</div>
						<div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right; height:14mm">
						<div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;height:14mm">
							
							<xsl:call-template name="CreateBox_1040SS">
								<xsl:with-param name="AmountBoxStyle"></xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">background-color:lightgrey</xsl:with-param>
								<xsl:with-param name="Height">14mm</xsl:with-param>
							</xsl:call-template>
						</div>
						</div>
						</div>

						<!-- II Line 2 -->
						<xsl:call-template name="RegularLine">
						<xsl:with-param name="Number">2</xsl:with-param>
						<xsl:with-param name="Description">
						Number of qualifying children under age 17 with the required social security number:<br/>
						<span style="width:10mm; height:100%; border-bottom: 1px solid black">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/QlfyChildUnderAgeSSNCnt"/>
						</xsl:call-template></span>
						x  $1,700. 
						</xsl:with-param>
						<xsl:with-param name="Dots">.......................</xsl:with-param>
						<xsl:with-param name="Rows">2</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/QlfyChildUnderAgeSSNLimtAmt"/>
						</xsl:call-template>
						<!-- II Line 3 -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">3</xsl:with-param>
						<xsl:with-param name="Description">Enter your modified adjusted gross income</xsl:with-param>
						<xsl:with-param name="Dots">...........</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/ModifiedAGIAmt"/>
						</xsl:call-template>
						<!-- II Line 4 -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">4</xsl:with-param>
						<xsl:with-param name="Description">Enter the amount shown below for your filing status </xsl:with-param>
						<xsl:with-param name="Dots">........</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/FilingStatusThresholdCd"/>
						</xsl:call-template>
						<!-- II Below Line 4 -->
						<div class="styIRS1040SSPRLineItem" style="height:8mm">
							<div class="styIRS1040SSPRLNDesc" style="width:105mm; height:8mm; padding-left:10mm">
								<img src="{$ImagePath}/1040_Bullet_Round.gif" alt="Round Bullet"/> 
								Married filling jointly - $400,000
								<br/>
								<img src="{$ImagePath}/1040_Bullet_Round.gif" alt="Round Bullet"/> 
								All other filling statuses - $200,000
							</div>
							<div class="styIRS1040SSPRCleanDiv" style="width:75mm;padding:0px 0px 0px 0px;float:right; height:8mm">
								<div class="styIRS1040SSPRCleanDiv" style="width:37mm;	float:right;height:8mm">
									<xsl:call-template name="CreateBox_1040SS">
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px; padding:0 0 0 0;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px; padding:0 0 0 0;background-color:lightgrey;</xsl:with-param>
										<xsl:with-param name="Height">8mm</xsl:with-param> 
									</xsl:call-template>
								</div>
								<div class="styIRS1040SSPRCleanDiv" style="width:37mm;	float:right;height:8mm">
									<xsl:call-template name="CreateBox_1040SS">
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 1px 1px; padding:0 0 0 0;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 1px 1px; padding:0 0 0 0;background-color:lightgrey;</xsl:with-param>
										<xsl:with-param name="Height">8mm</xsl:with-param> 
									</xsl:call-template>
								</div>
							</div>
						</div>
						
						<!-- II Line 5 -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">5</xsl:with-param>
						<xsl:with-param name="Description">
							Is the amount on line 3 more than the amount on line 4?<br/>
							<input type="checkbox" class="styCkbox" alt="MAGIMoreThanThresholdInd No">
								<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/MAGIMoreThanThresholdInd "/>
								<xsl:with-param name="BackupName" select="IRS1040SSPRMAGIMoreThanThresholdInd "/>
								</xsl:call-template>
							</input>
							<span class="styBoldText">No.</span> 
							Leave line 5 blank. Enter the amount from line 2 on line 11, and go to line 12.<br/>
							<input type="checkbox" class="styCkbox" alt="MAGIMoreThanThresholdInd Yes">
								<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/MAGIMoreThanThresholdInd "/>
								<xsl:with-param name="BackupName" select="IRS1040SSPRMAGIMoreThanThresholdInd "/>
								</xsl:call-template>
							</input>
							<span class="styBoldText">Yes.</span>
							Subtract line 4 from line 3. If the result isn’t a multiple of $1,000, increase it to the next multiple of $1,000 (for example, increase $425 to $1,000, increase $1,025 to $2,000, etc.)
						</xsl:with-param>
						<xsl:with-param name="Dots">...........</xsl:with-param>
						<xsl:with-param name="Rows">6</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/MAGILessThresholdAmt"/>
						</xsl:call-template>
						<!-- II Line 6 -->
						<xsl:call-template name="RegularLine">
						<xsl:with-param name="Number">6</xsl:with-param>
						<xsl:with-param name="Description">Multiply the amount on line 5 by 5% (0.05).  </xsl:with-param>
						<xsl:with-param name="Dots">...............</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/ModifiedAGIPhaseOutAmt"/>
						</xsl:call-template>
						<!-- II Line 7 -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">7</xsl:with-param>
						<xsl:with-param name="Description">Number of qualifying children from line 2 x $2,000. </xsl:with-param>
						<xsl:with-param name="Dots">...</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/QlfyChildUnderAgeSSNLimtAmtLN7"/>
						</xsl:call-template>
						<!-- II Line 8 -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">8</xsl:with-param>
						<xsl:with-param name="Description">
						Number of other dependents, including children who are not under age 17:<br/>
						<span style="width:10mm; height:100%; border-bottom: 1px solid black">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/OtherDependentCnt"/>
						</xsl:call-template></span>
						x  $500. See instructions.
						</xsl:with-param>
						<xsl:with-param name="Dots">.......</xsl:with-param>
						<xsl:with-param name="Rows">2</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/OtherDependentCreditAmt"/>
						</xsl:call-template>
						<!-- II Line 9 -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">9</xsl:with-param>
						<xsl:with-param name="Description">Add lines 7 and 8</xsl:with-param>
						<xsl:with-param name="Dots">...................</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/InitialACTCAmt"/>
						</xsl:call-template>
						<!-- II Line 10 -->
						<xsl:call-template name="RegularLine">
						<xsl:with-param name="Number">10</xsl:with-param>
						<xsl:with-param name="Description">
							Is the amount on line 9 more than the amount on line 6?<br/>
							<input type="checkbox" class="styCkbox" alt="ACTCOverPhaseOutLimitInd No">
								<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/ACTCOverPhaseOutLimitInd"/>
								<xsl:with-param name="BackupName" select="IRS1040SSPRACTCOverPhaseOutLimitInd"/>
								</xsl:call-template>
							</input>
							<span class="styBoldText">No.</span> 
							Stop. You can’t claim the credit.<br/>
							<input type="checkbox" class="styCkbox" alt="ACTCOverPhaseOutLimitInd Yes">
								<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/ACTCOverPhaseOutLimitInd"/>
								<xsl:with-param name="BackupName" select="IRS1040SSPRACTCOverPhaseOutLimitInd"/>
								</xsl:call-template>
							</input>
							<span class="styBoldText">Yes.</span> 
							Subtract line 6 from line 9. 
						</xsl:with-param>
						<xsl:with-param name="Dots">......................</xsl:with-param>
						<xsl:with-param name="Rows">3</xsl:with-param>
						<xsl:with-param name="Height">13mm</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/ACTCLimitAmt"/>
						</xsl:call-template>
						<!-- II Line 11 -->
						<xsl:call-template name="RegularLine">
						<xsl:with-param name="Number">11</xsl:with-param>
						<xsl:with-param name="Description">Enter the <b>smaller</b> of line 2 or line 10</xsl:with-param>
						<xsl:with-param name="Dots">......................</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/ACTCAfterLimitAmt"/>
						</xsl:call-template>
						<!-- II Line 12a -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">12</xsl:with-param>
						<xsl:with-param name="Letter">a</xsl:with-param>
						<xsl:with-param name="Description">Enter one-half of self-employment tax from Part I, line 3.</xsl:with-param>
						<xsl:with-param name="Dots">......</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/OneHalfSelfEmploymentTaxAmt"/>
						</xsl:call-template>
						<!-- II Line 12b -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">12</xsl:with-param>
						<xsl:with-param name="Letter">b</xsl:with-param>
						<xsl:with-param name="Description">Enter one-half of the Additional Medicare Tax on self-employment
															income from Form 8959, line 13</xsl:with-param>
						<xsl:with-param name="Rows">2</xsl:with-param>										
						<xsl:with-param name="Dots">..............</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/OneHalfAddnlMedicareTaxAmt"/>
						</xsl:call-template>
						<!-- II Line 12c -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">12</xsl:with-param>
						<xsl:with-param name="Letter">c</xsl:with-param>
						<xsl:with-param name="Description">Add lines 12a and 12b.</xsl:with-param>
						<xsl:with-param name="Dots">.................</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/TotalSEAddnlMedicareTaxAmt"/>
						</xsl:call-template>
						<!-- II Line 13a -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">13</xsl:with-param>
						<xsl:with-param name="Letter">a</xsl:with-param>
						<xsl:with-param name="Description">
						Enter the amount, if any, of withheld social security, Medicare, 
						and Additional Medicare taxes from Puerto Rico Form(s) 499R-2/W-2PR (<b>attach copy of form(s)</b>). 
						If married filing jointly, include your spouse’s amounts with yours.
						<span style="width:2mm"/>						
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/TotalSocSecAndMedcrWithheldAmt"/>
							</xsl:call-template>	
						<span style="width:2mm"/>	
						</xsl:with-param>
						<xsl:with-param name="Dots">.....................</xsl:with-param>
						<xsl:with-param name="Rows">4</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/TotalSocSecAndMedcrWithheldAmt"/>
						</xsl:call-template>
						<!-- II Line 13b -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">13</xsl:with-param>
						<xsl:with-param name="Letter">b</xsl:with-param>
						<xsl:with-param name="Description">Enter the amount reported on Part I, line 6, if any, of employee social security and Medicare tax on tips not reported to employer from Form 4137
							</xsl:with-param>
						<xsl:with-param name="Dots">.</xsl:with-param>
						<xsl:with-param name="Rows">2</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/SocSecMedicareTaxUnrptdTipAmt"/>
						</xsl:call-template>
						<!-- II Line 13c -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">13</xsl:with-param>
						<xsl:with-param name="Letter">c</xsl:with-param>
						<xsl:with-param name="Description">Enter the amount reported on Part I, line 6, if any, of uncollected employee social security and Medicare tax on wages from Form 8919 </xsl:with-param>
						<xsl:with-param name="Dots">...</xsl:with-param>
						<xsl:with-param name="Rows">2</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/UncollectedSocSecMedTaxAmt"/>
						</xsl:call-template>
						<!-- II Line 13d -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">13</xsl:with-param>
						<xsl:with-param name="Letter">d</xsl:with-param>
						<xsl:with-param name="Description">Enter the amount reported on Part I, line 6, if any, of uncollected employee social security tax and Medicare tax on tips and group-term life
							insurance </xsl:with-param>
						<xsl:with-param name="Dots"></xsl:with-param>
						<xsl:with-param name="Rows">2</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/UncollectedSocSecMedTaxGTLIAmt"/>
						</xsl:call-template>
						<!-- II Line 13e -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">13</xsl:with-param>
						<xsl:with-param name="Letter">e</xsl:with-param>
						<xsl:with-param name="Description">Enter the amount, if any, of Additional Medicare Tax on Medicare wages from Form 8959, line 7</xsl:with-param>
						<xsl:with-param name="Dots">.................</xsl:with-param>
						<xsl:with-param name="Rows">2</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/AdditionalMedicareTaxAmt"/>
						</xsl:call-template>
						<!-- II Line 13f -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">13</xsl:with-param>
						<xsl:with-param name="Letter">f</xsl:with-param>
						<xsl:with-param name="Description">Add lines 13a through 13e</xsl:with-param>
						<xsl:with-param name="Dots">................</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/TotalWthldUncollUnrptdTaxAmt"/>
						</xsl:call-template>
						<!-- II Line 14 -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">14</xsl:with-param>
						<xsl:with-param name="Description">Add lines 12c and 13f. </xsl:with-param>
						<xsl:with-param name="Dots">............</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/TotalTaxLimitAmt"/>
						</xsl:call-template>
						<!-- II Line 15 -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">15</xsl:with-param>
						<xsl:with-param name="Description">Enter the amount, if any, of Additional Medicare Tax withheld from Form 8959, line 22</xsl:with-param>
						<xsl:with-param name="Dots">....................</xsl:with-param>
						<xsl:with-param name="Rows">2</xsl:with-param>						
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/AddnlMedicareTaxWithholdingAmt"/>
						</xsl:call-template>
						<!-- II Line 16 -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">16</xsl:with-param>
						<xsl:with-param name="Description">Subtract line 15 from line 14. </xsl:with-param>
						<xsl:with-param name="Dots">..........</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/TotalTaxAfterLimitAmt"/>
						</xsl:call-template>
						<!-- II Line 17 -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">17</xsl:with-param>
						<xsl:with-param name="Description">Enter the amount, if any, from Part I, line 9</xsl:with-param>
						<xsl:with-param name="Dots">...........</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ExSocSecTaxWithheldAmt"/>
						</xsl:call-template>
						<!-- II Line 18 -->
						<xsl:call-template name="RegularLine">
						<xsl:with-param name="Number">18</xsl:with-param>
						<xsl:with-param name="Description">
							Is the amount on line 16 more than the amount on line 17?<br/>
							<input type="checkbox" class="styCkbox" alt="ACTCTaxClaimInd No">
								<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/ACTCTaxClaimInd"/>
								<xsl:with-param name="BackupName" select="IRS1040SSPRACTCTaxClaimInd"/>
								</xsl:call-template>
							</input>
							<span class="styBoldText">No.</span> 
							Stop. You can't claim the credit.<br/>
							<input type="checkbox" class="styCkbox" alt="ACTCTaxClaimInd Yes">
								<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/ACTCTaxClaimInd"/>
								<xsl:with-param name="BackupName" select="IRS1040SSPRACTCTaxClaimInd"/>
								</xsl:call-template>
							</input>
							<span class="styBoldText">Yes.</span> Subtract line 17 from line 16 
						</xsl:with-param>
						<xsl:with-param name="Dots">................</xsl:with-param>
						<xsl:with-param name="Rows">3</xsl:with-param>
						<xsl:with-param name="Height">13mm</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/ACTCTaxLimitAmt"/>
						</xsl:call-template>
						<!-- II Line 19 -->
						<xsl:call-template name="RegularLine">
						<xsl:with-param name="Number">19</xsl:with-param>
						<xsl:with-param name="Description"><b>Additional child tax credit.</b> Enter the smaller of line 11 or line 18 here and on Part I, line 10</xsl:with-param>
						<xsl:with-param name="Dots">...</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/AdditionalChildTaxCreditAmt"/>
						<xsl:with-param name="Rows">1</xsl:with-param>						
						</xsl:call-template>

					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm; padding-top:.25mm;">
						<div style="float:right;">
							<span style="width:50px;"/>	Form 
						    <span class="styBoldText" style="font-size:8pt;">1040-SS</span> (2024)
					    </div>
					</div>
					<p style="page-break-before: always"/>
					<!-- END Page Break and Footer-->
		

					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
						<div class="styLeftOverTitle">
              Additional Data        
            </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<xsl:variable name="TableWidth">130</xsl:variable>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1040SSData"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:if test="$Form1040SSData/PrimaryDeathDt">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Top Left Margin - Primary Date of Death</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040SSData/PrimaryDeathDt"/>
								<xsl:with-param name="DescWidth" select="$TableWidth"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$Form1040SSData/SpouseDeathDt">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Top Left Margin - Spouse Date of Death</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040SSData/SpouseDeathDt"/>
								<xsl:with-param name="DescWidth" select="$TableWidth"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Non Paid Preparer Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/NonPaidPreparerCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<!--<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Refund product code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/RefundProductCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>-->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Refund product code text</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/RefundProductCodeTxt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Power Of Attorney Signed By</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/PowerOfAttorneySignedByInd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Power Of Attorney Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/PowerOfAttorneyNm"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Personal Representative Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/PersonalRepresentativeInd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Surviving Spouse Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/SurvivingSpouseInd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - Header - In Care Of Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:for-each select="$Form1040SSData/QualifyingChildInfoGrp">
							<xsl:variable name="Num">
								<xsl:number value="position()" format="1"/>
							</xsl:variable>
							<xsl:if test="QualifyingChildNameControlTxt">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part I - Line 2 - Qualifying Child Name Control (Row <xsl:value-of select="$Num"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="QualifyingChildNameControlTxt"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:for-each>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 6 - Repayment Of Advance Payment Received In Error Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAdditionsGrp/RepymtOfAdvncPymtRcvdInErrGrp/RepymtOfAdvncPymtRcvdInErrCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I, Line 6 - Repayment Of Advance Payment Received In Error Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAdditionsGrp/RepymtOfAdvncPymtRcvdInErrGrp/RepymtOfAdvncPymtRcvdInErrAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I - Line 6 - Tax On Tips Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAdditionsGrp/SocSecMedicareTaxUnrptdTipGrp/TaxOnTipsCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I - Line 6 - Social Security Medicare Tax Unreported Tip Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAdditionsGrp/SocSecMedicareTaxUnrptdTipGrp/SocSecMedicareTaxUnrptdTipAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I - Line 6 - Uncollected Social Security Tax On Tips Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAdditionsGrp/UncollectedSocSecTaxOnTipsGrp/UncollectedTaxCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I - Line 6 - Uncollected Social Security Tax On Tips Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAdditionsGrp/UncollectedSocSecTaxOnTipsGrp/UncollectedSocSecTaxOnTipsAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I - Line 6 - Uncollected Social Security Medicare Tax Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGrp/UncollectedTaxCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I - Line 6 - Uncollected Social Security Medicare Tax Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGrp/UncollectedSocSecMedTaxAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I - Line 6 - Uncollected Social Security Medicare Tax GTLI Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGTLIGrp/UncollectedTaxCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I - Line 6 - Uncollected Social Security Medicare Tax GTLI Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGTLIGrp/UncollectedSocSecMedTaxGTLIAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 12 - Request for Extension Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalPaymentsAmt/@requestForExtensionCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I, Line 12 - Request for Extension Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalPaymentsAmt/@requestForExtensionAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 12 - Additional Medicare Tax Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/AddnlMedicareTaxWithheldGrp/AdditionalMedicareTaxCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I, Line 12 - Additional Medicare Withholding Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/AddnlMedicareTaxWithheldGrp/AddlMedcrRRTTaxWithholdingAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<!--           PYEI 2021-->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part II, Line 2 - Prior year employment tax code </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/PriorYearEmploymentTaxCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part II, Line 2 - Prior year social security, medicare and additional medicare tax withheld amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/PYSSMedcrAddnlMedcrTxWthldAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part II, Line 3 - Prior year self employment tax code </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/PriorYearSelfEmploymentTaxCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part II, Line 3 - Prior year self employment tax amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/PriorYearSelfEmploymentTaxAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:for-each select="$Form1040SSData/FarmingProfitLoss">
							<xsl:if test="FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt/@section263AIndicatorCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part III - Section B - Line 34(e) - Section 263 A Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt/@section263AIndicatorCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt/Desc">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part III - Section B - Line 34(e) - Total Preproductive Period Expenses</xsl:with-param>
									<xsl:with-param name="TargetNode" select="FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt/Desc"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="$Form1040SSData/FarmingProfitLoss">
							<xsl:if test="FarmExpensesGrp/NetFarmProfitLossAmt/@passiveActivityLossLiteralCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part III - Section B - Line 36 - Passive Activity Loss Literal Code (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="FarmExpensesGrp/NetFarmProfitLossAmt/@passiveActivityLossLiteralCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="$Form1040SSData/SelfEmploymentTaxGrp">
							<xsl:if test="SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Self-Employment Tax Exempt Code (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt">
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part V - Line 3 - Self-Employment Tax Exempt Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Chap 11 Bankruptcy Income Code (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt">
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part V - Line 3 - Chap 11 Bankruptcy Income Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Community Income Taxed To Spouse Code (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseAmt">
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part V - Line 3 - Community Income Taxed To Spouse Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseAmt"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Exempt Community Income Code (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt">
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part V - Line 3 - Exempt Community Income Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Additional Income Or Loss Code (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt">
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part V - Line 3 - Additional Income Or Loss Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:for-each>
					</table>
					<!--	  -->
					<!-- (34a-e) //////////////////////////////////////////////////// -->
					<!--          
           <xsl:if test="($Print = $Separated) and (count($Form1040SSData/FarmingProfitLoss/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense) &gt; 5)">
			<span class="styRepeatingDataTitle">Form
             <xsl:if test="/AppData/Parameters/SubmissionType='1040SS'">
                  1040-SS
                </xsl:if>
                <xsl:if test="/AppData/Parameters/SubmissionType='1040PR'">
                  1040-SS
                </xsl:if>                
                Part III - Section B - Line 34 - Other Expenses			
			</span>
				<table class="styDepTbl" cellspacing="0" style="font-size:7pt;font-family:arial;width:100mm;">
					<thead class="styTableThead">
						<tr class="styDepTblHdr">
							<th class="styIRS1040SSPRTableCell" scope="col" rowspan="2" style="width:10mm;font-weight:normal;">
								Letter
							</th>
							<th class="styIRS1040SSPRTableCell" scope="col" rowspan="2" style="width:55mm;font-weight:normal;">
								Description
							</th>
							<th class="styIRS1040SSPRTableCell" scope="col" rowspan="2" style="width:35mm;font-weight:normal;">
								Amount
							</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="$Form1040SSData/FarmingProfitLoss/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense">
							<xsl:variable name="Letter">
								<xsl:number format="a"/>
							</xsl:variable>
							<tr style="border-color:black;height:6mm;">
								<xsl:attribute name="class">
									<xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
								<td class="styTableCellText" style="width:10mm;text-align:center;">
									<xsl:value-of select="$Letter"/>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellText" style="width:55mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="Desc"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellText" style="width:35mm;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="Amt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
          </xsl:if> -->
					<!-- Separated Data for Part I - Qualifying Children -->
					<xsl:if test="($Print = $Separated) and  (count($Form1040SSData/QualifyingChildInfoGrp) &gt; 6)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							<xsl:if test="/AppData/Parameters/SubmissionType='1040SS'">
                  Form 1040-SS
                </xsl:if>
							<xsl:if test="/AppData/Parameters/SubmissionType='1040PR'">
                  Formulario 1040-SS
                </xsl:if>              
              , Part I - Qualifying Children
            </span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<xsl:call-template name="QualifyingChildrenTableHeaders_1040SS">
									<xsl:with-param name="AddColoredHeaders">true</xsl:with-param>
								</xsl:call-template>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1040SSData/QualifyingChildInfoGrp">
									<xsl:call-template name="QualifyingChildrenTableRows_1040SS">
										<xsl:with-param name="TargetNode" select="."/>
										<xsl:with-param name="AddColoredRows">true</xsl:with-param>
									</xsl:call-template>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<!-- Begin Separated Repeating data table for Special Condition Description-->
					<xsl:if test="$Form1040SSData/SpecialConditionDesc">
						<span class="styRepeatingDataTitle">Top Left Margin - Special Condition Description</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;">
					  Special Condition Description
				   </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$Form1040SSData/SpecialConditionDesc">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;" class="styGenericDiv">
												<div style="width:6mm;font-weight:bold;float:right;clear:none;">
													<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
														<xsl:value-of select="position()"/>
													</span>
												</div>
											</div>
											<div style="width:80mm;float:none;clear:none;">
												<xsl:variable name="pos" select="position()"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
													<xsl:with-param name="BackupName">IRS1040SSPRSpecialConditionDescription</xsl:with-param>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Repeating data table for Special Condition Description-->
					<br/>
					<!-- Begin Separated Repeating data table for Refund Product Code -->
					<xsl:if test="$Form1040SSData/RefundProductCd ">
						<span class="styRepeatingDataTitle">Top Left Margin - Refund Product Code</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;">
					   Refund Product Code
				   </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$Form1040SSData/RefundProductCd">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;" class="styGenericDiv">
												<div style="width:6mm;font-weight:bold;float:right;clear:none;">
													<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
														<xsl:value-of select="position()"/>
													</span>
												</div>
											</div>
											<div style="width:80mm;float:none;clear:none;">
												<xsl:variable name="pos" select="position()"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
													<xsl:with-param name="BackupName">IRS1040SSPRRefund Product Code</xsl:with-param>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Repeating data table for Refund Product Code-->
					<!--(43) ////////////////////////////////////////////////////-->
					<xsl:for-each select="$Form1040SSData/FarmingProfitLoss">
						<xsl:if test="FarmIncomeAccrualMethodGrp and (count(FarmIncomeAccrualMethodGrp/OtherIncomeGrp) &gt; 0)">
							<br/>
							<br/>
							<span class="styRepeatingDataTitle">
								<xsl:if test="/AppData/Parameters/SubmissionType='1040SS'">
                  Form 1040-SS
                </xsl:if>
								<xsl:if test="/AppData/Parameters/SubmissionType='1040PR'">
                  Formulario 1040-SS
                </xsl:if>                
                Part III - Section C - Line 43 - Other Farm Income<br/>
                Name of proprietor:<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="FarmProprietorName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<xsl:if test="FarmProprietorName/BusinessNameLine2Txt">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="FarmProprietorName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
							</span>
							<xsl:variable name="CellStyle">border-color:black;font-size:7pt;text-align:center;font-family:arial;padding-left:0px;padding-right:0px;</xsl:variable>
							<table class="styDepTbl" cellspacing="0">
								<thead>
									<tr class="styDepTblHdr">
										<th class="styIRS1040SSPRTableCell" scope="col">
											<xsl:attribute name="style">width:50%;<xsl:value-of select="$CellStyle"/></xsl:attribute>
                      Other Income Type
                    </th>
										<th class="styIRS1040SSPRTableCell" scope="col">
											<xsl:attribute name="style">width:50%;<xsl:value-of select="$CellStyle"/></xsl:attribute>
                      Other Income Including<br/>Gas Fuel Tax Credit
                    </th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="FarmIncomeAccrualMethodGrp/OtherIncomeGrp">
										<tr style="font-size:7pt;font-family:arial;">
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<!-- ++++++++++++++++++++++++++++++++++ -->
											<td class="styIRS1040SSPRTableCell">
												<xsl:attribute name="style">
                          width:50%;text-align:left;
                          <xsl:if test="position() = last()">
                            border-bottom-width:0px;
                          </xsl:if></xsl:attribute>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OtherIncomeTyp"/>
												</xsl:call-template>
											</td>
											<!-- ++++++++++++++++++++++++++++++++++ -->
											<td class="styIRS1040SSPRTableCell">
												<xsl:attribute name="style">
                          width:50%;text-align:right;
                          <xsl:if test="position() = last()">
                            border-bottom-width:0px;
                          </xsl:if></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OthIncmIncludingGasFuelTxCrAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:for-each>
				</form>
			</body>
		</html>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:  CreateBox_1040SS) -->
	<!-- CreateBox_1040SS template -->
	<xsl:template name="CreateBox_1040SS">
		<xsl:param name="TargetNode"/>
		<xsl:param name="AmountBoxStyle"/>
		<xsl:param name="PopulateAsText"/>
		<xsl:param name="AddParentheses"/>
		<xsl:param name="StaticText"/>
		<xsl:param name="Number"/>
		<xsl:param name="NumberBoxStyle"/>
		<xsl:param name="Width">29mm</xsl:param>
		<xsl:param name="Height">4mm</xsl:param>
		<div class="styLNRightNumBox">
			<xsl:attribute name="style">
				padding:2px 0px 0px 0px;
				border-right-width:0px;font-size:8pt;
				height:<xsl:value-of select="$Height"/>;
				<xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if>
			</xsl:attribute>
			<xsl:if test="$Number">
				<xsl:value-of select="$Number"/>
			</xsl:if>
		</div>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
        width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
        border-right-width:0px;text-align:right;padding-right:2px;font-size:7pt;
        <xsl:choose><xsl:when test="$TargetNode"><xsl:choose><xsl:when test="$TargetNode/@referenceDocumentId">padding-top:2px;</xsl:when><xsl:otherwise>padding-top:4px;</xsl:otherwise></xsl:choose></xsl:when><xsl:otherwise>padding-top:3px;</xsl:otherwise></xsl:choose><xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:choose>
				<xsl:when test="$TargetNode">
					<xsl:if test="$AddParentheses">
            (<span style="width:5px;"/>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="$PopulateAsText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$TargetNode"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="$AddParentheses">
						<span style="width:5px;"/>)
          </xsl:if>
				</xsl:when>
				<xsl:when test="$StaticText">
					<xsl:value-of select="$StaticText"/>
				</xsl:when>
				<xsl:when test="not($TargetNode) and not($StaticText) and $AddParentheses">
          (<span style="width:23mm;"/>)
        </xsl:when>
			</xsl:choose>
		</div>
	</xsl:template>


	<!-- ////////////////////////////////////////////////////////////// (Template: QualifyingChildrenTableHeaders_1040SS) -->
	<xsl:template name="QualifyingChildrenTableHeaders_1040SS">
		<xsl:param name="AddColoredHeaders"/>
		<xsl:variable name="CommonStyle">border-color:black;font-size:7pt;text-align:center;font-family:arial;padding-left:0px;padding-right:0px;</xsl:variable>
		<tr>
			<xsl:if test="$AddColoredHeaders">
				<xsl:attribute name="class">styDepTblHdr</xsl:attribute>
			</xsl:if>
			<th class="styIRS1040SSPRTableCell" scope="col">
				<xsl:attribute name="style">width:104mm;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				<span class="styNormalText">
					<b>(a)</b>  First name<span style="width:10mm;"/>Last name</span>
			</th>
			<th class="styIRS1040SSPRTableCell" scope="col">
				<xsl:attribute name="style">width:41.5mm;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				<span class="styNormalText">
					<b>(b)</b> Child's<br/>social security number</span>
			</th>
			<th class="styIRS1040SSPRTableCell" scope="col">
				<xsl:attribute name="style">width:41.5mm;<xsl:value-of select="$CommonStyle"/>;border-right-width:0px;</xsl:attribute>
				<span class="styNormalText">
					<b>(c)</b> Child's<br/>relationship to you</span>
			</th>
		</tr>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template: QualifyingChildrenTableRows_1040SS) -->
	<xsl:template name="QualifyingChildrenTableRows_1040SS">
		<xsl:param name="TargetNode"/>
		<xsl:param name="AddColoredRows"/>
		<xsl:param name="AddAdditionalDataMessage"/>
		<!-- IsLast -->
		<xsl:variable name="IsLast">
			<xsl:if test="$TargetNode and (position() = last())">
			border-bottom-width:1px;
			</xsl:if>
		</xsl:variable>
		<!-- ClassType -->
		<xsl:variable name="ClassType">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
				<xsl:otherwise>styDepTblRow2</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<tr style="font-size:7pt;font-family:arial;">
			<xsl:if test="$AddColoredRows">
				<xsl:attribute name="class"><xsl:value-of select="$ClassType"/></xsl:attribute>
			</xsl:if>
			<!-- First/Last Name +++++++++++++ -->
			<td class="styIRS1040SSPRTableCell">
				<xsl:attribute name="style">width:104mm;height:4mm;text-align:left;<xsl:value-of select="$IsLast"/></xsl:attribute>
				<xsl:if test="$TargetNode">
					<span style="width:40mm;text-align:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="QualifyingChildFirstNm"/>
						</xsl:call-template>
					</span>
					<span style="width:14mm;"/>
					<span style="width:40mm;text-align:left;;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="QualifyingChildLastNm"/>
						</xsl:call-template>
					</span>
					<span style="width:4mm;">
						<xsl:if test="$TargetNode/QualifyingChildNameControlTxt">
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Part I, Line 2 - Qualifying Child <xsl:number value="position()"/> Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$TargetNode/QualifyingChildNameControlTxt"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</xsl:if>
				<xsl:if test="not($TargetNode)">
					<span style="width:4px"/>
				</xsl:if>
				<xsl:if test="$AddAdditionalDataMessage">
					<xsl:if test="((count($Form1040SSData/QualifyingChildInfoGrp) &gt;6) and ($Print = $Separated))">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form1040SSData/QualifyingChildInfoGrp"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
			</td>
			<!-- (a) +++++++++++++++++++++++ -->
			<td class="styIRS1040SSPRTableCell">
				<xsl:attribute name="style">width:37mm;height:4mm;text-align:center;<xsl:value-of select="$IsLast"/></xsl:attribute>
				<xsl:if test="$TargetNode">
				<xsl:choose>
					<xsl:when test="$TargetNode/DiedLiteralCd='DIED'">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="DiedLiteralCd"/>
					</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
					<xsl:call-template name="PopulateSSN">
						<xsl:with-param name="TargetNode" select="QualifyingChildIdentifyingNum"/>
					</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				</xsl:if>
				<xsl:if test="not($TargetNode)">
					<span style="width:4px"/>
				</xsl:if>
			</td>
			<!-- (b) +++++++++++++++++++++++ -->
			<td class="styIRS1040SSPRTableCell">
				<xsl:attribute name="style">width:37mm;height:4mm;text-align:left;border-right-width:0px;<xsl:value-of select="$IsLast"/></xsl:attribute>
				<xsl:if test="$TargetNode">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="ChildRelationshipCd"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="not($TargetNode)">
					<span style="width:4px"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="IRS1040PR">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="ES">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1040SSData)"/>
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
				<meta name="Desc" content="IRS Form 1040PR"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040SSStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="IRS1040PR" style="font-family:arial;">
				    
				    <xsl:if test="$Form1040SSData/CorrectedReturnInd='X'">
						<span style="padding-right:10mm; color:red; font-size:10pt;font-weight:bold;"> CORRECTED </span>
					</xsl:if>
					<xsl:if test="$Form1040SSData/SupersededReturnInd='X'">
						<span style="padding-right:10mm; color:red; font-size:10pt;font-weight:bold;"> SUPERSEDED </span>
					</xsl:if>
					<xsl:if test="$Form1040SSData/ChangeDt != '' ">
						<span style="padding-right:10mm; color:red; font-size:10pt;font-weight:bold;"> Date of Change: <xsl:value-of select="$Form1040SSData/ChangeDt"/> </span>
					</xsl:if>
				    <xsl:if test="$Form1040SSData/AddressChangeInd='X'">
						<span style="color:red; font-size:10pt;font-weight:bold;"> ADDRESS CHANGE </span>
					</xsl:if>
					
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:35mm;height:27mm;border-right-width:2px;padding-top:.5mm;">
							Formulario <span class="styFormNumber" style="font-size:10pt;">1040-SS</span>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1040SSData"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Special Condition Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040SSData/SpecialConditionDesc[1]"/>
							</xsl:call-template>
							<xsl:if test="$Form1040SSData/PrimaryDeathDt">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Top Left Margin - Primary Date of Death</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040SSData/PrimaryDeathDt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$Form1040SSData/SpouseDeathDt">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Top Left Margin - Spouse Date of Death</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040SSData/SpouseDeathDt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Non Paid Preparer Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040SSData/NonPaidPreparerCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Power Of Attorney Signed By</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040SSData/PowerOfAttorneySignedByInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Power Of Attorney Name</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040SSData/PowerOfAttorneyNm"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Personal Representative Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040SSData/PersonalRepresentativeInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Surviving Spouse Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040SSData/SurvivingSpouseInd"/>
							</xsl:call-template>
							<!--<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Refund Product Code </xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040SSData/RefundProductCd[1]"/>
							</xsl:call-template>-->
							<br/>
							<span class="styAgency" style="padding-top:5.5mm;">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:17mm;font-size:10pt;">
								Declaración de Impuestos Federal sobre el<br/>
								Trabajo por Cuenta Propia (Incluyendo el Crédito Tributario <br/>Adicional por
								Hijos para Residentes <span class="styItalicText">Bona Fide</span> de Puerto Rico)<br/>
									<span style="font-size:5.5pt;">
								Islas Vírgenes Estadounidenses, Guam, Samoa Estadounidense, 
								la Mancomunidad de las Islas Marianas del Norte o Puerto Rico</span>
							</div>
							<div class="styFST" style="height:5mm;font-size:7pt;text-align:center;width:100%;">
								<span style="text-align:center;font-weight:bold;width:100%;">
									<div style="width:100%;height:5mm;padding-left:0px;">
										<div style="width:100%;height:5mm;font-size:7.5pt;font-family:arial narrow;">
											<span class="styNormalText">
												Para el año correspondiente del 1 de enero al 31 de diciembre de 2024, o cualquier otro<br/>
												año tributario comenzando el
												<span style="width:29mm;padding-left:3px;text-align:center;">
													<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
												</span>
												y terminando el
												<span style="width:29mm;padding-left:3px;text-align:center;">
													<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
												</span>.
											</span>
											<!--<br/>
											<span style="">
												Visite <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form1040pr">
													<i>www.irs.gov/Form1040PR</i>
												</a> para obtener las instrucciones y la información más reciente.
												 	
											</span>-->
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:27mm;height:27mm;border-left-width:2px;">
							<div class="styOMB" style="height:4mm;font-size:7pt;">OMB No. 1545-0074</div>
							<div class="styTY" style="padding-top:3.5mm;">20<span class="styTYColor">24</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<div class="styBB" style="width:187mm;height:55mm;">
						
						<div class="styIRS1040PRCleanDiv" style="width:100%;height:100%;">
							<!-- Line 1 -->
							<div class="styIRS1040PRCleanDiv" style="width:100%;height:16%;border-bottom-width:1px;">
								<div class="styIRS1040PRCleanDiv" style="width:40%;height:100%;border-right-width:1px;">
									<div class="styIRS1040PRLNDesc" style="width:100%;auto;font-size:7pt;padding:0mm 0mm 0mm 1mm;">
										Nombre e inicial de su segundo nombre
										<span style="width:.5mm;padding:.5mm 0mm 0mm 1mm;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
										</xsl:call-template>
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding:.25mm 0mm 0mm 1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">Name</xsl:with-param>
											<xsl:with-param name="BackupName">RtnHdrDataFilerName</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:30%;height:100%;border-right-width:1px;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										Apellido
									</div>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:29.9%;height:100%;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										<b>Su número de Seguro Social</b>
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding:1mm 0mm 0mm 1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
											<xsl:with-param name="EINChanged">true</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
							</div>
							<!-- Line 2 -->
							<div class="styIRS1040PRCleanDiv" style="width:100%;height:16%;border-bottom-width:1px;">
								<div class="styIRS1040PRCleanDiv" style="width:40%;height:100%;border-right-width:1px;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:0mm 0mm 0mm 1mm;">
										Si es una declaración conjunta, nombre e inicial del cónyuge
										<span style="width:.5mm;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
										</xsl:call-template>
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">SpouseName</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:30%;height:100%;border-right-width:1px;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										Apellido
									</div>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:29.9%;height:100%;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:1mm 0mm 0mm 1mm;">
										<b>Número de Seguro Social del cónyuge</b>
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
											<xsl:with-param name="EINChanged">true</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
							</div>
							<!-- Line 3 -->
							<div class="styIRS1040PRCleanDiv" style="width:100%;height:16%;border-bottom-width:1px;">
								<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
									Dirección postal (número, calle, número de apartamento o ruta rural)
								</div>
								<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
									<xsl:if test="$RtnHdrData/Filer/USAddress">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine1</xsl:with-param>
										</xsl:call-template>
										<span style="width:2mm;"/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine2</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine1</xsl:with-param>
										</xsl:call-template>
										<span style="width:2mm;"/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine2</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
							<!-- Line 4 -->
							<div class="styIRS1040PRCleanDiv" style="width:100%;height:18%;border-bottom-width:1px;">
								<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
									Ciudad, pueblo u oficina postal, estado libre asociado o territorio y código postal ( <span class="styItalicText">ZIP</span>)
								</div>
								<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
									<xsl:choose>
										<xsl:when test="$RtnHdrData/Filer/ForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
							<!-- Line 5 -->
							<div class="styIRS1040PRCleanDiv" style="width:100%;height:18%;border-bottom-width:1px;">
								<div class="styIRS1040PRCleanDiv" style="width:40%;height:100%;border-right-width:1px;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										Nombre del país extranjero
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
											<xsl:with-param name="MainForm" select="true()"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:30%;height:100%;border-right-width:1px;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										Provincia/estado/condado extranjero 
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:29.9%;height:100%;">
									<div class="styIRS1040PRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										Código postal extranjero
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
							</div>
							<!-- Line 6 -->
							<div class="styIRS1040SSPRCleanDiv" style="width:100%;height:16%;">
								<div class="styIRS1040SSPRCleanDiv" style="width:187mm;height:100%;">
									<div class="styIRS1040SSPRLNDesc" style="width:100%;height:auto;font-size:7pt;padding:.5mm 0mm 0mm 1mm;">
								En algún momento durante 2024, ¿(a) recibió (como recompensa, premio o pago por bienes o servicios) o (b) vendió, intercambió o de otra manera<br/> enajenó un activo digital (o un interés financiero en un activo digital)? (Vea las instrucciones) 
							<xsl:call-template name="PopulateYesNoGroup_PR">
											<xsl:with-param name="TargetNode" select="$Form1040SSData/VirtualCurAcquiredDurTYInd"/>
											<xsl:with-param name="BackupName">Form1040SSData/VirtualCurAcquiredDurTYInd</xsl:with-param>
											<xsl:with-param name="AltName">VirtualCurAcquiredDurTY</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Parte I																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:12mm;font-size:9pt;background-color:black">Parte I</div>
						<div class="styPartDesc" style="padding:.25mm 0mm 0mm 4mm;font-size:8.5pt;">
							Impuesto y Créditos Totales <span style="font-weight: normal">(vea las instrucciones)</span>
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (1) ////////////////////////////////////////////////////-->
							<div class="styIRS1040SSPRLineItem" style="height:20mm;">
							<div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">1</div>
							<div class="styIRS1040SSPRLNDesc" style="width:181mm;">
								<b>Estado civil.</b> Marque el recuadro para su estado civil.<br/>
								<input type="checkbox" alt="Soltero" class="styCkbox" style="margin:.5mm 0mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[1]</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:.25mm;"/>
								<!--<label style="padding-right:2mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[1]</xsl:with-param>
									</xsl:call-template>-->
									  Soltero
								<!--</label>-->
								<input type="checkbox" alt="Casado que radica una planilla conjunta" class="styCkbox" style="margin:.5mm 0mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[2]</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:.25mm;"/>
								<!--<label style="padding-right:2mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[2]</xsl:with-param>
									</xsl:call-template>-->
								Casado que presenta una declaración conjunta
								<!--</label>-->
								<input type="checkbox" alt="Casado que radica una planilla por separado" class="styCkbox" style="margin:.5mm 0mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[3]</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:.25mm;"/>
								<!--<label>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[3]</xsl:with-param>
									</xsl:call-template>-->
									  Casado que presenta una declaración por separado 
									<!--</label>--><br/>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Jefe de familia" class="styCkbox" style="margin:.5mm 0mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'4'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[4]</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:.25mm;"/>
								<label style="padding-right:2mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[4]</xsl:with-param>
									</xsl:call-template>
									  Cabeza de familia
								</label>
								<input type="checkbox" alt="Viudo que reúne los requisitos" class="styCkbox" style="margin:.5mm 0mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'5'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[5]</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:.25mm;"/>
								<label style="padding-right:2mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[5]</xsl:with-param>
									</xsl:call-template>
									  Cónyuge sobreviviente que reúne los requisitos 
									</label>
								<br/>
                
				Si marcó el recuadro de casado que presenta una declaración por separado, anote arriba el número de Seguro Social de su cónyuge y el nombre completo aquí: 
                  
								<span style="width:130mm;border-width:0px 0px 1px 0px;border-style:solid;border-color:black;font-size:7pt;margin-left:2mm;">
								<xsl:choose>
									<xsl:when test="$Form1040SSData/NRALiteralCd='NRA'">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1040SSData/NRALiteralCd"/>
										</xsl:call-template>
									</xsl:when>								
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1040SSData/SpouseNm"/>
										</xsl:call-template>
									</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
						</div>	
					<!--	<div class="styIRS1040PRLineItem" style="height:14mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm;">1</div>
							<div class="styIRS1040PRLNDesc" style="width:181mm;height:auto;">
								<b>Estado civil.</b> Marque el encasillado para su estado civil (vea las instrucciones).
							   <xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Soltero" class="styCkbox" style="margin:.5mm 0mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[1]</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:.25mm;"/>
								<label>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[1]</xsl:with-param>
									</xsl:call-template>
									Soltero
								</label>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Casado que radica una planilla conjunta" class="styCkbox" style="margin:.5mm 0mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[2]</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:.25mm;"/>
								<label>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[2]</xsl:with-param>
									</xsl:call-template>
									Casado que radica una planilla conjunta
								</label>
								<br/>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Casado que radica una planilla por separado" class="styCkbox" style="margin:.5mm 0mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[3]</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:.25mm;"/>
								<label>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
										<xsl:with-param name="BackupName">Form1040SSDataIndividualReturnFilingStatusCd[3]</xsl:with-param>
									</xsl:call-template>
									Casado que radica una planilla por separado. Anote arriba el número de Seguro Social de su cónyuge y su nombre<br/>
									completo aquí.
									<span style="width:130mm;border-width:0px 0px 1px 0px;border-style:solid;border-color:black;font-size:7pt;margin-left:2mm;">
										<xsl:if test="$Form1040SSData/SpouseNm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1040SSData/SpouseNm"/>
											</xsl:call-template>
										</xsl:if>
									</span>
								</label>
							</div>
						</div>-->
						<!-- (2) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:8.5mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 1.5mm .75mm 0mm;">2</div>
							<div class="styIRS1040PRLNDesc" style="width:181mm;">
								<b>Hijos calificados.</b> Complete <b>sólo</b> si usted es residente bona fide de Puerto Rico y reclama el crédito tributario adicional por hijos. 
								    Si son más de cuatro hijos calificados, vea las instrucciones y marque aquí
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........</span>	
							<input type="checkbox" alt="Hijos calificados" class="styCkbox" style="margin-left:2mm">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/MoreDependentsInd"/>
										<xsl:with-param name="BackupName">Form1040SSDataMoreDependentsInd[1]</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styGenericDiv" style="width:3.2mm;height:4mm;float:right;clear:none;">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/QualifyingChildInfoGrp"/>
									<xsl:with-param name="containerHeight" select="4"/>
									<xsl:with-param name="containerID" select=" 'QualifyingChildInfoGrpDiv' "/>
									<xsl:with-param name="headerRowCount" select="1"/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- (Table) ///////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="width:187mm;height:auto;">
							<div class="styTableContainerNBB" id="QualifyingChildInfoGrpDiv" style="width:187mm;clear:all;height:auto;">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" cellspacing="0" style="width:187mm;height:4mm;">
									<thead class="styTableThead">
										<xsl:call-template name="QualifyingChildrenTableHeaders_1040PR"/>
									</thead>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form1040SSData/QualifyingChildInfoGrp">
											<xsl:if test="($Print != $Separated) or (count($Form1040SSData/QualifyingChildInfoGrp) &lt;=4)">
												<xsl:call-template name="QualifyingChildrenTableRows_1040PR">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="count($Form1040SSData/QualifyingChildInfoGrp) &lt; 1 or 
																   ((count($Form1040SSData/QualifyingChildInfoGrp) &gt;4) and ($Print = $Separated))">
											<xsl:call-template name="QualifyingChildrenTableRows_1040PR">
												<xsl:with-param name="AddAdditionalDataMessage">true</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="count($Form1040SSData/QualifyingChildInfoGrp) &lt; 2 or 
																   ((count($Form1040SSData/QualifyingChildInfoGrp) &gt;4) and ($Print = $Separated))">
											<xsl:call-template name="QualifyingChildrenTableRows_1040PR"/>
										</xsl:if>
										<xsl:if test="count($Form1040SSData/QualifyingChildInfoGrp) &lt; 3 or 
																   ((count($Form1040SSData/QualifyingChildInfoGrp) &gt;4) and ($Print = $Separated))">
											<xsl:call-template name="QualifyingChildrenTableRows_1040PR"/>
										</xsl:if>
										<xsl:if test="count($Form1040SSData/QualifyingChildInfoGrp) &lt; 4 or 
																   ((count($Form1040SSData/QualifyingChildInfoGrp) &gt;4) and ($Print = $Separated))">
											<xsl:call-template name="QualifyingChildrenTableRows_1040PR"/>
										</xsl:if>
									</tbody>
								</table>
							</div>
							<!-- Set Initial Height of Above Table -->
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$Form1040SSData/QualifyingChildInfoGrp"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="headerRowCount" select="1"/>
								<xsl:with-param name="containerID" select=" 'QualifyingChildInfoGrpDiv' "/>
							</xsl:call-template>
							<!-- End Set Initial Height of Above Table -->
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- (3) ////////////////////////////////////////////////////-->
						
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">3</xsl:with-param>
						<xsl:with-param name="Description">
						Impuesto sobre el trabajo por cuenta propia de la línea <b>12</b> del Anexo SE (Formulario 1040). Adjunte los anexos que
						correspondan. </xsl:with-param>
						<xsl:with-param name="Dots">....</xsl:with-param>
						<xsl:with-param name="Rows">2</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/SelfEmploymentTaxAmt"/>
						</xsl:call-template>
						<!-- (4) ////////////////////////////////////////////////////-->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">4</xsl:with-param>
						<xsl:with-param name="Description">Impuestos por empleados domésticos. Adjunte el Anexo H (Formulario 1040)
						<span style="width:2mm"/>
						<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1040SSData/HouseholdEmploymentTaxAmt"/>
						</xsl:call-template>
						</xsl:with-param>
						<xsl:with-param name="Dots">....................</xsl:with-param>
						<xsl:with-param name="Rows">2</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/HouseholdEmploymentTaxAmt"/>
						</xsl:call-template>
						<!-- (5) ////////////////////////////////////////////////////-->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">5</xsl:with-param>
						<xsl:with-param name="Description">Impuesto Adicional del Medicare. Adjunte el Formulario 8959
						<span style="width:2mm"/>
						<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalAMRRTTaxAmt"/>
						</xsl:call-template>
						</xsl:with-param>
						<xsl:with-param name="Dots">...</xsl:with-param>
						<xsl:with-param name="Rows">1</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalAMRRTTaxAmt"/>
						</xsl:call-template>
						<!-- (6) ////////////////////////////////////////////////////-->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">6</xsl:with-param>
						<xsl:with-param name="Description">Otros impuestos</xsl:with-param>
						<xsl:with-param name="Dots">...................</xsl:with-param>
						<xsl:with-param name="Rows">1</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalOtherTaxAdditionsGrp/TotalOtherTaxesAmt"/>
						</xsl:call-template>
						
						
						
						<!-- (7) ////////////////////////////////////////////////////-->
						<xsl:call-template name="RegularLine">
						<xsl:with-param name="Number">7</xsl:with-param>
						<xsl:with-param name="Description"><b>Impuestos totales.</b> Sume las líneas <b>3</b> a <b>6</b></xsl:with-param>
						<xsl:with-param name="Dots">....................</xsl:with-param>
						<xsl:with-param name="Rows">1</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAmt"/>
						</xsl:call-template>
						<!-- (8) ////////////////////////////////////////////////////-->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">8</xsl:with-param>
						<xsl:with-param name="Description">Pagos del impuesto estimado del año 2024

						</xsl:with-param>
						<xsl:with-param name="Dots">..........</xsl:with-param>
						<xsl:with-param name="Rows">1</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/EstimatedTaxPaymentsAmt"/>
						</xsl:call-template>
						<!-- (9) ////////////////////////////////////////////////////-->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">9</xsl:with-param>
						<xsl:with-param name="Description">Impuesto del Seguro Social retenido en exceso
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1040SSData/ExSocSecTaxWithheldAmt"/>
							</xsl:call-template>
						</xsl:with-param>
						<xsl:with-param name="Dots">........</xsl:with-param>
						<xsl:with-param name="Rows">1</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ExSocSecTaxWithheldAmt"/>
						</xsl:call-template>
						<!-- (10) ////////////////////////////////////////////////////-->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">10</xsl:with-param>
						<xsl:with-param name="Description">Crédito tributario adicional por hijos de la línea <b>19</b> de la Parte II</xsl:with-param>
						<xsl:with-param name="Dots">...</xsl:with-param>
						<xsl:with-param name="Rows">1</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/AdditionalChildTaxCreditAmt"/>
						</xsl:call-template>
						<!-- (11a) ////////////////////////////////////////////////////-->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">11</xsl:with-param>
						<xsl:with-param name="Letter">a</xsl:with-param>
						<xsl:with-param name="Description">Impuesto Adicional del Medicare retenido. Adjunte el Formulario 8959</xsl:with-param>
						<xsl:with-param name="Dots">..</xsl:with-param>
						<xsl:with-param name="Rows">1</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/AddlMedcrRRTTaxWithholdingAmt"/>
						</xsl:call-template>
						<!-- (11b) ////////////////////////////////////////////////////-->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">11</xsl:with-param>
						<xsl:with-param name="Letter">b</xsl:with-param>
						<xsl:with-param name="Description">Cantidad pagada con solicitud de prórroga para presentar</xsl:with-param>
						<xsl:with-param name="Dots">......</xsl:with-param>
						<xsl:with-param name="Rows">1</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/RequestForExtensionAmt"/>
						</xsl:call-template>
						<!-- (12) ////////////////////////////////////////////////////-->
						<xsl:call-template name="RegularLine">
						<xsl:with-param name="Number">12</xsl:with-param>
						<xsl:with-param name="Description"><b>Pagos y créditos totales.</b> Sume las líneas <b>8</b> a <b>11b</b></xsl:with-param>
						<xsl:with-param name="Dots">.................</xsl:with-param>
						<xsl:with-param name="Rows">1</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalPaymentsAmt"/>
						</xsl:call-template>

						<!-- (13) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:4mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-top:.5mm">13</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
										Si la línea <b>12</b> es mayor que la línea <b>7</b>, reste la línea <b>7</b> de la línea <b>12</b>. Ésta es la cantidad <b>pagada en exceso</b>	 								
									  <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.</span>
								
							</div>
							<div class="styIRS1040SSPRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040SSPRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040SS">
										<xsl:with-param name="Number">13</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040SSData/OverpaidAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (14a) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:7mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding:.5mm 0mm 0mm 0mm;">14a</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;">
										Cantidad de la línea <b>13</b> que quiere que le <b>reembolsen a usted</b>. Si adjunta el Formulario 8888,<br/> marque aquí
										
									  <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">............................</span>
							</div>
							<span style="margin-top:3mm">
								<xsl:choose>
									<xsl:when test="$Form1040SSData/Form8888Ind/@referenceDocumentId">
										<span style="width:.25mm;"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1040SSData/Form8888Ind"/>
										</xsl:call-template>
										<span style="width:.25mm;"/>
									</xsl:when>
									<xsl:otherwise>
										<span style="width:.25mm"/>
									</xsl:otherwise>
								</xsl:choose>
								
								<input type="checkbox" alt="Formulario 8888Ind" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040SSData/Form8888Ind"/>
										<xsl:with-param name="BackupName">Form1040SSDataForm8888Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<!--<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$Form1040SSData/Form8888Ind"/>
													<xsl:with-param name="BackupName">Form1040SSDataForm8888Ind</xsl:with-param>
												</xsl:call-template>
											</label>-->
							</span>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="AmountBoxStyle">height:3mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">height:3mm;padding:0px 0px 0px 0px;border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
									<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
										<xsl:call-template name="CreateBox_1040PR">
											<xsl:with-param name="Number">14a</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040SSData/RefundAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
						<!-- (14b-14c) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:4mm">
							<div class="styIRS1040PRLNLeftNumBox" style="padding:1.25mm 0mm .5mm 0mm;">b</div>
							<div class="styIRS1040PRLNDesc" style="width:33mm;padding:1mm 0mm 1mm 3mm;">
								Núm. de circulación
							</div>
							<span class="styLNCtrNumBox" style="width:50mm;height:4mm;border-width:1px 1px 1px 1px;text-align:center;margin-top:.5mm;padding:.5mm 0mm 0mm 0mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/RoutingTransitNum"/>
								</xsl:call-template>
							</span>
							<span style="width:1.5mm;"/>
							
							<span style="width:.5mm;"/>
							<span class="styBoldText">c</span>
							<span style="padding-left:.75mm">Tipo:</span>
							<input class="styCkbox" alt="Corriente" type="checkbox">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
									<xsl:with-param name="BackupName">Form1040SSDataBankAccountTypeCd</xsl:with-param>
								</xsl:call-template>
							</input>
							<!--<label>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/BankAccountTypeCd"/>
								</xsl:call-template>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
									<xsl:with-param name="BackupName">Form1040SSDataBankAccountTypeCd</xsl:with-param>
								</xsl:call-template>
								<span style="width:.25mm;"/>-->									
									Corriente
								<!--</label>-->
							<span style="width:1mm;"/>
							<input class="styCkbox" alt="Ahorros" type="checkbox">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
									<xsl:with-param name="BackupName">Form1040SSDataBankAccountTypeCd</xsl:with-param>
								</xsl:call-template>
							</input>
							<!--<label>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/BankAccountTypeCd"/>
								</xsl:call-template>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
									<xsl:with-param name="BackupName">Form1040SSDataBankAccountTypeCd</xsl:with-param>
								</xsl:call-template>
								<span style="width:.25mm;"/>-->												
									Ahorros
								<!--</label>-->
							<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (14d) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:5.5mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding:2.5mm 0mm 0mm 0mm;">d</div>
							<div class="styIRS1040PRLNDesc" style="width:33mm;padding:2.25mm 0mm 0mm 3mm;">
								Núm. de cuenta
							</div>
							<span class="styLNCtrNumBox" style="width:90mm;height:4mm;border-width:1px 1px 1px 1px;text-align:center;margin-top:1.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1040SSData/DepositorAccountNum"/>
								</xsl:call-template>
							</span>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:100%;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="AmountBoxStyle">height:5.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">height:5.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (15) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:6.5mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-bottom:0mm;">15</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;padding-bottom:0mm;">
										Cantidad de la línea <b>13</b> que quiere que se le <b>aplique al impuesto<br/>
										estimado de 2025</b>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...................</span>
								
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:75mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:37mm;height:4mm;float:left;padding-top:3.0mm;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">15</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040SSData/AppliedToEsTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:37mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="AmountBoxStyle">height:6.4mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">height:6.4mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (16) ////////////////////////////////////////////////////-->
						<div class="styIRS1040PRLineItem" style="height:8mm;">
							<div class="styIRS1040PRLNLeftNumBox" style="padding-top:1mm;">16</div>
							<div class="styIRS1040PRLNDesc" style="width:auto;padding:1mm 0mm 0mm 3mm;">
								<b>Cantidad que usted adeuda.</b> Si la  línea <b>7</b> es mayor que la  línea <b>12</b>, reste la<br/>
										 línea <b>12</b> de la  línea <b>7</b>. 
										 <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">............................</span>
								
							</div>
							<div class="styIRS1040PRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS1040PRCleanDiv" style="width:37mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="AmountBoxStyle">height:4mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">height:4mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox_1040PR">
										<xsl:with-param name="Number">16</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040SSData/OwedAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Third Party Designee -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="styBB" style="width:187mm;border-bottom:1px solid black;">
						<div class="styIRS1040PRLineItem" style="height:12mm;">
							<!-- Header -->
							<div style="width:17.5mm;float:left;clear:none;">
								<div style="padding-top:1mm;padding-bottom:0mm;">
									<span class="styMainTitle" style="font-size:9pt;padding-top:1mm;">
									Tercero</span>
									<br/>
									<span style="font-weight:bold;font-size:8.5pt;padding-top:.25mm;">Autorizado</span>
								</div>
							</div>
							<!-- Body -->
							<div style="width:169.5mm;float:left;clear:none;">
								<div style="font-size:7pt;float:left;clear:none;padding:.75mm 0mm 0mm 3mm;;">
										¿Desea permitir que otra persona hable sobre esta declaración con el IRS? Vea las instrucciones.
								</div>
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<div style="float:left;clear:none;padding:0mm 0mm 2mm 3mm;">
									<!-- Checkbox -->
									<input type="checkbox" alt="Tercero Autorizado Si" class="styCkbox" style="margin:.25mm .25mm;">
										<xsl:if test="$Form1040SSData/ThirdPartyDesigneeInd">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1040SSData/ThirdPartyDesigneeInd"/>
												<xsl:with-param name="BackupName">IRS1040PRThirdPartyDesigneeInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
									<!--<label>
										<xsl:if test="$Form1040SSData/ThirdPartyDesigneeInd">
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form1040SSData/ThirdPartyDesigneeInd"/>
												<xsl:with-param name="BackupName">IRS1040PRThirdPartyDesigneeInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>-->
										<span style="width:.1mm;"/>
										<b>Sí.</b> Complete lo siguiente.
									<!--</label>-->
								</div>
								<div style="float:left;clear:none;padding-left:7mm;">
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<input type="checkbox" alt="Tercero Autorizado No" class="styCkbox" style="margin:.25mm .25mm;">
										<xsl:if test="$Form1040SSData/ThirdPartyDesigneeInd">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1040SSData/ThirdPartyDesigneeInd"/>
												<xsl:with-param name="BackupName">IRS1040PRThirdPartyDesigneeInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
									<!--<label>
										<xsl:if test="$Form1040SSData/ThirdPartyDesigneeInd">
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form1040SSData/ThirdPartyDesigneeInd"/>
												<xsl:with-param name="BackupName">IRS1040PRThirdPartyDesigneeInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>-->
										<span class="styBoldText">No</span>
									<!--</label>-->
								</div>
								<div style="height:2mm;float:left;clear:none;width:175mm;">
									<!-- Designee’s name-->
									<div style="height:10mm;float:left;clear:none;width:28mm;font-size:7pt;padding:0mm 0mm 4mm 3mm;">Nombre del<br/>
										<span style="padding-top:.25mm;"> tercero autorizado	</span>
										<span style="width:3.5mm;"/>
										
									</div>
									<div style="width:50mm;float:left;clear:none;padding:3.5mm 0mm 0mm 0mm;">
										<xsl:if test="$Form1040SSData/ThirdPartyDesigneeNm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1040SSData/ThirdPartyDesigneeNm"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$Form1040SSData/Preparer">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1040SSData/Preparer"/>
											</xsl:call-template>
										</xsl:if>
									</div>
									<!-- Phone no.-->
									<div style="float:left;clear:none;width:13mm;padding-left:.5mm;font-size:7pt;">
									Número de<br/>
										<span style="padding-top:.5mm;"> teléfono</span>
										<span style="width:1mm;"/>
										
									</div>
									<div style="float:left;clear:none;width:20mm;padding-top:3.5mm;">
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$Form1040SSData/ThirdPartyDesigneePhoneNum"/>
										</xsl:call-template>
									</div>
									<!-- Personal identification number (PIN) -->
									<div style="float:left;clear:none;width:35mm;padding-bottom:1mm;padding-left:5mm;font-size:7pt;">
									Número de identificación<br/>
										<span style="padding-top:.5mm;">personal (PIN)</span>
										<span style="width:9mm;"/>
										
									</div>
									<div class="styLNCtrNumBox" style="float:left;width:19mm;border-top-width:1px;margin-top:1.5mm;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$Form1040SSData/ThirdPartyDesigneePIN"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Sign Here -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="styBB" style="width:187mm;float:none;clear:both;">
						<div class="styIRS1040PRLineItem" style="height:28.5mm;">
							<!-- Header -->
							<div class="styIRS1040PRCleanDiv" style="width:17.5mm;height:100%;">
								<span class="styBoldText" style="font-size:9pt;padding-top:.25mm;">Firme aquí</span>
								<div class="styIRS1040PRCleanDiv" style="width:22;text-align:center;padding-top:.25mm;">
									¿Declaración<br/>conjunta?<br/> Vea las<br/>instrucciones.<br/>Conserve una<br/>
									copia para sus<br/>
									archivos.
								</div>
							</div>
							<!-- Body -->
							<div class="styIRS1040PRCleanDiv" style="width:165mm;height:100%;">
								<div class="styIRS1040PRLNDesc" style="width:100%;height:8.5mm;padding:.25mm 0mm 0mm 3mm;font-size:7pt;">
Bajo pena de perjurio, declaro que he examinado esta declaración, incluyendo todo anexo o comprobante que la acompañe, y que, a mi leal saber y entender, es verídica, correcta y completa. La declaración del preparador (que no sea el contribuyente) está basada en toda información de la cual el preparador tenga conocimiento.
								</div>
								<!-- Container -->
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:27mm;margin-left:6mm;">
									<!-- Line 1 -->
									<!--<img src="{$ImagePath}/1040PR_Bullet_Lg.gif" alt="Large right arrow" width="21" height="49" style="float:left;margin:2.5mm -4mm;padding-left:1.5mm;"/>-->
									<div class="styIRS1040PRCleanDiv" style="width:160mm;height:8mm;margin-left:3mm;border-bottom-width:1px;border-color:black;">
										<!-- Your Signature -->
										<div class="styIRS1040PRLNDesc" style="width:48mm;height:8mm;border-right-width:1px;border-color:black;padding-left:0mm;font-size:7pt;">
											Su firma<br/>
											<span style="width:100%;padding-top:6px;">
												<xsl:call-template name="PopulatePin">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignaturePIN"/>
													<xsl:with-param name="BackupName">RtnHdrDataPrimarySignature</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
										<!-- Date -->
										<div class="styIRS1040PRLNDesc" style="width:20mm;height:8mm;border-right-width:1px;border-color:black;padding-left:0px;font-size:7pt;">
											<span style="width:100%;padding-left:4px;">Fecha</span>
											<span style="width:100%;padding:1.5mm 0mm 0mm 1mm;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDt"/>
													<xsl:with-param name="BackupName">RtnHdrDataPrimarySignatureDate</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
										<!-- Daytime phone number -->
										<div class="styIRS1040PRLNDesc" style="width:40mm;height:8mm;border-right-width:1px;border-color:black;padding-left:0px;font-size:7pt;">
											<span style="width:100%;padding-left:4px;">Número de teléfono durante el día</span>
											<span style="width:100%;padding-top:6px;padding:1.5mm 0mm 0mm 1mm;">
												<xsl:choose>
													<xsl:when test="$RtnHdrData/Filer/PhoneNum">
														<xsl:call-template name="PopulatePhoneNumber">
															<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PhoneNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignPhoneNum"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</span>
										</div>
										<!-- Identity protection Pin -->
										<div class="styIRS1040SSPRLNDesc" style="width:52mm;height:8mm;border-color:black;padding-left:1mm;font-size:7pt;">
											Si el IRS le envió un "Identity Protection PIN", anótelo aquí.Vea las inst.
										<div class="styLNCtrNumBox" style="width:21mm;border-top-width:1px;float:right;margin-right:2mm;">
												<xsl:call-template name="PopulatePin">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/IdentityProtectionPIN"/>
													<xsl:with-param name="BackupName">RtnHdrDataIdentityProtectionPIN"</xsl:with-param>
												</xsl:call-template>
											</div>
										</div>
									</div>
									<!-- Line 2 -->
									<!-- Spouse’s signature -->
									<div class="styIRS1040PRLNDesc" style="width:93mm;height:12mm;border-right-width:1px;border-color:black;padding-left:3mm;font-size:6.5pt;">
											Firma del cónyuge. Si presentan conjuntamente, <b>ambos</b> cónyuges tienen que firmar.<br/>
										<xsl:choose>
										 <xsl:when test="$Form1040SSData/SurvivingSpouseInd">
										  <span style="width:100%;padding-top:6px;">
											  Presentación como cónyuge sobreviviente.
										  </span>
										</xsl:when>
										<xsl:otherwise>
										<span style="width:100%;padding-top:6px;">
											<xsl:call-template name="PopulatePin">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignaturePIN"/>
												<xsl:with-param name="BackupName">RtnHdrDataSpouseSignature</xsl:with-param>
											</xsl:call-template>
										</span>
										</xsl:otherwise>
										</xsl:choose>	
									</div>
									<!-- Date -->
									<div class="styIRS1040PRLNDesc" style="width:18mm;height:12mm;border-right-width:1px;border-color:black;padding-left:0px;font-size:7pt;">
										<span style="width:100%;padding-left:4px;">Fecha</span>
										<span style="width:100%;padding-top:6px;padding:1.5mm 0mm 0mm 1mm;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDt"/>
												<xsl:with-param name="BackupName">RtnHdrDataSpouseSignatureDate</xsl:with-param>
											</xsl:call-template>
										</span>
									</div>
									<!-- Identity protection Pin -->
									<div class="styIRS1040SSPRLNDesc" style="width:52mm;height:12mm;border-color:black;padding-left:1mm;font-size:7pt;">
											Si el IRS le envió a su cónyuge un "Identity Protection PIN", anótelo aquí. Vea las inst.
										<div class="styLNCtrNumBox" style="width:21mm;border-top-width:1px;float:right;margin-right:2mm;">
											<xsl:call-template name="PopulatePin">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseIdentityProtectionPIN"/>
												<xsl:with-param name="BackupName">RtnHdrDataSpouseIdentityProtectionPIN"</xsl:with-param>
											</xsl:call-template>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Paid Preparer Use Only -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="styTBB" style="width:187mm;padding-bottom:6.5mm;font-size:6.5pt;font-family:arial;float:none;clear:both;">
						<!-- Header -->
						<div style="width:21mm;padding-top:1mm;float:left;clear:none;">
							<span class="styMainTitle" style="font-size:9pt;">	
								Para uso<br/>exclusivo del<br/>Preparador<br/>Remunerado
						  </span>
						</div>
						<!-- Body -->
						<!-- Line 1 -->
						<div style="width:166mm;float:left;clear:none;border-width:0px 0px 0px 0px; border-color:black;border-style:solid;">
							<div style="width:166mm;height:8mm;float:left;clear:none;;border-width:0px 0px 1px 0px;border-style:solid;border-color:black;">
								<!-- Box 1 -->
								<div class="styFNBox" style="width:52mm;height:8mm;padding:.25mm 0mm .5mm 1.5mm;">
									Nombre del preparador<br/>
									<div style="padding-top:1mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
											<xsl:with-param name="BackupName">RtnHdrDataPaidPreparerInformationPreparerPersonName</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<!-- Box 2 -->
								<div class="styFNBox" style="width:43.5mm;height:8mm;padding:.25mm 0mm .5mm 1mm;border-right-width:1 solid black;">
								Firma del preparador<br/>
								</div>
								<!-- Box 3 -->
								<div class="styFNBox" style="width:20mm;height:8mm;padding:.25mm 0mm .5mm 1mm;">
								Fecha<br/>
									<div style="padding-top:1mm;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationDateSigned</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<!-- Box 4 -->
								<div class="styFNBox" style="width:27mm;height:8mm;padding:0mm 0mm .5mm 1mm;">
								Marque aquí<br/>si trabaja<br/>por cuenta propia	
							<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
										</xsl:call-template>
										<input class="styCkbox" alt="Marque aquí si el preparador trabaja por cuenta propia" type="checkbox" style="margin:-5mm 0mm 3mm 3mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
											</xsl:call-template>
										</input>
									</label>
								</div>
								<div class="styFNBox" style="width:23mm;height:8mm;padding:.25mm 0mm .5mm 1mm;border-right:none;">
									<i>PTIN</i>
									<br/>
									<div style="padding-top:1mm;">
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerSSN</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPTIN</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/STIN">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">STIN</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSTIN</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<!-- Line 2 -->
								<div class="styIRS1040PRCleanDiv" style="width:100%;height:8mm;">
									<div class="styIRS1040PRCleanDiv" style="width:40mm;height:8mm;font-size:6pt;padding-left:3mm;">
										Nombre y dirección<br/>de la empresa
									</div>
									
									<div class="styIRS1040PRCleanDiv" style="width:126mm;height:8mm;">
										<div class="styIRS1040PRCleanDiv" style="width:100%;height:6mm;border-bottom-width:1px;">
											<div class="styIRS1040PRCleanDiv" style="width:82.25mm;height:4mm;padding-top:.5mm;font-size:6pt;">
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName1</xsl:with-param>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName2</xsl:with-param>
												</xsl:call-template>
											</div>
											<div class="styIRS1040PRCleanDiv" style="width:43mm;height:6mm;font-size:6pt;border-left-width:1px;padding:.5mm 0mm 0mm .5mm;">
												Núm. de identificación del empleador<span style="width:1mm;"/>
												<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerFirmIDNumber</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReason">
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationMissingEINReason</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
											</div>
										</div>
										<div class="styIRS1040PRCleanDiv" style="width:100%;height:4mm;font-size:6pt;">
											<div class="styIRS1040PRCleanDiv" style="width:82.25mm;height:4mm;padding-top:.5mm;font-size:6pt;">
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine1</xsl:with-param>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine2</xsl:with-param>
												</xsl:call-template>
												<br/>
												<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
													</xsl:call-template>,
													<span style="width:.25mm;"/>
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressState</xsl:with-param>
													</xsl:call-template>,
													<span style="width:.25mm;"/>
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressZip</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
													</xsl:call-template>,
													<span style="width:.25mm;"/>
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrState</xsl:with-param>
													</xsl:call-template>,
													<span style="width:.25mm;"/>
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCd</xsl:with-param>
													</xsl:call-template>,
													<span style="width:.25mm;"/>
													<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
														<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountryCd</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
											</div>
											<div class="styIRS1040PRCleanDiv" style="width:43mm;height:8.5mm;font-size:6pt;border-left-width:1px;padding:.5mm 0mm 0mm .5mm;">
												Número de teléfono<span style="width:1mm;"/>
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">Phone</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPhone</xsl:with-param>
												</xsl:call-template>
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPhone</xsl:with-param>
												</xsl:call-template>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:.15mm;">
						<div style="float:left;">
							<span class="styBoldText">
								Para el Aviso sobre la Divulgación, la Ley de Confidencialidad <br/>de Información y la Ley de
								Reducción de Trámites, vea las instrucciones.
							</span>
						</div>
						<div style="float:right;">
							<span style="width:7mm;"/>  
								Form
							<span class="styBoldText" style="font-size:8pt;">1040-SS(sp)</span> (2024)
						</div>
						<div style="width:53mm; float:right; text-align:center; font-size:7pt;">
							www.irs.gov/Form1040SSSP <span style="width:2mm"/>Cat. No. 93969A
						</div>
					</div>
					<p style="page-break-before: always;"/>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page Header -->
					<div style="width:187mm;padding-top:.5mm;">
						<div style="float:right;">
							Version A, Cycle 3
						</div>
					</div>
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">
							Formulario 1040-SS (2024)
						</div>
						<div style="float:right;">
							Página <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part II SPANISH																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->

					<!-- Header -->
					<div style="width:187mm; padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:11mm;height:8mm;font-size:9pt;">Parte II</div>
						<div class="styPartDesc" style="padding:.25mm 0mm 0mm 2mm;font-size:8.5pt;">
						Residentes <i>Bona Fide</i> de Puerto Rico que Reclaman el Crédito Tributario Adicional por Hijos (ACTC)
						 
							<span class="styNormalText" style="padding-left:.5mm;">(vea las instrucciones)</span>
						</div>
					</div>
					
						<!-- Body -->
						<div class="styBB" style="width:187mm;">

						<!-- II Line 1 -->
						<div class="styIRS1040SSPRLineItem" style="height:18mm" >
						<div class="styIRS1040SSPRLNLeftNumBox" style="padding-top:.75mm;">1</div>
						<div class="styIRS1040SSPRLNDesc" style="width:142mm;">
						¿Tiene uno o más hijos calificados menores de 17 años de edad con el número de Seguro Social requerido?<br/>
						<input type="checkbox" class="styCkbox" alt="QualifyingChildInd No">
							<xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/QualifyingChildInd"/>
							<xsl:with-param name="BackupName" select="IRS1040SSPRQualifyingChildInd"/>
							</xsl:call-template>
						</input>
						<span class="styBoldText">No.</span> 
						No siga. No puede reclamar el crédito.<br/>
						<input type="checkbox" class="styCkbox" alt="QualifyingChildInd Yes">
							<xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/QualifyingChildInd"/>
							<xsl:with-param name="BackupName" select="IRS1040SSPRQualifyingChildInd"/>
							</xsl:call-template>
						</input>
						<span class="styBoldText">Sí.</span>
						Pase a la línea<b> 2</b>.					
						</div>
						<div class="styIRS1040SSPRCleanDiv" style="width:37mm;padding:0px 0px 0px 0px;float:right; height:18mm">
						<div class="styIRS1040SSPRCleanDiv" style="width:100%;float:right;height:18mm">
							
							<xsl:call-template name="CreateBox_1040SS">
								<xsl:with-param name="AmountBoxStyle"></xsl:with-param>
								<xsl:with-param name="NumberBoxStyle">background-color:lightgrey</xsl:with-param>
								<xsl:with-param name="Height">18mm</xsl:with-param>
							</xsl:call-template>
						</div>
						</div>
						</div>

						<!-- II Line 2 -->
						<xsl:call-template name="RegularLine">
						<xsl:with-param name="Number">2</xsl:with-param>
						<xsl:with-param name="Description">
						Número de hijos calificados menores de 17 años de edad con el número de Seguro Social requerido:<br/>
						<span style="width:10mm; height:100%; border-bottom: 1px solid black">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/QlfyChildUnderAgeSSNCnt"/>
						</xsl:call-template></span>
						x  $1,700
						</xsl:with-param>
						<xsl:with-param name="Dots">...........................</xsl:with-param>
						<xsl:with-param name="Rows">2</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/QlfyChildUnderAgeSSNLimtAmt"/>
						</xsl:call-template>
						<!-- II Line 3 -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">3</xsl:with-param>
						<xsl:with-param name="Description">Anote la cantidad de su ingreso bruto ajustado modificado</xsl:with-param>
						<xsl:with-param name="Dots">...........</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/ModifiedAGIAmt"/>
						</xsl:call-template>
						<!-- II Line 4 -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Rows">2</xsl:with-param>
						<xsl:with-param name="Number">4</xsl:with-param>
						<xsl:with-param name="Description">Anote la cantidad indicada a continuación que corresponda a su estado civil para
efectos de la declaración</xsl:with-param>
						<xsl:with-param name="Dots">...............</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/FilingStatusThresholdCd"/>
						</xsl:call-template>
						<!-- II Below Line 4 -->
						<div class="styIRS1040SSPRLineItem" style="height:8mm">
							<div class="styIRS1040SSPRLNDesc" style="width:105mm; height:8mm; padding-left:10mm">
								<img src="{$ImagePath}/1040_Bullet_Round.gif" alt="Round Bullet"/> 
								Casado que presenta una declaración conjunta - $400,000
								<br/>
								<img src="{$ImagePath}/1040_Bullet_Round.gif" alt="Round Bullet"/> 
								Todos los otros estados civiles - $200,000
							</div>
							<div class="styIRS1040SSPRCleanDiv" style="width:75mm;padding:0px 0px 0px 0px;float:right; height:8mm">
								<div class="styIRS1040SSPRCleanDiv" style="width:37mm;	float:right;height:8mm">
									<xsl:call-template name="CreateBox_1040SS">
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px; padding:0 0 0 0;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px; padding:0 0 0 0;background-color:lightgrey;</xsl:with-param>
										<xsl:with-param name="Height">8mm</xsl:with-param> 
									</xsl:call-template>
								</div>
								<div class="styIRS1040SSPRCleanDiv" style="width:37mm;	float:right;height:8mm">
									<xsl:call-template name="CreateBox_1040SS">
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 1px 1px; padding:0 0 0 0;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 1px 1px; padding:0 0 0 0;background-color:lightgrey;</xsl:with-param>
										<xsl:with-param name="Height">8mm</xsl:with-param> 
									</xsl:call-template>
								</div>
							</div>
						</div>
						
						<!-- II Line 5 -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">5</xsl:with-param>
						<xsl:with-param name="Description">
							¿Es la cantidad que aparece en la línea <b>3</b> mayor que la cantidad que aparece en la
línea <b>4</b>?<br/>
							<input type="checkbox" class="styCkbox" alt="MAGIMoreThanThresholdInd No">
								<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/MAGIMoreThanThresholdInd "/>
								<xsl:with-param name="BackupName" select="IRS1040SSPRMAGIMoreThanThresholdInd "/>
								</xsl:call-template>
							</input>
							<span class="styBoldText">No.</span> 
							Deje la línea <b>5</b> en blanco. Anote la cantidad de la línea <b>2</b> en la línea <b>11</b> y pase a
la línea <b>12</b>.<br/>
							<input type="checkbox" class="styCkbox" alt="MAGIMoreThanThresholdInd Yes">
								<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/MAGIMoreThanThresholdInd "/>
								<xsl:with-param name="BackupName" select="IRS1040SSPRMAGIMoreThanThresholdInd "/>
								</xsl:call-template>
							</input>
							<span class="styBoldText">Sí.</span>
							Reste la línea <b>4</b> de la línea <b>3</b>. Si el resultado no es un múltiplo de $1,000,
auméntelo al próximo múltiplo de $1,000 (por ejemplo, aumente $425 a $1,000,
$1,025 a $2,000, etcétera)
						</xsl:with-param>
						<xsl:with-param name="Dots">..........</xsl:with-param>
						<xsl:with-param name="Rows">7</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/MAGILessThresholdAmt"/>
						</xsl:call-template>
						<!-- II Line 6 -->
						<xsl:call-template name="RegularLine">
						<xsl:with-param name="Number">6</xsl:with-param>
						<xsl:with-param name="Description">Multiplique la cantidad que aparece en la línea<b> 5</b> por 5% (0.05) </xsl:with-param>
						<xsl:with-param name="Dots">.............</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/ModifiedAGIPhaseOutAmt"/>
						</xsl:call-template>
						<!-- II Line 7 -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Rows">1</xsl:with-param>
						<xsl:with-param name="Number">7</xsl:with-param>
						<xsl:with-param name="Description">Multiplique el número de hijos calificados de la línea <b>2</b> por $2,000 </xsl:with-param>
						<xsl:with-param name="Dots">...</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/QlfyChildUnderAgeSSNLimtAmtLN7"/>
						</xsl:call-template>
						<!-- II Line 8 -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">8</xsl:with-param>
						<xsl:with-param name="Description">
						Número de otros dependientes, incluyendo los hijos que no sean menores de 17 años de edad:<br/>
						<span style="width:10mm; height:100%; border-bottom: 1px solid black">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/OtherDependentCnt"/>
						</xsl:call-template></span>
						x  $500. Vea las instrucciones
						</xsl:with-param>
						<xsl:with-param name="Dots">............</xsl:with-param>
						<xsl:with-param name="Rows">3</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/OtherDependentCreditAmt"/>
						</xsl:call-template>
						<!-- II Line 9 -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">9</xsl:with-param>
						<xsl:with-param name="Description">Sume las líneas <b>7</b> y <b>8</b></xsl:with-param>
						<xsl:with-param name="Dots">..................</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/InitialACTCAmt"/>
						</xsl:call-template>
						<!-- II Line 10 -->
						<xsl:call-template name="RegularLine">
						<xsl:with-param name="Number">10</xsl:with-param>
						<xsl:with-param name="Description">
							¿Es la cantidad que aparece en la línea <b>9</b> mayor que la cantidad que aparece en la línea <b>6</b>?<br/>
							<input type="checkbox" class="styCkbox" alt="ACTCOverPhaseOutLimitInd No">
								<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/ACTCOverPhaseOutLimitInd"/>
								<xsl:with-param name="BackupName" select="IRS1040SSPRACTCOverPhaseOutLimitInd"/>
								</xsl:call-template>
							</input>
							<span class="styBoldText">No.</span> 
							No siga. No puede reclamar el crédito.<br/>
							<input type="checkbox" class="styCkbox" alt="ACTCOverPhaseOutLimitInd Yes">
								<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/ACTCOverPhaseOutLimitInd"/>
								<xsl:with-param name="BackupName" select="IRS1040SSPRACTCOverPhaseOutLimitInd"/>
								</xsl:call-template>
							</input>
							<span class="styBoldText">Sí.</span> 
							Reste la línea <b>6</b> de la línea <b>9</b>.
						</xsl:with-param>
						<xsl:with-param name="Dots">......................</xsl:with-param>
						<xsl:with-param name="Rows">3</xsl:with-param>
						<xsl:with-param name="Height">13mm</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/ACTCLimitAmt"/>
						</xsl:call-template>
						<!-- II Line 11 -->
						<xsl:call-template name="RegularLine">
						<xsl:with-param name="Number">11</xsl:with-param>
						<xsl:with-param name="Description">Anote aquí la cantidad <b>menor</b> entre la cantidad de la línea <b>2</b> o la línea <b>10</b> </xsl:with-param>
						<xsl:with-param name="Dots">..........</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/ACTCAfterLimitAmt"/>
						</xsl:call-template>
						<!-- II Line 12a -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Rows">2</xsl:with-param>	
						<xsl:with-param name="Number">12</xsl:with-param>
						<xsl:with-param name="Letter">a</xsl:with-param>
						<xsl:with-param name="Description">Anote la mitad del impuesto sobre el trabajo por cuenta propia que aparece en la línea <b>3</b>
de la Parte I</xsl:with-param>
						<xsl:with-param name="Dots">......</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/OneHalfSelfEmploymentTaxAmt"/>
						</xsl:call-template>
						<!-- II Line 12b -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">12</xsl:with-param>
						<xsl:with-param name="Letter">b</xsl:with-param>
						<xsl:with-param name="Description">Anote la mitad del Impuesto Adicional del <i>Medicare</i> que usted pagó sobre el ingreso del
trabajo por cuenta propia de la línea <b>13</b> del Formulario 8959</xsl:with-param>
						<xsl:with-param name="Rows">2</xsl:with-param>										
						<xsl:with-param name="Dots">.</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/OneHalfAddnlMedicareTaxAmt"/>
						</xsl:call-template>
						<!-- II Line 12c -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">12</xsl:with-param>
						<xsl:with-param name="Letter">c</xsl:with-param>
						<xsl:with-param name="Description">Sume las líneas <b>12a</b> y <b>12b</b></xsl:with-param>
						<xsl:with-param name="Dots">...............</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/TotalSEAddnlMedicareTaxAmt"/>
						</xsl:call-template>
						<!-- II Line 13a -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">13</xsl:with-param>
						<xsl:with-param name="Letter">a</xsl:with-param>
						<xsl:with-param name="Description">
						Anote la cantidad, si alguna, de la retención del impuesto del Seguro Social, del
						<i>Medicare</i> y del Impuesto Adicional del <i>Medicare</i> del (de los) 
						Formulario(s) 499R-2/W-2PR de Puerto Rico. (<b>adjunte copia(s) de
						dicho(s) formulario(s)</b>). Si es casado que presenta una declaración conjunta, incluya las
						cantidades de los impuestos correspondientes a su cónyuge con las suyas
						<span style="width:2mm"/>						
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/TotalSocSecAndMedcrWithheldAmt"/>
							</xsl:call-template>	
						<span style="width:2mm"/>	
						</xsl:with-param>
						<xsl:with-param name="Dots">......</xsl:with-param>
						<xsl:with-param name="Rows">6</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/TotalSocSecAndMedcrWithheldAmt"/>
						</xsl:call-template>
						<!-- II Line 13b -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">13</xsl:with-param>
						<xsl:with-param name="Letter">b</xsl:with-param>
						<xsl:with-param name="Description">Anote la cantidad declarada en la línea <b>6</b> de la Parte I, si alguna, de los impuestos del
Seguro Social y del <i>Medicare</i> sobre las propinas recibidas del empleado y no
declaradas al empleador del Formulario 4137</xsl:with-param>
						<xsl:with-param name="Dots">.....</xsl:with-param>
						<xsl:with-param name="Rows">3</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/SocSecMedicareTaxUnrptdTipAmt"/>
						</xsl:call-template>
						<!-- II Line 13c -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">13</xsl:with-param>
						<xsl:with-param name="Letter">c</xsl:with-param>
						<xsl:with-param name="Description">Anote la cantidad declarada en la línea <b>6</b> de la Parte I, si alguna, de los impuestos del
empleado del Seguro Social y del <i>Medicare</i> no retenidos sobre los salarios del
Formulario 8919</xsl:with-param>
						<xsl:with-param name="Dots">............</xsl:with-param>
						<xsl:with-param name="Rows">3</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/UncollectedSocSecMedTaxAmt"/>
						</xsl:call-template>
						<!-- II Line 13d -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">13</xsl:with-param>
						<xsl:with-param name="Letter">d</xsl:with-param>
						<xsl:with-param name="Description">Anote la cantidad declarada en la línea <b>6</b> de la Parte I, si alguna, de los impuestos del
empleado del Seguro Social y del <i>Medicare</i> no retenidos sobre propinas y seguro de
vida colectivo a término</xsl:with-param>
						<xsl:with-param name="Dots">.......</xsl:with-param>
						<xsl:with-param name="Rows">3</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/UncollectedSocSecMedTaxGTLIAmt"/>
						</xsl:call-template>
						<!-- II Line 13e -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">13</xsl:with-param>
						<xsl:with-param name="Letter">e</xsl:with-param>
						<xsl:with-param name="Description"> Anote la cantidad, si alguna, del Impuesto Adicional del <i>Medicare</i> sobre los salarios del
Medicare de la línea <b>7</b> del Formulario 8959</xsl:with-param>
						<xsl:with-param name="Dots">.......</xsl:with-param>
						<xsl:with-param name="Rows">2</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/AdditionalMedicareTaxAmt"/>
						</xsl:call-template>
						<!-- II Line 13f -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">13</xsl:with-param>
						<xsl:with-param name="Letter">f</xsl:with-param>
						<xsl:with-param name="Description">Sume las líneas <b>13a</b> a <b>13e</b></xsl:with-param>
						<xsl:with-param name="Dots">...............</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/TotalWthldUncollUnrptdTaxAmt"/>
						</xsl:call-template>
						<!-- II Line 14 -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">14</xsl:with-param>
						<xsl:with-param name="Description">Sume las líneas <b>12c</b> y <b>13f</b>. </xsl:with-param>
						<xsl:with-param name="Dots">.........</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/TotalTaxLimitAmt"/>
						</xsl:call-template>
						<!-- II Line 15 -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">15</xsl:with-param>
						<xsl:with-param name="Description">Anote la cantidad, si alguna, de la retención del Impuesto Adicional del <i>Medicare</i>
						de la línea <b>22</b> del Formulario 8959</xsl:with-param>
						<xsl:with-param name="Dots">..........</xsl:with-param>
						<xsl:with-param name="Rows">2</xsl:with-param>						
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/AddnlMedicareTaxWithholdingAmt"/>
						</xsl:call-template>
						<!-- II Line 16 -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">16</xsl:with-param>
						<xsl:with-param name="Description">Reste la línea<b> 15</b> de la línea <b>14</b> </xsl:with-param>
						<xsl:with-param name="Dots">..............</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/TotalTaxAfterLimitAmt"/>
						</xsl:call-template>
						<!-- II Line 17 -->
						<xsl:call-template name="LeftShiftedLine">
						<xsl:with-param name="Number">17</xsl:with-param>
						<xsl:with-param name="Description">Anote la cantidad, si alguna, de la línea <b>9</b> de la Parte I</xsl:with-param>
						<xsl:with-param name="Dots">......</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ExSocSecTaxWithheldAmt"/>
						</xsl:call-template>
						<!-- II Line 18 -->
						<xsl:call-template name="RegularLine">
						<xsl:with-param name="Number">18</xsl:with-param>
						<xsl:with-param name="Description">
							¿Es la cantidad que aparece en la línea <b>16</b> mayor que la que aparece en la línea <b>17</b>?<br/>
							<input type="checkbox" class="styCkbox" alt="ACTCTaxClaimInd No">
								<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/ACTCTaxClaimInd"/>
								<xsl:with-param name="BackupName" select="IRS1040SSPRACTCTaxClaimInd"/>
								</xsl:call-template>
							</input>
							<span class="styBoldText">No.</span> 
							No siga. No puede reclamar el crédito.<br/>
							<input type="checkbox" class="styCkbox" alt="ACTCTaxClaimInd Yes">
								<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/ACTCTaxClaimInd"/>
								<xsl:with-param name="BackupName" select="IRS1040SSPRACTCTaxClaimInd"/>
								</xsl:call-template>
							</input>
							<span class="styBoldText">Si.</span> Reste la línea <b>17</b> de la línea <b>16</b>
						</xsl:with-param>
						<xsl:with-param name="Dots">....................</xsl:with-param>
						<xsl:with-param name="Rows">3</xsl:with-param>
						<xsl:with-param name="Height">13mm</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/ACTCTaxLimitAmt"/>
						</xsl:call-template>
						<!-- II Line 19 -->
						<xsl:call-template name="RegularLine">
						<xsl:with-param name="Number">19</xsl:with-param>
						<xsl:with-param name="Description"><b>Crédito tributario adicional por hijos.</b> Anote la que sea <b>menor</b> entre la cantidad de la línea <b>11</b> o la línea <b>18</b>
 aquí y en la línea <b>10</b> de la Parte I</xsl:with-param>
						<xsl:with-param name="Dots">...................</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/AdditionalChildTaxCreditAmt"/>
						<xsl:with-param name="Rows">2</xsl:with-param>						
						</xsl:call-template>

					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm; padding-top:.25mm;">
						<div style="float:right;">
							<span style="width:50px;"/>	Form 
						    <span class="styBoldText" style="font-size:8pt;">1040-SS (sp)</span> (2024)
					    </div>
					</div>
					<p style="page-break-before: always"/>
					<!-- END Page Break and Footer-->
					
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<xsl:variable name="TableWidth">130</xsl:variable>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1040SSData"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Primary Date of Death</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/PrimaryDeathDt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Spouse Date of Death</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/SpouseDeathDt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:if test="$Form1040SSData/NonPaidPreparerCd">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Top Left Margin - Non Paid Preparer Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040SSData/NonPaidPreparerCd"/>
								<xsl:with-param name="DescWidth" select="$TableWidth"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Refund product code text</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/RefundProductCodeTxt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Power Of Attorney Signed By</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/PowerOfAttorneySignedByInd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Power Of Attorney Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/PowerOfAttorneyNm"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Personal Representative Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/PersonalRepresentativeInd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Surviving Spouse Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/SurvivingSpouseInd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:for-each select="$Form1040SSData/QualifyingChildInfoGrp">
							<xsl:variable name="Num">
								<xsl:number value="position()" format="1"/>
							</xsl:variable>
							<xsl:if test="QualifyingChildNameControlTxt">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part I - Line 2 - Qualifying Child Name Control (Row <xsl:value-of select="$Num"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="QualifyingChildNameControlTxt"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:for-each>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 6 - Repayment Of Advance Payment Received In Error Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAdditionsGrp/RepymtOfAdvncPymtRcvdInErrGrp/RepymtOfAdvncPymtRcvdInErrCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I, Line 6 - Repayment Of Advance Payment Received In Error Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAdditionsGrp/RepymtOfAdvncPymtRcvdInErrGrp/RepymtOfAdvncPymtRcvdInErrAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I - Line 6 - Tax On Tips Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAdditionsGrp/SocSecMedicareTaxUnrptdTipGrp/TaxOnTipsCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I - Line 6 - Social Security Medicare Tax Unrptd Tip Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAdditionsGrp/SocSecMedicareTaxUnrptdTipGrp/SocSecMedicareTaxUnrptdTipAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I - Line 6 - Uncollected Social Security Tax On Tips Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAdditionsGrp/UncollectedSocSecTaxOnTipsGrp/UncollectedTaxCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I - Line 6 - Uncollected Social Security Tax On Tips Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAdditionsGrp/UncollectedSocSecTaxOnTipsGrp/UncollectedSocSecTaxOnTipsAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I - Line 6 - Uncollected Social Security Medicare Tax Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGrp/UncollectedTaxCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I - Line 6 - Uncollected Social Security Medicare Tax Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGrp/UncollectedSocSecMedTaxAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I - Line 6 - Uncollected Social Security Medicare Tax GTLI Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGTLIGrp/UncollectedTaxCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I - Line 6 - Uncollected Social Security Medicare Tax GTLI Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalTaxAdditionsGrp/UncollectedSocSecMedTaxGTLIGrp/UncollectedSocSecMedTaxGTLIAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 12 - Request for Extension Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalPaymentsAmt/@requestForExtensionCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I, Line 12 - Request for Extension Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/TotalPaymentsAmt/@requestForExtensionAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 12 - Additional Medicare Tax Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/AddnlMedicareTaxWithheldGrp/AdditionalMedicareTaxCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I, Line 12 - Additional Medicare Withholding Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/AddnlMedicareTaxWithheldGrp/AddlMedcrRRTTaxWithholdingAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<!--           PYEI 2021-->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part II, Line 2 - Prior Year Employment Tax Code </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/PriorYearEmploymentTaxCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part II, Line 2 - PYSS Medcr Addnl Medcr Tx Wthld Amt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/PYSSMedcrAddnlMedcrTxWthldAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part II, Line 3 - Prior Year SelfEmployment Tax Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/PriorYearSelfEmploymentTaxCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part II, Line 3 - Prior Year SelfEmployment Tax Amt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SSData/ACTCBonaFideResidentsGrp/PriorYearSelfEmploymentTaxAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:for-each select="$Form1040SSData/FarmingProfitLoss">
							<xsl:if test="FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt/@section263AIndicatorCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part III - Section B - Line 34(e) - Section 263 A Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt/@section263AIndicatorCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt/Desc">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part III - Section B - Line 34(e) - Total Preproductive Period Expenses</xsl:with-param>
									<xsl:with-param name="TargetNode" select="FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt/Desc"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="$Form1040SSData/FarmingProfitLoss">
							<xsl:if test="FarmExpensesGrp/NetFarmProfitLossAmt/@passiveActivityLossLiteralCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part III - Section B - Line 36 - Passive Activity Loss Literal Code (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="FarmExpensesGrp/NetFarmProfitLossAmt/@passiveActivityLossLiteralCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="$Form1040SSData/SelfEmploymentTaxGrp">
							<xsl:if test="SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Self-Employment Tax Exempt Code (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt">
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part V - Line 3 - Self-Employment Tax Exempt Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Chap 11 Bankruptcy Income Code (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt">
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part V - Line 3 - Chap 11 Bankruptcy Income Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Community Income Taxed To Spouse Code (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseAmt">
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part V - Line 3 - Community Income Taxed To Spouse Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseAmt"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Exempt Community Income Code (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt">
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part V - Line 3 - Exempt Community Income Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Part V - Line 3 - Additional Income Or Loss Code (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt">
								<xsl:call-template name="PopulateLeftoverRowAmount">
									<xsl:with-param name="Desc">Part V - Line 3 - Additional Income Or Loss Amount (<xsl:value-of select="position()"/>)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt"/>
									<xsl:with-param name="DescWidth" select="$TableWidth"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:for-each>
					</table>
					<!-- (34a-e) //////////////////////////////////////////////////// -->
					<!--					   <xsl:if test="($Print = $Separated) and (count($Form1040SSData/FarmingProfitLoss/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense) &gt; 5)">
						<span class="styRepeatingDataTitle">Formulario
						 <xsl:if test="/AppData/Parameters/SubmissionType='1040SS'">
							  1040-SS
							</xsl:if>
							<xsl:if test="/AppData/Parameters/SubmissionType='1040PR'">
							  1040-SS
							</xsl:if>                
							Parte III - Sección C - La Línea 34 - Otros Gastos			
						</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;font-family:arial;width:100mm;">
								<thead class="styTableThead">
									<tr class="styDepTblHdr">
										<th class="styIRS1040PRTableCell" scope="col" rowspan="2" style="width:10mm;font-weight:normal;">
											Letter
										</th>
										<th class="styIRS1040PRTableCell" scope="col" rowspan="2" style="width:55mm;font-weight:normal">
											Description
										</th>
										<th class="styIRS1040PRTableCell" scope="col" rowspan="2" style="width:35mm;font-weight:normal">
											Amount
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="$Form1040SSData/FarmingProfitLoss/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense">
										<xsl:variable name="Letter">
											<xsl:number format="a"/>
										</xsl:variable>
										<tr style="border-color:black;height:6mm;">
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styTableCellText" style="width:10mm;text-align:center;">
												<xsl:value-of select="$Letter"/>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellText" style="width:55mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Desc"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellText" style="width:35mm;text-align:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Amt"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
					  </xsl:if>        -->
					<!-- Separated Data for Part I - Qualifying Children -->
					<xsl:if test="($Print = $Separated) and  (count($Form1040SSData/QualifyingChildInfoGrp) &gt; 6)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Formulario 1040-SS, Parte I - Hijos calificados
						</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<xsl:call-template name="QualifyingChildrenTableHeaders_1040PR">
									<xsl:with-param name="AddColoredHeaders">true</xsl:with-param>
								</xsl:call-template>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1040SSData/QualifyingChildInfoGrp">
									<xsl:call-template name="QualifyingChildrenTableRows_1040PR">
										<xsl:with-param name="TargetNode" select="."/>
										<xsl:with-param name="AddColoredRows">true</xsl:with-param>
									</xsl:call-template>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Begin Separated Repeating data table for Special Condition Description-->
					<xsl:if test="$Form1040SSData/SpecialConditionDesc">
						<span class="styRepeatingDataTitle">Margen Superior Izquierdo - Descripción de condición Especial</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;">
							  Descripción de condición Especial
						   </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$Form1040SSData/SpecialConditionDesc">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;" class="styGenericDiv">
												<div style="width:6mm;font-weight:bold;float:right;clear:none;">
													<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
														<xsl:value-of select="position()"/>
													</span>
												</div>
											</div>
											<div style="width:80mm;float:none;clear:none;">
												<xsl:variable name="pos" select="position()"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
													<xsl:with-param name="BackupName">IRS1040SSPRSpecialConditionDescription</xsl:with-param>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Repeating data table for Special Condition Description-->
					<br/>
					<!-- Begin Separated Repeating data table for Refund Product Code -->
					<xsl:if test="$Form1040SSData/RefundProductCd">
						<span class="styRepeatingDataTitle">Margen Superior Izquierdo - Código de producto de reembolso</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;">
							  Código de producto de reembolso
						   </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$Form1040SSData/RefundProductCd">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;" class="styGenericDiv">
												<div style="width:6mm;font-weight:bold;float:right;clear:none;">
													<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
														<xsl:value-of select="position()"/>
													</span>
												</div>
											</div>
											<div style="width:80mm;float:none;clear:none;">
												<xsl:variable name="pos" select="position()"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
													<xsl:with-param name="BackupName">IRS1040SSPRRefundProductCode</xsl:with-param>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Repeating data table for Refund Product Code -->
					<!--(43) ////////////////////////////////////////////////////-->
					<xsl:for-each select="$Form1040SSData/FarmingProfitLoss">
						<xsl:if test="FarmIncomeAccrualMethodGrp and (count(FarmIncomeAccrualMethodGrp/OtherIncomeGrp) &gt; 0)">
							<br/>
							<br/>
							<span class="styRepeatingDataTitle">
								Formulario 1040-SS, Parte III - Sección C - La Línea <b>43</b> - Otros ingresos de negocio agropecuario<br/>
								Nombre del propietario:<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="FarmProprietorName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<xsl:if test="FarmProprietorName/BusinessNameLine2Txt">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="FarmProprietorName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
							</span>
							<xsl:variable name="CellStyle">border-color:black;font-size:7pt;text-align:center;font-family:arial;padding-left:0px;padding-right:0px;</xsl:variable>
							<table class="styDepTbl" cellspacing="0">
								<thead>
									<tr class="styDepTblHdr">
										<th class="styIRS1040PRTableCell" scope="col">
											<xsl:attribute name="style">width:50%;<xsl:value-of select="$CellStyle"/></xsl:attribute>
											Other Income Type
										</th>
										<th class="styIRS1040PRTableCell" scope="col">
											<xsl:attribute name="style">width:50%;<xsl:value-of select="$CellStyle"/></xsl:attribute>
											Other Income Including<br/>Gas Fuel Tax Credit
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="FarmIncomeAccrualMethodGrp/OtherIncomeGrp">
										<tr style="font-size:7pt;font-family:arial;">
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<!-- ++++++++++++++++++++++++++++++++++ -->
											<td class="styIRS1040PRTableCell">
												<xsl:attribute name="style">
													width:50%;text-align:left;
													<xsl:if test="position() = last()">
														border-bottom-width:0px;
													</xsl:if></xsl:attribute>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OtherIncomeTyp"/>
												</xsl:call-template>
											</td>
											<!-- ++++++++++++++++++++++++++++++++++ -->
											<td class="styIRS1040PRTableCell">
												<xsl:attribute name="style">
													width:50%;text-align:right;
													<xsl:if test="position() = last()">
														border-bottom-width:0px;
													</xsl:if></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OthIncmIncludingGasFuelTxCrAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:for-each>
				</form>
			</body>
		</html>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:	CreateBox_1040PR) -->
	<xsl:template name="CreateBox_1040PR">
		<xsl:param name="TargetNode"/>
		<xsl:param name="AmountBoxStyle"/>
		<xsl:param name="PopulateAsText"/>
		<xsl:param name="AddParentheses"/>
		<xsl:param name="StaticText"/>
		<xsl:param name="Number"/>
		<xsl:param name="NumberBoxStyle"/>
		<xsl:param name="Width">29mm</xsl:param>
		<xsl:param name="Height">4mm</xsl:param>
		<div class="styLNRightNumBox">
			<xsl:attribute name="style">
        padding:2px 0px 0px 0px;
        border-right-width:0px;font-size:8pt;
        height:<xsl:value-of select="$Height"/>;
        <xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:if test="$Number">
				<xsl:value-of select="$Number"/>
			</xsl:if>
		</div>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
        width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
        border-right-width:0px;text-align:right;padding-right:2px;font-size:7pt;
        <xsl:choose><xsl:when test="$TargetNode"><xsl:choose><xsl:when test="$TargetNode/@referenceDocumentId">padding-top:2px;</xsl:when><xsl:otherwise>padding-top:4px;</xsl:otherwise></xsl:choose></xsl:when><xsl:otherwise>padding-top:3px;</xsl:otherwise></xsl:choose><xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:choose>
				<xsl:when test="$TargetNode">
					<xsl:if test="$AddParentheses">
            (<span style="width:5px;"/>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="$PopulateAsText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$TargetNode"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="$AddParentheses">
						<span style="width:5px;"/>)
          </xsl:if>
				</xsl:when>
				<xsl:when test="$StaticText">
					<xsl:value-of select="$StaticText"/>
				</xsl:when>
				<xsl:when test="not($TargetNode) and not($StaticText) and $AddParentheses">
          (<span style="width:23mm;"/>)
        </xsl:when>
			</xsl:choose>
		</div>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:	GenerateEmptyItems_1040PR) -->
	

	<!-- ////////////////////////////////////////////////////////////// (Template: QualifyingChildrenTableHeaders_1040PR) -->
	<xsl:template name="QualifyingChildrenTableHeaders_1040PR">
		<xsl:param name="AddColoredHeaders"/>
		<xsl:variable name="CommonStyle">border-color:black;font-size:7pt;text-align:center;font-family:arial;padding-left:0px;padding-right:0px;</xsl:variable>
		<tr>
			<xsl:if test="$AddColoredHeaders">
				<xsl:attribute name="class">styDepTblHdr</xsl:attribute>
			</xsl:if>
			<th class="styIRS1040PRTableCell" scope="col">
				<xsl:attribute name="style">width:80mm;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				<div class="styNormalText">
					<b>(a)</b> Primer nombre			
					<span style="width:25mm;"/>Apellido 
				</div>
			</th>
			<th class="styIRS1040PRTableCell" scope="col">
				<xsl:attribute name="style">width:35mm;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				<span class="styNormalText">
					<b>(b)</b> Número de Seguro Social del hijo</span>
			</th>
			<th class="styIRS1040PRTableCell" scope="col">
				<xsl:attribute name="style">width:72mm;<xsl:value-of select="$CommonStyle"/>;border-right-width:0px;</xsl:attribute>
				<span class="styNormalText">
					<b>(c)</b> Parentesco del hijo con usted</span>
			</th>
		</tr>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template: QualifyingChildrenTableRows_1040PR) -->
	<xsl:template name="QualifyingChildrenTableRows_1040PR">
		<xsl:param name="TargetNode"/>
		<xsl:param name="AddColoredRows"/>
		<xsl:param name="AddAdditionalDataMessage"/>
		<!-- IsLast -->
		<xsl:variable name="IsLast">
			<xsl:if test="$TargetNode and (position() = last())">
				border-bottom-width:0px;
			</xsl:if>
		</xsl:variable>
		<!-- ClassType -->
		<xsl:variable name="ClassType">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
				<xsl:otherwise>styDepTblRow2</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<tr style="font-size:7pt;font-family:arial;">
			<xsl:if test="$AddColoredRows">
				<xsl:attribute name="class"><xsl:value-of select="$ClassType"/></xsl:attribute>
			</xsl:if>
			<!-- First/Last Name +++++++++++++ -->
			<td class="styIRS1040PRTableCell">
				<xsl:attribute name="style">width:80mm;height:4mm;text-align:left;<xsl:value-of select="$IsLast"/></xsl:attribute>
				<xsl:if test="$TargetNode">
					<span style="width:30mm;text-align:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="QualifyingChildFirstNm"/>
						</xsl:call-template>
					</span>
					<span style="width:8mm;"/>
					<span style="width:32mm;text-align:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="QualifyingChildLastNm"/>
						</xsl:call-template>
					</span>
					<span style="width:4mm;">
						<xsl:if test="$TargetNode/QualifyingChildNameControlTxt">
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Part I, Line 2 - Qualifying Child <xsl:number value="position()"/> Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$TargetNode/QualifyingChildNameControlTxt"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</xsl:if>
				<xsl:if test="not($TargetNode)">
					<span style="width:4px"/>
				</xsl:if>
				<xsl:if test="$AddAdditionalDataMessage">
					<xsl:if test="((count($Form1040SSData/QualifyingChildInfoGrp) &gt;6) and ($Print = $Separated))">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form1040SSData/QualifyingChildInfoGrp"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
			</td>
			<!-- (a) +++++++++++++++++++++++ -->
			<td class="styIRS1040PRTableCell">
				<xsl:attribute name="style">width:38mm;height:4mm;text-align:center;<xsl:value-of select="$IsLast"/></xsl:attribute>
				<xsl:if test="$TargetNode">
				<xsl:choose>
					<xsl:when test="$TargetNode/DiedLiteralCd='DIED'">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="DiedLiteralCd"/>
					</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
					<xsl:call-template name="PopulateSSN">
						<xsl:with-param name="TargetNode" select="QualifyingChildIdentifyingNum"/>
					</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				</xsl:if>
				<xsl:if test="not($TargetNode)">
					<span style="width:4px"/>
				</xsl:if>
			</td>
			<!-- (b) +++++++++++++++++++++++ -->
			<td class="styIRS1040PRTableCell">
				<xsl:attribute name="style">width:65mm;height:4mm;text-align:left;border-right-width:0px;<xsl:value-of select="$IsLast"/></xsl:attribute>
				<xsl:if test="$TargetNode">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="ChildRelationshipCd"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="not($TargetNode)">
					<span style="width:4px"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>



</xsl:stylesheet>
