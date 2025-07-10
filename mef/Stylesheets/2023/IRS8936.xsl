<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8936Style.xsl"/>
<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
<xsl:strip-space elements="*"/>
<xsl:param name="FormData" select="$RtnDoc/IRS8936"/>
<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>  
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"/></xsl:call-template></title>
  <!--  No Browser Caching  -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching-->
  <meta http-equiv="Cache-Control" content="private"/>  
  <meta name="Description" content="Form IRS 8936"/>
  <meta name="GENERATOR" content="IBM WebSphere Studio"/>
   <xsl:call-template name="GlobalStylesForm"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
  <xsl:call-template name="InitJS"/>  
  <style type="text/css">
  <!--************************************************************************
     Notes: Part I, line 1 thru 5, Part II, 6 and 7, and Part 3, line 11
                is an unbound repeatable columns.
     ************************************************************************** -->
		<xsl:if test="not($Print) or $Print=''">
		  <xsl:call-template name="IRS8936Style"/>
		  <xsl:call-template name="AddOnStyle"/>  
		</xsl:if>
  </style>      
 </head>
      <body class="styBodyClass" style="width:187mm">
  <form name="Form8936">    
    <xsl:call-template name="DocumentHeader"/>  
 <!--Title of Form -->    
  <div class="styBB" style="width:187mm;height: 22mm">
	<div class="styFNBox" style="width:30mm;height:22mm;border-right-width:1px;">
		<div style="font-size: 8pt;height:16mm">      
		  Form <span class="styFormNumber">8936</span> <br />
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$FormData"/>
			</xsl:call-template>		  
		   <br /> 
			<!--<span style="font-size:7pt;font-weight:normal">(Rev. December 2022)</span>--> <br /> 
		<div class="styAgency" style="font-weight:normal;height:7mm;">
		  Department of the Treasury<br/>Internal Revenue Service
		</div>
	</div>
  </div>
	<div class="styFTBox" style="width:127mm;height:22mm;">
      <div class="styMainTitle" style="height: 8mm">Clean Vehicle Credits</div>
      <div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:bold;">
        <div style="margin-left: 1.5mm;">
