<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>

	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>

	<xsl:param name="DependencyData" select="$RtnDoc/ElectionOutQTIPTreatmentStmt"/>

	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>  
	</xsl:param>

	<!-- Main template -->
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title><xsl:value-of select="$depDocTitle"/></title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Author" content="Beju Ekperigin"/>
				<meta name="Description" content="{$depDocTitle}"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>    
					</xsl:if>
				</style>        
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			
			<!-- NameDisplay - ElectionOutQTIPTreatmentStatement -->
			<body class="styBodyClass">      
				<xsl:call-template name="DocumentHeaderDependency"/>    
				<div class="styDepTitleLine">
					<span class="styDepTitle">
						<span style="padding-right:5mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				
				<table id="ElectionOutTb" class="styDepTbl">
					<thead class="styTableThead">
						<tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col">Election Out</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="styDepTblCell">
								<div style="text-align:left;margin-left:7mm;min-height:100mm;padding:1mm;line-height:1.3;display:block;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$DependencyData/LongExplanationTxt"/>
									</xsl:call-template>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
