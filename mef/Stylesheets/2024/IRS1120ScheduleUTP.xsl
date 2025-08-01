<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1120ScheduleUTPStyle.xsl"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1120ScheduleUTP"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<!-- Set Document Title -->
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
				<!-- Set Target to Top -->
				<!-- <meta http-equiv="Window-target" content="_top" /> -->
				<!-- Set Filename and Description -->
				<meta name="Description" content="Schedule UTP (Form 1120)"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120ScheduleUTPStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:256mm;">
				<form name="Form1120ScheduleUTP">
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<!-- END WARNING LINE -->
					<!-- BEGIN FORM HEADER -->
					<!--Title of Form -->
					<div class="styBB" style="width:256mm;height: 19mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;font-size:8pt;height:19mm;border-right-width:2px;">
							<div class="styFormNumber" style="font-size:10pt;font-weight:bold;">SCHEDULE UTP<br/>(Form 1120)</div>
							<div class="styAgency">(Rev. December 2022)</div>
							<div class="styAgency">Department of the Treasury</div>
							<div class="styAgency" style="padding-bottom:.1mm;">Internal Revenue Service</div>
						</div>
						<div class="styFTBox" style="height: 19mm;width:194mm;padding-top:1mm;border-left-width:2px;border-right-width:2px;">
							<div class="styMainTitle" style="font-weight:bold;width:100%;">Uncertain Tax Position Statement</div>
							<div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:bold;">
								<div style="margin-left: 1.5mm;padding-top:5mm;">
									<img src="{$ImagePath}/1120SchUTP_Bullet.gif" alt="Right Pointing Arrowhead"/>
				  File with Form 1120, 1120-F, 1120-L, or 1120-PC<br/>
									<img src="{$ImagePath}/1120SchUTP_Bullet.gif" alt="Right Pointing Arrowhead"/>
									Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form1120" title="Link to www.irs.gov/Form1120">
										<i>www.irs.gov/Form1120</i> for instructions and the latest information.
									</a>
								</div>
							</div>
						</div>
						<div class="styTYBox" style="width:31mm;height:19mm;border-left-width: 2px">
							<div class="styOMB" style="padding-top:6mm;border-bottom:0;">OMB No. 1545-0123</div>
						</div>
					</div>
					<!--  End title of Form  -->
					<!-- END FORM HEADER -->
					<!-- BEGIN TAXPAYER INFO -->
					<!--  Name -->
					<div class="styBB" style="width:256mm;">
						<div class="styNameBox" style="width:190mm;font-size:7pt;">
              Name of entity as shown on page 1 of tax return
              <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- EIN -->
						<div class="styEINBox" style="padding-left:2mm;font-size:7pt;">
							EIN of entity <br/>
							<br/>
							<span style="width:100%;text-align:left;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styBB" style="text-align:left;width:256mm;border-top-width:1px;border-bottom:0;">
							<div style="font-size:8pt;padding-bottom:0.5mm;padding-left:26mm;">
                This Part I, Schedule UTP (Form 1120) is page
                <span style="width:10mm; border-bottom:1px solid black; text-align:center;">
									<!-- insert element here -->
								</span>
                of 
                <span style="width:10mm; border-bottom:1px solid black; text-align:center;">
									<!-- insert element here -->
								</span>
                Part I pages.
							</div>
						</div>
					</div>
					<!-- END TAXPAYER INFO -->
					<!-- BEGIN PART I HEADER -->
					<div class="styBB" style="width:256mm;height:12mm;">
						<div class="styPartName" style="height:3.5mm;">Part I</div>
						<div class="styPartDesc" style="width:225mm;font-weight:normal;font-size:7pt;">
							<b>Uncertain Tax Positions for the Current Tax Year.  </b> 
								 See instructions for how to complete columns (a) through (k). <br/>
								 Enter, in Part III, a description for each uncertain tax position (UTP). <br/>
			 					Check this box if the corporation was unable to obtain information from related parties sufficient to
			 					determine whether a tax position is a UTP.  See instructions. 
			 					<img src="{$ImagePath}/1120SchUTP_Bullet.gif" alt="Right Pointing Arrowhead"/>
							<span style="width: 6mm;"/>
							<input alt="Part I - unable to obtain information from related parties sufficient to
			 					determine whether a tax position is a UTP" type="checkbox" class="styCkboxNM" name="UnableObtainRelatedPartyInfoI">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/UnableObtainRltdPrtyInfoCYInd"/>
									<xsl:with-param name="BackupName">Part I - unable to obtain information from related parties sufficient to
			 					determine whether a tax position is a UTP</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/UnableObtainRltdPrtyInfoCYInd"/>
									<xsl:with-param name="BackupName">Part I - unable to obtain information from related parties sufficient to
			 					determine whether a tax position is a UTP</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
						<xsl:if test="(count($FormData/CurrentTYUTPInformationGrp) &gt; 21) and ($Print != $Separated)">
							<div class="styPartDesc" style="padding-left:1mm;padding-top:8mm;float:right;width:5.5mm;font-weight:normal;">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/CurrentTYUTPInformationGrp"/>
									<xsl:with-param name="containerHeight" select="21"/>
									<xsl:with-param name="headerHeight" select="2"/>
									<xsl:with-param name="containerID" select="'ScheduleUTPPartITable'"/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</xsl:if>
					</div>
					<!-- END PART I HEADER -->
					<div class="styIRS1120ScheduleUTP_styTableContainer" id="ScheduleUTPPartITable">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styIRS1120ScheduleUTP_styTable" cellspacing="0">
							<!-- BEGIN PART I TABLE HEADER -->
							<tr>
								<th class="styIRS1120ScheduleUTP_styLeftCell" style="width:13mm;" scope="col" rowspan="2">
									(a)<br/>UTP No.
								</th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" colspan="3" style="width:69mm;font-weight:normal;" scope="col">
									<b>(b)<br/>Primary IRC Sections</b>
									<br/>(for example, "61", "108",  "263A")
								</th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" style="width:20mm;" scope="col" rowspan="2">
									(c)<br/>Rev. Rule, Rev. Proc.<br/>Etc.
								</th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" colspan="1" style="width:23mm;font-weight:normal;" scope="col">
									<b>(d)<br/>Regulation Section</b>
									<br/>(for example, "1.482-7")
        </th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" colspan="2" style="width:20mm;font-weight:normal;" scope="col" rowspan="2">
									<b>(e)<br/>Timing Codes</b>
									<br/>(check if Permanent,<br/>Temporary, or both)
        </th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;" scope="col" rowspan="2">
									(f)<br/>Pass-Through<br/>Entity EIN
								</th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" style="width:11mm;" scope="col" rowspan="2">
									(g)<br/>Major Tax<br/>Position
								</th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" style="width:11mm;" scope="col" rowspan="2">
									(h)<br/>Ranking of Tax<br/>Position
								</th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" style="width:20mm;" scope="col" rowspan="2">
									(i)<br/>Form or<br/>Schedule
								</th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" scope="col" rowspan="2">
									(j)<br/>Line<br/>No.
								</th>
								<th class="styIRS1120ScheduleUTP_styRightCell" scope="col" rowspan="2">
									(k)<br/>Amount
								</th>
							</tr>
							<tr>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" colspan="3" style="width:69mm;font-weight:normal;" scope="col">
									<b>Primary IRC Subsections</b>
									<br/>(for example, (f)(2)(A)(ii))
        </th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" colspan="1" style="width:23mm;font-weight:normal;" scope="col">
									<b>Regulation Subsection</b>
									<br/>(for example, (d)(1)(ii))
        </th>
							</tr>
							<!-- END PART I TABLE HEADER -->
							<!-- BEGIN PART I TABLE -->
							<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
							<xsl:if test="($Print != $Separated) or (count($FormData/CurrentTYUTPInformationGrp) &lt;= 21) ">
								<xsl:for-each select="$FormData/CurrentTYUTPInformationGrp">
									<tr>
										<xsl:if test="position() mod 2 = 1">
											<xsl:attribute name="style">background-color:lightgrey;</xsl:attribute>
										</xsl:if>
										<!-- Begin Part I Column (a) -->
										<td class="styIRS1120ScheduleUTP_styLeftCell" scope="row" style="text-align:left;font-size:6pt;width:13mm;">
											<b>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="UTPNum"/>
												</xsl:call-template>
											</b>
										</td>
										<!-- End Part I Column (a) -->
										<!-- Begin Part I Column (b) -->
										<xsl:variable name="UTPpositionPartI" select="position()"/>
										<xsl:if test="count(IRCSections) = 0">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="padding-left:0;padding-right:0;font-size:6pt;width:23mm;">
												<span style="width:23mm;border-bottom:1px solid black;">&#160;</span>
(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)
											</td>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="padding-left:0;padding-right:0;font-size:6pt;width:23mm;">
												<span style="width:23mm;border-bottom:1px solid black;">&#160;</span>
(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)
											</td>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="padding-left:0;padding-right:0;font-size:6pt;width:23mm;">
												<span style="width:23mm;border-bottom:1px solid black;">&#160;</span>
(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)
											</td>
										</xsl:if>
										<xsl:if test="count(IRCSections) = 1">
											<xsl:for-each select="IRCSections">
												<td class="styIRS1120ScheduleUTP_styMiddleCell" style="padding-left:0;padding-right:0;font-size:6pt;width:23mm;">
													<span style="width:23mm;border-bottom:1px solid black;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PrimaryIRCSectionsNum"/>
														</xsl:call-template>
													</span>
													(<span style="width:1px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCSubSectionNum"/>
													</xsl:call-template>
													<span style="width:1px;"/>) (<span style="width:1px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCParagraphNum"/>
													</xsl:call-template>
													<span style="width:1px;"/>) (<span style="width:1px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCSubParagraphNum"/>
													</xsl:call-template>
													<span style="width:1px;"/>) (<span style="width:1px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCClauseNum"/>
													</xsl:call-template>
													<span style="width:1px;"/>)
												</td>
											</xsl:for-each>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="padding-left:0;padding-right:0;font-size:6pt;width:23mm;">
												<xsl:if test="($UTPpositionPartI = count($FormData/CurrentTYUTPInformationGrp)) and (count($FormData/CurrentTYUTPInformationGrp) &gt;20)">
													<xsl:attribute name="style">padding-left:0;padding-right:0;border-bottom-width:0px;text-align:center;font-size:6pt;width:23mm;</xsl:attribute>
												</xsl:if>
												<span style="width:23mm;border-bottom:1px solid black;">&#160;</span>