<!--          (Including Qualified Two- or Three-Wheeled Plug-in Electric Vehicles)--><br/><br/>
            Attach to your tax return.<br/>
            <span style="padding-top:1px;margin-left: 1mm;">
             Go to <i><a href="http://www.irs.gov/Form8936"><i>www.irs.gov/Form8936</i></a></i> for instructions and the latest information.</span>
             </div>
    </div>
  </div>
      <!-- OMB etc; set OMB width to 6 pt since 7pt will increase width to over 187mm-->  
		<div class="styTYBox" style="width:30mm;height:22mm;">
			<div class="styOMB" style="height:auto;">OMB No. 1545-2137</div>
			<div class="styTY" style="height:11mm;">20<span class="styTYColor">23</span>
		</div>
        <div class="stySequence" style="height:11mm;">
          Attachment
			<div>
			  Sequence No. <span class="styBoldText" style="font-size:8pt;">69</span>
			</div>
		</div>
	<!--<div class="styOMB" style="height:5mm;"><br/>OMB No. 1545-2137</div>
		<div class="styTY" style="height:11mm;">20<span class="styTYColor">23</span>
		</div>
        <div class="stySequence" style="height:10.5mm;">
          Attachment
          <div>
          Sequence No. <span class="styBoldText" style="font-size:8pt;">69</span>
        </div></div>-->
      </div>
  </div>
  <!--  End title of Form  -->
   <!--  Name and Employer identification number  -->
  <div class="styBB" style="width:187mm">
    <div class="styNameBox" style="width:141mm;font-size:7pt;">
      Name(s) shown on return<br/>
  		 <xsl:choose>
			  <!-- Name from 1120/990/1065 Return Header -->
			  <xsl:when test="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt">
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
				</xsl:call-template>
				<br/>
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
				</xsl:call-template>
			  </xsl:when>
			  <!-- Name from 1040 Return Header -->
			  <xsl:when test="$RtnHdrData/Filer/PrimaryNameControlTxt">
				<br/>
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
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
		</xsl:choose>
    </div>
    <div class="styEINBox" style="width:46mm;padding-left:2mm; font-size:7pt;">
	<div class="BoldText" style="width:46mm;height:3mm;">Identifying number</div>
		<div style="text-align:left;font-weight:normal; ">
		  <br/>
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
		</div>    
    </div>
  </div>  
  <!--  End Name and Employer indentification number  -->
   <!--  Note Line -->
  <div class="styTBB" style="width: 187mm;">
         <!--<div style="font-weight:normal"><b>Note:</b> This credit is for qualified plug-in electric drive motor vehicles placed in service before 2023, qualified two-wheeled plug-in electric vehicles acquired before but placed in service in 2022, and new clean vehicles placed in service after 2022. See separate instructions for vehicle definitions and other requirements. </div>-->
			<b>Notes:</b>
		<span style="width:3mm;"/>&#8226; Complete a separate Schedule A (Form 8936) for each clean vehicle placed in service during the tax year.<br/>
		<span style="width:12mm;"/>&#8226; Individuals completing Parts II, III, or IV, must also complete Part I. See "Note" text below.

  </div>
  <!--  End Note Line -->
	<!--  Part I header -->
	<div class="styBB" style="width: 187mm;">
		<div class="styPartName" style="height:4mm;">Part I</div>
		<div class="styPartDesc">Modified Adjusted Gross Income Amount</div>
	</div>
	<!-- Part 1 Line 1a -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD">1a</div>
		<div class="styLNDesc" style="width:99mm;">
			Enter the amount from line 11 of your 2023 Form 1040, 1040-SR, or 1040-NR
			<!--<span class="sty8936DotLn">.....</span>-->
		</div>
		<div class="styLNRightNumBox">1a</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/MAGIAmountGrp/CurrentYrMAGIAmountGrp/AdjustedGrossIncomeAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
		<div class="styLNAmountBoxNBB" style="border-left-width:0px;">&nbsp;</div>
	</div>
	<!-- Part 1 Line 1b -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
		<div class="styLNDesc" style="width:99mm;">
			Enter any income from Puerto Rico you excluded
			<span class="sty8936DotLn">.........</span>
		</div>
		<div class="styLNRightNumBox">1b</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/MAGIAmountGrp/CurrentYrMAGIAmountGrp/ExcldSect933PuertoRicoIncmAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
		<div class="styLNAmountBoxNBB" style="border-left-width:0px;">&nbsp;</div>
	</div>
	<!-- Part 1 Line 1c -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
		<div class="styLNDesc" style="width:99mm;">
			Enter any amount from Form 2555, line 45
			<span class="sty8936DotLn">...........</span>
		</div>
		<div class="styLNRightNumBox">1c</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/MAGIAmountGrp/CurrentYrMAGIAmountGrp/TotalIncomeExclusionAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
		<div class="styLNAmountBoxNBB" style="border-left-width:0px;">&nbsp;</div>
	</div>
	<!-- Part 1 Line 1d -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
		<div class="styLNDesc" style="width:99mm;">
			Enter any amount from Form 2555, line 50
			<span class="sty8936DotLn">...........</span>
		</div>
		<div class="styLNRightNumBox">1d</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/MAGIAmountGrp/CurrentYrMAGIAmountGrp/HousingDeductionAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
		<div class="styLNAmountBoxNBB" style="border-left-width:0px;">&nbsp;</div>
	</div>
	<!-- Part 1 Line 1e -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">e</div>
		<div class="styLNDesc" style="width:99mm;">
			Enter any amount from Form 4563, line 15
			<span class="sty8936DotLn">...........</span>
		</div>
		<div class="styLNRightNumBox">1e</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/MAGIAmountGrp/CurrentYrMAGIAmountGrp/GrossIncomeExclusionAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
		<div class="styLNAmountBoxNBB" style="border-left-width:0px;">&nbsp;</div>
	</div>
	<!-- Part 1 Line 2 -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD">2</div>
		<div class="styLNDesc" style="width:139mm;">
			Add lines 1a through 1e
			<span class="sty8936DotLn">...........................</span>
		</div>
		<div class="styLNRightNumBox">2</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/MAGIAmountGrp/CurrentYrMAGIAmountGrp/NetIncomeAmt"/>
			</xsl:call-template>
		</div>
	</div>
	<!-- Part 1 Line 3a -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD">3a</div>
		<div class="styLNDesc" style="width:99mm;">
			Enter the amount from line 11 of your 2022 Form 1040, 1040-SR, or 1040-NR
			<!--<span class="sty8936DotLn">.....</span>-->
		</div>
		<div class="styLNRightNumBox">3a</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/MAGIAmountGrp/PriorYrMAGIAmountGrp/AdjustedGrossIncomeAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
		<div class="styLNAmountBoxNBB" style="border-left-width:0px;">&nbsp;</div>
	</div>
	<!-- Part 1 Line 3b -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
		<div class="styLNDesc" style="width:99mm;">
			Enter any income from Puerto Rico you excluded
			<span class="sty8936DotLn">.........</span>
		</div>
		<div class="styLNRightNumBox">3b</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/MAGIAmountGrp/PriorYrMAGIAmountGrp/ExcldSect933PuertoRicoIncmAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
		<div class="styLNAmountBoxNBB" style="border-left-width:0px;">&nbsp;</div>
	</div>
	<!-- Part 1 Line 3c -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
		<div class="styLNDesc" style="width:99mm;">
			Enter any amount from Form 2555, line 45
			<span class="sty8936DotLn">...........</span>
		</div>
		<div class="styLNRightNumBox">3c</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/MAGIAmountGrp/PriorYrMAGIAmountGrp/TotalIncomeExclusionAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
		<div class="styLNAmountBoxNBB" style="border-left-width:0px;">&nbsp;</div>
	</div>
	<!-- Part 1 Line 3d -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
		<div class="styLNDesc" style="width:99mm;">
			Enter any amount from Form 2555, line 50
			<span class="sty8936DotLn">...........</span>
		</div>
		<div class="styLNRightNumBox">3d</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/MAGIAmountGrp/PriorYrMAGIAmountGrp/HousingDeductionAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
		<div class="styLNAmountBoxNBB" style="border-left-width:0px;">&nbsp;</div>
	</div>
	<!-- Part 1 Line 3e -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">e</div>
		<div class="styLNDesc" style="width:99mm;">
			Enter any amount from Form 4563, line 15
			<span class="sty8936DotLn">...........</span>
		</div>
		<div class="styLNRightNumBox">3e</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/MAGIAmountGrp/PriorYrMAGIAmountGrp/GrossIncomeExclusionAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
		<div class="styLNAmountBoxNBB" style="border-left-width:0px;">&nbsp;</div>
	</div>
	<!-- Part 1 Line 4 -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD">4</div>
		<div class="styLNDesc" style="width:139mm;">
			Add lines 3a through 3e
			<span class="sty8936DotLn">...........................</span>
		</div>
		<div class="styLNRightNumBox">4</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/MAGIAmountGrp/PriorYrMAGIAmountGrp/NetIncomeAmt"/>
			</xsl:call-template>
		</div>
	</div>
	<!-- Part 1 Line 5 -->
	<div class="styTBB" style="width:187mm;">
		<div class="styLNLeftNumBoxSD">5</div>
		<div class="styLNDesc" style="width:139mm;">
			Enter the <span class="styBoldText">smaller</span> of line 2 or line 4
			<span class="sty8936DotLn">.......................</span>
		</div>
		<div class="styLNRightNumBox" style="border-bottom-width:0;">5</div>
		<div class="styLNAmountBox" style="border-bottom-width:0;padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/MAGIAmountGrp/MaximumNetIncomeAmt"/>
			</xsl:call-template>
		</div>
	</div>
	<!--  End Part I -->
	<!--<xsl:if test="($Print != $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt;= 5)">
         <br class="pageEnd"/>
	</xsl:if>-->

	<!--  Part II header -->
	<div class="styStdDiv">
		<div class="styPartName" style="height:4mm;">Part II</div>
		<div class="styPartDesc">Credit for Business/Investment Use Part of New Clean Vehicles</div>
	</div>
    <div class="styBB" style="width:187mm;">  
	    <div style="float:left;padding-left:17mm;">
			<span class="styBoldText">Note:</span>		              
               Individuals can't claim a credit on line 6 if Part I, line 5, is more than $150,000 ($300,000 if married filing jointly or a
		</div>
	    <div style="float:left;padding-left:17mm;"> 
               qualifying surviving spouse; $225,000 if head of household).            
        </div>
	</div>
	<!-- Part 2 Line 6 -->  
	<div class="styStdDiv">  
		<div class="styLNLeftNumBoxSD">6</div>
		<div class="styLNDesc" style="width:139mm;">
			Enter the total credit amount figured in Part II of Schedule(s) A (Form 8936)
			<span class="sty8936DotLn">..........</span>
		</div>
		<div class="styLNRightNumBox">6</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUseAmt"/>
			</xsl:call-template>
		</div>          
	</div>
	<!-- Part 2 Line 7 -->
	<div class="styStdDiv">   
		<div class="styLNLeftNumBoxSD">7</div>
		<div class="styLNDesc" style="width:139mm;">
			New clean vehicle credit from partnerships and S corporations (see instructions)  
			<span class="sty8936DotLn">.........</span>    
		</div>    
		<div class="styLNRightNumBox">7</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/NewCleanVehCrPrtshpSCorpAmt"/>
			</xsl:call-template>
		</div>          
	</div>  
	<!-- Part 2 Line 8 -->
	<div class="styTBB" style="width:187mm;height:7mm;">
		<div class="styLNLeftNumBoxSD">8</div>
		<div class="styLNDesc" style="width:139mm;">
		  <b>Business/investment use part of credit. </b>Add lines 6 and 7. Partnerships and S corporations, stop here<span style="float:left;"> and report this amount on Schedule K. All others, report this amount on Form 3800, Part III, line 1y</span>       
			<span class="sty8936DotLn">...</span>    
		</div>    
		<div class="styLNRightNumBox" style="border-bottom-width:0;height:7mm;padding-top:3.5mm;">8</div>
		<div class="styLNAmountBox" style="border-bottom-width:0;padding-right:0.5mm;height:7mm;padding-top:3.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/BusinessInvstUsePartOfCrAmt"/>
			</xsl:call-template>
		</div>          
	</div>  
	<!--  End Part II -->
	<!--  Part III header -->
	<div class="styStdDiv">
		<div class="styPartName" style="height:4mm;">Part III</div>
		<div class="styPartDesc">Credit for Personal Use Part of New Clean Vehicles</div>
	</div>
    <div class="styBB" style="width:187mm;">  
	    <div style="float:left;padding-left:17mm;">
			<span class="styBoldText">Note:</span>		              
               You can't claim the Part III credit if Part I, line 5, is more than $150,000 ($300,000 if married filing jointly or a 
		</div>
	    <div style="float:left;padding-left:17mm;"> 
           qualifying surviving spouse; $225,000 if head of household).            
        </div>
	</div>
	<!-- Part 3 Line 9 -->  
	<div class="styStdDiv">  
		<div class="styLNLeftNumBoxSD">9</div>
		<div class="styLNDesc" style="width:139mm;">
			Enter the total credit amount figured in Part III of Schedule(s) A (Form 8936)
			<span class="sty8936DotLn">..........</span>
		</div>
		<div class="styLNRightNumBox">9</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CrPrsnlUsePartNewCleanVehGrp/PrsnlUseNewCleanVehicleCrAmt"/>
			</xsl:call-template>
		</div>          
	</div>
	<!-- Part 3 Line 10 -->
	<div class="styStdDiv">   
		<div class="styLNLeftNumBoxSD">10</div>
		<div class="styLNDesc" style="width:139mm;">
			Enter the amount from Form 1040, 1040-SR, or 1040-NR, line 18  
			<span class="sty8936DotLn">..............</span>    
		</div>    
		<div class="styLNRightNumBox">10</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CrPrsnlUsePartNewCleanVehGrp/TotalTaxBeforeCrAndOthTaxesAmt"/>
			</xsl:call-template>
		</div>          
	</div>  
	<!-- Part 3 Line 11 -->
	<div class="styStdDiv">   
		<div class="styLNLeftNumBoxSD">11</div>
		<div class="styLNDesc" style="width:139mm;">
			Personal credits from Form 1040, 1040-SR, or 1040-NR (see instructions)  
			<span class="sty8936DotLn">...........</span>    
		</div>    
		<div class="styLNRightNumBox">11</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CrPrsnlUsePartNewCleanVehGrp/PersonalTaxCreditsAmt"/>
			</xsl:call-template>
		</div>          
	</div>
 	<!-- Part 3 Line 12 -->
	<div class="styStdDiv" style="height:7mm;">   
		<div class="styLNLeftNumBoxSD">12</div>
		<div class="styLNDesc" style="width:139mm;">
			Subtract line 11 from line 10. If zero or less, enter -0- and stop here. You can't claim
