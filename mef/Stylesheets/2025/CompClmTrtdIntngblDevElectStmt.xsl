<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/CompClmTrtdIntngblDevElectStmt"/>
	<!-- Shared Dependency Display Name is Compensation Claimed Treat As Intangible Development Election Statement  -->
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
		<xsl:template name="DependencyTemplate">
		<div style="font-weight:bold;font-size:10pt;width:187mm;padding-top:5mm;">Compensation Claimed Treat As Intangible Development Election Group:</div>
		<!-- Table begin -->
		<table class="styDepTbl">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:40mm;vertical-align:middle;">
             Total Amount of Stock-Based Compensation Granted
          </th>
					<th class="styDepTblCell" scope="col" style="width:46mm;vertical-align:middle;">
             Regulation Reference
           </th>
					<th class="styDepTblCell" scope="col" style="width:101mm;vertical-align:middle;">       
            Explanation
            </th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$DependencyData/CompClmTrtdIntngblDevElectGrp">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" align="right">
							<span style="width:40mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="CompClmTrtdAsIntngblDevAmt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styDepTblCell" align="left">
							<span style="width:46mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="RegulationReferenceTxt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styDepTblCell" align="left">
							<span style="width:101mm">
								<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="ExplanationTxt" /></xsl:call-template>
							</span>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- Main template -->
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:value-of select="$depDocTitle"/>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Desc" content="{$depDocTitle}"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass">
				<xsl:call-template name="DocumentHeaderDependency"/>
				<div class="styDepTitleLine">
					<span class="styDepTitle">
						<span style="padding-right:2mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<xsl:call-template name="DependencyTemplate"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>