(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)

											</td>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="padding-left:0;padding-right:0;font-size:6pt;width:23mm;">
												<xsl:if test="($UTPpositionPartI = count($FormData/CurrentTYUTPInformationGrp)) and (count($FormData/CurrentTYUTPInformationGrp) &gt;20)">
													<xsl:attribute name="style">padding-left:0;padding-right:0;border-bottom-width:0px;text-align:center;font-size:6pt;width:23mm;</xsl:attribute>
												</xsl:if>
												<span style="width:23mm;border-bottom:1px solid black;">&#160;</span>
(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)

											</td>
										</xsl:if>
										<xsl:if test="count(IRCSections) = 2">
											<xsl:for-each select="IRCSections">
												<td class="styIRS1120ScheduleUTP_styMiddleCell" style="padding-left:0;padding-right:0;font-size:6pt;width:23mm;">
													<span style="width:23mm;border-bottom:1px solid black;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PrimaryIRCSectionsNum"/>
														</xsl:call-template>
													</span>
													(<span style="width:1px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCSubSectionNum"/>
													</xsl:call-template>
													<span style="width:1px;"/>) (<span style="width:1px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCParagraphNum"/>
													</xsl:call-template>
													<span style="width:1px;"/>) (<span style="width:1px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCSubParagraphNum"/>
													</xsl:call-template>
													<span style="width:1px;"/>) (<span style="width:1px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCClauseNum"/>
													</xsl:call-template>
													<span style="width:1px;"/>)
												</td>
											</xsl:for-each>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="padding-left:0;padding-right:0;font-size:6pt;width:23mm;">
												<xsl:if test="($UTPpositionPartI = count($FormData/CurrentTYUTPInformationGrp)) and (count($FormData/CurrentTYUTPInformationGrp) &gt;20)">
													<xsl:attribute name="style">padding-left:0;padding-right:0;border-bottom-width:0px;text-align:center;font-size:6pt;width:23mm;</xsl:attribute>
												</xsl:if>
												<span style="width:23mm;border-bottom:1px solid black;">&#160;</span>