the personal use part of the credit 
			<span class="sty8936DotLn">...............................</span>    
		</div>    
		<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">12</div>
		<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;padding-top:3.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CrPrsnlUsePartNewCleanVehGrp/AdjustedPersonalTaxCreditsAmt"/>
			</xsl:call-template>
		</div>          
	</div>
  	<!-- Part 3 Line 13 -->
	<div class="styTBB" style="width:187mm;height:7mm;">  
		<div class="styLNLeftNumBoxSD">13</div>
		<div class="styLNDesc" style="width:139mm;">
			<b>Personal use part of credit. </b>Enter the <b>smaller</b> of line 9 or line 12 here and on
Schedule 3 (Form 1040), <span style="float:left;">line 6f. If line 12 is smaller than line 9, see instructions</span> 
			<span class="sty8936DotLn">.................</span>    
		</div>    
		<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;border-bottom-width:0;">13</div>
		<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;padding-top:3.5mm;border-bottom-width:0;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CrPrsnlUsePartNewCleanVehGrp/CleanVehPrsnlUsePartCrAmt"/>
			</xsl:call-template>
		</div>          
	</div>
 	<!--  End Part III -->
	<!--  Part IV header -->
	<div class="styStdDiv">
		<div class="styPartName" style="height:4mm;">Part IV</div>
		<div class="styPartDesc">Credit for Previously Owned Clean Vehicles</div>
	</div>
    <div class="styBB" style="width:187mm;">  
	    <div style="float:left;padding-left:17mm;">
			<span class="styBoldText">Note:</span>		              
               You can’t claim the Part IV credit if Part I, line 5, is more than $75,000 ($150,000 if married filing jointly or a
		</div>
	    <div style="float:left;padding-left:17mm;"> 
           qualifying surviving spouse; $112,500 if head of household).            
        </div>
	</div>
 	<!-- Part 4 Line 14 -->  
	<div class="styStdDiv">  
		<div class="styLNLeftNumBoxSD">14</div>
		<div class="styLNDesc" style="width:139mm;">
			Enter the total credit amount figured in Part IV of Schedule(s) A (Form 8936)
			<span class="sty8936DotLn">..........</span>
		</div>
		<div class="styLNRightNumBox">14</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CrPreviouslyOwnedCleanVehGrp/PrevOwnedCleanVehCreditAmt"/>
			</xsl:call-template>
		</div>          
	</div>
	<!-- Part 4 Line 15 -->
	<div class="styStdDiv">   
		<div class="styLNLeftNumBoxSD">15</div>
		<div class="styLNDesc" style="width:139mm;">
			Enter the amount from Form 1040, 1040-SR, or 1040-NR, line 18  
			<span class="sty8936DotLn">..............</span>    
		</div>    
		<div class="styLNRightNumBox">15</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CrPreviouslyOwnedCleanVehGrp/TotalTaxBeforeCrAndOthTaxesAmt"/>
			</xsl:call-template>
		</div>          
	</div>  
	<!-- Part 4 Line 16 -->
	<div class="styStdDiv">   
		<div class="styLNLeftNumBoxSD">16</div>
		<div class="styLNDesc" style="width:139mm;">
			Personal credits from Form 1040, 1040-SR, or 1040-NR (see instructions)  
			<span class="sty8936DotLn">...........</span>    
		</div>    
		<div class="styLNRightNumBox">16</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CrPreviouslyOwnedCleanVehGrp/PersonalTaxCreditsAmt"/>
			</xsl:call-template>
		</div>          
	</div>
 	<!-- Part 4 Line 17 -->
	<div class="styStdDiv">   
		<div class="styLNLeftNumBoxSD">17</div>
		<div class="styLNDesc" style="width:139mm;">
			Subtract line 16 from line 15. If zero or less, enter -0- and stop here. You can’t claim the Part IV credit 
			<span class="sty8936DotLn">..</span>    
		</div>    
		<div class="styLNRightNumBox" >17</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CrPreviouslyOwnedCleanVehGrp/AdjustedPersonalTaxCreditsAmt"/>
			</xsl:call-template>
		</div>          
	</div>
  	<!-- Part 4 Line 18 -->
	<div class="styTBB" style="width:187mm;height:7mm;">  
		<div class="styLNLeftNumBoxSD">18</div>
		<div class="styLNDesc" style="width:139mm;">
			Enter the <b>smaller</b> of line 14 or line 17 here and on Schedule 3 (Form 1040), line 6m. If line 17 is smaller
