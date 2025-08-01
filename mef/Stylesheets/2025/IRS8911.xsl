<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XML Spy v4.4 U (http://www.xmlspy.com) by Ken Dulabhan (Comteq Federal Inc) -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8911Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8911" select="$RtnDoc/IRS8911"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8911)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 8911"/>
				<xsl:call-template name="InitJS"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<style type="text/css">
					<!-- EXCEPTION: per Tamaira Green's response e-mail dated 8/4/09, column a and b heading for Part III, line 12 can be omitted from PDF dated 1/9/09.-->
					<!--PRINT STATEMENT-->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8911Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8911">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:20mm;border-right:none;">
							<span style="height:5mm;">
                Form <span class="styFormNumber">8911</span>
								<!--General Dependency Push Pin -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8911"/>
								</xsl:call-template>
								<span class="styAgency">(Rev. December 2024)</span>
							</span>
							<span class="styAgency">Department of the Treasury</span>
						    <span class="styAgency">Internal Revenue Service</span>		
              
						</div>
						<div class="styFTBox" style="width:123mm;border-right:1px solid black;border-left:1px solid black;height:20mm;">
							<div style="padding-top:2mm;height:8.5mm;" class="styMainTitle">
                Alternative Fuel Vehicle Refueling Property Credit
              </div>
							<br/>
							<br/>
							<div class="styFST" style="height:5mm;font-size:7pt;padding-top:2mm;">
								<img src="{$ImagePath}/8911_Bullet.gif" alt="Right Pointing Arrow Image"/>
                  Attach to your tax return.<br/>
								<img src="{$ImagePath}/8911_Bullet.gif" alt="Right Pointing Arrow Image"/>
								 Go to <i><a href="http://www.irs.gov/Form8911">www.irs.gov/Form8911</a></i> for instructions and the latest information.
							</div>
						</div>
						<div class="styTYBox" style="width:32mm;border-left:none;">
							<div class="styOMB" style="height:4mm;">OMB No. 1545-0123</div>
						
							<div style="margin-left:2mm;padding-top:9mm;text-align:left;">
                Attachment<br/>Sequence No. <span class="styBoldText">151</span>
							</div>
						</div>
						<!-- Close right tax return header box -->
					</div>
					<!-- Close left tax return header box -->
					<!-- End Form Number and Name section -->
					<!-- Begin Name and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:140mm;height:10mm;font-size:7pt;">
				Name(s) shown on return
				<br/>
							<!-- =============Return Header goes here==========================================-->
							<xsl:choose>
								<xsl:when test="$RtnHdrData/Filer/BusinessName">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<!-- Name from 1041 Return Header -->
								<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$RtnHdrData/Filer/NationalMortgageAssocCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
									</xsl:call-template>
									<br/>
								</xsl:when>
								<xsl:otherwise>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<!-- Begin Names and Identifying number section -->
						<div class="styEINBox" style="width:46mm;height:4mm;padding-left:2mm;font-size:7pt;">Identifying number
				<br/>
							<br/>
							<span style="font-weight:normal;">
								<!--Choice statement for EIN Line when either filing with 1120 or 1040 and data calling from a ReturnHeader-->
								<!-- WARNING: Return Type will need to be update with various future form 1040 return type-->
								<xsl:choose>
									<xsl:when test="$RtnHdrData/Filer/EIN">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
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
					
					<div style="width:187mm">
						<div style="float:left;clear:none;">
					<!--		<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:1mm;">1</div> -->
							<div class="styLNDesc" style="width:187mm;padding-top:1mm;height:7.5mm;">
              <span class="styBoldText"> Note: </span> Complete a separate Schedule A (Form 8911) for each qualified alternative fuel vehicle refueling property placed in service during the tax <span style="padding-right:8.5mm"></span>year.  See instructions.
         			
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;height:auto;padding-top:0;padding-bottom:0;border-top-width:2px;">
						<div class="styPartName" style="height:4mm;">Part I</div>
						<div class="styPartDesc" style="float:left;width:167mm;">
		     Credit for Business/Investment Use Part of Refueling Property
				   </div> 
					 </div> 				
					<!-- Line 1-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc" style="width:137mm;">
								<span style="float:left;">Enter the total credit amount figured in Part II of Schedule(s) A (Form 8911)</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">.........</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox">1</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8911/BusInvstUseRefuelingPropCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					<!-- Line 2 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:2.5mm;">2</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Alternative fuel vehicle refueling property credit from partnerships and S corporations (see instructions)</span>
                                          							
                         		<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:3mm;">.</div>
							</div>
						</div>
						<div style="float:right;clear:none;width:40mm;">
					
			   				<div class="styLNRightNumBox" style="height:4mm;">2</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8911/AltFuelVehRefuelPropCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					<!-- Line 3 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none">
							<div class="styLNLeftNumBox" style="padding-left:2.5mm;">3</div>
							<div class="styLNDesc">
								<span class="styBoldText">Business/investment use part of credit. </span>
									Add lines 1 and 2. Partnerships and S corporations not making <br/> an election to transfer the 
									credit, stop here and report this amount on Schedule K. All others, report this amount on Form 
									3800, Part III, line 1s 
								<!--Dotted Line<span style="float:left;">-->
								<div class="styDotLn" style="float:right;padding-right:2.5mm;">.....................</div>
							</div>
						</div>
						<div style="float:right;clear:none;width:40mm;">
							<div class="styLNRightNumBoxNBB" style="height:5mm;background:gray;bottom-width:0"/>
			   				<div class="styLNAmountBox" style="height:5mm;border-bottom-width:0"/>
			   				<div class="styLNRightNumBoxNBB" style="height:5mm;">3</div>
							<div class="styLNAmountBoxNBB" style="height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8911/BusinessInvstUsePartOfCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
																	
					<!-- Part II header -->
					<div class="styBB" style="width:187mm;height:auto;padding-top:0;padding-bottom:0;border-top-width:2px;">
						<div class="styPartName" style="height:4mm">Part II</div>
						<div class="styPartDesc" style="float:left;width:167mm;">
		        Credit for Personal Use Part of Refueling Property
		    </div>
					</div>
					<!-- Line 4-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:2.5mm;">4</div>
							<div class="styLNDesc" style="width:137mm;">
               Enter the total credit amount figured in Part III of Schedule(s) A (Form 8911) 
                <!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">.........</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4mm;">4</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8911/PrsnlUseRefuelingPropCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 5 Row 1 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:2.5mm;">5</div>
							<div class="styLNDesc" style="width:139mm;">
		      Regular tax before credits:
		    </div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="background:gray;border-bottom-width:0;"/>
							<div class="styLNAmountBox" style="border-bottom-width:0;"/>
						</div>
					</div>
					<!-- Line 5 Row 2-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left: 2mm;"/>
							<div class="styLNDesc" style="width:139mm; ">
								<table border="0" cellspacing="0" cellpadding="0" style="padding:0mm">
									<tr>
										<td style=" width:119mm;font-size:7pt;font-family:verdana;font-style: normal;font-weight:normal;border:none;">
											<img src="{$ImagePath}/8911_Bullet_Round.gif" alt="dot"/>
						Individuals. Enter the sum of the amounts from Form 1040, 1040-SR, or 1040-NR, 
						
											<span style="padding-left:2mm">line 16, and Schedule 2 (Form 1040), line 1z.</span>
											<br/>
											
											<img src="{$ImagePath}/8911_Bullet_Round.gif" alt="dot"/>
                        Other filers. Enter the regular tax before credits from your return.
                       
										</td>
										<td style="width:27mm;">
											<div class="styLNDesc" style="width:2mm;padding-bottom:9.5mm;"> 
												<img src="{$ImagePath}/8911_Bracket_Sm.gif" alt="Curly Bracket Image"/>
										</div> 
											<div class="styLNDesc" style="width:21mm;">
												<span class="styBoldText" style="font-size:7pt;float:right;letter-spacing:3mm;padding-top:3mm">.....</span> 
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<div style="float:right;clear:none;width:40mm;">
							<div class="styLNRightNumBox" style="padding-top:4mm;height:8mm;">5</div>
							<div class="styLNAmountBox" style="padding-top:4mm;height:8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8911/RegularTaxBeforeCreditsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;background-color:grey;border-bottom-width:0;"/>
							<div class="styLNAmountBox" style="height:4mm;border-bottom-width:0;"/>
						</div>
					</div>
					<!-- Line 6-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;padding-top:2mm">
							<div class="styLNLeftNumBox" style="padding-left: 2mm;">6</div>
							<div class="styLNDesc" style="width:139mm;">
		      Credits that reduce regular tax before the alternative fuel vehicle refueling property credit:
			  <xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$Form8911/OtherSpecifiedCredits"/>
								</xsl:call-template>
								<span style="width:2px;"/>
								<!--Dotted Line-->
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:6mm;background:gray;border-bottom-width:0"/>
							<div class="styLNAmountBox" style="height:6mm;border-bottom-width:0;"/>
						</div>
					</div>
					<!-- Line 6a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox">
								<span style="width:6px;padding-left:3mm"/>a							
							</div>
							<div class="styLNDesc" style="width:99mm;">
								<span style="float:left;">Foreign tax credit </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">6a</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8911/ForeignTaxCreditAmt"/>
								</xsl:call-template>
							</div>
				  		<div class="styLNRightNumBox" style="height:4.5mm;background:gray;border-bottom-width:0"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0;"/>
						</div>
					</div>
					<!-- Line 6b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
							<div class="styLNDesc" style="width:99mm;">
								<span style="float:left;">Certain allowable credits (see instructions) </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">6b</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8911/CertainAllowableCreditsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;background:gray;border-bottom-width:0"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0;"/>
						</div>
					</div>
					<!-- Line 6c -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox">
								<span style="width:6px;padding-left:3mm">c</span>
							</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Add lines 6a and 6b</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:3mm;">...........................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox">6c</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8911/TotalTaxCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
										
					<!-- L7 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left: 2mm;">7</div>
							<div class="styLNDesc" style="width:139mm;">
		      Net regular tax. Subtract line 6c from line 5. If zero or less, enter -0- and stop here; 
			 <span class="styBoldText">do not</span> file this 
			 <span style="float:left;">form unless you are claiming a credit on line 3 </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:3mm;">..................</div>
							</div>
						</div>
						<div style="float:right;clear:none;width:40mm;">
							<div class="styLNRightNumBox" style="height:4mm;background:gray;border-bottom-width:0"/>
							<div class="styLNAmountBox" style="height:4mm;border-bottom-width:0"/>
							<div class="styLNRightNumBox" style="height:4mm;">7</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8911/NetRegularTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 8 Row 2-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:2mm;">8</div>
							<div class="styLNDesc" style="width:139mm;">
		      Tentative minimum tax (see instructions):	
		    </div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="background:gray;border-bottom-width:0"/>
							<div class="styLNAmountBox" style="border-bottom-width:0;"/>
						</div>
					</div>
					<!-- Line 8 Row 2-->
					<div style="width:187mm;height:13mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:2mm; "/>
							<div class="styLNDesc" style="width:139mm; ">
								<table border="0" cellspacing="0" cellpadding="0" style="padding:0mm">
									<tr>
										<td style="font-size:7pt;font-family:verdana;font-style: normal;font-weight:normal;border:none; width: 111mm;">
											<img src="{$ImagePath}/8911_Bullet_Round.gif" alt="dot"/>
											Individuals. Enter the amount from Form 6251, line 9.
                      <br/>
											<img src="{$ImagePath}/8911_Bullet_Round.gif" alt="dot"/>
										  Other filers. Enter the tentative minimum tax from your alternative minimum tax
										 <br/>
											<span style="padding-left:2.5mm;">form or schedule.</span>
										</td>
										<td style="width:27mm">
											<div class="styLNDesc" style="width:2mm;padding-bottom:7mm;">
												<img src="{$ImagePath}/8911_Bracket_Sm.gif" alt="Curly Bracket Image"/>
											</div>
											<div class="styLNDesc" style="width:25mm;">
												<span class="styBoldText" style="font-size:7pt;float:right;letter-spacing:3.5mm;padding-top:3.5mm">......</span>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<div style="float:right;clear:none;width:40mm;">
							<div class="styLNRightNumBoxNBB" style="padding-top:4mm;height:6mm;background-color:gray;"/>
							<div class="styLNAmountBoxNBB" style="padding-top:4mm;height:6mm;"/>
							<div class="styLNRightNumBox" style="">8</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8911/TentativeMinimumTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:6m;background-color:gray;border-bottom-width:0;"/>
							<div class="styLNAmountBox" style="height:6mm;border-bottom-width:0;"/>
						</div>
					</div>
					<!-- L9-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left: 2mm;">9</div>
							<div class="styLNDesc" style="width:139mm;">
		      Subtract line 8 from line 7. If zero or less, enter -0- and stop here; 
		      <span class="styBoldText">do not</span> 
			 file this form unless you are 
			 <span style="float:left;">claiming a credit on line 3 </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:2mm;">.........................</div>
							</div>
						</div>
						<div style="float:right;clear:none;width:40mm;">
							<div class="styLNRightNumBox" style="background:gray;border-bottom-width:0;"/>
							<div class="styLNAmountBox" style="border-bottom-width:0;"/>
							<div class="styLNRightNumBox">9</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8911/AdjustedRegularTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 10-->
					<div class="styTBB" style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox">10</div>
							<div class="styLNDesc" style="width:139mm">
								<span class="styBoldText">Personal use part of credit. </span>
			   Enter the <span class="styBoldText">smaller</span>
			   of line 4 or line 9 here and on Schedule 3 (Form 1040), <br/>line 6j; or the appropriate line of your return. If line 9 is smaller than line 4, see instructions 			
                <!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1.5mm;">.....</div>
							</div>
						</div>
						<div style="float:right;clear:none;width:40mm;">
							<div class="styLNRightNumBox" style="height:4mm;background:gray;border-bottom-width:0"/>
							<div class="styLNAmountBox" style="height:4mm;border-bottom-width:0"/>
							<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0;">10</div>
							<div class="styLNAmountBox" style="height:4mm;border-bottom-width:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8911/TotalPersonalUsePartOfCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End of Page -->
					<div class="pageEnd" style="width:187mm;">
						<div style="float:left;clear:none;">
							<span class="styBoldText" style="width:90mm;">For Paperwork Reduction Act Notice, see separate instructions. </span>
							<span style="width:40mm; text-align:center;">Cat. No. 37721Q </span>
						</div>
						<div style="float:right;clear:none;">
							<span style="width:50mm;text-align:right;"> Form <b>8911</b> (Rev. 12-2024)</span>
						</div>
					</div>
					<!-- BEGIN Left Over Table -->
					<!-- ADDITIONAL DATA TITLE BAR AND BUTTON--> 
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
              Additional Data        
            </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8911"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- Optional Print Solution for repeating data table  -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