(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)

											</td>
										</xsl:if>
										<xsl:if test="count(IRCSections) = 3">
											<xsl:for-each select="IRCSections">
												<td class="styIRS1120ScheduleUTP_styMiddleCell" style="padding-left:0;padding-right:0;font-size:6pt;width:23mm;">
													<span style="width:23mm;border-bottom:1px solid black;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PrimaryIRCSectionsNum"/>
														</xsl:call-template>
													</span> (<span style="width:1px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCSubSectionNum"/>
													</xsl:call-template>
													<span style="width:1px;"/>) (<span style="width:1px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCParagraphNum"/>
													</xsl:call-template>
													<span style="width:1px;"/>) (<span style="width:1px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCSubParagraphNum"/>
													</xsl:call-template>
													<span style="width:1px;"/>) (<span style="width:1px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCClauseNum"/>
													</xsl:call-template>
													<span style="width:1px;"/>)
												</td>
											</xsl:for-each>
										</xsl:if>
										<!-- End Part I Column (b) -->
										<!-- Begin Part I Column (c) -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:20mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CitationNm"/>
											</xsl:call-template>
										</td>
										<!-- End Part I Column (c) -->
										<!-- Begin Part I Column (d) -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="padding-left:0;padding-right:0;font-size:6pt;width:23mm;">
											<span style="width:23mm;border-bottom:1px solid black;word-wrap: break-word;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RegulationSectionNum"/>
												</xsl:call-template>
											</span>
											(<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LevelOneParagraphNum"/>
											</xsl:call-template>)
											(<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LevelTwoParagraphNum"/>
											</xsl:call-template>)
											(<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LevelThreeParagraphNum"/>
											</xsl:call-template>)
											(<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LevelFourParagraphNum"/>
											</xsl:call-template>)
										</td>
										<!-- End Part I Column (d) -->
										<!-- Begin Part I Column (e) -->
										<xsl:choose>
											<xsl:when test="BothTimingCodesInd">
												<td class="styIRS1120ScheduleUTP_styMiddleCell">
													<span style="width:4px;"/>
													<input alt="Partl-Permanent" type="checkbox" class="styCkbox">
														<xsl:call-template name="PopulateYesCheckbox">
															<xsl:with-param name="TargetNode" select="BothTimingCodesInd"/>
															<xsl:with-param name="BackupName">Partl-Permanent<xsl:value-of select="$UTPpositionPartI"/>
															</xsl:with-param>
														</xsl:call-template>
													</input>
													<label>
														<xsl:call-template name="PopulateLabelYes">
															<xsl:with-param name="TargetNode" select="BothTimingCodesInd"/>
															<xsl:with-param name="BackupName">Partl-Permanent<xsl:value-of select="$UTPpositionPartI"/>
															</xsl:with-param>
														</xsl:call-template>
													</label>
												</td>
												<td class="styIRS1120ScheduleUTP_styMiddleCell">
													<span style="width:4px;"/>
													<input alt="Partl-Temporary" type="checkbox" class="styCkbox">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="BothTimingCodesInd"/>
															<xsl:with-param name="BackupName">Partl-Temporary<xsl:value-of select="$UTPpositionPartI"/>
															</xsl:with-param>
														</xsl:call-template>
													</input>
													<label>
														<xsl:call-template name="PopulateLabel">
															<xsl:with-param name="TargetNode" select="BothTimingCodesInd"/>
															<xsl:with-param name="BackupName">Partl-Temporary<xsl:value-of select="$UTPpositionPartI"/>
															</xsl:with-param>
														</xsl:call-template>
													</label>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td class="styIRS1120ScheduleUTP_styMiddleCell">
													<span style="width:4px;"/>
													<input alt="Partl-PermanentTimingCode" type="checkbox" class="styCkbox">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="PermanentTimingCodeInd"/>
															<xsl:with-param name="BackupName">Partl-PermanentTimingCode<xsl:value-of select="$UTPpositionPartI"/>
															</xsl:with-param>
														</xsl:call-template>
													</input>
													<label>
														<xsl:call-template name="PopulateLabel">
															<xsl:with-param name="TargetNode" select="PermanentTimingCodeInd"/>
															<xsl:with-param name="BackupName">Partl-PermanentTimingCode<xsl:value-of select="$UTPpositionPartI"/>
															</xsl:with-param>
														</xsl:call-template>
													</label>
												</td>
												<td class="styIRS1120ScheduleUTP_styMiddleCell">
													<span style="width:4px;"/>
													<input alt="Partl-TemporaryTimingCode" type="checkbox" class="styCkbox">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="TemporaryTimingCodeInd"/>
															<xsl:with-param name="BackupName">Partl-TemporaryTimingCode<xsl:value-of select="$UTPpositionPartI"/>
															</xsl:with-param>
														</xsl:call-template>
													</input>
													<label>
														<xsl:call-template name="PopulateLabel">
															<xsl:with-param name="TargetNode" select="TemporaryTimingCodeInd"/>
															<xsl:with-param name="BackupName">Partl-TemporaryTimingCode<xsl:value-of select="$UTPpositionPartI"/>
															</xsl:with-param>
														</xsl:call-template>
													</label>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<!-- End Part I Column (e) -->
										<!-- Begin Part I Column (f) -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;">
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
										<!-- End Part I Column (f) -->
										<!-- Begin Part I Column (g) -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell">
											<span style="width:4px;"/>
											<input alt="Partl-MajorTaxPosition" type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="MajorTaxPositionInd"/>
													<xsl:with-param name="BackupName">Partl-MajorTaxPosition</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="MajorTaxPositionInd"/>
													<xsl:with-param name="BackupName">Partl-MajorTaxPosition</xsl:with-param>
												</xsl:call-template>
											</label>
										</td>
										<!-- End Part I Column (g) -->
										<!-- Begin Part I Column (h) -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:11mm;">
											<xsl:choose>
												<xsl:when test="TransferPricingTaxPostionCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TransferPricingTaxPostionCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OtherTaxPositionCd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<!-- End Part I Column (h) -->
										<!-- Begin Part I Column (i) -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:20mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ScheduleOrFormNum"/>
											</xsl:call-template>
										</td>
										<!-- End Part I Column (i) -->
										<!-- Begin Part I Column (j) -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:11mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LineNum"/>
											</xsl:call-template>
										</td>
										<!-- End Part I Column (j) -->
										<!-- Begin Part I Column (k) -->
										<td class="styIRS1120ScheduleUTP_styRightCell" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DisclosedItemAmt"/>
											</xsl:call-template>
										</td>
										<!-- End Part I Column (k) -->
									</tr>
								</xsl:for-each>
							</xsl:if>
							<!-- Depending on the number of data rows, insert blank rows to fill the container height -->
							<!-- For separated print where there are more data elements than the container height, -->
							<!-- display a message in the first row directing the user to the additional data table -->
							<xsl:if test="count($FormData/CurrentTYUTPInformationGrp) &lt; 21">
								<xsl:call-template name="PrintBlankTable1">
									<xsl:with-param name="numRows" select="21 - count($FormData/CurrentTYUTPInformationGrp)"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="(count($FormData/CurrentTYUTPInformationGrp) &gt; 21) and ($Print = $Separated)">
								<xsl:call-template name="PrintBlankTable1">
									<xsl:with-param name="numRows" select="21"/>
								</xsl:call-template>
							</xsl:if>
						</table>
					</div>
					<xsl:if test="(count($FormData/CurrentTYUTPInformationGrp) &gt; 21) and ($Print != $Separated)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/CurrentTYUTPInformationGrp"/>
							<xsl:with-param name="containerHeight" select="21"/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerID" select="'ScheduleUTPPartITable'"/>
						</xsl:call-template>
					</xsl:if>
					<!-- END PART I TABLE -->
					<!-- BEGIN PAGE I FOOTER -->
					<div class="styIRS1120ScheduleUTP_styFormFooter" style="width:256mm;border-top-width: 0px;">
						<span style="width:142mm;font-weight:bold;font-size:6pt;" class="styGenericDiv">
			    For Paperwork Reduction Act Notice, see the Instructions for Form 1120.
			  </span>
						<span style="width:31mm;font-weight:normal;font-size:6pt;text-align:center;" class="styGenericDiv">Cat. No. 54658Q</span>
						<span style="width:82mm;text-align:right;font-weight:bold;font-size:6pt;" class="styGenericDiv">Schedule UTP (Form 1120) (Rev. 12-2022)</span>
					</div>
					<!-- END PAGE I FOOTER -->
					<!--  ********************************************************************************************************* -->
					<p style="page-break-before: always"/>
					<!--  ********************************************************************************************************* -->
					<!-- Page 2 Header -->
					<div class="styBB" style="border-bottom-width:2px;width:256mm;padding-top:.5mm;">
						<div style="float:left;">Schedule UTP (Form 1120) (Rev. 12-2022)</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!--  Name -->
					<div class="styBB" style="width:256mm">
						<div class="styNameBox" style="width:190mm;font-size:7pt;">
                Name of entity as shown on page 1 of tax return
                <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- EIN -->
						<div class="styEINBox" style="padding-left:2mm;font-size:7pt;">
							EIN of entity <br/>
							<br/>
							<span style="width:100%;text-align:left;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styBB" style="text-align:left;width:256mm;border-top-width:1px;border-bottom:0;">
							<div style="font-size:8pt;padding-bottom:0.5mm;padding-left:26mm;">
                This Part II, Schedule UTP (Form 1120) is page
                <span style="width:10mm; border-bottom:1px solid black; text-align:center;">
									<!-- insert element here -->
								</span>
                of 
                <span style="width:10mm; border-bottom:1px solid black; text-align:center">
									<!-- insert element here -->
								</span>
                Part II pages.
							</div>
						</div>
					</div>
					<!--  End Name and Employer indentification number  -->
					<!-- END Page 2 Header -->
					<!-- BEGIN PART II HEADER -->
					<div class="styBB" style="width:256mm;height:12mm;">
						<div class="styPartName" style="height:3.5mm;">Part II</div>
						<div class="styPartDesc" style="width:225mm;font-weight:normal;font-size:7pt;">
							<b>Uncertain Tax Positions for Prior Tax Years. </b>
							<br/> 
								 See instructions for how to complete columns (a) through (l). Enter, in Part III, a description for
								  each uncertain tax position (UTP). <br/>
			 					Check this box if the corporation was unable to obtain information from related parties sufficient to determine
			 					 whether a tax position is a UTP.  See instructions. 
			 					<img src="{$ImagePath}/1120SchUTP_Bullet.gif" alt="Right Pointing Arrowhead"/>
							<span style="width: 6mm;"/>
							<input alt="Part II - unable to obtain information from related parties sufficient to
			 					determine whether a tax position is a UTP" type="checkbox" class="styCkboxNM" name="UnableObtainRelatedPartyInfoI">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/UnableObtainRltdPrtyInfoPYInd"/>
									<xsl:with-param name="BackupName">Part II - unable to obtain information from related parties sufficient to
			 					determine whether a tax position is a UTP</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/UnableObtainRltdPrtyInfoPYInd"/>
									<xsl:with-param name="BackupName">Part II - unable to obtain information from related parties sufficient to
			 					determine whether a tax position is a UTP</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
						<xsl:if test="(count($FormData/PriorTYUTPInformationGrp) &gt; 21) and ($Print != $Separated)">
							<div class="styPartDesc" style="padding-left:1mm;padding-top:8mm;float:right;width:5.5mm;font-weight:normal;">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/PriorTYUTPInformationGrp"/>
									<xsl:with-param name="containerHeight" select="21"/>
									<xsl:with-param name="headerHeight" select="2"/>
									<xsl:with-param name="containerID" select="'ScheduleUTPPartIITable'"/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</xsl:if>
					</div>
					<!-- END PART II HEADER -->
					<!-- BEGIN PART II TABLE -->
					<div class="styIRS1120ScheduleUTP_styTableContainer" id="ScheduleUTPPartIITable">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styIRS1120ScheduleUTP_styTable" cellspacing="0">
							<!-- BEGIN PART II TABLE HEADER -->
							<tr>
								<th class="styIRS1120ScheduleUTP_styLeftCell" style="width:13mm;text-align:center;" scope="col" rowspan="2">
									(a)<br/>UTP No.
								</th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" colspan="3" style="width:69mm;font-weight:normal;" scope="col">
									<b>(b)<br/>Primary IRC Sections</b>
									<br/>(for example, "61", "108",  "263A")
        </th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" scope="col" rowspan="2">
									(c)<br/>Rev. Rule, Rev. Proc.<br/>Etc.
								</th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" colspan="1" style="width:23mm;font-weight:normal;" scope="col">
									<b>(d)<br/>Regulation Section</b>
									<br/>(for example, "1.482-7")
        </th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" colspan="2" style="width:20mm;font-weight:normal;" scope="col" rowspan="2">
									<b>(e)<br/>Timing Codes</b>
									<br/>(check if Permanent,<br/>Temporary, or both)
        </th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;" scope="col" rowspan="2">
									(f)<br/>Pass-Through<br/>Entity EIN
								</th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" style="width:11mm;" scope="col" rowspan="2">
									(g)<br/>Major Tax<br/>Position
								</th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" style="width:11mm;" scope="col" rowspan="2">
									(h)<br/>Ranking of Tax<br/>Position
								</th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" style="width:20mm;" scope="col" rowspan="2">
									(i)<br/>Form or<br/>Schedule
								</th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" style="width:11mm;" scope="col" rowspan="2">
									(j)<br/>Line<br/>No.
								</th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" style="width:20mm;" scope="col" rowspan="2">
									(k)<br/>Amount<br/>No.
								</th>
								<th class="styIRS1120ScheduleUTP_styRightCell" scope="col" rowspan="2">
									(l)<br/>Year of<br/>Tax<br/>Position
								</th>
							</tr>
							<tr>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" colspan="3" style="width:69mm;font-weight:normal;" scope="col">
									<b>Primary IRC Subsections</b>
									<br/>(for example, (f)(2)(A)(ii))
        </th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" colspan="1" style="width:23mm;font-weight:normal;" scope="col">
									<b>Regulation Subsection</b>
									<br/>(for example, (d)(1)(ii))
        </th>
							</tr>
							<!-- END PART II TABLE HEADER -->
							<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
							<!-- If the print parameter is separated, but there are fewer elements than the container height (7) -->
							<xsl:if test="($Print != $Separated) or (count($FormData/PriorTYUTPInformationGrp) &lt;= 21) ">
								<xsl:for-each select="$FormData/PriorTYUTPInformationGrp">
									<tr>
										<xsl:if test="position() mod 2 = 1">
											<xsl:attribute name="style">background-color:lightgrey;</xsl:attribute>
										</xsl:if>
										<!-- Begin Part II Column (a) -->
										<td class="styIRS1120ScheduleUTP_styLeftCell" style="text-align:left;width:20mm;font-size:6pt;">
											<b>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="UTPNum"/>
												</xsl:call-template>
											</b>
										</td>
										<!-- End Part II Column (a) -->
										<!-- Begin  Part II Column (b) -->
										<xsl:variable name="UTPpositionPartII" select="position()"/>
										<xsl:if test="count(IRCSections) = 0">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="padding-left:0;padding-right:0;font-size:6pt;width:23mm;">
												<span style="width:23mm;border-bottom:1px solid black;">&#160;</span>
(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)
											</td>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="padding-left:0;padding-right:0;font-size:6pt;width:23mm;">
												<span style="width:23mm;border-bottom:1px solid black;">&#160;</span>
(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)
											</td>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="padding-left:0;padding-right:0;font-size:6pt;width:23mm;">
												<span style="width:23mm;border-bottom:1px solid black;">&#160;</span>
(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)
											</td>
										</xsl:if>
										<xsl:if test="count(IRCSections) = 1">
											<xsl:for-each select="IRCSections">
												<td class="styIRS1120ScheduleUTP_styMiddleCell" style="padding-left:0;padding-right:0;font-size:6pt;width:23mm;">
													<span style="width:23mm;border-bottom:1px solid black;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PrimaryIRCSectionsNum"/>
														</xsl:call-template>
													</span>
													(<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCSubSectionNum"/>
													</xsl:call-template>)
													(<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCParagraphNum"/>
													</xsl:call-template>)
													(<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCSubParagraphNum"/>
													</xsl:call-template>)
													(<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCClauseNum"/>
													</xsl:call-template>)
													</td>
											</xsl:for-each>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="padding-left:0;padding-right:0;font-size:6pt;width:23mm;">
												<span style="width:23mm;border-bottom:1px solid black;">&#160;</span>