<span style="float:left;">than line 14, see instructions</span> 
			<span class="sty8936DotLn">.........................</span>    
		</div>    
		<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;border-bottom-width:0;">18</div>
		<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;padding-top:3.5mm;border-bottom-width:0;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CrPreviouslyOwnedCleanVehGrp/MaxPrevOwnedCleanVehCrAmt"/>
			</xsl:call-template>
		</div>          
	</div>
 	<!--  End Part IV -->
 	<!--  Part V header -->
	<div class="styBB" style="width: 187mm;">
		<div class="styPartName" style="height:4mm;">Part V</div>
		<div class="styPartDesc">Credit for Qualified Commercial Clean Vehicles</div>
	</div>
	<!-- Part 5 Line 19 -->
	<div class="styStdDiv">   
		<div class="styLNLeftNumBoxSD">19</div>
		<div class="styLNDesc" style="width:139mm;">
			Enter the total credit amount figured in Part V of Schedule(s) A (Form 8936)  
			<span class="sty8936DotLn">..........</span>    
		</div>    
		<div class="styLNRightNumBox">19</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/QlfyCmrclCleanVehicleCrAmt"/>
			</xsl:call-template>
		</div>          
	</div>
 	<!-- Part 5 Line 20 -->
	<div class="styStdDiv">   
		<div class="styLNLeftNumBoxSD">20</div>
		<div class="styLNDesc" style="width:139mm;">
			Qualified commercial clean vehicle credit from partnerships and S corporations (see instructions)
			<span class="sty8936DotLn">....</span>    
		</div>    
		<div class="styLNRightNumBox" >20</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CmrclCleanVehCrPrtshpSCorpAmt"/>
			</xsl:call-template>
		</div>          
	</div>
  	<!-- Part 5 Line 21 -->
	<div class="styTBB" style="width:187mm;height:7mm;">  
		<div class="styLNLeftNumBoxSD">21</div>
		<div class="styLNDesc" style="width:139mm;">
			Add lines 19 and 20. Partnerships and S corporations, stop here and report this amount on Schedule
<span style="float:left;">K. All others, report this amount on Form 3800, Part III, line 1aa</span> 
			<span class="sty8936DotLn">..............</span>    
		</div>    
		<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;border-bottom-width:0;">21</div>
		<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;padding-top:3.5mm;border-bottom-width:0;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/TotalQlfyCmrclCleanVehCrAmt"/>
			</xsl:call-template>
		</div>          
	</div>
 	<!--  End Part V -->
   	<div style="width:187mm;border-top-width:1px;clear:all;">
		<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions. </span>
		<span style="width:79px;"/>                      
          Cat. No. 37751E
        <span style="width:117px;"/>  
          Form <span class="styBoldText">8936</span> (2023)
    </div>
        <p style="page-break-before:always"/>
	<!-- END Page Break and Footer-->
  <!--   Part III header -->
  		  <!--Begin Page 2 -->
		  <!-- Page Header -->
		  <!--<div class="styBB" style="width:187mm;padding-top:.5mm;">
			<div style="float:left;">Form 8936 (Rev. 12-2022)<span style="width:144mm;"/>
		  </div>
		  <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>
		</div>
  <div class="styBB" style="width: 187mm;height:4mm;">
    <div class="styPartName" style="height:4mm;">Part III</div>
    <div class="styPartDesc">Credit for Personal Use Part of Vehicle</div>
  </div>
     --><!-- Line 15 --><!--
  <div style="width: 187mm;clear:all;"> 
  <xsl:if test="($Print != $Separated) or (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &lt;= 2)">
 <xsl:for-each select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp">
  <xsl:variable name="pos" select="position()"/>
  <xsl:if test="(position() mod 2)=1">
 <div class="styIRS8936TableContainer" id="Spcctn">
   --><!--print logic--><!--
  <xsl:call-template name="SetInitialState"/>
  --><!--end--><!--
   <table class="styTable" cellspacing="0" style="font-size: 7pt">
   <tfoot/>
    <tbody>  
	--><!--  Line 15  --><!--
      <tr style="width:187mm">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines"></td>
		<td class="sty8936LNDescTallShortest"></td>
		 <td class="sty8936HLNRightNumBoxTall" style="background-color:grey">
		</td>
			<td class="styTableCellSmall" style="height:6mm;border-left-width:1px;border-bottom:1 solid black;width:30mm;text-align:center;font-weight:bold;">
			        <span>(</span>
			       <xsl:number value="position()" format="a"/>
			         <span>)</span>
			         <span style="width:18mm;font-weight:normal;">Vehicle <xsl:number value="($pos)" format="1"/></span>
			       </td> 
			       <td class="styTableCellSmall" style="border-left:1 solid black;border-bottom:1 solid black;width:45mm;text-align:center;font-weight:bold;border-right-width: 0px;">
			        <span>(</span>
			       <xsl:number value="position() + 1" format="a"/>
			         <span>)</span>
			         <span style="width:18mm;font-weight:normal;">Vehicle <xsl:number value="($pos + 1)" format="1"/></span>
			       </td> 
	    </tr>  
	  <tr>  
		<td class="sty8936LNLeftNumBoxTallDDTwoLines" style="padding-bottom:9mm;">
			15</td>
		<td class="sty8936LNDescTallShortest">
       <span style="float:left;">If you skipped Part II, enter the amount from line 4c. If you completed Part II, subtract line 6 from line 4c. If the vehicle  </span>
       <span style="float:left;">has at least four wheels, leave lines 16 and 17 blank and go </span>
       <span style="float:left;">to line 18</span>
       <span class="styDotLn" style="float:right;padding-right:1mm;">................</span> 
		</td>
		<td class="sty8936HLNRightNumBoxTall" style="padding-top:0px;padding-left:0px;padding-right:0px;padding-bottom:0px">
			<div style="height:4mm;padding-top:0.5mm;text-align:center">15</div>
		</td>   
        <td class="styTableCell" style="width:44mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:9mm;">
          <span class="styTableCellPad"/>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="TentativeCreditForPrsnlUseAmt"/>
          </xsl:call-template>
        </td>
        <td class="styTableCell" style="width:44mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; padding-top:9mm;padding-left:11mm;">
          <span class="styTableCellPad"/>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/TentativeCreditForPrsnlUseAmt"/> 
          </xsl:call-template>
        </td>
     </tr> 
    --><!--Line 16 --><!--  
     <tr style="font-size: 7pt">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines">
			16</td>
		<td class="sty8936LNDescTallShortest">
			   <span style="float:left;">Multiply line 15 by 10% (0.10)</span>
			   <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span> 
		 </td>
		 <td class="sty8936HLNRightNumBoxTall">
			16
		</td>    
        <td class="styTableCell" style="text-align:right;border-color: black; border-left-width: 1px; border-right-width: 1px;  border-bottom-width:1px; padding-left:14mm;padding-top:1mm;">
			<div class="styLNAmountBox" style="height:4mm;border-width:0px;">	
			    <span class="styTableCellPad"/>		
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="TentativeCrPersonalUseRatioAmt"></xsl:with-param>
					</xsl:call-template>
			</div>   
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-bottom-width:1px; padding-top:1mm;padding-left:12mm">
         	<div class="styLNAmountBox" style="height:4mm;border-width:0px;">		
         						<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/TentativeCrPersonalUseRatioAmt"></xsl:with-param>
					</xsl:call-template>
			</div>  
        </td>
    </tr>
    --><!--Line 17--><!--
    <tr style="font-size: 7pt">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines" style="padding-bottom:6mm;">
			17</td>
		<td class="sty8936LNDescTallShortest">
			<span style="float:left;"> Maximum credit per vehicle. If you skipped Part II, enter $2,500. If you completed Part II, subtract line 11 from </span>
			<span style="float:left;">line 10</span>
			<span class="styDotLn" style="float:right;padding-right:1mm;">................</span> 
		 </td>
		 <td class="sty8936HLNRightNumBoxTall">
			17
		</td>
        <td class="styTableCell" style="text-align:right;border-color: black; border-left-width: 1px; border-right-width: 1px;  border-bottom-width:1px; padding-left:14mm;padding-top:6mm;">
			<div class="styLNAmountBox" style="height:4mm;border-width:0px;">	
			    <span class="styTableCellPad"/>		
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="MaxCreditPerVehiclePersonalAmt"></xsl:with-param>
					</xsl:call-template>
			</div>   
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-bottom-width:1px; padding-left:12mm;padding-top:6mm;">
         	<div class="styLNAmountBox" style="height:4mm;border-width:0px;">		
         						<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/MaxCreditPerVehiclePersonalAmt"></xsl:with-param>
					</xsl:call-template>
			</div>  
        </td>
        </tr>
		--><!--Line 18--><!--
         <tr style="font-size: 7pt">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines" style="padding-bottom:6mm;">
			18</td>
		<td class="sty8936LNDescTallShortest">
       <span style="float:left;">For vehicles with four or more wheels placed in service before 2023, enter the amount from line 15. If the vehicle is a two-wheeled vehicle, enter the smaller of line 16 or line 17. For</span>
       <span style="float:left;">vehicles placed in service after 2022, see instructions</span>
			<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>  
		 </td>
		 <td class="sty8936HLNRightNumBoxTall">
			18
		</td>
        <td class="styTableCell" style="width:44mm;text-align:right;border-color: black; border-left-width: 1px; border-right-width: 1px;  border-bottom-width:1px; padding-top:5mm;">
			<span class="styTableCellPad"/>		
			<xsl:call-template name="PopulateAmount">
			  <xsl:with-param name="TargetNode" select="SmallerMaxCrOrPrsnlRatioAmt"></xsl:with-param>
			</xsl:call-template>
        </td>
        <td class="styTableCell" style="width:44mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-bottom-width:1px; padding-left:12mm;padding-top:5mm;">
         	<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/SmallerMaxCrOrPrsnlRatioAmt"></xsl:with-param>
			</xsl:call-template>
        </td>
        </tr>
    </tbody>
  </table>
