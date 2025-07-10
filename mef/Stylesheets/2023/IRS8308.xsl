<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 08/15/2023 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8308Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest -->
  <xsl:param name="Form8308Data" select="$RtnDoc/IRS8308"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8308Data)"/>
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
        <meta name="Description" content="IRS Form 8308"/>
        <xsl:call-template name="InitJS"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8308Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form8308">
          <xsl:call-template name="DocumentHeader"/>
          
          <!-- Begin Form Number and Name -->
          <div class="styTBB" style="width:187mm;height:19mm;">
            <div class="styFNBox" style="width:30mm;height:19mm;">
				  <div style="height:mm;">
					Form<span class="styFormNumber">  8308</span>
				  </div>
				 <div style="height:7mm;font-size:7pt;font-family:arial;">(Rev. October 2023)
						<span style="width:3px;"/>
						<span style="width:3px;"/>
					<xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="Desc">Form 8308, Top Left Margin - Summary Dormant FDE Indicator</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$Form8308Data/@summaryDormantFDEIndicator"/>
					</xsl:call-template>	                
							   
								<span class="styAgency"  style="padding-top:1mm;">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
			   </div>
         </div>
         <div class="styFTBox" style="width:126mm;height:19mm;padding-top:2mm;">
             <div class="styMainTitle">Report of a Sale or Exchange of<br/>Certain Partnership Interests</div><br/>
             	<div class="styFBT">
            		<span style="text-align:center;">
						<img src="{$ImagePath}/8308_Bullet_Sm.gif" alt="Bullet"/>Go to <a href="http://www.irs.gov/Form8308"><i>www.irs.gov/Form8308</i>
						</a> for the latest information.
					</span> 
	            </div>
              </div>
           <div class="styTYBox" style="width:30mm;height:19mm;padding-top:9mm;text-align:center;">OMB No. 1545-0123</div>
         </div>
         <!-- End Form Header -->
         <!--James-border-style:solid;border-color:black;border-style:solid;border-color:black;border-width:1px 1px 1px 1px;--> 
          
         <!-- Begin Partner Info -->
         <div class="styBB" style="width:187mm;">
	         <div class="styNameBox" style="width:105mm;height:10mm;font-size:7pt;">Name of partnership<br/>
		           <div style="font-family:verdana;font-size:7pt;height:10mm;">
			           <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$Form8308Data/PartnershipName/BusinessNameLine1Txt"/>
					   </xsl:call-template><br/>  
			           <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$Form8308Data/PartnershipName/BusinessNameLine2Txt"/>
						</xsl:call-template> 
		           </div> 
           </div>
           <div class="styNameBox" style="height:10mm;width:35mm;font-size:7pt;border-right:0px solid black;">
	              <span style="padding-left:1mm;">Phone number</span><br/>
						  <span style="padding-left:1mm;"> 
	                    <xsl:call-template name="PopulatePhoneNumber">
		                  <xsl:with-param name="TargetNode" select="$Form8308Data/PhoneNum"/>
		              </xsl:call-template>    
		       </span>
	        </div>
      	   <div style="width:47mm;height:10mm;padding-left:2mm;font-size:7pt; font-weight: normal;border-left:1px solid black;" class="styEINBox">         
       		   <span class="styBoldText" style="">Employer identification number</span><br/>   
	          <div>    
	             <span style="font-weight:normal;">  
       	        <xsl:call-template name="PopulateEIN">
      	        	<xsl:with-param name="TargetNode" select="$Form8308Data/PartnershipEIN"/>
      	        </xsl:call-template>
            	</span>       
            	</div> 
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styNumberBox" style="height:10mm;font-size:7pt;">Number, street, and room or suite no. If a P.O. box, see instructions.<br/>
		        <!--<span style="">-->
				<xsl:if test="$Form8308Data/USAddress ">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8308Data/USAddress/AddressLine1Txt"/>
					</xsl:call-template>
					<xsl:if test="$Form8308Data/USAddress/AddressLine2Txt">
					<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$Form8308Data/USAddress/AddressLine2Txt"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
              <xsl:if test="$Form8308Data/ForeignAddress ">
					<xsl:call-template name="PopulateText">
					   <xsl:with-param name="TargetNode"
					    select="$Form8308Data/ForeignAddress/AddressLine1Txt"/>
					</xsl:call-template>
					<xsl:if test="$Form8308Data/ForeignAddress/AddressLine2Txt">
					<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							 select="$Form8308Data/ForeignAddress/AddressLine2Txt"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
		       <!-- </span>-->
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
				<div class="styNumberBox" style="height:10mm;font-size:7pt;">City or town, state or province, country, and ZIP or foreign postal code<br/>
					<span style="width:90mm;">
					  <!--<br/>-->
					  <xsl:if test="$Form8308Data/USAddress">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form8308Data/USAddress/CityNm"/>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form8308Data/USAddress/StateAbbreviationCd"/>
						 </xsl:call-template>,
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form8308Data/USAddress/ZIPCd"/>
							</xsl:call-template>
					  </xsl:if>
					  <xsl:if test="$Form8308Data/ForeignAddress ">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form8308Data/ForeignAddress/CityNm"/>
							</xsl:call-template><br/>
						  <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form8308Data/ForeignAddress/ProvinceOrStateNm"/>
						</xsl:call-template>,
						<span style="padding-left:.5mm;"/>
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form8308Data/ForeignAddress/ForeignPostalCd "/>
						</xsl:call-template>,
						<span style="padding-left:.5mm;"/>
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form8308Data/ForeignAddress/CountryCd"/>
						</xsl:call-template>
					  </xsl:if>
					</span>
				</div>
          </div>

          <!-- End Filer Info -->
             
          <!-- Part I, Transferor Information -->
          <div class="styBB" style="height:4mm;width:187mm;float:none;clear:both;">
				<span class="styPartName" style="height:4mm;width:12mm;padding-top:.5mm;padding-bottom:.5mm;">Part I</span>
				<div class="styLNDesc" style="width:175mm;font-size:8pt;padding-left:3mm;">
					<b>Transferor Information</b> Record holder of the partnership interest immediately before transferring that interest:
				</div>
          </div>
          
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="height:9mm;width:155mm;font-size:7pt;">
              Name<br/>
                   <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8308Data/TransferorGrp/BusinessName/BusinessNameLine1Txt"/>
                  </xsl:call-template>
                  <xsl:if test="$Form8308Data/TransferorGrp/BusinessName/BusinessNameLine2Txt">
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorGrp/BusinessName/BusinessNameLine2Txt"/>
                    </xsl:call-template>
                  </xsl:if>
          </div>

          <div style="height:9mm;padding-left:2mm;font-size:7pt; font-weight: normal;"
             class="styEINBox">       
			<span class="styBoldText">Identifying number</span><br/>   
                <xsl:choose>
					<xsl:when test="$Form8308Data/TransferorGrp/EIN">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$Form8308Data//TransferorGrp/EIN"/>
		                </xsl:call-template>
                   </xsl:when> 
                   <xsl:when test="$Form8308Data/TransferorGrp/SSN">                
                        <xsl:call-template name="PopulateSSN">
		                  <xsl:with-param name="TargetNode" select="$Form8308Data//TransferorGrp/SSN"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" 
							select="$Form8308Data/TransferorGrp/MissingEINReasonCd"/>
								</xsl:call-template>
					</xsl:otherwise>
                </xsl:choose>
          </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styNumberBox" style="height:10mm;font-size:7pt;">
              Number and street (including apt. no.)
				<br/>
				<xsl:if test="$Form8308Data/TransferorGrp/USAddress ">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode"
						 select="$Form8308Data/TransferorGrp/USAddress/AddressLine1Txt"/>
					</xsl:call-template>
					<xsl:if test="$Form8308Data/TransferorGrp/USAddress/AddressLine2Txt">
					<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							 select="$Form8308Data/TransferorGrp/USAddress/AddressLine2Txt"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
                <xsl:if test="$Form8308Data/TransferorGrp/ForeignAddress">
					<xsl:call-template name="PopulateText">
					   <xsl:with-param name="TargetNode"
					    select="$Form8308Data/TransferorGrp/ForeignAddress/AddressLine1Txt"/>
					</xsl:call-template>
					<xsl:if test="$Form8308Data/TransferorGrp/ForeignAddress/AddressLine2Txt">
					<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							 select="$Form8308Data/TransferorGrp/ForeignAddress/AddressLine2Txt"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styNumberBox" style="height:10mm;font-size:7pt;">
         	 City or town, state or province, country, and ZIP or foreign postal code
              <br/>
					  <xsl:if test="$Form8308Data/TransferorGrp/USAddress">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorGrp/USAddress/CityNm"/>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorGrp/USAddress/StateAbbreviationCd"/>
						 </xsl:call-template>,
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorGrp/USAddress/ZIPCd"/>
							</xsl:call-template>
					  </xsl:if>
					  <xsl:if test="$Form8308Data/TransferorGrp/ForeignAddress ">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorGrp/ForeignAddress/CityNm"/>
							</xsl:call-template><br/>
						  <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorGrp/ForeignAddress/ProvinceOrStateNm"/>
						</xsl:call-template>,
						<span style="padding-left:.5mm;"/>
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorGrp/ForeignAddress/ForeignPostalCd "/>
						</xsl:call-template>,
						<span style="padding-left:.5mm;"/>
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorGrp/ForeignAddress/CountryCd"/>
						</xsl:call-template>
					  </xsl:if>
            </div>
          </div>

			<div class="styBB" style="width:187mm;">
				<div class="styLNDesc" style="height:auto;width:187mm;">Check if the transferor is foreign:  
                     <span style="width:5mm"/>
                      <span>
						  <xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form8308Data/TransferorForeignInd"/>
								<xsl:with-param name="BackupName">IRS8308TransferorForeignInd</xsl:with-param>
						  </xsl:call-template>
						  <input type="checkbox" class="styCkbox" alt="TransferorForeignInd">
								<xsl:call-template name="PopulateYesCheckbox">
								  <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorForeignInd"/>
								  <xsl:with-param name="BackupName">IRS8308TransferorForeignInd</xsl:with-param>
								</xsl:call-template>
						  </input>
                      </span>
                      <label>
                        <xsl:call-template name="PopulateLabel">
                          <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorForeignInd"/>
                          <xsl:with-param name="BackupName">IRS8308TransferorForeignInd</xsl:with-param>
                        </xsl:call-template>
                      </label>
			   </div>
                    	
				<div class="styLNDesc" style="height:auto;width:187mm;">Beneficial owner of the partnership interest immediately before transferring that interest:</div>
			 </div> 	 

          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="height:9mm;width:155mm;font-size:7pt;">
              Name<br/>
                   <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8308Data/TransferorBeneficialOwnerGrp/BusinessName/BusinessNameLine1Txt"/>
                  </xsl:call-template>
                  <xsl:if test="$Form8308Data/TransferorBeneficialOwnerGrp/BusinessName/BusinessNameLine2Txt">
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorBeneficialOwnerGrp/BusinessName/BusinessNameLine2Txt"/>
                    </xsl:call-template>
                  </xsl:if>
          </div>

          <div style="height:9mm;padding-left:2mm;font-size:7pt; font-weight: normal;"
             class="styEINBox">       
			<span class="styBoldText">Identifying number</span><br/>   
                <xsl:choose>
					<xsl:when test="$Form8308Data/TransferorBeneficialOwnerGrp/EIN">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$Form8308Data//TransferorBeneficialOwnerGrp/EIN"/>
		                </xsl:call-template>
                   </xsl:when> 
                   <xsl:when test="$Form8308Data/TransferorBeneficialOwnerGrp/SSN">                
                        <xsl:call-template name="PopulateSSN">
		                  <xsl:with-param name="TargetNode" select="$Form8308Data//TransferorBeneficialOwnerGrp/SSN"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" 
							select="$Form8308Data/TransferorBeneficialOwnerGrp/MissingEINReasonCd"/>
								</xsl:call-template>
					</xsl:otherwise>
                </xsl:choose>
          </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styNumberBox" style="height:10mm;font-size:7pt;">
              Number and street (including apt. no.)
				<br/>
				<xsl:if test="$Form8308Data/TransferorBeneficialOwnerGrp/USAddress ">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode"
						 select="$Form8308Data/TransferorBeneficialOwnerGrp/USAddress/AddressLine1Txt"/>
					</xsl:call-template>
					<xsl:if test="$Form8308Data/TransferorBeneficialOwnerGrp/USAddress/AddressLine2Txt">
					<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							 select="$Form8308Data/TransferorBeneficialOwnerGrp/USAddress/AddressLine2Txt"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
                <xsl:if test="$Form8308Data/TransferorBeneficialOwnerGrp/ForeignAddress">
					<xsl:call-template name="PopulateText">
					   <xsl:with-param name="TargetNode"
					    select="$Form8308Data/TransferorBeneficialOwnerGrp/ForeignAddress/AddressLine1Txt"/>
					</xsl:call-template>
					<xsl:if test="$Form8308Data/TransferorBeneficialOwnerGrp/ForeignAddress/AddressLine2Txt">
					<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							 select="$Form8308Data/TransferorBeneficialOwnerGrp/ForeignAddress/AddressLine2Txt"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styNumberBox" style="height:10mm;font-size:7pt;">
         	 City or town, state or province, country, and ZIP or foreign postal code
              <br/>
					  <xsl:if test="$Form8308Data/TransferorBeneficialOwnerGrp/USAddress">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorBeneficialOwnerGrp/USAddress/CityNm"/>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorBeneficialOwnerGrp/USAddress/StateAbbreviationCd"/>
						 </xsl:call-template>,
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorBeneficialOwnerGrp/USAddress/ZIPCd"/>
							</xsl:call-template>
					  </xsl:if>
					  <xsl:if test="$Form8308Data/TransferorBeneficialOwnerGrp/ForeignAddress ">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorBeneficialOwnerGrp/ForeignAddress/CityNm"/>
							</xsl:call-template><br/>
						  <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorBeneficialOwnerGrp/ForeignAddress/ProvinceOrStateNm"/>
						</xsl:call-template>,
						<span style="padding-left:.5mm;"/>
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorBeneficialOwnerGrp/ForeignAddress/ForeignPostalCd "/>
						</xsl:call-template>,
						<span style="padding-left:.5mm;"/>
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorBeneficialOwnerGrp/ForeignAddress/CountryCd"/>
						</xsl:call-template>
					  </xsl:if>
            </div>
          </div>
    
		<!-- Extra information start -->          
			<div class="styBB" style="height:auto;width:187mm;float:none;clear:both;">
				<div class="styLNDesc" style="height:auto;width:186mm;">
					<b>Notice to Transferors:</b>
					<i>The information on this form has been supplied to the Internal Revenue Service.
					 The transferor in a section 751(a) exchange is required to treat a portion of the gain
					 realized from the exchange as ordinary income. For more details, see Pub. 541,
					 Partnerships.</i>
				</div>          
				<div class="styLNDesc" style="height:auto;width:186mm;">
					<b>Statement by Transferor:</b>
					<i>The transferor in a section 751(a) exchange is required under Regulations section
					 1.751-1(a)(3) to attach a statement relating to the sale or exchange to his or her return.
					 See Instructions to Transferors for more details.
					</i> 
				</div>
		   </div>      
		<!-- Extra information end -->   
    
    <!-- End Part I, Transferor Information -->       
           
    <!-- Part II, Transferee Information -->
    <div class="styBB" style="height:4mm;width:187mm;float:none;clear:both;">
		<span class="styPartName" style="height:4mm;width:12mm;padding-top:.5mm;padding-bottom:.5mm;">Part II</span>
		<div class="styLNDesc" style="height:4mm;width:175mm;font-size:8pt;padding-left:3mm;">
		   <b>Transferee Information</b> Record holder of the partnership interest immediately after the transfor of that interest:
		</div>
    </div>
    <div class="styBB" style="width:187mm;">
		<div class="styNameBox" style="height:9mm;width:155mm;font-size:7pt;">
		  Name<br/>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" 
				select="$Form8308Data/TransfereeGrp/BusinessName/BusinessNameLine1Txt"/>
			</xsl:call-template>
			<xsl:if test="$Form8308Data/TransfereeGrp/BusinessName/BusinessNameLine2Txt">
				<br/>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode"
					 select="$Form8308Data/TransfereeGrp/BusinessName/BusinessNameLine2Txt"/>
				</xsl:call-template>
			</xsl:if>
		</div>
		<div style="height:9mm;padding-left:2mm;font-size:7pt; font-weight: normal;" 
		  class="styEINBox">         
			<span class="styBoldText">Identifying number</span><br/>
			<xsl:choose>
				<xsl:when test="$Form8308Data/TransfereeGrp/EIN">
					<xsl:call-template name="PopulateEIN">
						<xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeGrp/EIN"/>
					</xsl:call-template>
				</xsl:when>                  
				<xsl:when test="$Form8308Data/TransfereeGrp/SSN">
					<xsl:call-template name="PopulateSSN">
						<xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeGrp/SSN"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeGrp/MissingEINReasonCd"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
        </div>
    </div>
    <div class="styBB" style="width:187mm;">
		<div class="styNumberBox" style="height:10mm;font-size:7pt;">
        Number and street (including apt. no.)
			<br/>

				<xsl:if test="$Form8308Data/TransfereeGrp/USAddress ">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode"
						 select="$Form8308Data/TransfereeGrp/USAddress/AddressLine1Txt"/>
					</xsl:call-template>
					<xsl:if test="$Form8308Data/TransfereeGrp/USAddress/AddressLine2Txt">
					<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							 select="$Form8308Data/TransfereeGrp/USAddress/AddressLine2Txt"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
                <xsl:if test="$Form8308Data/TransfereeGrp/ForeignAddress">
					<xsl:call-template name="PopulateText">
					   <xsl:with-param name="TargetNode"
					    select="$Form8308Data/TransfereeGrp/ForeignAddress/AddressLine1Txt"/>
					</xsl:call-template>
					<xsl:if test="$Form8308Data/TransfereeGrp/ForeignAddress/AddressLine2Txt">
					<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							 select="$Form8308Data/TransfereeGrp/ForeignAddress/AddressLine2Txt"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styNumberBox" style="height:10mm;font-size:7pt;">
         	 City or town, state or province, country, and ZIP or foreign postal code
              <br/>
					  <xsl:if test="$Form8308Data/TransfereeGrp/USAddress">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeGrp/USAddress/CityNm"/>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeGrp/USAddress/StateAbbreviationCd"/>
						 </xsl:call-template>,
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeGrp/USAddress/ZIPCd"/>
							</xsl:call-template>
					  </xsl:if>
					  <xsl:if test="$Form8308Data/TransfereeGrp/ForeignAddress ">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeGrp/ForeignAddress/CityNm"/>
							</xsl:call-template><br/>
						  <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeGrp/ForeignAddress/ProvinceOrStateNm"/>
						</xsl:call-template>,
						<span style="padding-left:.5mm;"/>
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeGrp/ForeignAddress/ForeignPostalCd "/>
						</xsl:call-template>,
						<span style="padding-left:.5mm;"/>
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeGrp/ForeignAddress/CountryCd"/>
						</xsl:call-template>
					  </xsl:if>
            </div>
          </div>

			<div class="styBB" style="width:187mm;">
				<div class="styLNDesc" style="height:auto;width:187mm;">Beneficial owner of the partnership interest immediately after the transfer of that interest:</div>
			</div> 	 

          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="height:9mm;width:155mm;font-size:7pt;">
              Name<br/>
                   <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeBeneficialOwnerGrp/BusinessName/BusinessNameLine1Txt"/>
                  </xsl:call-template>
                  <xsl:if test="$Form8308Data/TransfereeBeneficialOwnerGrp/BusinessName/BusinessNameLine2Txt">
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeBeneficialOwnerGrp/BusinessName/BusinessNameLine2Txt"/>
                    </xsl:call-template>
                  </xsl:if>
          </div>

          <div style="height:9mm;padding-left:2mm;font-size:7pt; font-weight: normal;"
             class="styEINBox">       
			<span class="styBoldText">Identifying number</span><br/>   
                <xsl:choose>
					<xsl:when test="$Form8308Data/TransfereeBeneficialOwnerGrp/EIN">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$Form8308Data//TransfereeBeneficialOwnerGrp/EIN"/>
		                </xsl:call-template>
                   </xsl:when> 
                   <xsl:when test="$Form8308Data/TransfereeBeneficialOwnerGrp/SSN">                
                        <xsl:call-template name="PopulateSSN">
		                  <xsl:with-param name="TargetNode" select="$Form8308Data//TransfereeBeneficialOwnerGrp/SSN"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" 
							select="$Form8308Data/TransfereeBeneficialOwnerGrp/MissingEINReasonCd"/>
								</xsl:call-template>
					</xsl:otherwise>
                </xsl:choose>
          </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styNumberBox" style="height:10mm;font-size:7pt;">
              Number and street (including apt. no.)
				<br/>
				<xsl:if test="$Form8308Data/TransfereeBeneficialOwnerGrp/USAddress ">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode"
						 select="$Form8308Data/TransfereeBeneficialOwnerGrp/USAddress/AddressLine1Txt"/>
					</xsl:call-template>
					<xsl:if test="$Form8308Data/TransfereeBeneficialOwnerGrp/USAddress/AddressLine2Txt">
					<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							 select="$Form8308Data/TransfereeBeneficialOwnerGrp/USAddress/AddressLine2Txt"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
                <xsl:if test="$Form8308Data/TransfereeBeneficialOwnerGrp/ForeignAddress">
					<xsl:call-template name="PopulateText">
					   <xsl:with-param name="TargetNode"
					    select="$Form8308Data/TransfereeBeneficialOwnerGrp/ForeignAddress/AddressLine1Txt"/>
					</xsl:call-template>
					<xsl:if test="$Form8308Data/TransfereeBeneficialOwnerGrp/ForeignAddress/AddressLine2Txt">
					<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							 select="$Form8308Data/TransfereeBeneficialOwnerGrp/ForeignAddress/AddressLine2Txt"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styNumberBox" style="height:10mm;font-size:7pt;">
         	 City or town, state or province, country, and ZIP or foreign postal code
              <br/>
					  <xsl:if test="$Form8308Data/TransfereeBeneficialOwnerGrp/USAddress">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeBeneficialOwnerGrp/USAddress/CityNm"/>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeBeneficialOwnerGrp/USAddress/StateAbbreviationCd"/>
						 </xsl:call-template>,
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeBeneficialOwnerGrp/USAddress/ZIPCd"/>
							</xsl:call-template>
					  </xsl:if>
					  <xsl:if test="$Form8308Data/TransfereeBeneficialOwnerGrp/ForeignAddress ">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeBeneficialOwnerGrp/ForeignAddress/CityNm"/>
							</xsl:call-template><br/>
						  <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeBeneficialOwnerGrp/ForeignAddress/ProvinceOrStateNm"/>
						</xsl:call-template>,
						<span style="padding-left:.5mm;"/>
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeBeneficialOwnerGrp/ForeignAddress/ForeignPostalCd "/>
						</xsl:call-template>,
						<span style="padding-left:.5mm;"/>
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeBeneficialOwnerGrp/ForeignAddress/CountryCd"/>
						</xsl:call-template>
					  </xsl:if>
            </div>
          </div>

    <!-- End Part II, Transferee Information -->
          
    <!-- Part III, Date of Sale or Exchange of Partnership Interest -->
    <div class="styBB" style="height:4mm;width:187mm;float:none;clear:both;">
       <span class="styPartName" style="width: 14mm;">Part III</span>
       <span class="styPartDesc" style="width: 92mm;">Transfer of Partnership Interest</span>
    </div>
 		<div class="styBB" style="width:187mm;">
			<div  style="width:187mm;">
				<div class="styLNLeftNumBoxSD">1</div>
				<div class="styLNDesc" style="height:auto;width:80mm;">Date of Sale or Exchange of Partnership Interest:</div>
				<div class="styFixedUnderline" style="height:auto;width:16mm;">		    
					<xsl:call-template name="PopulateMonthDayYear">
					  <xsl:with-param name="TargetNode" select="$Form8308Data/SaleOrExchangeDt"/>
					</xsl:call-template>
				</div>
			</div> 
			
			<div  style="width:187mm;">
				<div class="styLNLeftNumBoxSD">2</div>
				<div class="styLNDesc" style="height:auto;width:80mm;">Type of partnership interest transferred:</div>
				<div class="styLNDesc" style="height:auto;width:40mm;">		    
                     <span style="width:5mm"/>
                      <span>
						  <xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form8308Data/CapitalPrtshpIntTrnsfrInd"/>
								<xsl:with-param name="BackupName">IRS8308CapitalPrtshpIntTrnsfrInd</xsl:with-param>
						  </xsl:call-template>
						  <input type="checkbox" class="styCkbox" alt="A. Capital">
								<xsl:call-template name="PopulateYesCheckbox">
								  <xsl:with-param name="TargetNode" select="$Form8308Data/CapitalPrtshpIntTrnsfrInd"/>
								  <xsl:with-param name="BackupName">IRS8308CapitalPrtshpIntTrnsfrInd</xsl:with-param>
								</xsl:call-template>
						  </input>
                      </span>
                      <span style="width:5mm"/>
                      <label>
                        <xsl:call-template name="PopulateLabel">
                          <xsl:with-param name="TargetNode" select="$Form8308Data/CapitalPrtshpIntTrnsfrInd"/>
                          <xsl:with-param name="BackupName">IRS8308CapitalPrtshpIntTrnsfrInd</xsl:with-param>
                        </xsl:call-template>
                      </label>A. Capital
				</div>
			</div> 

			<div  style="width:187mm;">
				<div class="styLNLeftNumBoxSD"/>
				<div class="styLNDesc" style="height:auto;width:80mm;"/>
				<div class="styLNDesc" style="height:auto;width:40mm;">		    
                     <span style="width:5mm"/>
                      <span>
						  <xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form8308Data/PreferredPrtshpIntTrnsfrInd"/>
								<xsl:with-param name="BackupName">IRS8308PreferredPrtshpIntTrnsfrInd</xsl:with-param>
						  </xsl:call-template>
						  <input type="checkbox" class="styCkbox" alt="B. Preferred">
								<xsl:call-template name="PopulateYesCheckbox">
								  <xsl:with-param name="TargetNode" select="$Form8308Data/PreferredPrtshpIntTrnsfrInd"/>
								  <xsl:with-param name="BackupName">IRS8308PreferredPrtshpIntTrnsfrInd</xsl:with-param>
								</xsl:call-template>
						  </input>
                      </span>
                      <span style="width:5mm"/>
                      <label>
                        <xsl:call-template name="PopulateLabel">
                          <xsl:with-param name="TargetNode" select="$Form8308Data/PreferredPrtshpIntTrnsfrInd"/>
                          <xsl:with-param name="BackupName">IRS8308PreferredPrtshpIntTrnsfrInd</xsl:with-param>
                        </xsl:call-template>
                      </label>B. Preferred  
				</div>
			</div> 

			<div  style="width:187mm;">
				<div class="styLNLeftNumBoxSD"/>
				<div class="styLNDesc" style="height:auto;width:80mm;"/>
				<div class="styLNDesc" style="height:auto;width:40mm;">		    
                     <span style="width:5mm"/>
                      <span>
						  <xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form8308Data/ProfitsPrtshpIntTrnsfrInd"/>
								<xsl:with-param name="BackupName">IRS8308ProfitsPrtshpIntTrnsfrInd</xsl:with-param>
						  </xsl:call-template>
						  <input type="checkbox" class="styCkbox" alt="C. Profits">
								<xsl:call-template name="PopulateYesCheckbox">
								  <xsl:with-param name="TargetNode" select="$Form8308Data/ProfitsPrtshpIntTrnsfrInd"/>
								  <xsl:with-param name="BackupName">IRS8308ProfitsPrtshpIntTrnsfrInd</xsl:with-param>
								</xsl:call-template>
						  </input>
                      </span>
                      <span style="width:5mm"/>
                      <label>
                        <xsl:call-template name="PopulateLabel">
                          <xsl:with-param name="TargetNode" select="$Form8308Data/ProfitsPrtshpIntTrnsfrInd"/>
                          <xsl:with-param name="BackupName">IRS8308ProfitsPrtshpIntTrnsfrInd</xsl:with-param>
                        </xsl:call-template>
                      </label>C. Profits
				</div>
			</div> 

			<div  style="width:187mm;">
				<div class="styLNLeftNumBoxSD"/>
				<div class="styLNDesc" style="height:auto;width:80mm;"/>
				<div class="styLNDesc" style="height:auto;width:40mm;">		    
                     <span style="width:5mm"/>
                      <span>
						  <xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form8308Data/OtherPrtshpIntTrnsfrInd"/>
								<xsl:with-param name="BackupName">IRS8308OtherPrtshpIntTrnsfrInd</xsl:with-param>
						  </xsl:call-template>
						  <input type="checkbox" class="styCkbox" alt="D. Other">
								<xsl:call-template name="PopulateYesCheckbox">
								  <xsl:with-param name="TargetNode" select="$Form8308Data/OtherPrtshpIntTrnsfrInd"/>
								  <xsl:with-param name="BackupName">IRS8308OtherPrtshpIntTrnsfrInd</xsl:with-param>
								</xsl:call-template>
						  </input>
                      </span>
                      <span style="width:5mm"/>
                      <label>
                        <xsl:call-template name="PopulateLabel">
                          <xsl:with-param name="TargetNode" select="$Form8308Data/OtherPrtshpIntTrnsfrInd"/>
                          <xsl:with-param name="BackupName">IRS8308OtherPrtshpIntTrnsfrInd</xsl:with-param>
                        </xsl:call-template>
                      </label>D. Other
				</div>
			</div> 
		</div>			 

    <!-- Part IV, Partners' share of gain (loss) required by sections 751(a) and (1)(h)(5) and (6) -->
    <div class="styBB" style="height:4mm;width:187mm;float:none;clear:both;">
       <span class="styPartName" style="width: 14mm;">Part IV</span>
       <span class="styPartDesc" style="width: 173mm;">Partners' share of gain (loss) required by sections 751(a) and (1)(h)(5) and (6)</span>
    </div>  
 
    <div class="styBB" style="height:39.5mm;width:187mm;float:none;clear:both;">
		<div class="styLNDesc" style="height:4mm;width:187mm;padding-left:17mm;">The amounts in column (c ) should be reported to the selling partner on their Schedule K-1 in box 20 using the relevant code</div> 
		<div class="styLNDesc" style="height:14mm;width:187mm;">
			<div class="styLNDesc" style="height:auto;width:68mm;"/>
			<div class="styLNDesc" style="height:13mm;width:27mm;">
				<div class="styLNDesc" style="height:2.5mm;width:27mm;"/>
				<div class="styLNDesc" style="height:10mm;width:27mm;padding-left:.5mm;border-style:solid;border-color:black;border-width:1px 0px 1px 1px; ">(a) Partnership<br/> level deemed sale<br/> gain (loss)</div>
			</div>	
			<div class="styLNDesc" style="height:13mm;width:27mm;padding-left:.5mm;border-style:solid;border-color:black;border-width:1px 0px 1px 1px;">(b1) Percentage<br/> interest in the<br/> partnership<br/> transferred</div> 
			<div class="styLNDesc" style="height:13mm;width:27mm;padding-left:.5mm;border-style:solid;border-color:black;border-width:1px 1px 1px 1px;">(b2) Number of<br/> units in the<br/> partnership<br/> transferred</div>  
			<div class="styLNDesc" style="height:13mm;width:27mm;">
				<div class="styLNDesc" style="height:2.5mm;width:27mm;"/>
				<div class="styLNDesc" style="height:10mm;width:27mm;padding-left:.5mm;border-style:solid;border-color:black;border-width:1px 1px 1px 0px;">(c) Partner level<br/> deemed sale gain<br/> (loss)</div>
			</div>	   
			<div class="styLNDesc" style="height:13mm;width:11mm;">
				<div class="styLNDesc" style="height:5.5mm;width:11mm;"/>
				<div class="styLNDesc" style="height:7mm;width:11mm;padding-left:.5mm;border-style:solid;border-color:black;border-width:1px 1px 1px 0px;">K-1 box<br/> 20 code</div>
			</div>	  
		</div>
 
	<!-- Part IV, Section 751a Gain Loss Group -->
		<div class="styLNDesc" style="height:7mm;width:187mm;">
			<div class="styLNLeftNumBoxSD" style="padding-top:3.5mm;">1</div>
			<div class="styLNDesc" style="height:7mm;width:60mm;padding-top:3.5mm;">Section 751(a) gain (loss)</div>
		
			<div class="styLNAmountBox" style="height:7mm;width:27mm;padding-top:3.5mm;padding-right:.5mm;border-top-width:1px;border-bottom-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form8308Data/Section751aGainLossGrp/PrtshpLvlDeemedSaleGainLossAmt"/>
				</xsl:call-template>
			</div>
			<div class="styLNAmountBox" style="height:7mm;width:27mm;border-top-width:1px;border-bottom-width:0px;word-break:break-all;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form8308Data/Section751aGainLossGrp/PrtshpInterestTransferredPct"/>
				</xsl:call-template>
			</div>
			<div class="styLNAmountBox" style="height:7mm;width:27mm;border-top-width:1px;border-bottom-width:0px;word-break:break-all;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form8308Data/Section751aGainLossGrp/TotalPrtshpUnitsTransferredCnt"/>
				</xsl:call-template>
			</div>
			<div class="styLNAmountBox" style="height:7mm;width:27mm;padding-top:3.5mm;padding-right:.5mm;border-top-width:1px;border-bottom-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form8308Data/Section751aGainLossGrp/PrtnrLvlDeemedSaleGainLossAmt"/>
				</xsl:call-template>
			</div>		
			<div class="styLNDesc" style="height:7mm;width:11mm;border-style:solid;border-color:black;border-width:1px 1px 0px 1px;"/>
		</div>

	<!-- Part IV, Section 1h5 Gain Loss Group -->
		<div class="styLNDesc" style="height:7mm;width:187mm;">
			<div class="styLNLeftNumBoxSD" style="padding-top:3.5mm;">2</div>
			<div class="styLNDesc" style="height:7mm;width:60mm;padding-top:3.5mm;">Section 1(h)(5) gain (loss)</div>
		
			<div class="styLNAmountBox" style="height:7mm;width:27mm;padding-top:3.5mm;padding-right:.5mm;border-top-width:1px;border-bottom-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form8308Data/Section1h5GainLossGrp/PrtshpLvlDeemedSaleGainLossAmt"/>
				</xsl:call-template>
			</div>
			<div class="styLNAmountBox" style="height:7mm;width:27mm;border-top-width:1px;border-bottom-width:0px;word-break:break-all;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form8308Data/Section1h5GainLossGrp/PrtshpInterestTransferredPct"/>
				</xsl:call-template>
			</div>
			<div class="styLNAmountBox" style="height:7mm;width:27mm;border-top-width:1px;border-bottom-width:0px;word-break:break-all;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form8308Data/Section1h5GainLossGrp/TotalPrtshpUnitsTransferredCnt"/>
				</xsl:call-template>
			</div>
			<div class="styLNAmountBox" style="height:7mm;width:27mm;padding-top:3.5mm;padding-right:.5mm;border-top-width:1px;border-bottom-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form8308Data/Section1h5GainLossGrp/PrtnrLvlDeemedSaleGainLossAmt"/>
				</xsl:call-template>
			</div>		
			<div class="styLNDesc" style="height:7mm;width:11mm;border-style:solid;border-color:black;border-width:1px 1px 0px 1px;"/>
		</div>
 
	<!-- Part IV, Deemed Section 1250 Unrecaptured Gain Group -->
		<div class="styLNDesc" style="height:7mm;width:187mm;">
			<div class="styLNLeftNumBoxSD" style="padding-top:3.5mm;">3</div>
			<div class="styLNDesc" style="height:7mm;width:60mm;padding-top:3.5mm;">Deemed section 1250 unrecaptured gain</div>
		
			<div class="styLNAmountBox" style="height:7mm;width:27mm;padding-top:3.5mm;padding-right:.5mm;border-top-width:1px;border-bottom-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form8308Data/DmdSect1250UnrcptrGainLossGrp/PrtshpLvlDeemedSaleGainLossAmt"/>
				</xsl:call-template>
			</div>
			<div class="styLNAmountBox" style="height:7mm;width:27mm;border-top-width:1px;border-bottom-width:0px;word-break:break-all;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form8308Data/DmdSect1250UnrcptrGainLossGrp/PrtshpInterestTransferredPct"/>
				</xsl:call-template>
			</div>
			<div class="styLNAmountBox" style="height:7mm;width:27mm;border-top-width:1px;border-bottom-width:0px;word-break:break-all;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form8308Data/DmdSect1250UnrcptrGainLossGrp/TotalPrtshpUnitsTransferredCnt"/>
				</xsl:call-template>
			</div>
			<div class="styLNAmountBox" style="height:7mm;width:27mm;padding-top:3.5mm;padding-right:.5mm;border-top-width:1px;border-bottom-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form8308Data/DmdSect1250UnrcptrGainLossGrp/PrtnrLvlDeemedSaleGainLossAmt"/>
				</xsl:call-template>
			</div>		
			<div class="styLNDesc" style="height:7mm;width:11mm;border-style:solid;border-color:black;border-width:1px 1px 0px 1px;"/>
		</div>
	</div>
                                           
    <div class="styBB" style="height:auto;width:187mm;float:none;clear:both;"> 
		<div style="height:17mm;width: 38mm; float:left;border-right: thin solid black;font-size: 7pt;padding-right: 4mm;padding-top: 2mm;padding-bottom: 2mm;">
			<b>Sign here only if you are filing this form by itself and not with Form 1065</b>
		</div>

		<div style="width:145mm;float:right;clear none;font-size: 7pt;">
				Under penalties of perjury, I declare that I have examined this return, including accompanying attachments, and to the best of my
				knowledge and belief, it is true, correct, and complete.<br/><br/>
			<div style="width: 110mm; float: left; clear none;">
			   <div style="width: 4mm; float: left; clear: none;"><img src="{$ImagePath}/8308_Bullet_Lg.gif" alt="LargeBullet"/></div>
			   <div class="styFixedUnderline" style="float: left; clear: none; width:95mm; height:4mm; border-style:solid"/>
				<div style="float: left; clear: none; width:95mm; height:4mm; padding-left:.5mm;font-size: 6pt; text-align:left;">Signature of partnership representative 
						or partner or limited liability company member</div>
			</div>
    
			<div style="width:30mm; float: right;clear none;">
			   <div style="width: 4mm; float: left; clear: none;"><img src="{$ImagePath}/8308_Bullet_Lg.gif" alt="LargeBullet"/></div>
			   <div class="styFixedUnderline" style="float: right; clear: none; width:25mm;height:4mm; border-style:solid;"><span style="width:80px"/></div> 
			   <div style="float: right; clear: none; width:25mm;height:4mm;padding-left:.5mm;font-size: 6pt; text-align:left;">Date</div>
			</div>
		</div>
   </div>
   <!-- End Part III, Date of Sale or Exchange of Partnership Interest -->
              
    <div style="width:187mm;">
		<span style="width:80mm;"/>       
			  Cat. No. 62503I
		<span style="width:49.5mm;"/>   
		<span style="font-size:7pt;padding-right:1mm;">Form</span> <span class="styBoldText" style="font-size:8pt;">8308</span> <span style="font-size:7pt;padding-left:1mm;">(Rev. 10-2023)</span>
	</div>
		<br/><br/>
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
        <xsl:with-param name="TargetNode" select="$Form8308Data"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>          
    </table>
    <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>