(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)
											</td>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="padding-left:0;padding-right:0;font-size:6pt;width:23mm;">
												<xsl:if test="($UTPpositionPartII = count($FormData/PriorTYUTPInformationGrp)) and (count($FormData/PriorTYUTPInformationGrp) &gt;20)">
													<xsl:attribute name="style">padding-left:0;padding-right:0;border-bottom-width:0px;text-align:center;font-size:6pt;width:23mm;</xsl:attribute>
												</xsl:if>
												<span style="width:23mm;border-bottom:1px solid black;">&#160;</span>
(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)

											</td>
										</xsl:if>
										<xsl:if test="count(IRCSections) = 2">
											<xsl:for-each select="IRCSections">
												<td class="styIRS1120ScheduleUTP_styMiddleCell" style="padding-left:0;padding-right:0;font-size:6pt;width:23mm;">
													<span style="width:23mm;border-bottom:1px solid black;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PrimaryIRCSectionsNum"/>
														</xsl:call-template>
													</span>
													(<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCSubSectionNum"/>
													</xsl:call-template>)
													(<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCParagraphNum"/>
													</xsl:call-template>)
													(<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCSubParagraphNum"/>
													</xsl:call-template>)
													(<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCClauseNum"/>
													</xsl:call-template>)
													</td>
											</xsl:for-each>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="padding-left:0;padding-right:0;font-size:6pt;width:23mm;">
												<span style="width:23mm;border-bottom:1px solid black;">&#160;</span>