</div>
</xsl:if>
</xsl:for-each>
  </xsl:if>
   --><!-- Display if there are no data elements, or Print is set to separated and there are more than 2 elements.  Be sure to test by commenting 
 out "if separated" statements in 3 places: at top of form, on transmissionXML.xml print paramter and in the populateTemplate globalStylesForm --><!--
 --><!-- start here greater than three --><!--
 <xsl:if test="(count($FormData/QlfyPlugInElecDriveMtrVehCrGrp)=0) or (($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2))">
 <div class="styIRS8936TableContainer" id="Spcctn">
   --><!--print logic for the table that remains empty if separated (repeating) data appears at the bottom of form--><!--
  <xsl:call-template name="SetInitialState"/>
  --><!--end--><!--
  --><!-- blank lines --><!--
   <table class="styTable" cellspacing="0" style="font-size: 7pt">
     <thead class="styTableThead">
    </thead>
    <tfoot/>
    <tbody>
   --><!--  Line 15   --><!--
      <tr>
		<td class="sty8936LNLeftNumBoxTallDDTwoLines"></td>
		<td class="sty8936LNDescTallShortest"></td>
		 <td class="sty8936HLNRightNumBoxTall" style="background-color:grey">
		</td>
			<td class="styTableCellSmall" style="height:6mm;border-left-width:1px;border-bottom:1 solid black;width:45mm;text-align:center;font-weight:bold;">
			        <span>(</span>
			       <xsl:number value="position()" format="a"/>
			         <span>)</span>
			         <span style="width:18mm;font-weight:normal;">Vehicle 1</span>
			       </td> 
			       <td class="styTableCellSmall" style="border-left:1 solid black;border-bottom:1 solid black;width:45mm;text-align:center;font-weight:bold;border-right-width: 0px;">
			        <span>(</span>
			       <xsl:number value="position() + 1" format="a"/>
			         <span>)</span>
			         <span style="width:18mm;font-weight:normal;">Vehicle 2</span>
			       </td> 
	    </tr>    
    <tr>
		<td class="sty8936LNLeftNumBoxTallDDTwoLines" style="padding-bottom:9mm;">
			15</td>
		<td class="sty8936LNDescTallShortest">
       <span style="float:left;">If you skipped Part II, enter the amount from line 4c. If you completed Part II, subtract line 6 from line 4c. If the vehicle has at least four wheels, leave lines 16 and 17 blank and go </span>
       <span style="float:left;">to line 18</span>
       <span class="styDotLn" style="float:right;padding-right:1mm;">................</span> 
		 </td>
		 <td class="sty8936HLNRightNumBoxTall" style="padding-top:0px;padding-left:0px;padding-right:0px;padding-bottom:0px">
			<div style="height:9mm;width:8.75mm;background-color:grey">
			</div>    
			<div style="height:4mm;padding-top:0.5mm;text-align:center">15</div>
		</td>   
        <xsl:choose>
          --><!-- Display "Additional Data" message if Print is set to separated and there are more than 3 elements --><!--
          <xsl:when test="(($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2))">
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;width:47mm; text-align:center;padding-top:9mm;">
              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="ShortMessage">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp/TentativeCreditForPrsnlUseAmt"/>
              </xsl:call-template>
            </td>
          </xsl:when>
          <xsl:otherwise>
            <td class="styTableCell" style="border-color: black; border-left-width: 1px;width:46.5mm; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center;"></td>
          </xsl:otherwise>
        </xsl:choose>
            <td class="styTableCell" style="border-color: black;border-left-width: 0px;width:46.5mm;border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align:right;"></td>
        </tr>
    --><!--  Line 16   --><!--
    <tr>
		<td class="sty8936LNLeftNumBoxTallDDTwoLines">
			16</td>
		<td class="sty8936LNDescTallShortest">
			   <span style="float:left;">Multiply line 15 by 10% (0.10)</span>
			   <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span> 
		 </td>
		 <td class="sty8936HLNRightNumBoxTall">
			16
		</td>    
        <xsl:choose>
          --><!-- Display "Additional Data" message if Print is set to separated and there are more than 3 elements --><!--
          <xsl:when test="(($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2))">
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;width:46.5mm; text-align:center;">
            <span style="width:5px;"/>
            </td>
          </xsl:when>
          <xsl:otherwise>
            <td class="styTableCell" style="border-color: black; border-left-width: 1px;width:46.5mm; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center"><span class="styTableCellPad"/></td>
          </xsl:otherwise>
        </xsl:choose>
            <td class="styTableCell" style="border-color: black;border-left-width: 0px;width:46.5mm; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align:right;"><span class="styTableCellPad"/></td>
        </tr>
    --><!--  Line 17   --><!--
    <tr>
		<td class="sty8936LNLeftNumBoxTallDDTwoLines" style="padding-bottom:3.5mm;">
			17</td>
		<td class="sty8936LNDescTallShortest">
			Maximum credit per vehicle. If you skipped Part II, enter $2,500. If you completed Part II, subtract line 11 from line 10

		 </td>
		 <td class="sty8936HLNRightNumBoxTall">
			17
		</td>
        <xsl:choose>
          --><!-- Display "Additional Data" message if Print is set to separated and there are more than 3 elements --><!--
          <xsl:when test="(($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2))">
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center;">
            </td>
          </xsl:when>
          <xsl:otherwise>
            <td class="styTableCell" style="border-color: black; border-left-width: 1px;width:46.5mm; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center"><span class="styTableCellPad"/></td>
          </xsl:otherwise>
        </xsl:choose>
            <td class="styTableCell" style="border-color: black;border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align:right;"><span class="styTableCellPad"/></td>
        </tr>
        --><!--  Line 18   --><!--
         <tr style="font-size: 7pt">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines" style="padding-bottom:6mm;">
			18</td>
		<td class="sty8936LNDescTallShortest">
       <span style="float:left;">For vehicles with four or more wheels, enter the amount from line 15. If the vehicle is a two-wheeled vehicle, enter the </span>
       <span style="float:left;">smaller of line 16 or line 17 </span>
			<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>  
		 </td>
		 <td class="sty8936HLNRightNumBoxTall">
			18
		</td>
        <xsl:choose>
          --><!-- Display "Additional Data" message if Print is set to separated and there are more than 3 elements --><!--
          <xsl:when test="(($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2))">
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;width:46.5mm; text-align:center;">
                 <span style="width:5px;"></span>
            </td>
          </xsl:when>
          <xsl:otherwise>
            <td class="styTableCell" style="border-color: black; border-left-width: 1px;width:46.5mm; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center"><span class="styTableCellPad"/></td>
          </xsl:otherwise>
        </xsl:choose>
            <td class="styTableCell" style="border-color: black;border-left-width: 0px;width:46.5mm; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align:right;"><span class="styTableCellPad"/></td>
        </tr>
 </tbody>
  </table>
