<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Yee Chen on 4/2/2025 - 1040 SCH 2 TY25 -->
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY ndash "&#8211;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS1040Schedule2Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1040Schedule2" />
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge" />
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)" />
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content="IRS Form 1040 Schedule 2" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040Schedule2Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1040Schedule2">
					<xsl:call-template name="DocumentHeader" />
					<!-- Header -->		
					<div class="styStdDiv">
						<div class="styFNBox" style="width:29mm;height:17mm;border-right-width:2px;">
							<div class="styFormNumber" style="font-size:7pt;">
								<span style="font-size:10pt;">SCHEDULE 2</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData" />
								</xsl:call-template><br />
								(Form 1040)
							</div>
							<br /><br />
							<div class="styAgency" style="padding-top:.5mm;">Department of the Treasury<br/>
								Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:128mm;height:17mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:2mm;">Additional Taxes</span>
							<br /><br />
							<span style="font-weight:bold;">
								Attach to Form 1040, 1040-SR, or 1040-NR.
							</span><br />
							<span style="font-weight:bold;">
								Go to <span style="font-style:italic">www.irs.gov/Form1040</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width: 29mm; height: 17mm;">
							<div class="styOMB" style="font-size:6pt; height: 4mm; padding-right: 1.5mm; padding-left: 1.5mm;">
								OMB No. 1545-0074
							</div>
							<div class="styTY" style="height: 6mm; line-height: 100%; font-size: 21pt;">
								20<span class="styTYColor">25</span>
							</div>
							<div style="text-align: left; padding-top: .3mm; padding-left: 3mm;">
								Attachment<br/> Sequence No. <span class="styBoldText" style="font-size:8pt">02</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:2px solid black;">
						<div class="styNameBox" style="width:135mm;">Name(s) shown on Form 1040, 1040-SR or 1040-NR
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:0.5mm;font-weight:normal;">
							<strong>Your social security number</strong>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="padding-top:.25mm;">Part I</div>
						<div class="styPartDesc" style="padding-top:.25mm;">Tax</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBox">1</div>
                        <div class="styLNDesc" style="width:98mm;">
                            Addittions to tax:
                        </div>
                        <div class="styLNRightNumBox" style="border-bottom:none;">&nbsp;</div>
                        <div class="styLNAmountBox" style="border-bottom:none;">&nbsp;</div>
                        <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB">&nbsp;</div>
                    </div>
                    <!-- Line 1a -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-top:2mm;padding-left:4.2mm;height:5mm;">a</div>
                        <div class="styLNDesc" style="width:98mm;padding-top:2mm;">
                            Excess advance premium tax credit repayment. Attach Form 8962
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PremiumTaxCreditTaxLiabAmt"/>
							</xsl:call-template>
                            <span class="sty1040Sch2DotLn">..</span>
                        </div>
                        <div class="styLNRightNumBox" style="height:7mm;padding-bottom:6mm;"><br />1a</div>
                        <div class="styLNAmountBox" style="height:7mm;padding-bottom:6mm;"><br />
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/PremiumTaxCreditTaxLiabAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
                    </div>
					<!-- Line 1b -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;height:10mm;">b</div>
                        <div class="styLNDesc" style="width:98mm;">
                           Repayment of new clean vehicle credit(s) transferred to a registered dealer from Schedule A (Form 8936), Part II. Attach Form 8936 and Schedule A (Form 8936)
                           <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/CrTrnsfrDlrSaleAmt"/>
							</xsl:call-template>
                            <span class="sty1040Sch2DotLn">...................</span>
                        </div>
                        <div class="styLNRightNumBox" style="padding-top:3mm;height:10mm;"><br />1b</div>
                        <div class="styLNAmountBox" style="padding-top:3mm;height:10mm;"><br />
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/CrTrnsfrDlrSaleAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB" style="height:10mm;">&nbsp;</div>
                    </div>
					<!-- Line 1c -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;height:10mm;">c</div>
                        <div class="styLNDesc" style="width:98mm;">
                           Repayment of previously owned clean vehicle credit(s) transferred to a registered dealer from Schedule A (Form 8936), Part IV. Attach Form 8936 and Schedule A (Form 8936)
                           <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PrevOwnCrTrnsfrDlrSaleAmt"/>
							</xsl:call-template>
                            <span class="sty1040Sch2DotLn">..............</span>
                        </div>
                        <div class="styLNRightNumBox" style="padding-top:3mm;height:10mm;"><br />1c</div>
                        <div class="styLNAmountBox" style="padding-top:3mm;height:10mm;"><br />
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/PrevOwnCrTrnsfrDlrSaleAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB" style="height:10mm;">&nbsp;</div>
                    </div>
                    <!-- Line 1d -->
						<div class="styStdDivNoScroll">
							<div class="styLNLeftNumBoxSD" style="padding-top:3mm;padding-left:4.2mm;height:7mm;">d</div>
							<div class="styLNDesc" style="padding-top:3mm;width:98mm;">
								Recapture of net EPE from Form 4255, line 2a, column (l)
								<span class="sty1040Sch2DotLn">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;"><br />1d</div>
							<div class="styLNAmountBox" style="height:7mm;"><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RcptrPrtnNetEPECrAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040Sch2LNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
						</div>
                    <!-- Line 1e -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;height:15mm;">e</div>
                        <div class="styLNDesc" style="width:98mm;">
                            Excessive payments from Form 4255. Check applicable box and enter amount
                            <br/>
						<span class="styBoldText">(i)<span style="width: 1.5mm;"/></span>
						<span style="width:4px;"/>
						<input type="checkbox" alt="ExcessivePymtFrom4255Grp/ApplicableCheckboxiInd" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessivePymtFrom4255Grp/ApplicableCheckboxiInd"/>
								<xsl:with-param name="BackupName">IRS1040Schedule2ExcessivePymtFrom4255GrpApplicableCheckboxiInd</xsl:with-param>
							</xsl:call-template>
						</input> 
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessivePymtFrom4255Grp/ApplicableCheckboxiInd"/>
								<xsl:with-param name="BackupName">IRS1040Schedule2ExcessivePymtFrom4255GrpApplicableCheckboxiInd</xsl:with-param>
							</xsl:call-template>
							Line 1a, column (n)
						</label>
						<span style="width:20px;"/>
							<span class="styBoldText">(ii)<span style="width: 2mm;"/></span>
							<span style="width:3px;"/>
						<input type="checkbox" alt="ExcessivePymtFrom4255Grp/ApplicableCheckboxiiInd" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessivePymtFrom4255Grp/ApplicableCheckboxiiInd"/>
								<xsl:with-param name="BackupName">IRS1040Schedule2ExcessivePymtFrom4255GrpApplicableCheckboxiiInd</xsl:with-param>
							</xsl:call-template>
						</input> 
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessivePymtFrom4255Grp/ApplicableCheckboxiiInd"/>
								<xsl:with-param name="BackupName">IRS1040Schedule2ExcessivePymtFrom4255GrpApplicableCheckboxiiInd</xsl:with-param>
							</xsl:call-template>
							Line 1c, column (n)
						</label>
								<br/>
							<span class="styBoldText">(iii)<span style="width: 1mm;"/></span>
						<input type="checkbox" alt="ExcessivePymtFrom4255Grp/ApplicableCheckboxiiiInd" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessivePymtFrom4255Grp/ApplicableCheckboxiiiInd"/>
								<xsl:with-param name="BackupName">IRS1040Schedule2ExcessivePymtFrom4255GrpApplicableCheckboxiiiInd</xsl:with-param>
							</xsl:call-template>
						</input> 
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessivePymtFrom4255Grp/ApplicableCheckboxiiiInd"/>
								<xsl:with-param name="BackupName">IRS1040Schedule2ExcessivePymtFrom4255GrpApplicableCheckboxiiiInd</xsl:with-param>
							</xsl:call-template>
							Line 1d, column (n)
						</label>
						<span style="width:20px;"/>
							<span class="styBoldText">(iv)<span style="width: 2mm;"/></span>
							
						<input type="checkbox" alt="ExcessivePymtFrom4255Grp/ApplicableCheckboxivInd" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessivePymtFrom4255Grp/ApplicableCheckboxivInd"/>
								<xsl:with-param name="BackupName">IRS1040Schedule2ExcessivePymtFrom4255GrpApplicableCheckboxivInd</xsl:with-param>
							</xsl:call-template>
						</input> 
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessivePymtFrom4255Grp/ApplicableCheckboxivInd"/>
								<xsl:with-param name="BackupName">IRS1040Schedule2ExcessivePymtFrom4255GrpApplicableCheckboxivInd</xsl:with-param>
							</xsl:call-template>
							Line 2a, column (n)
						</label>
                            <span class="sty1040Sch2DotLn" style="padding-top:2mm;">....</span>
                        </div>
                        <div class="styLNRightNumBox" style="padding-top:8mm;height:15mm;"><br />1e</div>
                        <div class="styLNAmountBox" style="padding-top:8mm;height:15mm;"><br />
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/ExcessivePymtFrom4255Grp/ExPymt100CrAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="height:15mm;background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB" style="height:15mm;">&nbsp;</div>
                    </div>
                <!-- Line 1f -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;height:16mm;">f</div>
                        <div class="styLNDesc" style="width:98mm;">
                            20% EP from Form 4255. Check applicable box and enter amount. See instructions.<br/>                      
							<span class="styBoldText">(i)<span style="width: 1.5mm;"/></span>
							<span style="width:4px;"/>
							<input type="checkbox" alt="IncreaseChapter1TaxFrom4255Grp/ApplicableCheckboxiInd" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IncreaseChapter1TaxFrom4255Grp/ApplicableCheckboxiInd"/>
									<xsl:with-param name="BackupName">IRS1040Schedule2IncreaseChapter1TaxFrom4255GrpApplicableCheckboxiInd</xsl:with-param>
								</xsl:call-template>
							</input> 
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IncreaseChapter1TaxFrom4255Grp/ApplicableCheckboxiInd"/>
									<xsl:with-param name="BackupName">IRS1040Schedule2IncreaseChapter1TaxFrom4255GrpApplicableCheckboxiInd</xsl:with-param>
								</xsl:call-template>
								Line 1a, column (o)
							</label>
							<span style="width:20px;"/>
								<span class="styBoldText">(ii)<span style="width: 2mm;"/></span>
								<span style="width:3px;"/>
							<input type="checkbox" alt="IncreaseChapter1TaxFrom4255Grp/ApplicableCheckboxiiInd" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IncreaseChapter1TaxFrom4255Grp/ApplicableCheckboxiiInd"/>
									<xsl:with-param name="BackupName">IRS1040Schedule2IncreaseChapter1TaxFrom4255GrpApplicableCheckboxiiInd</xsl:with-param>
								</xsl:call-template>
							</input> 
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IncreaseChapter1TaxFrom4255Grp/ApplicableCheckboxiiInd"/>
									<xsl:with-param name="BackupName">IRS1040Schedule2IncreaseChapter1TaxFrom4255GrpApplicableCheckboxiiInd</xsl:with-param>
								</xsl:call-template>
								Line 1c, column (o)
							</label>
									<br/>
								<span class="styBoldText">(iii)<span style="width: 1mm;"/></span>
							<input type="checkbox" alt="IncreaseChapter1TaxFrom4255Grp/ApplicableCheckboxiiiInd" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IncreaseChapter1TaxFrom4255Grp/ApplicableCheckboxiiiInd"/>
									<xsl:with-param name="BackupName">IRS1040Schedule2IncreaseChapter1TaxFrom4255GrpApplicableCheckboxiiiInd</xsl:with-param>
								</xsl:call-template>
							</input> 
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IncreaseChapter1TaxFrom4255Grp/ApplicableCheckboxiiiInd"/>
									<xsl:with-param name="BackupName">IRS1040Schedule2IncreaseChapter1TaxFrom4255GrpApplicableCheckboxiiiInd</xsl:with-param>
								</xsl:call-template>
								Line 1d, column (o)
							</label>
							<span style="width:20px;"/>
								<span class="styBoldText">(iv)<span style="width: 2mm;"/></span>
								
							<input type="checkbox" alt="IncreaseChapter1TaxFrom4255Grp/ApplicableCheckboxivInd" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IncreaseChapter1TaxFrom4255Grp/ApplicableCheckboxivInd"/>
									<xsl:with-param name="BackupName">IRS1040Schedule2IncreaseChapter1TaxFrom4255GrpApplicableCheckboxivInd</xsl:with-param>
								</xsl:call-template>
							</input> 
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IncreaseChapter1TaxFrom4255Grp/ApplicableCheckboxivInd"/>
									<xsl:with-param name="BackupName">IRS1040Schedule2IncreaseChapter1TaxFrom4255GrpApplicableCheckboxivInd</xsl:with-param>
								</xsl:call-template>
								Line 2a, column (o)
							</label>
                            <span class="sty1040Sch2DotLn" style="padding-top:1mm;">....</span>
                        </div>
                        <div class="styLNRightNumBox" style="height:16mm;padding-top:9mm;"><br />1f</div>
                        <div class="styLNAmountBox" style="height:16mm;padding-top:9mm;"><br />
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/IncreaseChapter1TaxFrom4255Grp/TotEx20PrvlWgAprntcshpPnltyAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="height:16mm;background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB" style="height:16mm;">&nbsp;</div>
                    </div>
                    <!-- Line 1y -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-top:4mm;padding-left:4.2mm;height:7mm;">y</div>
                        <div class="styLNDesc" style="width:98mm;height:7mm;padding-top:4mm;">
                            Other additions to tax (see instructions):
                            <span style="width:10mm;">
                             <xsl:call-template name="LinkToLeftoverDataTableInline">
                                        <xsl:with-param name="Desc">Line 1y - Other additions to tax literal code</xsl:with-param>
                                        <xsl:with-param name="TargetNode" select="$FormData/OtherTaxAdditionsGrp/OtherTaxLitCd"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                                        <xsl:with-param name="Desc">Line 1y - Other additions to tax text</xsl:with-param>
                                        <xsl:with-param name="TargetNode" select="$FormData/OtherTaxAdditionsGrp/OtherTaxTxt"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                                        <xsl:with-param name="Desc">Line 1y - Other additions to tax amount</xsl:with-param>
                                        <xsl:with-param name="TargetNode" select="$FormData/OtherTaxAdditionsGrp/OtherTaxAmt"/>
                                    </xsl:call-template>
                            </span>
                            <span style="width:34mm;border-bottom:1px solid black;"></span>
                        </div>
                        <div class="styLNRightNumBox" style="height:7mm;"><br />1y</div>
                        <div class="styLNAmountBox" style="height:7mm;"><br />
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxAdditionsAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7mm;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB" style="height:7mm;width:19mm;">&nbsp;</div>
                    </div>
                    <!-- Line 1z -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-top:3mm;padding-left:4.2mm;height:7mm;">z</div>
                        <div class="styLNDesc" style="padding-top:3mm;width:98mm;">
                            Add lines 1a through 1y
                            <span class="sty1040Sch2DotLn">................</span>
                        </div>
                        <div class="styLNRightNumBox" style="height:7mm;"><br />1z</div>
                        <div class="styLNAmountBox" style="height:7mm;"><br />
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/TotalTaxAdditionsAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
                    </div>
					<!-- Line 2 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Alternative minimum tax. Attach Form 6251 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch2DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="sty1040Sch2AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							Add lines 1z and 2. Enter here and on Form 1040, 1040-SR, or 1040-NR, line 17
							<span class="sty1040Sch2DotLn">.........</span>
						</div>
						<div class="styLNRightNumBoxNBB">3</div>
						<div class="sty1040Sch2LNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Other Taxes</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							Self-employment tax. Attach Schedule SE 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 4 - Exempt Self-Employment Tax Literal Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt/@exemptSETaxLiteralCd"/>
							</xsl:call-template>
							<span class="sty1040Sch2DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="sty1040Sch2AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
                    <!-- Line 5 -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD">5</div>
                        <div class="styLNDesc" style="height:7mm;width:98mm;">
                            Social security and Medicare tax on unreported tip income. &nbsp;&nbsp;Attach Form 
                            <br />4137
                            <xsl:call-template name="SetFormLinkInline">
                                <xsl:with-param name="TargetNode" select="$FormData/SocSecMedicareTaxUnrptdTipAmt"/>
                            </xsl:call-template>
                            <span class="sty1040Sch2DotLn">.....................</span>
                        </div>
                        <div class="styLNRightNumBox" style="height:7mm;"><br />5</div>
                        <div class="styLNAmountBox" style="height:7mm;"><br />
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/SocSecMedicareTaxUnrptdTipAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7mm;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
                    </div>
                     <!-- Line 6 -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD">6</div>
                        <div class="styLNDesc" style="width:98mm;">
                            Uncollected social security and Medicare tax on wages. Attach Form 8919
                            <xsl:call-template name="SetFormLinkInline">
                                <xsl:with-param name="TargetNode" select="$FormData/UncollectedSocSecMedTaxAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBox">6</div>
                        <div class="styLNAmountBox">
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/UncollectedSocSecMedTaxAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB">&nbsp;</div>
                    </div>
                    <!-- Line 7 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc">
							Total additional social security and Medicare tax. Add lines 5 and 6
                            <span class="sty1040Sch2DotLn">.............</span>
                        </div>
						<div class="styLNRightNumBox">7</div>
						<div class="sty1040Sch2AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UnrprtdSocSecAndMedcrTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD" style="height:7mm">8</div>
						<div class="styLNDesc" style="height:7mm">
                            Additional tax on IRAs or other tax-favored accounts. Attach Form 5329 if required. If not required, check <br/>here
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 8 - Form 5329 Not Required Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt/@form5329NotRequiredInd"/>
							</xsl:call-template>
							<span style="float:right;">
								<span class="sty1040Sch2DotLn" style="float:none;margin-right:-7px;">.............................</span>
								<span style="width:8px;"/>
								<input type="checkbox" class="styCkboxNM" style="margin-right:6px;" alt="Form 5329 not required indicator">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt/@form5329NotRequiredInd"/>
										<xsl:with-param name="BackupName">IRS1040Schedule2Form5329NotRequiredInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm; padding-top:3.5mm">8</div>
						<div class="sty1040Sch2AmountBox" style="height:7mm;padding-top:3.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc">
                            Household employment taxes. Attach Schedule H 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/HouseholdEmploymentTaxAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch2DotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="sty1040Sch2AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/HouseholdEmploymentTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc">
							Repayment of first-time homebuyer credit. Attach Form 5405 if required 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/FirstTimeHmByrRepaymentAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch2DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="sty1040Sch2AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FirstTimeHmByrRepaymentAmt"/>
							</xsl:call-template>
						</div>
					</div>
                    <!-- Line 11 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc">
							Additional Medicare Tax. Attach Form 8959 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAMRRTTaxAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch2DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="sty1040Sch2AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAMRRTTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
                    <!-- Line 12 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc">
							Net investment income tax. Attach Form 8960 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IndivNetInvstIncomeTaxAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch2DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">12</div>
						<div class="sty1040Sch2AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IndivNetInvstIncomeTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
                    <!-- Line 13 -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBox">13</div>
                        <div class="styLNDesc" style="height:7mm;">
                            Uncollected social security and Medicare or RRTA tax on tips or group-term life insurance from Form W-2,<br />
                            box 12
                            <span class="sty1040Sch2DotLn">................................</span>
                        </div>
                        <div class="styLNRightNumBox" style="height:7mm;"><br />13</div>
                        <div class="sty1040Sch2AmountBox" style="height:7mm;"><br />
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/UncollSSMedcrRRTAGrpInsTxAmt"/>
                            </xsl:call-template>
                        </div>
                    </div>
                    <!-- Line 14 -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBox">14</div>
                        <div class="styLNDesc">
                            Interest on tax due on installment income from the sale of certain residential lots and timeshares
                            <span class="sty1040Sch2DotLn">...</span>
                        </div>
                        <div class="styLNRightNumBox">14</div>
                        <div class="sty1040Sch2AmountBox">
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/IntTaxDueInstalSaleIncmAmt"/>
                            </xsl:call-template>
                        </div>
                    </div>
                    <!-- Line 15 -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBox">15</div>
                        <div class="styLNDesc">
                            Interest on the deferred tax on gain from certain installment sales with a sales price over $150,000
                            <span class="sty1040Sch2DotLn">...</span>
                        </div>
                        <div class="styLNRightNumBox">15</div>
                        <div class="sty1040Sch2AmountBox">
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/IntDefrdTaxGainInstalSalesAmt"/>
                            </xsl:call-template>
                        </div>
                    </div>
                    <!-- Line 16 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc">
							Recapture of low-interest housing credit. Attach Form 8611
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/RecaptureTaxAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch2DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">16</div>
						<div class="sty1040Sch2AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RecaptureTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
                    <div class="styStdDiv" style="text-align:right;font-weight:bold;font-style: italic;">
						(continued on page 2)
					</div>
                    <div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
						<span style="margin-left:16mm;font-size:6.5pt;">Cat. No. 71478U</span>
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule 2 (Form 1040) 2025</span>
					</div>
                    <!-- page break -->
                    <div class="styStdDiv">
                        Schedule 2 (Form 1040) 2025
                        <span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></span>
                    </div>
                    <!-- Part II -->
                    <div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;">
                        <div class="styPartName">Part II</div>
                        <div class="styPartDesc">Other Taxes<span style="font-weight:normal;font-style:italic;">&nbsp;&nbsp;(continued)</span></div>
                    </div>
                    <!-- Line 17 -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBox">17</div>
                        <div class="styLNDesc" style="width:98mm;">
                            Other additional taxes:
                        </div>
                        <div class="styLNRightNumBox" style="border-bottom:none;">&nbsp;</div>
                        <div class="styLNAmountBox" style="border-bottom:none;">&nbsp;</div>
                        <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB">&nbsp;</div>
                    </div>
                    <!-- Line 17a -->
                    <xsl:variable name="hasMultiRecapOtherCredits" select="count($FormData/RecaptureOtherCreditsGrp) &gt; 1"/>
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;height:4.2mm;">a</div>
                        <div class="styLNDesc" style="height:4.2mm;width:98mm;">
                            Recapture of other credits. List type, form number, and amount: 
                            <span style="width:12mm;border-bottom:1px solid black;">
                                <xsl:if test="not($hasMultiRecapOtherCredits)">
                                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                                        <xsl:with-param name="Desc">Line 17a - Other Credits Code</xsl:with-param>
                                        <xsl:with-param name="TargetNode" select="$FormData/RecaptureOtherCreditsGrp/OtherCreditsCd"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                                        <xsl:with-param name="Desc">Line 17a - Other Credits Text</xsl:with-param>
                                        <xsl:with-param name="TargetNode" select="$FormData/RecaptureOtherCreditsGrp/OtherCreditsTxt"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                                        <xsl:with-param name="Desc">Line 17a - Other Credits Amount</xsl:with-param>
                                        <xsl:with-param name="TargetNode" select="$FormData/RecaptureOtherCreditsGrp/OtherCreditsAmt"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="$hasMultiRecapOtherCredits">
                                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                                        <xsl:with-param name="Desc">Line 17a - Recapture of other credits</xsl:with-param>
                                        <xsl:with-param name="TargetNode" select="$FormData/RecaptureOtherCreditsGrp/OtherCreditsAmt"/>
                                    </xsl:call-template>
                                </xsl:if>
                            </span>
                        </div>
                        <div class="styLNRightNumBox" style="height:4.2mm;">17a</div>
                        <div class="styLNAmountBox" style="height:4.2mm;">
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/TotalRecaptureOtherCreditsAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="height:4.2mm;background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB" style="height:4.2mm;width:19mm;">&nbsp;</div>
                    </div>
                    <!-- Line 17b -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;height:7mm;">b</div>
                        <div class="styLNDesc" style="width:98mm;">
                            Recapture of federal mortgage subsidy, if you sold your home, see<br />
                            instructions
                            <span class="sty1040Sch2DotLn">....................</span>
                        </div>
                        <div class="styLNRightNumBox" style="height:7mm;"><br />17b</div>
                        <div class="styLNAmountBox" style="height:7mm;"><br />
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/MortgSbsdyRecaptureTaxAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
                    </div>
                    <!-- Line 17c -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
                        <div class="styLNDesc" style="width:98mm;">
                            Additional tax on HSA distributions. Attach Form 8889
                             <xsl:call-template name="SetFormLinkInline">
                                <xsl:with-param name="TargetNode" select="$FormData/HSADistriAddnlPercentTaxAmt"/>
                            </xsl:call-template>
                            <span class="sty1040Sch2DotLn">......</span>
                        </div>
                        <div class="styLNRightNumBox">17c</div>
                        <div class="styLNAmountBox">
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/HSADistriAddnlPercentTaxAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB">&nbsp;</div>
                    </div>
                    <!-- Line 17d -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;height:7mm;">d</div>
                        <div class="styLNDesc" style="width:98mm;">
                            Additional tax on an HSA because you didn't remain an eligible individual. Attach Form 8889
                            <xsl:call-template name="SetFormLinkInline">
                                <xsl:with-param name="TargetNode" select="$FormData/HDHPCoverageAddnlTaxAmt"/>
                            </xsl:call-template>
                            <span class="sty1040Sch2DotLn">.................</span>
                        </div>
                        <div class="styLNRightNumBox" style="height:7mm;"><br />17d</div>
                        <div class="styLNAmountBox" style="height:7mm;"><br />
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/HDHPCoverageAddnlTaxAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
                    </div>
                    <!-- Line 17e -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">e</div>
                        <div class="styLNDesc" style="width:98mm;">
                            Additional tax on Archer MSA distributions. Attach Form 8853
                            <xsl:call-template name="SetFormLinkInline">
                                <xsl:with-param name="TargetNode" select="$FormData/ArcherMSAAddnlDistriTaxAmt"/>
                            </xsl:call-template>
                            <span class="sty1040Sch2DotLn">...</span>
                        </div>
                        <div class="styLNRightNumBox">17e</div>
                        <div class="styLNAmountBox">
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/ArcherMSAAddnlDistriTaxAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB">&nbsp;</div>
                    </div>
                    <!-- Line 17f -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">f</div>
                        <div class="styLNDesc" style="width:98mm;">
                            Additional tax on Medicare Advantage MSA distributions. Attach Form 8853
                            <xsl:call-template name="SetFormLinkInline">
                                <xsl:with-param name="TargetNode" select="$FormData/MedicareMSAAddnlDistriTaxAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBox">17f</div>
                        <div class="styLNAmountBox">
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/MedicareMSAAddnlDistriTaxAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB">&nbsp;</div>
                    </div>
                    <!-- Line 17g -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;height:7mm;">g</div>
                        <div class="styLNDesc" style="width:98mm;">
                            Recapture of a charitable contribution deduction related to a fractional<br />
                            interest in tangible personal property
                            <span class="sty1040Sch2DotLn">............</span>
                        </div>
                        <div class="styLNRightNumBox" style="height:7mm;"><br />17g</div>
                        <div class="styLNAmountBox" style="height:7mm;"><br />
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/RecaptureChrtblContriDedAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
                    </div>
                    <!-- Line 17h -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;height:7mm;">h</div>
                        <div class="styLNDesc" style="width:98mm;">
                            Income you received from a nonqualified deferred compensation plan that <br />
                            fails to meet the requirements of section 409A
                            <span class="sty1040Sch2DotLn">.........</span>
                        </div>
                        <div class="styLNRightNumBox" style="height:7mm;"><br />17h</div>
                        <div class="styLNAmountBox" style="height:7mm;"><br />
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/IncmNonqlfyDefrdCompPlanAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
                    </div>
                    <!-- Line 17i -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;height:7mm;">i</div>
                        <div class="styLNDesc" style="width:98mm;">
                            Compensation you received from a nonqualified deferred compensation plan <br />
                            described in section 457A
                            <span class="sty1040Sch2DotLn">................</span>
                        </div>
                        <div class="styLNRightNumBox" style="height:7mm;"><br />17i</div>
                        <div class="styLNAmountBox" style="height:7mm;"><br />
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/CompNonqlfyDefrdCompPlanAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
                    </div>
                    <!-- Line 17j -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">j</div>
                        <div class="styLNDesc" style="width:98mm;">
                            Section 72(m)(5) excess benefits tax
                            <span class="sty1040Sch2DotLn">............</span>
                        </div>
                        <div class="styLNRightNumBox">17j</div>
                        <div class="styLNAmountBox">
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/Sect72m5ExcessBenefitsTaxAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB">&nbsp;</div>
                    </div>
                    <!-- Line 17k -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">k</div>
                        <div class="styLNDesc" style="width:98mm;">
                            Golden parachute payments
                            <span class="sty1040Sch2DotLn">...............</span>
                        </div>
                        <div class="styLNRightNumBox">17k</div>
                        <div class="styLNAmountBox">
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/ExcessParachutePaymentAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB">&nbsp;</div>
                    </div>
                    <!-- Line 17l -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">l</div>
                        <div class="styLNDesc" style="width:98mm;">
                            Tax on accumulation distribution of trusts
                            <span class="sty1040Sch2DotLn">...........</span>
                        </div>
                        <div class="styLNRightNumBox">17l</div>
                        <div class="styLNAmountBox">
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/PartialTaxOnAccumDistriAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB">&nbsp;</div>
                    </div>
                    <!-- Line 17m -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">m</div>
                        <div class="styLNDesc" style="width:98mm;">
                            Excise tax on insider stock compensation from an expatriated corporation
                            <span class="sty1040Sch2DotLn">.</span>
                        </div>
                        <div class="styLNRightNumBox">17m</div>
                        <div class="styLNAmountBox">
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/InsiderStockCompExciseTaxAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB">&nbsp;</div>
                    </div>
                    <!-- Line 17n -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">n</div>
                        <div class="styLNDesc" style="width:98mm;">
                            Look-back interest under section 167(g) or 460(b) from Form 8697 or 8866
                        </div>
                        <div class="styLNRightNumBox">17n</div>
                        <div class="styLNAmountBox">
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/LookBackIntSect167gOr460bAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB">&nbsp;</div>
                    </div>
                    <!-- Line 17o -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;height:7mm;">o</div>
                        <div class="styLNDesc" style="width:98mm;">
                            Tax on non-effectively connected income for any part of the year you were<br />
                            a nonresident alien from Form 1040-NR
                            <span class="sty1040Sch2DotLn">...........</span>
                        </div>
                        <div class="styLNRightNumBox" style="height:7mm;"><br />17o</div>
                        <div class="styLNAmountBox" style="height:7mm;"><br />
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/IncomeNotUSBusinessTaxAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
                    </div>
                    <!-- Line 17p -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;height:7mm;">p</div>
                        <div class="styLNDesc" style="width:98mm;">
                            Any interest from Form 8621, line 16f, relating to distributions from, and<br />
                             dispositions of, stock of a section 1291 fund
                            <xsl:call-template name="SetFormLinkInline">
                                <xsl:with-param name="TargetNode" select="$FormData/InterestOnEachNetIncrInTaxAmt"/>
                            </xsl:call-template>
                            <span class="sty1040Sch2DotLn">.........</span>
                        </div>
                        <div class="styLNRightNumBox" style="height:7mm;"><br />17p</div>
                        <div class="styLNAmountBox" style="height:7mm;"><br />
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/InterestOnEachNetIncrInTaxAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
                    </div>
                    <!-- Line 17q -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">q</div>
                        <div class="styLNDesc" style="width:98mm;">
                            Any interest from Form 8621, line 24
                            <xsl:call-template name="SetFormLinkInline">
                                <xsl:with-param name="TargetNode" select="$FormData/AccruedInterestDueThisRetAmt"/>
                            </xsl:call-template>
                            <span class="sty1040Sch2DotLn">...........</span>
                        </div>
                        <div class="styLNRightNumBox">17q</div>
                        <div class="styLNAmountBox">
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/AccruedInterestDueThisRetAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB">&nbsp;</div>
                    </div>
                    <!-- Line 17z -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;height:7mm;">z</div>
                        <div class="styLNDesc" style="width:98mm;height:7mm;border-bottom:1px solid black;">
                            Any other taxes. List type and amount: 
                            <span style="width:45mm;border-bottom:1px solid black;">
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$FormData/TotalAnyOtherTaxesAmt"/>
                                </xsl:call-template>
                            </span>
                        </div>
                        <div class="styLNRightNumBox" style="height:7mm;"><br />17z</div>
                        <div class="styLNAmountBox" style="height:7mm;"><br />
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/TotalAnyOtherTaxesAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7mm;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB" style="height:7mm;width:19mm;">&nbsp;</div>
                    </div>
                    <!-- Line 18 -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBox">18</div>
                        <div class="styLNDesc">
                            Total additional taxes. Add lines 17a through 17z
                            <span class="sty1040Sch2DotLn">..................</span>
                        </div>
                        <div class="styLNRightNumBox">18</div>
                        <div class="sty1040Sch2AmountBox">
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/TotalOtherAdditionalTaxesAmt"/>
                            </xsl:call-template>
                        </div>
                    </div>
                    <!-- Line 19 -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBox">19</div>
                        <div class="styLNDesc">
                            Recapture of net EPE from Form 4255, line 1d, column (l)
                            <span class="sty1040Sch2DotLn">................</span>
                        </div>
                        <div class="styLNRightNumBox">19</div>
                        <div class="sty1040Sch2AmountBox">
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/Frm3468IVRcptrPrtnNetEPECrAmt"/>
                            </xsl:call-template>
                        </div>
                        
                    </div>
                    <!-- Line 20 -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBox">20</div>
                        <div class="styLNDesc" style="width:98mm;">
                            Section 965 net tax liability installment from Form 965-A
                            <span class="sty1040Sch2DotLn">......</span>
                        </div>
                        <div class="styLNRightNumBox">20</div>
                        <div class="styLNAmountBox" style="padding-right:0.5mm;">
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/Section965TaxInstallmentAmt"/>
                            </xsl:call-template>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
                        <div class="sty1040Sch2LNAmountBoxNBB">&nbsp;</div>
                    </div>
                    <!-- Line 21 -->
                    <div class="styStdDivNoScroll">
                        <div class="styLNLeftNumBox">21</div>
                        <div class="styLNDesc" style="height:7mm;">
                            Add lines 4, 7 through 16, and 18. These are your <strong>total other taxes.</strong>
                            Enter here and on Form 1040 or <br/> 1040-SR, line 23, or Form 1040-NR, line 23b
                            <span class="sty1040Sch2DotLn">....................</span>
                        </div>
                        <div class="styLNRightNumBoxNBB" style="height:7mm;"><br />21</div>
                        <div class="sty1040Sch2LNAmountBoxNBB" style="height:7mm;"><br />
                            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxesAmt"/>
                            </xsl:call-template>
                        </div>
                    </div>
                    <!-- Form footer-->
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
						<span style="margin-left:16mm;font-size:6.5pt;">Cat. No. 71478U</span>
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule 2 (Form 1040) 2025</span>
					</div>
					<!-- Additional Data title bar and button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
                    <!-- Additional Data table -->
                    <table class="styLeftOverTbl">
                        <xsl:call-template name="PopulateCommonLeftover">
                            <xsl:with-param name="TargetNode" select="$FormData"/>
                            <xsl:with-param name="DescWidth" select="100"/>
                        </xsl:call-template>

                        <xsl:call-template name="PopulateLeftoverRow">
                            <xsl:with-param name="Desc">Line 4 - Exempt Self-Employment Tax Literal Code</xsl:with-param>
                            <xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt/@exemptSETaxLiteralCd"/>
                        </xsl:call-template>
                        <xsl:call-template name="PopulateLeftoverRow">
                            <xsl:with-param name="Desc">Line 8 - Form 5329 Not Required Indicator</xsl:with-param>
                            <xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt/@form5329NotRequiredInd"/>
                        </xsl:call-template>                  
                    </table>
                    
                     <br/>
                        <br/>
						<!-- Line 1y Table --> 
                        <span class="styRepeatingDataTitle">Line 1y - Other additions to tax</span>
                        <table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:150mm;">
                            <thead class="styTableThead">
                                <tr class="styDepTblHdr">
                                    <th class="styDepTblCell" scope="col" style="width:50mm;">
                                        <strong>(a)</strong><br /> Other Additions To Tax Literal Code
                                    </th>
                                    <th class="styDepTblCell" scope="col" style="width:50mm;">
                                        <strong>(b)</strong><br /> Other Additions To Tax Text
                                    </th>
                                    <th class="styDepTblCell" scope="col" style="width:50mm;">
                                        <strong>(c)</strong><br /> Other Additions To Tax Amount
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="$FormData/OtherTaxAdditionsGrp">
                                    <tr style="border-color:black;height:6mm;">
                                        <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                                        <td class="styTableCellCtrInherit">
                                            <xsl:call-template name="PopulateText">
                                                <xsl:with-param name="TargetNode" select="OtherTaxLitCd"/>
                                            </xsl:call-template>
                                        </td>
                                        <td class="styTableCellCtrInherit">
                                            <xsl:call-template name="PopulateText">
                                                <xsl:with-param name="TargetNode" select="OtherTaxTxt"/>
                                            </xsl:call-template>
                                        </td>
                                        <td class="styTableCellAmtInherit">
                                            <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="OtherTaxAmt"/>
                                            </xsl:call-template>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
					   <!-- End Line 1y Table --> 
					   
						<!-- Line 17a Table --> 
                        <br/>
                        <br/>
                        <span class="styRepeatingDataTitle">Line 17a - Recapture of other credits</span>
                        <table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:150mm;">
                            <thead class="styTableThead">
                                <tr class="styDepTblHdr">
                                    <th class="styDepTblCell" scope="col" style="width:50mm;">
                                        <strong>(a)</strong><br /> Other Credits Code
                                    </th>
                                    <th class="styDepTblCell" scope="col" style="width:50mm;">
                                        <strong>(b)</strong><br /> Other Credits Text
                                    </th>
                                    <th class="styDepTblCell" scope="col" style="width:50mm;">
                                        <strong>(c)</strong><br /> Other Credits Amount
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="$FormData/RecaptureOtherCreditsGrp">
                                    <tr style="border-color:black;height:6mm;">
                                        <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                                        <td class="styTableCellCtrInherit">
                                            <xsl:call-template name="PopulateText">
                                                <xsl:with-param name="TargetNode" select="OtherCreditsCd"/>
                                            </xsl:call-template>
                                        </td>
                                        <td class="styTableCellCtrInherit">
                                            <xsl:call-template name="PopulateText">
                                                <xsl:with-param name="TargetNode" select="OtherCreditsTxt"/>
                                            </xsl:call-template>
                                        </td>
                                        <td class="styTableCellAmtInherit">
                                            <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="OtherCreditsAmt"/>
                                            </xsl:call-template>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                        <br/>
                        <!-- End Line 17a Table --> 
				</form>
			</body>
		</html>
	</xsl:template>	
</xsl:stylesheet>