(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)
											</td>
										</xsl:if>
										<xsl:if test="count(IRCSections) = 3">
											<xsl:for-each select="IRCSections">
												<td class="styIRS1120ScheduleUTP_styMiddleCell" style="padding-left:0;padding-right:0;font-size:6pt;width:23mm;">
													<span style="width:23mm;border-bottom:1px solid black;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PrimaryIRCSectionsNum"/>
														</xsl:call-template>
													</span>
													(<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCSubSectionNum"/>
													</xsl:call-template>)
													(<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCParagraphNum"/>
													</xsl:call-template>)
													(<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCSubParagraphNum"/>
													</xsl:call-template>)
													(<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PrimaryIRCClauseNum"/>
													</xsl:call-template>)
												</td>
											</xsl:for-each>
										</xsl:if>
										<!-- Begin Part II Column (c) -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;font-size:6pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CitationNm"/>
											</xsl:call-template>
										</td>
										<!-- End Part II Column (c) -->
										<!-- Begin Part II Column (d) -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="padding-left:0;padding-right:0;font-size:6pt;width:23mm;">
											<span style="width:23mm;border-bottom:1px solid black;word-wrap: break-word;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RegulationSectionNum"/>
												</xsl:call-template>
											</span>
													(<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LevelOneParagraphNum"/>
											</xsl:call-template>)
													(<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LevelTwoParagraphNum"/>
											</xsl:call-template>)
													(<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LevelThreeParagraphNum"/>
											</xsl:call-template>)
													(<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LevelFourParagraphNum"/>
											</xsl:call-template>)
												</td>
										<!-- End Part II Column (d) -->
										<!-- Begin Part II Column (e) -->
										<xsl:choose>
											<xsl:when test="BothTimingCodesInd">
												<td class="styIRS1120ScheduleUTP_styMiddleCell">
													<span style="width:4px;"/>
													<input alt="Partll-Permanent" type="checkbox" class="styCkbox">
														<xsl:call-template name="PopulateYesCheckbox">
															<xsl:with-param name="TargetNode" select="BothTimingCodesInd"/>
															<xsl:with-param name="BackupName">Partll-Permanent<xsl:value-of select="$UTPpositionPartII"/>
															</xsl:with-param>
														</xsl:call-template>
													</input>
													<label>
														<xsl:call-template name="PopulateLabelYes">
															<xsl:with-param name="TargetNode" select="BothTimingCodesInd"/>
															<xsl:with-param name="BackupName">Partll-Permanent<xsl:value-of select="$UTPpositionPartII"/>
															</xsl:with-param>
														</xsl:call-template>
													</label>
												</td>
												<td class="styIRS1120ScheduleUTP_styMiddleCell">
													<span style="width:4px;"/>
													<input alt="Partll-Temporary" type="checkbox" class="styCkbox">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="BothTimingCodesInd"/>
															<xsl:with-param name="BackupName">Partll-Temporary<xsl:value-of select="$UTPpositionPartII"/>
															</xsl:with-param>
														</xsl:call-template>
													</input>
													<label>
														<xsl:call-template name="PopulateLabel">
															<xsl:with-param name="TargetNode" select="BothTimingCodesInd"/>
															<xsl:with-param name="BackupName">Partll-Temporary<xsl:value-of select="$UTPpositionPartII"/>
															</xsl:with-param>
														</xsl:call-template>
													</label>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td class="styIRS1120ScheduleUTP_styMiddleCell">
													<span style="width:4px;"/>
													<input alt="Partll-PermanentTimingCode" type="checkbox" class="styCkbox">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="PermanentTimingCodeInd"/>
															<xsl:with-param name="BackupName">Partll-PermanentTimingCode<xsl:value-of select="$UTPpositionPartII"/>
															</xsl:with-param>
														</xsl:call-template>
													</input>
													<label>
														<xsl:call-template name="PopulateLabel">
															<xsl:with-param name="TargetNode" select="PermanentTimingCodeInd"/>
															<xsl:with-param name="BackupName">Partll-PermanentTimingCode<xsl:value-of select="$UTPpositionPartII"/>
															</xsl:with-param>
														</xsl:call-template>
													</label>
												</td>
												<td class="styIRS1120ScheduleUTP_styMiddleCell">
													<span style="width:4px;"/>
													<input alt="Partll-TemporaryTimingCode" type="checkbox" class="styCkbox">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="TemporaryTimingCodeInd"/>
															<xsl:with-param name="BackupName">Partll-TemporaryTimingCode<xsl:value-of select="$UTPpositionPartII"/>
															</xsl:with-param>
														</xsl:call-template>
													</input>
													<label>
														<xsl:call-template name="PopulateLabel">
															<xsl:with-param name="TargetNode" select="TemporaryTimingCodeInd"/>
															<xsl:with-param name="BackupName">Partll-TemporaryTimingCode<xsl:value-of select="$UTPpositionPartII"/>
															</xsl:with-param>
														</xsl:call-template>
													</label>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<!-- End Part II Column (e) -->
										<!-- Begin Part II Column (f) -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;font-size:6pt;">
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
										<!-- End Part II Column (f) -->
										<!-- Begin Part II Column (g) -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell">
											<span style="width:4px;"/>
											<input alt="Partll-MajorTaxPosition" type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="MajorTaxPositionInd"/>
													<xsl:with-param name="BackupName">Partll-MajorTaxPosition<xsl:value-of select="$UTPpositionPartII"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="MajorTaxPositionInd"/>
													<xsl:with-param name="BackupName">Partll-MajorTaxPosition<xsl:value-of select="$UTPpositionPartII"/>
													</xsl:with-param>
												</xsl:call-template>
											</label>
										</td>
										<!-- End Part II Column (g) -->
										<!-- Begin Part II Column (h) -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:15mm;font-size:6pt;">
											<xsl:choose>
												<xsl:when test="TransferPricingTaxPostionCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TransferPricingTaxPostionCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OtherTaxPositionCd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<!-- End Part II Column (h) -->
										<!-- Begin Part II Column (i) -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:15mm;font-size:6pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ScheduleOrFormNum"/>
											</xsl:call-template>
										</td>
										<!-- End Part II Column (i) -->
										<!-- Begin Part II Column (j) -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:15mm;font-size:6pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LineNum"/>
											</xsl:call-template>
										</td>
										<!-- End Part II Column (j) -->
										<!-- Begin Part II Column (k) -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DisclosedItemAmt"/>
											</xsl:call-template>
										</td>
										<!-- End Part II Column (k) -->
										<!-- Begin Part II Column (l) -->
										<td class="styIRS1120ScheduleUTP_styRightCell" style="width:16mm;">
											<span style="font-size:7pt;">
												<xsl:call-template name="PopulateMonthYearForYearMonthType">
													<xsl:with-param name="TargetNode" select="TaxPositionYearDt"/>
												</xsl:call-template>
											</span>
										</td>
										<!-- End Part II Column (l) -->
										<td class="styIRS1120ScheduleUTP_styTableLastCol" id="Table2LastCol"/>
									</tr>
								</xsl:for-each>
							</xsl:if>
							<!-- Depending on the number of data rows, insert blank rows to fill the container height -->
							<!-- For separated print where there are more data elements than the container height, -->
							<!-- display a message in the first row directing the user to the additional data table -->
							<xsl:if test="count($FormData/PriorTYUTPInformationGrp) &lt;= 21">
								<xsl:call-template name="PrintBlankTable2">
									<xsl:with-param name="numRows" select="21 - count($FormData/PriorTYUTPInformationGrp)"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="($Print = $Separated) and (count($FormData/PriorTYUTPInformationGrp) &gt; 21)">
								<xsl:call-template name="PrintBlankTable2">
									<xsl:with-param name="numRows" select="21"/>
								</xsl:call-template>
							</xsl:if>
						</table>
					</div>
					<!--Toggle button at the bottom -->
					<xsl:if test="(count($FormData/PriorTYUTPInformationGrp) &gt; 21) and ($Print != $Separated)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/PriorTYUTPInformationGrp"/>
							<xsl:with-param name="containerHeight" select="21"/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerID" select="'ScheduleUTPPartIITable'"/>
						</xsl:call-template>
					</xsl:if>
					<!-- END PART II TABLE -->
					<!-- BEGIN PAGE II FOOTER -->
					<div class="styIRS1120ScheduleUTP_styFormFooter" style="width:256mm;border-top-width: 0px;">
						<span style="width:142mm;font-weight:bold;font-size:6pt;" class="styGenericDiv"> &nbsp; </span>
						<span style="width:31mm;font-weight:normal;font-size:6pt;text-align:center;" class="styGenericDiv"> &nbsp; </span>
						<span style="width:82mm;text-align:right;font-weight:bold;font-size:6pt;" class="styGenericDiv">Schedule UTP (Form 1120) (Rev. 12-2022)</span>
					</div>
					<!-- END PAGE II FOOTER -->
					<!--  ********************************************************************************************************* -->
					<div class="pageEnd"/>
					<!--  ********************************************************************************************************* -->
					<!-- Page 3 Header -->
					<div class="styBB" style="width:256mm;border-bottom-width:2px;padding-top:.5mm;">
						<div style="float:left;">Schedule UTP (Form 1120) (Rev. 12-2022)</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</div>
					</div>
					<!--  Name -->
					<div class="styBB" style="width:256mm">
						<div class="styNameBox" style="width:190mm;font-size:7pt;">
                Name of entity as shown on page 1 of tax return
                <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- EIN -->
						<div class="styEINBox" style="padding-left:2mm;font-size:7pt;">
							EIN of entity <br/>
							<br/>
							<span style="width:100%;text-align:left;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styBB" style="text-align:left;width:256mm;border-top-width:1px;border-bottom:0;">
							<div style="font-size:8pt;padding-bottom:0.5mm;padding-left:26mm;">
                This Part III, Schedule UTP (Form 1120) is page
                <span style="width:10mm; border-bottom:1px solid black; text-align:center;">
									<!-- insert element here -->
								</span>
                of 
                <span style="width:10mm; border-bottom:1px solid black; text-align:center">
									<!-- insert element here -->
								</span>
                Part III pages.
							</div>
						</div>
					</div>
					<!--  End Name and Employer indentification number  -->
					<!-- END Page 3 Header -->
					<!-- BEGIN PART III HEADER -->
					<!-- BEGIN PART III HEADER -->
					<xsl:variable name="TableIIIRowCount" select="count($FormData/CurrentTYUTPInformationGrp) + count($FormData/PriorTYUTPInformationGrp)"/>
					<div class="styBB" style="width:256mm;height:8mm;">
						<div class="styPartName" style="height:3.5mm;">Part III</div>
						<div class="styPartDesc" style="width:235mm;font-weight:normal;">
							<b>Concise Descriptions of UTPs. </b> Indicate the corresponding UTP number from Part I, column (a) (for example, C1)
							 or Part II, column (a) (for example, P2). Use as many Part III pages as necessary.  See instructions.
						</div>
						<div class="styPartDesc" style="padding-left:1mm;padding-top:4mm;float:right;width:5.5mm;font-weight:normal;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleRowCount">
								<xsl:with-param name="DataRowCount" select="$TableIIIRowCount"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="49"/>
								<xsl:with-param name="containerID" select=" 'ScheduleUTPPartIIITable' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<!-- END PART III HEADER -->
					<!-- BEGIN PART III TABLE -->
					<div class="styIRS1120ScheduleUTP_styTableContainer" id="ScheduleUTPPartIIITable">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styIRS1120ScheduleUTP_styTable" cellspacing="0" style="border-bottom:1px solid black;">
							<!-- BEGIN PART III TABLE HEADER -->
							<tr>
								<th class="styIRS1120ScheduleUTP_styLeftCell" style="width:23mm;text-align:center;" scope="col">
									UTP<br/>No.
								</th>
								<th class="styIRS1120ScheduleUTP_styRightCell" style="width:162mm;text-align:left;padding-left:2mm;" scope="col">
									Concise Description of Uncertain Tax Position
								</th>
							</tr>
							<!-- END PART III TABLE HEADER -->
							<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
							<xsl:if test="($Print != $Separated) or (count($FormData/CurrentTYUTPInformationGrp) + count($FormData/PriorTYUTPInformationGrp) &lt;= 49) ">
								<xsl:for-each select="$FormData/CurrentTYUTPInformationGrp">
									<tr>
										<td class="styIRS1120ScheduleUTP_styLeftCell" scope="row" style="text-align:left;vertical-align:top;width:23mm;">
											<b>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="UTPNum"/>
												</xsl:call-template>
											</b>
										</td>
										<td class="styIRS1120ScheduleUTP_styRightCell" style="text-align:left;">
											<span style="float:left;padding-left:2mm;font-size:7pt;vertical-align:top;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ConciseUTPDesc"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styIRS1120ScheduleUTP_styTableLastCol" id="Table3LastCol"/>
									</tr>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="($Print != $Separated) or (count($FormData/CurrentTYUTPInformationGrp) + count($FormData/PriorTYUTPInformationGrp) &lt;= 49) ">
								<xsl:for-each select="$FormData/PriorTYUTPInformationGrp">
									<tr>
										<td class="styIRS1120ScheduleUTP_styLeftCell" scope="row" style="text-align:left;vertical-align:top;width:23mm;">
											<b>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="UTPNum"/>
												</xsl:call-template>
											</b>
										</td>
										<td class="styIRS1120ScheduleUTP_styRightCell" style="text-align:left;">
											<span style="float:left;padding-left:2mm;font-size:7pt;vertical-align:top;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ConciseUTPDesc"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styIRS1120ScheduleUTP_styTableLastCol" id="Table3LastCol"/>
									</tr>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="($Print = $Separated) and (count($FormData/CurrentTYUTPInformationGrp) + count($FormData/PriorTYUTPInformationGrp) &gt; 49)">
								<xsl:call-template name="PrintBlankTable3">
									<xsl:with-param name="numRows" select="49"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="(count($FormData/CurrentTYUTPInformationGrp) + count($FormData/PriorTYUTPInformationGrp) &lt; 49) ">
								<xsl:call-template name="PrintBlankTable3">
									<xsl:with-param name="numRows" select="49 - (count($FormData/CurrentTYUTPInformationGrp) + count($FormData/PriorTYUTPInformationGrp))"/>
								</xsl:call-template>
							</xsl:if>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeightRowCount">
						<xsl:with-param name="DataRowCount" select="$TableIIIRowCount"/>
						<xsl:with-param name="headerHeight" select="1"/>
						<xsl:with-param name="containerHeight" select="49"/>
						<xsl:with-param name="containerID" select=" 'ScheduleUTPPartIIITable' "/>
					</xsl:call-template>
					<!-- END PART III TABLE -->
					<!-- BEGIN PART III FOOTER -->
					<div class="styIRS1120ScheduleUTP_styFormFooter" style="width:256mm;border-top-width: 0px;">
						<span style="width:142mm;font-weight:bold;font-size:6pt;" class="styGenericDiv"> &nbsp; </span>
						<span style="width:31mm;font-weight:normal;font-size:6pt;text-align:center;" class="styGenericDiv"> &nbsp; </span>
						<span style="width:82mm;text-align:right;font-weight:bold;font-size:6pt;" class="styGenericDiv">Schedule UTP (Form 1120) (Rev. 12-2022)</span>
					</div>
					<!-- END PART III FOOTER -->
					<div class="pageEnd"/>
				</form>
				<!--  ********************************************************************************************************* -->
				<!--  ********************************************************************************************************* -->
				<!-- leftover data table -->
				<div class="styLeftOverTitleLineLandscape" id="LeftoverData" style="padding-top:1mm;">
					<div class="styLeftOverTitle">
                Additional Data        
              </div>
					<div class="styLeftOverButtonContainerLandscape">
						<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
					</div>
				</div>
				<table class="styLeftOverTblLandscape">
					<xsl:call-template name="PopulateCommonLeftoverLandscape">
						<xsl:with-param name="TargetNode" select="$FormData"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
				</table>
				<!-- Additonal Data Table for Part I -->
				<xsl:if test="($Print = $Separated) and (count($FormData/CurrentTYUTPInformationGrp) &gt; 21)">
					<br/>
					<span class="styRepeatingDataTitle">
						<br/>Form 1120 Schedule UTP, Part I, Uncertain Tax Positions for the Current Tax Year.
              </span>
					<table class="styDepTblLandscape" style="font-size:6pt">
						<thead class="styTableHead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" style="width:13mm;vertical-align: middle;" scope="col" rowspan="2">(a)<br/>UTP No.</th>
								<th class="styDepTblCell" colspan="3" style="width:69mm;vertical-align: middle;" scope="col">(b)<br/>Primary IRC Sections
					  <br/>
									<span style="font-weight:normal;">(for example, "61", "108",  "263A")</span>
								</th>
								<th class="styDepTblCell" style="width:20mm;vertical-align: middle;" scope="col" rowspan="2">
									(c)<br/>Rev. Rule, Rev. Proc.<br/>Etc.
								</th>
								<th class="styDepTblCell" style="width:23mm;vertical-align: middle;" scope="col">
									(d)<br/>Regulation Section
									<br/>
									<span style="font-weight:normal;">(for example, "1.482-7")</span>
								</th>
								<th class="styDepTblCell" colspan="2" style="width:20mm;vertical-align: middle;" scope="col" rowspan="2">(e)<br/>Timing Codes
					  <span style="font-weight:normal;">(check if Permanent, Temporary, or both)</span>
								</th>
								<th class="styDepTblCell" style="width:23mm;vertical-align: middle;" scope="col" rowspan="2">(f)<br/>Pass-Through Entity EIN</th>
								<th class="styDepTblCell" style="width:11mm;vertical-align: middle;" scope="col" rowspan="2">(g)<br/>Major Tax Position</th>
								<th class="styDepTblCell" style="width:11mm;vertical-align: middle;" scope="col" rowspan="2">(h)<br/>Ranking of Tax Position</th>
								<th class="styDepTblCell" style="width:20mm;vertical-align: middle;" scope="col" rowspan="2">(i)<br/>Form or<br/>Schedule</th>
								<th class="styDepTblCell" style="width:11mm;vertical-align: middle;" scope="col" rowspan="2">(j)<br/>Line<br/>No.</th>
								<th class="styDepTblCell" style="vertical-align: middle;" scope="col" rowspan="2">(k)<br/>Amount</th>
							</tr>
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" colspan="3" style="width:69mm;vertical-align: middle;" scope="col">Primary IRC Subsections
									<span style="font-weight:normal;">(for example, (f)(2)(A)(ii))</span>
								</th>
								<th class="styDepTblCell" style="width:23mm;vertical-align: middle;" scope="col">Regulation Subsection
									<span style="font-weight:normal;">(for example, (d)(1)(ii))</span>
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/CurrentTYUTPInformationGrp">
								<!--Add variable name for separate format-->
								<xsl:variable name="SeparatedUTPpositionPartI" select="position()"/>
								<tr>
									<!--Define background colors to the rows -->
									<xsl:attribute name="class">
										<xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<td class="styDepTblCell" style="text-align:left;width:13mm;" rowspan="2">
										<b>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="UTPNum"/>
											</xsl:call-template>
										</b>
									</td>
									<xsl:if test="count(IRCSections) = 0">
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;">
											<span>&#160;</span>
										</td>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;">
											<span>&#160;</span>
										</td>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;">
											<span>&#160;</span>
										</td>
									</xsl:if>
									<xsl:if test="count(IRCSections) = 1">
										<xsl:for-each select="IRCSections">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCSectionsNum"/>
												</xsl:call-template>
											</td>
										</xsl:for-each>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;">
											<span>&#160;</span>
										</td>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;">
											<span>&#160;</span>
										</td>
									</xsl:if>
									<xsl:if test="count(IRCSections) = 2">
										<xsl:for-each select="IRCSections">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCSectionsNum"/>
												</xsl:call-template>
											</td>
										</xsl:for-each>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;">
											<span>&#160;</span>
										</td>
									</xsl:if>
									<xsl:if test="count(IRCSections) = 3">
										<xsl:for-each select="IRCSections">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCSectionsNum"/>
												</xsl:call-template>
											</td>
										</xsl:for-each>
									</xsl:if>
									<td class="styDepTblCell" style="text-align:center;width:20mm;" rowspan="2">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="CitationNm"/>
										</xsl:call-template>
									</td>
									<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;word-wrap: break-word;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="RegulationSectionNum"/>
										</xsl:call-template>
									</td>
									<xsl:choose>
										<xsl:when test="BothTimingCodesInd">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
												<!--<span style="width:4px;"/>-->
												<input alt="BothTimingCodesInd" type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="BothTimingCodesInd"/>
														<xsl:with-param name="BackupName">BothTimingCodes<xsl:value-of select="$SeparatedUTPpositionPartI"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="BothTimingCodesInd"/>
														<xsl:with-param name="BackupName">BothTimingCodes<xsl:value-of select="$SeparatedUTPpositionPartI"/>
														</xsl:with-param>
													</xsl:call-template>
												</label>
											</td>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
												<!--<span style="width:4px;"/>-->
												<input alt="BothTimingCodesInd" type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="BothTimingCodesInd"/>
														<xsl:with-param name="BackupName">BothTimingCodes<xsl:value-of select="$SeparatedUTPpositionPartI"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="BothTimingCodesInd"/>
														<xsl:with-param name="BackupName">BothTimingCodes<xsl:value-of select="$SeparatedUTPpositionPartI"/>
														</xsl:with-param>
													</xsl:call-template>
												</label>
											</td>
										</xsl:when>
										<xsl:otherwise>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
												<input alt="PermanentTimingCodeInd" type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="PermanentTimingCodeInd"/>
														<xsl:with-param name="BackupName">PermanentTimingCode<xsl:value-of select="$SeparatedUTPpositionPartI"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="PermanentTimingCodeInd"/>
														<xsl:with-param name="BackupName">PermanentTimingCode<xsl:value-of select="$SeparatedUTPpositionPartI"/>
														</xsl:with-param>
													</xsl:call-template>
												</label>
											</td>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
												<input alt="TemporaryTimingCodeInd" type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="TemporaryTimingCodeInd"/>
														<xsl:with-param name="BackupName">TemporaryTimingCode<xsl:value-of select="$SeparatedUTPpositionPartI"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="TemporaryTimingCodeInd"/>
														<xsl:with-param name="BackupName">TemporaryTimingCode<xsl:value-of select="$SeparatedUTPpositionPartI"/>
														</xsl:with-param>
													</xsl:call-template>
												</label>
											</td>
										</xsl:otherwise>
									</xsl:choose>
									<td class="styDepTblCell" style="text-align:middle;width:23mm;" rowspan="2">
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
									<td class="styDepTblCell" rowspan="2">
										<input alt="MajorTaxPositionInd" type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="MajorTaxPositionInd"/>
												<xsl:with-param name="BackupName">MajorTaxPosition</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="MajorTaxPositionInd"/>
												<xsl:with-param name="BackupName">MajorTaxPosition</xsl:with-param>
											</xsl:call-template>
										</label>
									</td>
									<td class="styDepTblCell" style="text-align:center;width:11mm;" rowspan="2">
										<xsl:choose>
											<xsl:when test="TransferPricingTaxPostionCd">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TransferPricingTaxPostionCd"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OtherTaxPositionCd"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styDepTblCell" rowspan="2">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ScheduleOrFormNum"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" rowspan="2">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="LineNum"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" rowspan="2">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="DisclosedItemAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<!--Define background colors to the rows -->
									<xsl:attribute name="class">
										<xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<xsl:if test="count(IRCSections) = 0">
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;">
					(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)
										</td>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;">
					(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)
										</td>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;">
					(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)
										</td>
									</xsl:if>
									<xsl:if test="count(IRCSections) = 1">
										<xsl:for-each select="IRCSections">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;">
											(<span style="width:1px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCSubSectionNum"/>
												</xsl:call-template>
												<span style="width:1px;"/>) (<span style="width:1px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCParagraphNum"/>
												</xsl:call-template>
												<span style="width:1px;"/>) (<span style="width:1px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCSubParagraphNum"/>
												</xsl:call-template>
												<span style="width:1px;"/>) (<span style="width:1px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCClauseNum"/>
												</xsl:call-template>
												<span style="width:1px;"/>)
											</td>
										</xsl:for-each>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;">
					(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)
										</td>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;">
					(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)
										</td>
									</xsl:if>
									<xsl:if test="count(IRCSections) = 2">
										<xsl:for-each select="IRCSections">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;">
											(<span style="width:1px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCSubSectionNum"/>
												</xsl:call-template>
												<span style="width:1px;"/>) (<span style="width:1px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCParagraphNum"/>
												</xsl:call-template>
												<span style="width:1px;"/>) (<span style="width:1px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCSubParagraphNum"/>
												</xsl:call-template>
												<span style="width:1px;"/>) (<span style="width:1px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCClauseNum"/>
												</xsl:call-template>
												<span style="width:1px;"/>)
											</td>
										</xsl:for-each>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;">
					(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)
										</td>
									</xsl:if>
									<xsl:if test="count(IRCSections) = 3">
										<xsl:for-each select="IRCSections">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;">
											(<span style="width:1px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCSubSectionNum"/>
												</xsl:call-template>
												<span style="width:1px;"/>) (<span style="width:1px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCParagraphNum"/>
												</xsl:call-template>
												<span style="width:1px;"/>) (<span style="width:1px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCSubParagraphNum"/>
												</xsl:call-template>
												<span style="width:1px;"/>) (<span style="width:1px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCClauseNum"/>
												</xsl:call-template>
												<span style="width:1px;"/>)
											</td>
										</xsl:for-each>
									</xsl:if>
									<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;">
									(<span style="width:1px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="LevelOneParagraphNum"/>
										</xsl:call-template>
										<span style="width:1px;"/>) (<span style="width:1px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="LevelTwoParagraphNum"/>
										</xsl:call-template>
										<span style="width:1px;"/>) (<span style="width:1px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="LevelThreeParagraphNum"/>
										</xsl:call-template>
										<span style="width:1px;"/>) (<span style="width:1px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="LevelFourParagraphNum"/>
										</xsl:call-template>
										<span style="width:1px;"/>)
											</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- End Part I separated data -->
				<!-- Additonal Data Table for Part II-->
				<xsl:if test="($Print = $Separated) and (count($FormData/PriorTYUTPInformationGrp) &gt; 21)">
					<br/>
					<span class="styRepeatingDataTitle">
						<br/>
                Form 1120 Schedule UTP, Part II, Uncertain Tax Positions For Prior Tax Years.
              </span>
					<table class="styDepTblLandscape" style="font-size:6pt">
						<thead class="styTableHead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" style="width:12mm;vertical-align: middle;" scope="col" rowspan="2">(a)<br/>UTP No.</th>
								<th class="styDepTblCell" colspan="3" style="width:69mm;vertical-align: middle;" scope="col">(b)<br/>Primary IRC Sections 
					  <span style="font-weight:normal;">(for example, "61", "108",  "263A")</span>
								</th>
								<th class="styDepTblCell" style="width:20mm;vertical-align: middle;" scope="col" rowspan="2">
									(c)<br/>Rev. Rule, Rev. Proc.<br/>Etc.
								</th>
								<th class="styDepTblCell" style="width:23mm;vertical-align: middle;" scope="col">
									(d)<br/>Regulation Section
									<br/>
									<span style="font-weight:normal;">(for example, "1.482-7")</span>
								</th>
								<th class="styDepTblCell" colspan="2" style="width:20mm;vertical-align: middle;" scope="col" rowspan="2">(e)<br/>Timing Codes
					  <span style="font-weight:normal;">(check if Permanent, Temporary, or both)</span>
								</th>
								<th class="styDepTblCell" style="width:20mm;vertical-align: middle;" scope="col" rowspan="2">(f)<br/>Pass-Through Entity EIN</th>
								<th class="styDepTblCell" style="width:11mm;vertical-align: middle;" scope="col" rowspan="2">(g)<br/>MajorTax Position</th>
								<th class="styDepTblCell" style="width:11mm;vertical-align: middle;" scope="col" rowspan="2">(h)<br/>Ranking of Tax Position</th>
								<th class="styDepTblCell" style="width:17mm;vertical-align: middle;" scope="col" rowspan="2">(i)<br/>Form or Schedule</th>
								<th class="styDepTblCell" style="width:11mm;vertical-align: middle;" scope="col" rowspan="2">(j)<br/>Line No.</th>
								<th class="styDepTblCell" style="width:20mm;vertical-align: middle;" scope="col" rowspan="2">(k)<br/>Amount</th>
								<th class="styDepTblCell" style="width:11mm;vertical-align: middle;" scope="col" rowspan="2">(l)<br/>Year of Tax Position</th>
							</tr>
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" colspan="3" style="width:69mm;vertical-align: middle;" scope="col">Primary IRC Sub Sections
					  <span style="font-weight:normal;">(for example, (f)(2)(A)(ii))</span>
								</th>
								<th class="styDepTblCell" style="width:23mm;vertical-align: middle;" scope="col">Regulation Subsection
									<span style="font-weight:normal;">(for example, (d)(1)(ii))</span>
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/PriorTYUTPInformationGrp">
								<!--Add variable name for separate part II-->
								<xsl:variable name="SeparatedUTPpositionPartIl" select="position()"/>
								<tr>
									<!--Define background colors to the rows -->
									<xsl:attribute name="class">
										<xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<td class="styDepTblCell" style="text-align:left;width:12mm;" rowspan="2">
										<b>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="UTPNum"/>
											</xsl:call-template>
										</b>
									</td>
									<xsl:if test="count(IRCSections) = 0">
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;font-size:6pt;">
											<span>&#160;</span>
										</td>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;font-size:6pt;">
											<span>&#160;</span>
										</td>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;font-size:6pt;">
											<span>&#160;</span>
										</td>
									</xsl:if>
									<xsl:if test="count(IRCSections) = 1">
										<xsl:for-each select="IRCSections">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;font-size:6pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCSectionsNum"/>
												</xsl:call-template>
											</td>
										</xsl:for-each>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;font-size:6pt;">
											<span>&#160;</span>
										</td>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;font-size:6pt;">
											<span>&#160;</span>
										</td>
									</xsl:if>
									<xsl:if test="count(IRCSections) = 2">
										<xsl:for-each select="IRCSections">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;font-size:6pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCSectionsNum"/>
												</xsl:call-template>
											</td>
										</xsl:for-each>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;font-size:6pt;">
											<span>&#160;</span>
										</td>
									</xsl:if>
									<xsl:if test="count(IRCSections) = 3">
										<xsl:for-each select="IRCSections">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;font-size:6pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCSectionsNum"/>
												</xsl:call-template>
											</td>
										</xsl:for-each>
									</xsl:if>
									<td class="styDepTblCell" style="text-align:center;width:20mm;" rowspan="2">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="CitationNm"/>
										</xsl:call-template>
									</td>
									<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;word-wrap: break-word;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="RegulationSectionNum"/>
										</xsl:call-template>
									</td>
									<xsl:choose>
										<xsl:when test="BothTimingCodesInd">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
												<span style="width:4px;"/>
												<input alt="Partll-BothTimingCodes" type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="BothTimingCodesInd"/>
														<xsl:with-param name="BackupName">Partll-BothTimingCodes<xsl:value-of select="$SeparatedUTPpositionPartIl"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="BothTimingCodesInd"/>
														<xsl:with-param name="BackupName">Partll-BothTimingCodes<xsl:value-of select="$SeparatedUTPpositionPartIl"/>
														</xsl:with-param>
													</xsl:call-template>
												</label>
											</td>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
												<span style="width:4px;"/>
												<input alt="Partll-BothTimingCodes" type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="BothTimingCodesInd"/>
														<xsl:with-param name="BackupName">Partll-BothTimingCodes<xsl:value-of select="$SeparatedUTPpositionPartIl"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="BothTimingCodesInd"/>
														<xsl:with-param name="BackupName">Partll-BothTimingCodes<xsl:value-of select="$SeparatedUTPpositionPartIl"/>
														</xsl:with-param>
													</xsl:call-template>
												</label>
											</td>
										</xsl:when>
										<xsl:otherwise>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
												<span style="width:4px;"/>
												<input alt="Partll-PermanentTimingCode" type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="PermanentTimingCodeInd"/>
														<xsl:with-param name="BackupName">Partll-PermanentTimingCode<xsl:value-of select="$SeparatedUTPpositionPartIl"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="PermanentTimingCodeInd"/>
														<xsl:with-param name="BackupName">Partll-PermanentTimingCode<xsl:value-of select="$SeparatedUTPpositionPartIl"/>
														</xsl:with-param>
													</xsl:call-template>
												</label>
											</td>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
												<span style="width:4px;"/>
												<input alt="Partll-TemporaryTimingCode" type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="TemporaryTimingCodeInd"/>
														<xsl:with-param name="BackupName">Partll-TemporaryTimingCode<xsl:value-of select="$SeparatedUTPpositionPartIl"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="TemporaryTimingCodeInd"/>
														<xsl:with-param name="BackupName">Partll-TemporaryTimingCode<xsl:value-of select="$SeparatedUTPpositionPartIl"/>
														</xsl:with-param>
													</xsl:call-template>
												</label>
											</td>
										</xsl:otherwise>
									</xsl:choose>
									<td class="styDepTblCell" style="text-align:center;width:20mm;" rowspan="2">
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
									<td class="styDepTblCell" style="width:11mm;" rowspan="2">
										<input alt="MajorTaxPositionInd" type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="MajorTaxPositionInd"/>
												<xsl:with-param name="BackupName">MajorTaxPosition</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="MajorTaxPositionInd"/>
												<xsl:with-param name="BackupName">MajorTaxPosition</xsl:with-param>
											</xsl:call-template>
										</label>
									</td>
									<td class="styDepTblCell" style="width:11mm;" rowspan="2">
										<xsl:choose>
											<xsl:when test="TransferPricingTaxPostionCd">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TransferPricingTaxPostionCd"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OtherTaxPositionCd"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styDepTblCell" style="width:17mm;" rowspan="2">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ScheduleOrFormNum"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="width:11mm;" rowspan="2">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="LineNum"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="width:20mm;" rowspan="2">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="DisclosedItemAmt"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" rowspan="2">
										<xsl:call-template name="PopulateMonthYearForYearMonthType">
											<xsl:with-param name="TargetNode" select="TaxPositionYearDt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<!--Define background colors to the rows -->
									<xsl:attribute name="class">
										<xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<xsl:if test="count(IRCSections) = 0">
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;font-size:6pt;">
					(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)
										</td>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;font-size:6pt;">
					(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)
										</td>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;font-size:6pt;">
					(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)
										</td>
									</xsl:if>
									<xsl:if test="count(IRCSections) = 1">
										<xsl:for-each select="IRCSections">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;font-size:6pt;">
												(<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCSubSectionNum"/>
												</xsl:call-template>)
												(<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCParagraphNum"/>
												</xsl:call-template>)
												(<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCSubParagraphNum"/>
												</xsl:call-template>)
												(<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCClauseNum"/>
												</xsl:call-template>)
											</td>
										</xsl:for-each>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;font-size:6pt;">
					(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)
										</td>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;font-size:6pt;">
					(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)
										</td>
									</xsl:if>
									<xsl:if test="count(IRCSections) = 2">
										<xsl:for-each select="IRCSections">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;font-size:6pt;">
												(<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCSubSectionNum"/>
												</xsl:call-template>)
												(<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCParagraphNum"/>
												</xsl:call-template>)
												(<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCSubParagraphNum"/>
												</xsl:call-template>)
												(<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCClauseNum"/>
												</xsl:call-template>)
											</td>
										</xsl:for-each>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;font-size:6pt;">
					(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)(<span style="width:8px;"/>)
										</td>
									</xsl:if>
									<xsl:if test="count(IRCSections) = 3">
										<xsl:for-each select="IRCSections">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:23mm;font-size:6pt;">
												(<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCSubSectionNum"/>
												</xsl:call-template>)
												(<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCParagraphNum"/>
												</xsl:call-template>)
												(<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCSubParagraphNum"/>
												</xsl:call-template>)
												(<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryIRCClauseNum"/>
												</xsl:call-template>)
											</td>
										</xsl:for-each>
									</xsl:if>
									<td class="styIRS1120ScheduleUTP_styMiddleCell" style="font-size:6pt;width:23mm;">
									(<span style="width:1px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="LevelOneParagraphNum"/>
										</xsl:call-template>
										<span style="width:1px;"/>) (<span style="width:1px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="LevelTwoParagraphNum"/>
										</xsl:call-template>
										<span style="width:1px;"/>) (<span style="width:1px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="LevelThreeParagraphNum"/>
										</xsl:call-template>
										<span style="width:1px;"/>) (<span style="width:1px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="LevelFourParagraphNum"/>
										</xsl:call-template>
										<span style="width:1px;"/>)
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- End Part II separated data -->
				<!-- Additonal Data Table for Part III-->
				<xsl:if test="($Print = $Separated) and ( count($FormData/PriorTYUTPInformationGrp) + count($FormData/CurrentTYUTPInformationGrp)) &gt; 49">
					<br/>
					<span class="styRepeatingDataTitle">
						<br/>
                Form 1120 Schedule UTP, Part III, Concise Descriptions of UTPs.
              </span>
					<table class="styDepTblLandscape" style="font-size:7pt;">
						<thead class="styTableHead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" style="width:23mm;vertical-align: middle;" scope="col">UTP<br/>No.</th>
								<th class="styDepTblCell" style="vertical-align: middle;" scope="col">Concise Description of Uncertain Tax Position</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/CurrentTYUTPInformationGrp">
								<tr>
									<!--Define background colors to the rows -->
									<xsl:attribute name="class">
										<xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<td class="styDepTblCell" style="text-align:left;width:23mm;">
										<b>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="UTPNum"/>
											</xsl:call-template>
										</b>
									</td>
									<td class="styDepTblCell" style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ConciseUTPDesc"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="$FormData/PriorTYUTPInformationGrp">
								<tr>
									<!--Define background colors to the rows -->
									<xsl:attribute name="class">
										<xsl:choose>
											<xsl:when test="(count($FormData/CurrentTYUTPInformationGrp) + position()) mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<td class="styDepTblCell" style="text-align:left;">
										<b>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="UTPNum"/>
											</xsl:call-template>
										</b>
									</td>
									<td class="styDepTblCell" style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ConciseUTPDesc"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
				</xsl:if>
				<!-- End Part III -->
			</body>
		</html>
	</xsl:template>
	<xsl:template name="PrintBlankTable1">
		<xsl:param name="numRows" select="21 - count($FormData/CurrentTYUTPInformationGrp)"/>
		<xsl:if test="$numRows &gt; 0">
			<tr>
				<xsl:if test="($numRows mod 2 = 1) and ($numRows != 1)">
					<xsl:attribute name="style">background-color:lightgrey;</xsl:attribute>
				</xsl:if>
				<td class="styIRS1120ScheduleUTP_styLeftCell" rowspan="2">
					<xsl:choose>
						<xsl:when test="($numRows = 21) and ($Print = $Separated) and (count($FormData/CurrentTYUTPInformationGrp) &gt; 21)">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormData/CurrentTYUTPInformationGrp"/>
								<xsl:with-param name="ShortMessage" select=" 'true' "/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<b>C</b>
							<span style="width:4px;"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<span style="width:4px;"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<span style="width:4px;"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<span style="width:4px;"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
					<span style="width:4px;"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<span style="width:4px;"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
					<span style="width:4px;"/>
					<input alt="Blank-PermanentTimingCode" type="checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="PermanentTimingCodeInd"/>
							<xsl:with-param name="BackupName">Blank-PermanentTimingCode<xsl:value-of select="$numRows"/>
							</xsl:with-param>
						</xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="PermanentTimingCodeInd"/>
							<xsl:with-param name="BackupName">Blank-PermanentTimingCode<xsl:value-of select="$numRows"/>
							</xsl:with-param>
						</xsl:call-template>
					</label>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
					<span style="width:4px;"/>
					<input alt="Blank-TemporaryTimingCode" type="checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="TemporaryTimingCodeInd"/>
							<xsl:with-param name="BackupName">Blank-TemporaryTimingCode<xsl:value-of select="$numRows"/>
							</xsl:with-param>
						</xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="TemporaryTimingCodeInd"/>
							<xsl:with-param name="BackupName">Blank-TemporaryTimingCode<xsl:value-of select="$numRows"/>
							</xsl:with-param>
						</xsl:call-template>
					</label>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
					<span style="width:4px;"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
					<span style="width:4px;"/>
					<input alt="Blank-MajorTaxPosition" type="checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="MajorTaxPositionInd"/>
							<xsl:with-param name="BackupName">Blank-MajorTaxPosition<xsl:value-of select="$numRows"/>
							</xsl:with-param>
						</xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="MajorTaxPositionInd"/>
							<xsl:with-param name="BackupName">Blank-MajorTaxPosition<xsl:value-of select="$numRows"/>
							</xsl:with-param>
						</xsl:call-template>
					</label>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
					<span style="width:4px;"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
					<span style="width:4px;"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
					<span style="width:4px;"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styRightCell" rowspan="2">
					<span style="width:4px;"/>
				</td>
			</tr>
			<tr>
				<xsl:if test="($numRows mod 2 = 1) and ($numRows != 1)">
					<xsl:attribute name="style">background-color:lightgrey;</xsl:attribute>
				</xsl:if>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					(<span style="width:12px;"/>)(<span style="width:12px;"/>)(<span style="width:12px;"/>)(<span style="width:12px;"/>)
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					(<span style="width:12px;"/>)(<span style="width:12px;"/>)(<span style="width:12px;"/>)(<span style="width:12px;"/>)
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					(<span style="width:12px;"/>)(<span style="width:12px;"/>)(<span style="width:12px;"/>)(<span style="width:12px;"/>)
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					(<span style="width:12px;"/>)(<span style="width:12px;"/>)(<span style="width:12px;"/>)(<span style="width:12px;"/>)
				</td>
			</tr>
			<xsl:call-template name="PrintBlankTable1">
				<xsl:with-param name="numRows" select="$numRows - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="PrintBlankTable2">
		<xsl:param name="numRows" select="21 - count($FormData/PriorTYUTPInformationGrp)"/>
		<xsl:if test="$numRows &gt; 0">
			<tr>
				<xsl:if test="($numRows mod 2 = 1) and ($numRows != 1)">
					<xsl:attribute name="style">background-color:lightgrey;</xsl:attribute>
				</xsl:if>
				<td class="styIRS1120ScheduleUTP_styLeftCell" rowspan="2">
					<xsl:choose>
						<xsl:when test="($numRows = 21) and ($Print = $Separated) and (count($FormData/PriorTYUTPInformationGrp) &gt; 21)">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormData/PriorTYUTPInformationGrp"/>
								<xsl:with-param name="ShortMessage" select=" 'true' "/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<b>P</b>
							<span style="width:4px;"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<span style="width:4px;"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<span style="width:4px;"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<span style="width:4px;"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
					<span style="width:4px;"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<span style="width:4px;"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
					<span style="width:4px;"/>
					<input alt="Blank2-PermanentTimingCode" type="checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="PermanentTimingCodeInd"/>
							<xsl:with-param name="BackupName">Blank2-PermanentTimingCode<xsl:value-of select="$numRows"/>
							</xsl:with-param>
						</xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="PermanentTimingCodeInd"/>
							<xsl:with-param name="BackupName">Blank2-PermanentTimingCode<xsl:value-of select="$numRows"/>
							</xsl:with-param>
						</xsl:call-template>
					</label>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
					<span style="width:4px;"/>
					<input alt="Blank2-TemporaryTimingCode" type="checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="TemporaryTimingCodeInd"/>
							<xsl:with-param name="BackupName">Blank2-TemporaryTimingCode<xsl:value-of select="$numRows"/>
							</xsl:with-param>
						</xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="TemporaryTimingCodeInd"/>
							<xsl:with-param name="BackupName">Blank2-TemporaryTimingCode<xsl:value-of select="$numRows"/>
							</xsl:with-param>
						</xsl:call-template>
					</label>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
					<span style="width:4px;"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
					<span style="width:4px;"/>
					<input alt="Blank2-MajorTaxPosition" type="checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="MajorTaxPositionInd"/>
							<xsl:with-param name="BackupName">Blank2-MajorTaxPosition<xsl:value-of select="$numRows"/>
							</xsl:with-param>
						</xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="MajorTaxPositionInd"/>
							<xsl:with-param name="BackupName">Blank2-MajorTaxPosition<xsl:value-of select="$numRows"/>
							</xsl:with-param>
						</xsl:call-template>
					</label>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
					<span style="width:4px;"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
					<span style="width:4px;"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
					<span style="width:4px;"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell" rowspan="2">
					<span style="width:4px;"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styRightCell" rowspan="2">
					<span style="width:4px;"/>
				</td>
			</tr>
			<tr>
				<xsl:if test="($numRows mod 2 = 1) and ($numRows != 1)">
					<xsl:attribute name="style">background-color:lightgrey;</xsl:attribute>
				</xsl:if>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					(<span style="width:12px;"/>)(<span style="width:12px;"/>)(<span style="width:12px;"/>)(<span style="width:12px;"/>)
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					(<span style="width:12px;"/>)(<span style="width:12px;"/>)(<span style="width:12px;"/>)(<span style="width:12px;"/>)
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					(<span style="width:12px;"/>)(<span style="width:12px;"/>)(<span style="width:12px;"/>)(<span style="width:12px;"/>)
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					(<span style="width:12px;"/>)(<span style="width:12px;"/>)(<span style="width:12px;"/>)(<span style="width:12px;"/>)
				</td>
			</tr>
			<xsl:call-template name="PrintBlankTable2">
				<xsl:with-param name="numRows" select="$numRows - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="PrintBlankTable3">
		<xsl:param name="numRows" select="49 - (count($FormData/CurrentTYUTPInformationGrp) + count($FormData/PriorTYUTPInformationGrp))"/>
		<xsl:if test="$numRows &gt; 0">
			<tr>
				<td class="styIRS1120ScheduleUTP_styLeftCell">
					<xsl:choose>
						<xsl:when test="($numRows = 49) and ($Print = $Separated) and (count($FormData/CurrentTYUTPInformationGrp) + count($FormData/PriorTYUTPInformationGrp) &gt; 49)">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormData/CurrentTYUTPInformationGrp"/>
								<xsl:with-param name="ShortMessage" select=" 'true' "/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="$numRows = 1">
								<xsl:attribute name="style">border-bottom-width: 0px;</xsl:attribute>
							</xsl:if>
							<span style="width:4px;"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="styIRS1120ScheduleUTP_styRightCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<span style="width:4px;"/>
				</td>
			</tr>
			<xsl:call-template name="PrintBlankTable3">
				<xsl:with-param name="numRows" select="$numRows - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>