</div>
</xsl:if>
</div>
--><!--Line 19 --><!--  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox">19</div>
    <div class="styLNDesc" style="width:126.25mm;">
      <span style="float:left;">Add columns (a) and (b) on line 18 </span> 
      <span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>   
    </div>    
    <div class="styLNRightNumBox" style="height:4mm;">19</div>
    <div class="styLNAmountBox" style="height:4mm;width:44.5mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalTentativeCrForPrsnlUseAmt"/>
      </xsl:call-template>
    </div>          
  </div>
--><!--Line 20 --><!--  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox">20</div>
    <div class="styLNDesc" style="width:126.25mm;">
	  <span style="float:left;">Enter the amount from Form 1040, 1040-SR or Form 1040-NR, line 18</span> 
	  <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>   
    </div>    
    <div class="styLNRightNumBox" style="height:4mm;">20</div>
    <div class="styLNAmountBox" style="height:4mm;width:44.5mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalTaxBeforeCrAndOthTaxesAmt"/>
      </xsl:call-template>
    </div>          
  </div>
--><!--Line 21 --><!--  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox">21</div>
    <div class="styLNDesc" style="width:126.25mm;">
        <span style="float:left;">Personal credits from Form 1040, 1040-NR, or 1040-SR (see instructions) </span> 
        <span class="styDotLn" style="float:right;padding-right:1mm;">........</span> 
    </div>    
    <div class="styLNRightNumBox" style="height:4mm;">21</div>
    <div class="styLNAmountBox" style="height:4mm;width:44.5mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehOtherFormCreditsAmt"/>
      </xsl:call-template>
    </div>          
  </div>
--><!--Line 22 --><!--  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox">22</div>
    <div class="styLNDesc" style="width:126.25mm;">
	  <span style="float:left;">Subtract line 21 from line 20 </span> 
	  <span class="styDotLn" style="float:right;padding-right:1mm;">......................</span> 
    </div>    
    <div class="styLNRightNumBox" style="height:4mm;">22</div>
    <div class="styLNAmountBox" style="height:4mm;width:44.5mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehAdjPrsnlCreditAmt"/>
      </xsl:call-template>
    </div>          
  </div>
--><!--Line 23 --><!--  
  <div style="width: 187mm;height:7mm; border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">  
    <div class="styLNLeftNumBox">23</div>
    <div class="styLNDesc" style="width:126.25mm;">
	    <b> Personal use part of credit. </b> Enter the <b>smaller </b>of line 19 or line 22 here 
	    and on Schedule 3 (Form 1040),  line 6f.  If line 22 is smaller than line 19, see instructions
	    <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span> 
    </div>    
    <div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;">23</div>
    <div class="styLNAmountBox" style="height:7mm;width:44.5mm;padding-top:3.5mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/PersonalUsePartOfCreditAmt"/>
      </xsl:call-template>
    </div>          
  </div>-->
 <!-- End of page -->
	  <!-- Page Break and Footer-->
		  <!--<div class="pageEnd" style="width:187mm;padding-top:1mm;border-top:1 solid black;border-top-width:1px;clear:all;">
			<div style="width:100mm;float:left;">
			  <span style="width:81mm;"/>
			</div>
			<div style="float:right;">
			  <span style="width:80px;"/>  
              Form <span class="styBoldText" style="font-size:8pt;">8936</span> (Rev. 12-2022)
            </div>
		  </div>
		  <br/>-->
 <!-- BEGIN Left Over Table -->  
 <!-- Additonal Data Title Bar and Button -->
        <div class="styLeftOverTitleLine" id="LeftoverData">
          <div class="styLeftOverTitle">
            Additional Data        
          </div>
          <div class="styLeftOverButtonContainer">
            <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
          </div>      
        </div>
        <!-- Additional Data Table -->
        <table class="styLeftOverTbl">
          <xsl:call-template name="PopulateCommonLeftover">
            <xsl:with-param name="TargetNode" select="$FormData"/>
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>          
        </table>
      <!-- END Left Over Table -->     
 <!-- Additional Data Table for Separated Data from Part I; displayed if more than 3 elements and Print is set to separated-->
  <!--<xsl:if test="($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2)">            
    <br/>
    <br/>
    <span class="styRepeatingDataTitle">Form 8936, Part I - Tentative Credit</span>
    <xsl:for-each select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp">
      <xsl:variable name="pos" select="position()"/>
      <xsl:if test="(position() mod 2)=1">
        <table class="styDepTbl" cellspacing="0" style="font-size: 7pt">
          <thead class="styTableThead">
            <tr style="height: 8mm" class="styDepTblHdr">
              <td class="styDepTblCell" colspan="3" style="width: 100mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: left">        
                <span class="styNormalText" style="padding-left: 5mm">
                  Use a separate column for each vehicle. If you need more columns, use additional Forms 8936 and include the totals on lines 12 and 19.
                </span>
              </td>
               --><!--start here additional data--><!--
              <td class="styDepTblCell" style="width: 45mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center">(<xsl:number value="($pos)" format="a"/>)
                   <span style="width:12mm">Vehicle</span>
                   <xsl:number value="($pos)" format="1"/>
              </td>
              <td class="styDepTblCell" style="width: 45mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center">(<xsl:number value="($pos + 1)" format="a"/>)
                    <span style="width:12mm">Vehicle</span>
                    <xsl:number value="($pos + 1)" format="1"/>
              </td>
             </tr>
          </thead>
          <tfoot/>
          <tbody>
            --><!--  Line 1   --><!--
            --><!-- column 1 --><!--
            <tr class="styDepTblRow1" style="height: 11mm">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines" >
			1
		</td>
		<td class="sty8936LNDescTallShortest" >
			<span style="float:left;">Year, make, and model of vehicle</span> 
			 <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
		 </td>
		 <td class="sty8936HLNRightNumBoxTall" style="padding-top:0px;padding-left:0px;padding-right:0px;padding-bottom:0px">
			1
		</td>
               <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: left">
          <xsl:call-template name="PopulateYear">
            <xsl:with-param name="TargetNode" select="VehicleDescriptionGrp/VehicleModelYr"/>
          </xsl:call-template>
          <br/>
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="VehicleDescriptionGrp/VehicleMakeNameTxt"/>
          </xsl:call-template>
          <br/>
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="VehicleDescriptionGrp/VehicleModelNameTxt"/>
          </xsl:call-template>
        </td>
        --><!-- column 2 --><!--
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: left">
          <xsl:call-template name="PopulateYear">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/VehicleDescriptionGrp/VehicleModelYr"/>  
          </xsl:call-template>
          <br/>
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/VehicleDescriptionGrp/VehicleMakeNameTxt"/>  
          </xsl:call-template>
          <br/>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/VehicleDescriptionGrp/VehicleModelNameTxt"/>  
          </xsl:call-template>
        </td>
            </tr> 
            --><!-- Line 2  --><!--
            <tr class="styDepTblRow2" style="height: 6mm; font-size: 7pt">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines">
			2
		</td>
		<td class="sty8936LNDescTallShortest">
			<span style="float:left;">Vehicle identification number (see instructions)</span> 
			 <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
		 </td>
		 <td class="sty8936HLNRightNumBoxTall">
			2
		</td>
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center;padding-top:6mm;padding-left:8mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="VIN"/>
                </xsl:call-template>
             </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center;padding-top:6mm;padding-left:8mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/VIN"/>
                </xsl:call-template>
              </td>
             </tr>
               --><!-- Line 3  --><!--
            <tr class="styDepTblRow1" style="height: 8mm; font-size: 7pt">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines">
			3
		</td>
		<td class="sty8936LNDescTallShortest">
			<span style="float:left;">Enter date vehicle was placed in service (MM/DD/YYYY)</span>
			<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>    
		 </td>
		 <td class="sty8936HLNRightNumBoxTall">
			3
		</td>
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center;padding-left:8mm;padding-top:6mm;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="VehiclePlacedInServiceDt"/>
                </xsl:call-template>
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center;padding-left:8mm;padding-top:6mm;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/VehiclePlacedInServiceDt"/>
                </xsl:call-template>
              </td>
              </tr>
            --><!-- Line 4a --><!--
            <tr class="styDepTblRow2" style="height: 8mm">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines" style="padding-bottom:6mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;border-style:solid">
			4a
		</td>
		<td class="sty8936LNDescTallShortest" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;border-style:solid">
              If the vehicle is a two-wheeled vehicle, enter the cost of the vehicle.  If the vehicle has at least four wheels, see instructions
              --><!--<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>--><!--  
		 </td>
		 <td class="sty8936HLNRightNumBoxTall" >
			4a
		</td>
              <td class="styTableCell" align="right" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="VehicleCostAmt"/>
                </xsl:call-template>
              </td>
              <td class="styTableCell" align="right" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/VehicleCostAmt"/>
                </xsl:call-template>
              </td>
             </tr>
             --><!-- Line 4b --><!--
            <tr class="styDepTblRow1" style="height: 8mm">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;border-style:solid">
			4b
		</td>
		<td class="sty8936LNDescTallShortest" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;border-style:solid">
              Phaseout percentage (see instructions)
              <span class="styDotLn" style="float:right;padding-right:1mm;">........</span>  
		 </td>
		 <td class="sty8936HLNRightNumBoxTall">
			4b
		</td>
              <td class="styTableCell" align="right" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="PhaseoutPct"/>
                </xsl:call-template>
              </td>
              <td class="styTableCell" align="right" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/PhaseoutPct"/>
                </xsl:call-template>
              </td>
             </tr>
            --><!-- Line 4c --><!--
            <tr class="styDepTblRow2" style="height: 8mm">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;border-style:solid">
			4c
		</td>
		<td class="sty8936LNDescTallShortest" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;border-style:solid">
             Tentative credit.  Multiply line 4a by line 4b
              <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>  
		 </td>
		 <td class="sty8936HLNRightNumBoxTall">
			4c
		</td>
              <td class="styTableCell" align="right" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="VehicleTentativeCreditAmt"/>
                </xsl:call-template>
              </td>
              <td class="styTableCell" align="right" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/VehicleTentativeCreditAmt"/>
                </xsl:call-template>
              </td>
             </tr>
          </tbody>
          </table>
          <br/>
        </xsl:if>
      </xsl:for-each>
    </xsl:if>
      --><!-- Additional Data Table for Separated Data from Part II; displayed if more than 3 elements and Print is set to separated--><!--
  <xsl:if test="($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2)">            
    <br/>  <br/>  <br/>
    <span class="styRepeatingDataTitle">Form 8936, Part II - Credit for Business/Investment Use Part of Vehicle</span>
    <xsl:for-each select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp">
      <xsl:variable name="pos" select="position()"/>
      <xsl:if test="(position() mod 2)=1">
        <table class="styDepTbl" cellspacing="0" style="font-size: 7pt">
          <tbody>
 --><!-- line 5 --><!--         
        <tr class="styDepTblRow1" style="height: 8mm;">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines" style="padding-left:1.5mm;">
			5</td>
		<td class="sty8936LNDescTallShortest" >
		  Business/investment use percentage (see instructions)
		 </td>
		 <td class="sty8936HLNRightNumBoxTall" style="padding-top:0px;padding-left:0px;padding-right:0px;padding-bottom:0px">
			5
		</td>
              <td class="styTableCell" style="width:44mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="BusinessInvestmentUsePct"/>
                </xsl:call-template>
                <span class="styTableCellPad"/>
              %
              </td>
              <td class="styTableCell" style="width:44mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/BusinessInvestmentUsePct"/>
                </xsl:call-template>
                <span class="styTableCellPad"/>
              %
              </td>
            </tr>
 --><!-- line 6  --><!--            
              <tr class="styDepTblRow2" style="height: 8mm">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines" style="padding-left:1.5mm;padding-bottom:3mm">
			6</td>
		<td class="sty8936LNDescTallShortest">
      <span style="float:left;">Multiply line 4c by line 5. If the vehicle has at least four wheels,</span> 
      <span style="float:left;">leave lines 7 through 10 blank and go to line 11</span>
      <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>    
		 </td>
		 <td class="sty8936HLNRightNumBoxTall">
		 6
		</td>
             <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="BusinessInvestmentUseAmt"/>
                </xsl:call-template>
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/BusinessInvestmentUseAmt"/>
                </xsl:call-template>
              </td>
              </tr>
--><!-- line 7 --><!--         
           <tr class="styDepTblRow1" style="height: 8mm;">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines" style="padding-left:1.5mm;">
			7</td>
		<td class="sty8936LNDescTallShortest">
		 <span style="float:left;"> Section 179 expense deduction (see instructions)</span>
		 <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
		 </td>
		 <td class="sty8936HLNRightNumBoxTall">
		 7
		</td>      
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <span class="styTableCellPad"/>    
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="Section179ExpenseDeductionAmt"/>
                </xsl:call-template>   
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <span class="styTableCellPad"/>        
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/Section179ExpenseDeductionAmt"/>
                </xsl:call-template>   
              </td>
            </tr>
 --><!-- line 8  --><!--            
             <tr class="styDepTblRow2" style="height: 8mm">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines" style="padding-left:1.5mm;">
			8</td>
		<td class="sty8936LNDescTallShortest">
     <span style="float:left;">Subtract line 7 from line 6</span>
     <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
		 </td>
		 <td class="sty8936HLNRightNumBoxTall">
		 8
		</td>
             <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="NetBusinessInvestmentUseAmt"/>
                </xsl:call-template>
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/NetBusinessInvestmentUseAmt"/>
                </xsl:call-template>
              </td>
              </tr>
   --><!-- line 9 --><!--         
           <tr class="styDepTblRow1" style="height: 8mm;">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines" style="padding-left:1.5mm;">
			9</td>
		<td class="sty8936LNDescTallShortest">
     <span style="float:left;">Multiply line 8 by 10% (0.10)</span>
     <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
		 </td>
		 <td class="sty8936HLNRightNumBoxTall">
		 9
		</td>
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <span class="styTableCellPad"/>    
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="BusinessInvestmentUseRatioAmt"/>
                </xsl:call-template>   
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <span class="styTableCellPad"/>        
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/BusinessInvestmentUseRatioAmt"/>
                </xsl:call-template>   
              </td>
            </tr>
           --><!-- line 10  --><!--            
             <tr class="styDepTblRow2" style="height: 8mm">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines">
			10</td>
		<td class="sty8936LNDescTallShortest">
     <span style="float:left;">Maximum credit per vehicle</span>
     <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
		 </td>
		 <td class="sty8936HLNRightNumBoxTall">
		 10
		</td>
             <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                2,500
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
				2,500
              </td>
              </tr>
           --><!-- line 11 --><!--         
          <tr class="styDepTblRow1" style="height: 8mm;">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines" style="padding-bottom:6mm;">
			11</td>
		<td class="sty8936LNDescTallShortest">
			For vehicles with four or more wheels, enter the amount from line 6. If the vehicle is a two-wheeled vehicle, enter the smaller <span style="float:left;">of line 9 or line 10</span>
			 <span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
		 </td>
		 <td class="sty8936HLNRightNumBoxTall">
			 11
		</td>
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <span class="styTableCellPad"/>    
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="SmallerMaxCreditOrBusRatioAmt"/>
                </xsl:call-template>   
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <span class="styTableCellPad"/>        
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/SmallerMaxCreditOrBusRatioAmt"/>
                </xsl:call-template>   
              </td>
            </tr>
           </tbody>
          </table>
          <br/>
        </xsl:if>
      </xsl:for-each>
    </xsl:if>
      --><!-- Additional Data Table for Separated Data from Part III; displayed if more than 3 elements and Print is set to separated--><!--
  <xsl:if test="($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2)">            
    <br/>
    <span class="styRepeatingDataTitle">Form 8936, Part III - Credit for Personal Use Part of Vehicle</span>
    <xsl:for-each select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp">
      <xsl:variable name="pos" select="position()"/>
      <xsl:if test="(position() mod 2)=1">
        <table class="styDepTbl" cellspacing="0" style="font-size: 7pt">
         <tbody>
          <thead class="styTableThead">
              <tr style="height: 8mm" class="styDepTblHdr">   
		<td class="sty8936LNLeftNumBoxTallDDTwoLines"></td>
		<td class="sty8936LNDescTallShortest"></td>
		 <td class="sty8936HLNRightNumBoxTall">
		</td>
			<td class="styTableCellSmall" style="height:6mm;border-left-width:1px;border-bottom:1 solid black;width:45mm;text-align:center;font-weight:bold;">
			        <span>(</span>
			       <xsl:number value="position()" format="a"/>
			         <span>)</span>
			         <span style="width:18mm;font-weight:normal;">Vehicle <xsl:number value="($pos)" format="1"/></span>
			       </td> 
			       <td class="styTableCellSmall" style="border-left:1 solid black;border-bottom:1 solid black;width:45mm;text-align:center;font-weight:bold;border-right-width: 0px;">
			        <span>(</span>
			       <xsl:number value="position() + 1" format="a"/>
			         <span>)</span>
			         <span style="width:18mm;font-weight:normal;">Vehicle <xsl:number value="($pos + 1)" format="1"/></span>
			       </td>
      </tr> 
       </thead>
       --><!-- line 15 --><!--      
           <tr class="styDepTblRow1" style="height:10mm;">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines" style="padding-bottom:9mm">
			15</td>
		<td class="sty8936LNDescTallShortest">
       <span style="float:left;">If you skipped Part II, enter the amount from line 4c. If you completed Part II, subtract line 6 from line 4c. If the vehicle has at least four wheels, leave lines 16 and 17 blank and go </span>
       <span style="float:left;">to line 18</span>
       <span class="styDotLn" style="float:right;padding-right:1mm;">.................</span> 
		 </td>
		 <td class="sty8936HLNRightNumBoxTall" style="padding-top:0px;padding-left:0px;padding-right:0px;padding-bottom:0px">
			15
		</td>   
              <td class="styTableCell" valign="bottom" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width:1px; border-bottom-width:1px;padding-left:14mm;padding-top:9mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="TentativeCreditForPrsnlUseAmt"/>
                </xsl:call-template>
              </td>
              <td class="styTableCell" valign="bottom" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width:1px; border-bottom-width:1px;padding-left:14mm;padding-top:9mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/TentativeCreditForPrsnlUseAmt"/>
                </xsl:call-template>
              </td>
             </tr>
             --><!-- line 16 --><!--         
           <tr class="styDepTblRow2" style="height:8mm;">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines">
			16</td>
		<td class="sty8936LNDescTallShortest">
			   <span style="float:left;">Multiply line 15 by 10% (0.10)</span>
			   <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span> 
		 </td>
		 <td class="sty8936HLNRightNumBoxTall">
			16
		</td>    
              <td class="styTableCell" valign="bottom" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width:1px; border-bottom-width:1px;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="TentativeCrPersonalUseRatioAmt"/>
                </xsl:call-template>
              </td>
              <td class="styTableCell" valign="bottom" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width:1px; border-bottom-width:1px;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/TentativeCrPersonalUseRatioAmt"/>
                </xsl:call-template>
              </td>
             </tr>
    --><!-- line 17 --><!--        
           <tr class="styDepTblRow1" style="height:8mm;">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines" style="padding-bottom:6mm;">
			17</td>
		<td class="sty8936LNDescTallShortest">
			<span style="float:left;white-space:nowrap;"> Maximum credit per vehicle. If you skipped Part II, enter</span>
			<span  style="float:left;white-space:nowrap;padding-right:6mm;">$2,500. If you completed Part II, subtract line 11 from line</span>
			<span  style="float:left;white-space:nowrap;">10</span>
			<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span> 
		 </td>
		 <td class="sty8936HLNRightNumBoxTall">
			17
		</td>
              <td class="styTableCell" valign="bottom" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width:1px; border-bottom-width:1px;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="MaxCreditPerVehiclePersonalAmt"/>
                </xsl:call-template>
              </td>
              <td class="styTableCell" valign="bottom" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width:1px; border-bottom-width:1px;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/MaxCreditPerVehiclePersonalAmt"/>
                </xsl:call-template>
              </td>
             </tr>
     --><!-- line 18 --><!--         
           <tr class="styDepTblRow2" style="height:8mm;">
		<td class="sty8936LNLeftNumBoxTallDDTwoLines" style="padding-bottom:6mm;">
			18</td>
		<td class="sty8936LNDescTallShortest">
			   <span style="float:left;">For vehicles with four or more wheels, enter the amount from line 15. If the vehicle is a two-wheeled vehicle, enter the </span>
			   <span style="float:left;">smaller of line 16 or line 17 </span>
			   <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>  
		 </td>
		 <td class="sty8936HLNRightNumBoxTall">
			18
		</td>
              <td class="styTableCell" valign="bottom" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width:1px; border-bottom-width:1px;padding-left:14mm; padding-top:5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="SmallerMaxCrOrPrsnlRatioAmt"/>
                </xsl:call-template>
              </td>
              <td class="styTableCell" valign="bottom" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width:1px; border-bottom-width:1px;padding-left:14mm; padding-top:5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/SmallerMaxCrOrPrsnlRatioAmt"/>
                </xsl:call-template>
              </td>
             </tr>
           </tbody>
          </table>
          <br/>
        </xsl:if>
      </xsl:for-each>
    </xsl:if>-->
    </form>  
</body>
</html>
</xsl:template>    
</xsl:stylesheet>