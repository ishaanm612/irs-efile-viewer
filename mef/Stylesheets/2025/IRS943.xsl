<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS943Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS943"/>
	<xsl:param name="SubType" select="/AppData/Parameters/SubmissionType"/>
	<xsl:template name="DotLoop">
		<xsl:param name="DotQty"/>
		<xsl:if test="$DotQty &gt; 0">
			&lt;span style="width:11px;" &gt;&lt;/span&gt;.
			<xsl:call-template name="DotLoop">
				<xsl:with-param name="DotQty" select="$DotQty - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:variable name="HtmlLang">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">EN-US</xsl:when>
			<xsl:otherwise>ES</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="MetaContent">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">IRS Form 943</xsl:when>
			<xsl:otherwise>IRS Form 943</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="EnglishBreak">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;br/&gt;</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SpanishBreak">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'"/>
			<xsl:otherwise>&lt;br/&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormName">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">IRS943</xsl:when>
			<xsl:otherwise>IRS943</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="HeightCell">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">9</xsl:when>
			<xsl:otherwise>11</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Form </xsl:when>
			<xsl:otherwise>Formulario </xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormTitleText">
		943
		<!--<xsl:choose>
			<xsl:when test="$SubType='943' and $Language='ENGLISH'">943</xsl:when>
			<xsl:when test="$SubType='943PR' and $Language='ENGLISH'">&lt;span style="font-size:9pt;"&gt;943-PR (Eng)&lt;/span&gt;</xsl:when>
			<xsl:when test="$SubType='943' and $Language='SPANISH'">943</xsl:when>
			<xsl:when test="$SubType='943PR' and $Language='SPANISH'">&lt;span style="font-size:10pt;"&gt;943-PR&lt;/span&gt;</xsl:when>
		</xsl:choose>-->
	</xsl:variable>
	<xsl:variable name="FormNameText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Employer&apos;s Annual Federal Tax Return for Agricultural Employees</xsl:when>
			<xsl:otherwise>Declaración del Impuesto Federal Anual del Empleador de Empleados Agropecuarios</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormUpperRightNumber">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">430124</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormUpperRightNumber2">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">430223</xsl:when>
			<xsl:otherwise>430223</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormUpperRightNumber3">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">430323</xsl:when>
			<xsl:otherwise>430323</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormOMBNoText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">OMB No. 1545-0029</xsl:when>
			<xsl:otherwise>OMB No. 1545-0029</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormDetailsText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'"> Go to </xsl:when>
			<xsl:otherwise>&lt;br/&gt;Visite </xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PrintTypeText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="font-weight:bold;font-size:10pt;width:100%;padding-top:12mm;text-align:center;"&gt;Type&lt;br/&gt;or&lt;br/&gt;Print&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="font-weight:bold;font-size:10pt;width:100%;padding-top:11mm;text-align:center;"&gt;Escriba a&lt;br/&gt;
				M&amp;#225;quina&lt;br/&gt; o en Letra de&lt;br/&gt; Molde&lt;/span&gt;			  
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PrintTypeHeight">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">39mm</xsl:when>
			<xsl:otherwise>39mm</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PrintTypePadding">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">9</xsl:when>
			<xsl:otherwise>2</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="NameText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Name (as distinguished from trade name)</xsl:when>
			<xsl:otherwise>Nombre (el nombre legal del negocio, no el nombre comercial)</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="CalendarYearText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Calendar year</xsl:when>
			<xsl:otherwise>A&amp;#241;o natural</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="TradeNameText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Trade name, if any</xsl:when>
			<xsl:otherwise>Nombre comercial, si existe</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="EINText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Employer identification number (EIN)</xsl:when>
			<xsl:otherwise>N&amp;#250;mero de identificaci&amp;#243;n del &lt;br/&gt;empleador &lt;i&gt;(EIN)&lt;/i&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="AddressText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Address (number and street)</xsl:when>
			<xsl:otherwise>Direcci&amp;#243;n (calle y n&amp;#250;mero)</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="CityStateZipText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">City or town, state or province, country, and ZIP or foreign postal code</xsl:when>
			<xsl:otherwise>Ciudad o pueblo, estado o provincia, país y código postal &lt;i&gt;(ZIP)&lt;/i&gt; o c&amp;#243;digo postal extranjero&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="AddressDifferentText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">If address is different from prior return, check here.</xsl:when>
			<xsl:otherwise>Si su dirección no es la misma que apareció en su declaración anterior, marque este recuadro</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line1Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Number of agricultural employees employed in the pay period that includes March 12, 2024</xsl:when>
			<xsl:otherwise>Número de empleados agropecuarios durante el período de nómina que incluye el 12 de marzo de 2024</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SSRateText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'"/>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line2Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Wages subject to social security tax&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Salarios sujetos al impuesto del Seguro Social&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line2aText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Qualified sick leave wages*&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Salarios de licencia por enfermedad calificados*&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line2bText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Qualified family leave wages*&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Salarios de licencia familiar calificados*&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line3Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Social security tax (multiple line 2 by 12.4% (0.124))&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Impuesto del Seguro Social (multiplique la l&amp;#237;nea &lt;b&gt;2&lt;/b&gt; por 12.4% (0.124))&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line3aText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Social security tax on qualified sick leave wages (multiply line 2a by 6.2% (0.062))&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Impuesto del Seguro Social por los salarios de licencia por enfermedad calificados (multiplique la l&amp;#237;nea &lt;b&gt;2a&lt;/b&gt;&lt;span style="float:left"&gt; por 6.2% (0.062))&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line3bText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Social security tax on qualified family leave wages (multiply line 2b by 6.2% (0.062))&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Impuesto del Seguro Social por los salarios de licencia familiar calificados (multiplique la l&amp;#237;nea &lt;b&gt;2b&lt;/b&gt; por 6.2%&lt;span style="float:left"&gt; (0.062))&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line4Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Wages subject to Medicare tax&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left;"&gt;Salarios sujetos al impuesto del &lt;i&gt;Medicare&lt;/i&gt;&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line5Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Medicare tax (multiply line 4 by 2.9% (0.029))&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Impuesto del &lt;i&gt;Medicare&lt;/i&gt; (multiplique la l&amp;#237;nea &lt;b&gt;4&lt;/b&gt; por el 2.9% (0.029))&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line6Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Wages subject to Additional Medicare Tax withholding&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Salarios sujetos a la retenci&amp;#243;n del Impuesto Adicional del &lt;i&gt;Medicare&lt;/i&gt;&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PrintSize">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">6</xsl:when>
			<xsl:otherwise>5</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PrintSpan">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">8</xsl:when>
			<xsl:otherwise>1</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PrintWidth">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">33</xsl:when>
			<xsl:otherwise>21</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line7Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Additional Medicare Tax withholding (multiply line 6 by 0.9% (0.009))&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Retenci&amp;#243;n del Impuesto Adicional del &lt;i&gt;Medicare&lt;/i&gt;
				 (multiplique la línea &lt;b&gt;6&lt;/b&gt; por el 0.9% (0.009))&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line8Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Federal income tax withheld&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;div style="float:left;"&gt;Impuesto federal sobre el ingreso retenido&lt;/div&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line9Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Total taxes before adjustments. Add lines 3, 5, 7, and 8&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Total de impuestos antes de los ajustes. Sume las l&amp;#237;neas &lt;b&gt;3&lt;/b&gt;, &lt;b&gt;5&lt;/b&gt;, &lt;b&gt;7&lt;/b&gt; y &lt;b&gt;8&lt;/b&gt;&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line10Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Current year&amp;#39;s adjustments&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Ajustes del a&amp;#241;o actual&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line11Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Total taxes after adjustments (line 9 as adjusted by line 10)&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Total de los impuestos despu&amp;#233;s de los ajustes (la l&amp;#237;nea &lt;b&gt;9&lt;/b&gt; seg&amp;#250;n ajustada por la l&amp;#237;nea &lt;b&gt;10&lt;/b&gt;)</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<!-- 8/1/17 New line 12 and 13, remove Line 13b shaded and reserved, and old line 12 is now line 14 (English only)-->
	<!-- 9/13/17 New lines 12-14 added in Spanish version -->
	<xsl:variable name="Line12aText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left;padding-right:1mm"&gt;Qualified small business payroll tax credit for increasing research activities. Attach Form 8974&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Cr&amp;#233;dito tributario sobre la n&amp;#243;mina de peque&amp;#241;os negocios calificados por aumentar las actividades &lt;br/&gt;&lt;span style="float:left"&gt;investigativas. Adjunte el Formulario 8974&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line12bText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left;padding-right:1mm"&gt;Nonrefundable portion of credit for qualified sick and family leave wages for leave taken before April 1, 2021&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left;padding-right:1mm"&gt;Porción no reembolsable del crédito por los salarios de licencia por enfermedad y familiar calificados por la licencia tomada antes del 1 de abril de 2021&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line12cText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left;padding-right:1mm"&gt;Reserved for future use&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left;padding-right:1mm"&gt;Reservada para uso futuro&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line12dText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Nonrefundable portion of credit for qualified sick and family leave wages for leave taken after March 31, 2021, &lt;span style="float:left;padding-right:1mm"&gt; and before October 1, 2021&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Porción no reembolsable del crédito por los salarios de licencia por enfermedad y familiar
calificados por la &lt;span style="float:left;padding-right:1mm"&gt;licencia tomada después del 31 de marzo de 2021 y antes del 1 de octubre de 2021&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line12eText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left;padding-right:1mm"&gt;Reserved for future use&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left;padding-right:1mm"&gt;Reservada para uso futuro&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line12fText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left;padding-right:1mm"&gt;Reserved for future use&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left;padding-right:1mm"&gt;Reservada para uso futuro&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line12gText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left;padding-right:1mm"&gt;Total nonrefundable credits. Add lines 12a, 12b, and 12d&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left;padding-right:1mm"&gt;Total de créditos no reembolsables. Sume las líneas  &lt;b&gt;12a, 12b&lt;/b&gt; y  &lt;b&gt;12d&lt;/b&gt;&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line13Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Total taxes after adjustments and nonrefundable credits. Subtract line 12 from line 11&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Total de los impuestos despu&amp;#233;s de  los ajustes y cr&amp;#233;ditos no reembolsables. Reste la l&amp;#237;nea &lt;b&gt;12g&lt;/b&gt; de la l&amp;#237;nea &lt;b&gt;11&lt;/b&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line14aText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Total deposits for 2024, including overpayment applied from a prior year and Form 943-X&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Total de dep&amp;#243;sitos hechos para 2024, incluyendo toda cantidad pagada en exceso aplicada de un a&amp;#241;o anterior&lt;br/&gt;&lt;span style="float:left"&gt;y del Formulario 943-X&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line14bText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Reserved for future use&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Reservada para uso futuro&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line14cText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Reserved for future use&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Reservada para uso futuro&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line14dText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Refundable portion of credit for qualified sick and family leave wages for leave taken before April 1, 2021&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Porción reembolsable del crédito por los salarios de licencia por enfermedad y familiar calificados por la licencia &lt;span style="float:left"&gt;tomada antes del 1 de abril de 2021&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line14eText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Reserved for future use&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Reservada para uso futuro&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line14fText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Refundable portion of credit for qualified sick and family leave wages for leave taken after March 31, 2021, &lt;span style="float:left"&gt; and before October 1, 2021&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Porción reembolsable del crédito por los salarios de licencia por enfermedad y familiar calificados
por la licencia &lt;span style="float:left"&gt;tomada después del 31 de marzo de 2021 y antes del 1 de octubre de 2021&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line14gText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Reserved for future use&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Reservada para uso futuro&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line14hText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Total deposits and refundable credits. Add lines 14a, 14d, and 14f&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Total de depósitos y créditos reembolsables. Sume las líneas &lt;b&gt;14a, 14d&lt;/b&gt; y  &lt;b&gt;14f&lt;/b&gt;&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line14iText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Reserved for future use&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Reservada para uso futuro&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line14jText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Reserved for future use&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Reservada para uso futuro&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line15Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;&lt;b&gt;Balance due.&lt;/b&gt; If line 13 is more than line 14, enter the difference and see the instructions&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;b&gt;Saldo adeudado.&lt;/b&gt; Si la l&amp;#237;nea &lt;b&gt;13&lt;/b&gt; es mayor que la l&amp;#237;nea &lt;b&gt;14&lt;/b&gt;, anote la diferencia y vea las instrucciones</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Page2Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Page 2&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Página 2&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="AllFilersText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;b&gt;All filers:&lt;/b&gt; If line 13 is less than $2,500, &lt;b&gt;don't&lt;/b&gt; complete line 17 or Form 943-A.
			</xsl:when>
			<xsl:otherwise>&lt;b&gt;Todos los declarantes:&lt;/b&gt; Si la l&amp;#237;nea &lt;b&gt;13&lt;/b&gt; es menos de $2,500, &lt;b&gt;no complete&lt;/b&gt; la l&amp;#237;nea &lt;b&gt;17 &lt;/b&gt;ni el Formulario 943-A.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SemiWeeklyText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;b&gt;Semiweekly schedule depositors:&lt;/b&gt; Complete Form 943-A and check here</xsl:when>
			<xsl:otherwise>&lt;b&gt;Depositantes de itinerario bisemanal:&lt;/b&gt; Complete el Formulario 943-A y marque aqu&amp;#237;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="MonthlyText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;b&gt;Monthly schedule depositors:&lt;/b&gt; Complete line 17 and check here</xsl:when>
			<xsl:otherwise>&lt;b&gt;Depositantes de itinerario mensual:&lt;/b&gt; Complete la l&amp;#237;nea &lt;b&gt;17&lt;/b&gt; y marque aqu&amp;#237;.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line17Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;b&gt;Monthly Summary of Federal Tax Liability.&lt;/b&gt; (&lt;b&gt;Don't&lt;/b&gt; complete if you were a semiweekly schedule depositor.)</xsl:when>
			<xsl:otherwise>&lt;b&gt;Registro Mensual de la Obligación Tributaria Federal.&lt;/b&gt; (&lt;b&gt;No lo complete&lt;/b&gt; si es depositante de itinerario bisemanal).</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="JanuaryText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;January&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Enero&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FebruaryText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;February&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Febrero&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="MarchText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;March&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Marzo&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="AprilText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;April&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Abril&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="MayText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;May&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Mayo&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="JuneText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;June&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Junio&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="JulyText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;July&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Julio&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="AugustText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;August&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Agosto&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SeptemberText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;September&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Septiembre&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="OctoberText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;October&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Octubre&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="NovemberText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;November&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Noviembre&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="DecemberText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;December&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Diciembre&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="MText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Total liability for&lt;br/&gt;year (add lines &lt;b&gt;A&lt;/b&gt;&lt;br/&gt;&lt;span style="float:left"&gt;through &lt;b&gt;L&lt;/b&gt;)&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Obligaci&amp;#243;n total para el a&amp;#241;o (sume las l&amp;#237;neas &lt;b&gt;A&lt;/b&gt; a &lt;b&gt;L&lt;/b&gt;)</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="TaxLiabilityMonthText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="padding-top:1.5mm;"&gt;Tax liability for month&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Obligaci&amp;#243;n tributaria&lt;br/&gt;para el mes</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line18Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Qualified health plan expenses allocable to qualified sick leave wages for leave taken before April 1, 2021&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Gastos calificados del plan de salud asignables a los salarios de licencia por enfermedad calificados por la &lt;span style="float:left"&gt;licencia tomada antes del 1 de abril de 2021&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line19Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Qualified health plan expenses allocable to qualified family leave wages for leave taken before April 1, 2021&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Gastos calificados del plan de salud asignables a los salarios de licencia familiar calificados por la licencia &lt;span style="float:left"&gt;tomada antes del 1 de abril de 2021&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line20Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Reserved for future use&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Reservada para uso futuro&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line21Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Reserved for future use&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Reservada para uso futuro&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Page3Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Page 3&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Página 3&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line22Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Qualified sick leave wages for leave taken after March 31, 2021, and before October 1, 2021&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Salarios de licencia por enfermedad calificados por la licencia tomada después del 31 de marzo de 2021 y antes &lt;span style="float:left"&gt;del 1 de octubre de 2021&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line23Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Qualified health plan expenses allocable to qualified sick leave wages reported on line 22&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Gastos calificados del plan de salud asignables a los salarios de licencia por enfermedad calificados declarados&lt;span style="float:left"&gt; en la línea &lt;b&gt;22&lt;/b&gt;&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line24Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Amounts under certain collectively bargained agreements allocable to qualified sick leave wages reported &lt;span style="float:left"&gt;on line 22&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Cantidades de ciertos acuerdos de negociación colectiva asignables a los salarios de licencia por
enfermedad &lt;span style="float:left"&gt;calificados declarados en la línea &lt;b&gt;22&lt;/b&gt; &lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line25Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Qualified family leave wages for leave taken after March 31, 2021, and before October 1, 2021&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Salarios de licencia familiar calificados por la licencia tomada después del 31 de marzo de 2021 y antes del 1 de &lt;span style="float:left"&gt;octubre de 2021&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line26Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Qualified health plan expenses allocable to qualified family leave wages reported on line &lt;span style="float:left"&gt;25&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Gastos calificados del plan de salud asignables a los salarios de licencia familiar calificados declarados en la línea &lt;span style="float:left"&gt;&lt;b&gt;25&lt;/b&gt;&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line27Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Amounts under certain collectively bargained agreements allocable to qualified family leave wages reported &lt;span style="float:left"&gt;on line 25&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Cantidades de ciertos acuerdos de negociación colectiva asignables a los salarios de licencia
familiar calificados  &lt;span style="float:left"&gt;declarados en la línea &lt;b&gt;25&lt;/b&gt;&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line28Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Reserved for future use&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Reservada para uso futuro&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line29Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Reserved for future use&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Reservada para uso futuro&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="DesigneeText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Third-&lt;br/&gt;Party&lt;br/&gt;Designee</xsl:when>
			<xsl:otherwise>&lt;span style="font-size:9pt;text-align:center;width:100%"&gt;Tercero&lt;br/&gt;Autorizado&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="DiscussText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Do you want to allow another person to discuss this return with the IRS? See separate instructions.</xsl:when>
			<xsl:otherwise>&amp;#191;Desea permitir que otra persona hable sobre esta declaración con el &lt;i&gt;IRS&lt;/i&gt;? Vea las instrucciones.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="YesText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Yes. Complete the following.</xsl:when>
			<xsl:otherwise>&lt;b&gt;S&amp;#237;.&lt;/b&gt; Complete lo siguiente.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="DesigneeNameText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Designee&amp;#39;s&lt;br/&gt;name</xsl:when>
			<xsl:otherwise>Nombre de esta&lt;br/&gt;persona</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="DesigneePhoneText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Phone&lt;br/&gt;no.</xsl:when>
			<xsl:otherwise>N&amp;#250;mero de&lt;br/&gt;tel&amp;#233;fono</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PINText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Personal identification&lt;br/&gt;number (PIN)</xsl:when>
			<xsl:otherwise>N&amp;#250;mero de &lt;br/&gt;identificaci&amp;#243;n&lt;br/&gt;personal &lt;i&gt;(PIN)&lt;/i&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SignHereText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Sign&lt;br/&gt;Here</xsl:when>
			<xsl:otherwise>&lt;span style="font-size:9pt;text-align:center;width:100%;padding-top:5mm;"&gt;Firme&lt;br/&gt;Aqu&amp;#237;&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SignHere1Padding">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">3</xsl:when>
			<xsl:otherwise>2</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SignHere2Padding">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">1</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PenaltiesText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements,
				 and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which
				 preparer has any knowledge.</xsl:when>
			<xsl:otherwise>Bajo pena de perjurio, declaro que he examinado esta declaración, incluyendo todos los anexos y declaraciones adjuntos, y que, a mi leal saber y entender, 
				 es ver&amp;#237;dica, correcta y completa. La declaraci&amp;#243;n del preparador (que no sea el contribuyente) est&amp;#225; basada en toda informaci&amp;#243;n de
				 la cual el preparador tenga conocimiento.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SignatureText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Signature</xsl:when>
			<xsl:otherwise>Firma</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PrintText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Print Your&lt;br/&gt;Name and Title</xsl:when>
			<xsl:otherwise>Escriba su nombre y cargo en letra de molde</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="DateText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Date</xsl:when>
			<xsl:otherwise>Fecha</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'"/>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PaidPreparerText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Paid&lt;br/&gt;Preparer&lt;br/&gt;Use Only</xsl:when>
			<xsl:otherwise>&lt;span style="font-size:8pt;line-height:100%;text-align:left"&gt;Para Uso&lt;br/&gt;Exclusivo&lt;br/&gt;del&lt;br/&gt;Preparador&lt;br/&gt;Remunerado&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PreparerNameText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Print/Type preparer&apos;s name</xsl:when>
			<xsl:otherwise>Escriba a máquina o con letra de molde el nombre del preparador</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PreparerSignatureText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Preparer&apos;s signature</xsl:when>
			<xsl:otherwise>Firma del preparador</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="CheckText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Check</xsl:when>
			<xsl:otherwise>Marque aqu&amp;#237;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SelfEmployedText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">if self-employed</xsl:when>
			<xsl:otherwise>si trabaja por cuenta propia</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FirmNameText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Firm&apos;s name</xsl:when>
			<xsl:otherwise>&lt;b&gt;Nombre de la empresa&lt;/b&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FirmEINText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Firm&apos;s EIN</xsl:when>
			<xsl:otherwise>&lt;b&gt;&lt;i&gt;EIN&lt;/i&gt; de la empresa&lt;/b&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FirmAddressText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Firm&apos;s address</xsl:when>
			<xsl:otherwise>&lt;b&gt;Direcci&amp;#243;n de la empresa&lt;/b&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FirmPhoneText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Phone no.</xsl:when>
			<xsl:otherwise>&lt;b&gt;N&amp;#250;m. de tel&amp;#233;fono&lt;/b&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PrivacyText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">For Privacy Act and Paperwork Reduction Act Notice, see the separate instructions.</xsl:when>
			<xsl:otherwise>Para el Aviso sobre la Ley de Confidencialidad de Informaci&amp;#243;n y la Ley de&lt;br/&gt; Reducci&amp;#243;n de Tr&amp;#225;mites, vea las instrucciones.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="CatNoText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Cat. No. 11252K</xsl:when>
			<xsl:otherwise>Cat. No. 93519Q</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormNoText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">943</xsl:when>
			<xsl:otherwise>943 (sp)</xsl:otherwise>
		</xsl:choose>
		<!--<xsl:choose>
			<xsl:when test="$SubType='943' and $Language='ENGLISH'">943</xsl:when>
			<xsl:when test="$SubType='943PR' and $Language='ENGLISH'">&lt;span style="font-size:7pt;"&gt;943-PR (Eng)&lt;/span&gt;</xsl:when>
			<xsl:when test="$SubType='943' and $Language='SPANISH'">943</xsl:when>
			<xsl:when test="$SubType='943PR' and $Language='SPANISH'">&lt;span style="font-size:7pt;"&gt;943-PR&lt;/span&gt;</xsl:when>
		</xsl:choose>-->
	</xsl:variable>
	<xsl:variable name="SpanishOff">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">1</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SpanishPageBreakAfter">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'"/>
			<xsl:otherwise>page-break-after:always;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<!--10/17/2014 AM: Insert English page break to fix flow of PDFs. -->
	<xsl:variable name="EnglishPageBreakAfter">
		<xsl:choose>
			<xsl:when test="$Language='SPANISH'"/>
			<xsl:otherwise>page-break-after:always;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="{$HtmlLang}">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)">
					</xsl:with-param>
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
				<meta name="Description" content="{$MetaContent}"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS943Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form943">
					<span style="font-family:arial;">
						<xsl:call-template name="DocumentHeader"/>
					</span>
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;float:none;clear:both;">
						<!-- Begin Form Number and push pin -->
						<div class="styFNBox" style="width:29mm;height:18mm;">
							<xsl:value-of select="$FormText"/>
							<span class="styFormNumber">
								<xsl:value-of disable-output-escaping="yes" select="$FormTitleText"/>
							</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<!-- To make sure 2 line "Department of .. and IRS" displays at bottom - Blank form or with data -->
							<xsl:choose>
								<xsl:when test="($FormData/@referenceDocumentId) and not($FormData/@referenceDocumentId='')">
									<div class="styAgency" style="font-size:7.5pt;vertical-align:bottom;">Department of the Treasury<br/>Internal Revenue Service
									</div>
								</xsl:when>
								<xsl:otherwise>
									<div class="styAgency" style="font-size:7.5pt;vertical-align:bottom;padding-top:3.5mm;">Department of the Treasury<br/>Internal Revenue Service
									</div>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<!-- Begin Form Title and webpage link -->
						<div class="styFTBox" style="width:128mm;height:18mm; ">
							<div class="styMainTitle">
								<xsl:value-of disable-output-escaping="yes" select="$FormNameText"/>
							</div>
							<div class="styFBT" style="margin-top:1mm;font-size:6.5pt;width:128mm;">
<!--								<xsl:if test="$Language='ENGLISH'">
									<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
								</xsl:if>-->
								<xsl:value-of disable-output-escaping="yes" select="$FormDetailsText"/>
								<xsl:if test="$Language='ENGLISH'">
									<a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form943" title="Link to IRS.gov">
										<i>www.irs.gov/Form943</i> for instructions and the latest information.</a>
								</xsl:if>
								<xsl:if test="$Language='SPANISH'">
									<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form943pr" title="Link to IRS.gov">
										<i>www.irs.gov/Form943SP</i> para obtener las instrucciones y la infomación más reciente.</a>
								</xsl:if>
							</div>
						</div>
						<!-- Begin Form Number and OMB No -->
						<div class="styTYBox" style="width:30mm;height:18mm;">
							<div style="font-size:12pt;font-family:Courier New;font-weight:bold;text-align:right;float:right">
								<xsl:value-of disable-output-escaping="yes" select="$FormUpperRightNumber"/>
							</div>
							<div class="styOMB" style="height:3.75mm;">
								<xsl:value-of select="$FormOMBNoText"/>
							</div>
							<xsl:if test="$Language='ENGLISH'">
								<div class="styTY">20<span class="styTYColor">24</span>
								</div>
							</xsl:if>
							<xsl:if test="$Language='SPANISH'">
								<div class="styTY" style="padding-top:1mm;">20<span class="styTYColor">24</span>
								</div>
							</xsl:if>
						</div>
					</div>
					<!-- Begin Type Print/Name/EIN/Trade Name/Address -->
					<div class="styBB" style="width:187mm;float:none;clear:both;">
						<div class="styFNBox" style="width:29mm;height:44mm;">
							<b>
								<xsl:value-of disable-output-escaping="yes" select="$PrintTypeText"/>
							</b>
						</div>
						<div class="styFNBox" style="width:128mm;border-left:0px solid black;border-right:0px solid black;">
							<div class="styGenericDiv" style="width:128mm;border-bottom:1px solid black;">
								<div class="styGenericDiv" style="width:75mm;height:13.5mm;padding-left:2mm;padding-right:1mm;border-right:1px solid black;font-size:6pt">
									<xsl:value-of disable-output-escaping="yes" select="$NameText"/>
									<br/>
									<div style="font-size:6pt;">
										<xsl:if test="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styGenericDiv" style="width:53mm;padding-left:2mm;">
									<xsl:value-of disable-output-escaping="yes" select="$EINText"/>
									<div style="font-size:6pt;">
										<xsl:if test="$Language='ENGLISH'">
											<span style="width:51mm;height:6mm;"/>	
										</xsl:if>
										<xsl:if test="$Language='SPANISH'">
											<span style="width:51mm;height:4mm;"/>									
										</xsl:if>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
											<xsl:with-param name="EINChanged">true</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<div class="styGenericDiv" style="width:128mm;height:8,5mm;border-bottom:1px solid black;padding-left:2mm;">
								<xsl:value-of select="$TradeNameText"/>
								<br/>
								<div style="font-size:6pt;">
									<xsl:if test="$RtnHdrData/Filer/TradeName/BusinessNameLine1Txt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine1Txt"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/Filer/TradeName/BusinessNameLine2Txt">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div class="styGenericDiv" style="width:128mm;height:8,5mm;padding-left:2mm;">
								<xsl:value-of disable-output-escaping="yes" select="$AddressText"/>
								<br/>
								<div style="font-size:6pt;">
									<xsl:if test="$RtnHdrData/Filer/USAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div class="styGenericDiv" style="width:128mm;height:8.5mm;padding-left:2mm;border-top:1px solid black;">
								<xsl:value-of disable-output-escaping="yes" select="$CityStateZipText"/>
								<br/>
								<div style="font-size:6pt;">
									<xsl:if test="$RtnHdrData/Filer/USAddress">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
										</xsl:call-template>
										<span style="width:2px;"/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<!-- BEGIN LINE FUTURE RETURNS ENGLISH -->
							<xsl:if test="$Language='ENGLISH'">
								<div class="styGenericDiv" style="width:158mm;height:5mm;padding-left:2mm;border-top:1px solid black;">
									<span style="float:left;padding-top:1.5mm;">If you don't have to file returns in the future, check here </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:left;padding-left:4mm;padding-top:1mm;">...................</span>
									<!--<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>-->
									<input type="checkbox" class="styCkbox" alt="Future Filing Not Required Indicator">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/FutureFilingNotRequiredInd"/>
											<xsl:with-param name="BackupName">IRS943FutureFilingNotRequiredInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/FutureFilingNotRequiredInd"/>
											<xsl:with-param name="BackupName">IRS943FutureFilingNotRequiredInd</xsl:with-param>
										</xsl:call-template>
									</label>
								</div>
							</xsl:if>
							<!-- END LINE FUTRE RETURNS ENGLISH -->
							<!-- BEGIN LINE FUTURE RETURNS SPANISH -->
							<xsl:if test="$Language='SPANISH'">
										<div class="styGenericDiv" style="width:158mm;height:5mm;padding-left:2mm;border-top:1px solid black;">
										<span style="float:left;padding-top:1mm;">Si no tien que presentar esta declaración en el futuro, marque este recuadro</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:left;padding-left:1mm;padding-top:1mm;">.............</span>
										<input type="checkbox" class="styCkbox" alt="Futuro Indicador Filing No requerido" style="float:right;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/FutureFilingNotRequiredInd"/>
												<xsl:with-param name="BackupName">IRS943FutureFilingNotRequiredInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/FutureFilingNotRequiredInd"/>
												<xsl:with-param name="BackupName">IRS943FutureFilingNotRequiredInd</xsl:with-param>
											</xsl:call-template>
										</label>
										<!--<img style="float:right;padding-top:.8mm;padding-right:.5mm;" src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>-->
								</div>
							</xsl:if>
							<!-- END LINE FUTRE RETURNS SPANISH -->
						</div>
						<div class="styFNBox" style="border-right:0px solid black;border-left:1px solid black;width:30mm;padding-left:2mm;height:{$PrintTypeHeight};padding-top:10mm;">
							<span class="styBoldText">
								<xsl:value-of disable-output-escaping="yes" select="$AddressDifferentText"/>
								<!--<img style="padding-left:1mm;padding-right:2mm;" src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>-->
								<xsl:if test="$Language='ENGLISH'">
									<input type="checkbox" class="styCkbox" alt="Different prior address indicator">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PriorAddressInd"/>
											<xsl:with-param name="BackupName">IRS943PriorAddressInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</xsl:if>
								<xsl:if test="$Language='SPANISH'">
									<!--<span class="styDotLn">.</span>-->
									<span style="width:3mm;"/>
									<input type="checkbox" class="styCkbox" alt="Indicador de dirección antes Diferente">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PriorAddressInd"/>
											<xsl:with-param name="BackupName">IRS943PriorAddressInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</xsl:if>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PriorAddressInd"/>
										<xsl:with-param name="BackupName">IRS943PriorAddressInd</xsl:with-param>
									</xsl:call-template>
								</label>
							</span>
						</div>
					</div>

					<!-- BEGIN LINE 1 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBoxSD" style="border-bottom:1px solid black;">1</div>
						<div class="styLNDesc" style="width:140.8mm;border-bottom:1px solid black;">
							<xsl:value-of disable-output-escaping="yes" select="$Line1Text"/>
							<span style="float:right;">
								<xsl:choose>
									<xsl:when test="$Language='ENGLISH'">
										<span class="styDotLn">......</span>
										<!--<img style="float:right;padding-right:1.5mm;padding-top:.5mm;" src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>-->
									</xsl:when>
									<xsl:otherwise>
										<span class="styDotLn">..</span>
										<!--<img style="float:right;padding-right:3.0mm;padding-top:.5mm;" src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>-->
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox" style="width:30mm;font-size:6pt;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/EmployeeCnt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 1 -->
					<!--BEGIN LINE SS Tax Rate was removed to save space on form output- DRB 10/2015-->
					<!-- BEGIN LINE SS Tax Rate -->
					<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc" style="width:140.8mm;border-bottom:0px solid black;">
							<span style="float:left;font-weight:bold;">
								<xsl:value-of disable-output-escaping="yes" select="$SSRateText"/>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;border-top-width:0px;"/>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px; border-top-width:0px;"/>
					</div>-->
					<!-- END LINE SS Tax Rate -->
					<div class="styBB" style="width:187mm;float:none;clear:both;border-bottom-width:0px;">
						<div class="styFNBox" style="width:157mm;">
						<!-- BEGIN LINE 2 -->
						<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="styLNDesc" style="width:102.8mm;">
								<xsl:value-of disable-output-escaping="yes" select="$Line2Text"/>
								<xsl:choose>
									<xsl:when test="$Language='ENGLISH'">
										<span class="styDotLn" style="padding-right:2mm;float:right;">............</span>
									</xsl:when>
									<xsl:otherwise>
										<span class="styDotLn" style="float:right;padding-right:3mm;">........</span>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="styLNRightNumBox">2</div>
							<div class="styLNAmountBox" style="font-size:6pt;width:30mm;padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTaxCashWagesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;border-top-width:0px;"/>
							<div class="styLNAmountBox" style="border-bottom-width:0px; border-top-width:0px;width:30mm;"/>
						</div>
						<!-- END LINE 2 -->
						
						<!-- BEGIN LINE 2a -->
<!--						<div class="styLNLeftNumBoxSD" style="text-align:center;">a</div>
						<div class="styLNDesc" style="width:102.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line2aText"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="padding-right:2mm;float:right;">................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:3mm;">.........</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styLNRightNumBox">2a</div>
						<div class="styLNAmountBox" style="width:30mm;font-size:6pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityQlfyPdSLWageAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;border-top-width:0px;width:7.9mm;"/>
-->						<!-- END LINE 2a -->
						
						<!-- BEGIN LINE 2b -->
<!--						<div class="styLNLeftNumBoxSD" style="text-align:center;">b</div>
						<div class="styLNDesc" style="width:102.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line2bText"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="padding-right:2mm;float:right;">...............</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:3mm;">............</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styLNRightNumBox">2b</div>
						<div class="styLNAmountBox" style="width:30mm;font-size:6pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityQlfyPdFMLWageAmt"/>
								</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;border-top-width:0px;width:7.9mm;"/>

						<xsl:if test="$Language='ENGLISH'">
							<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:1px;border-top-width:0px;width:8mm;height:6.5mm;float:right"/>
						</xsl:if>
						<xsl:if test="$Language='SPANISH'">
							<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:1px;border-top-width:0px;width:8mm;height:15mm;float:right;"/>
						</xsl:if>
-->						<!-- END LINE 2b -->
					</div>		
<!--						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styFNBox" style="border-right:0px solid black;border-bottom-width:1px;width:30mm;height:18.5mm;padding-left:1mm;padding-top:0mm;font-size:6px;">
								*Include taxable qualified sick and family leave wages paid in 2024 for leave taken after March 31, 2021, and before October 1, 2021, on line 2. Use lines 2a and 2b <b>only</b> for taxable qualified sick and family leave wages paid in 2024 for leave taken after March 31, 2020, and before April 1, 2021.
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styFNBox" style="border-right:0px solid black;border-bottom-width:1px;height:27mm;width:30mm;padding-left:1mm;padding-top:0mm;font-size:6px;">
								*Incluya en línea <b>2</b> los salarios sujetos al impuesto de licencia por enfermedad y familiar calificados pagados en 2023 por la licencia tomada después del 31 de marzo de 2021 y antes del 1 de octubre de 2021. Use las líneas <b>2a</b> y <b>2b sólo</b> para los salarios sujetos al impuesto de la licencia por enfermedad y familiar calificados pagados en 2023 por la licencia tomada después del 31 de marzo de 2020 y antes del 1 de abril de 2021.
								</div>	
							</xsl:otherwise>
						</xsl:choose>
-->					</div>	
					
					<!-- BEGIN LINE 3 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line3Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">..................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox" style="width:30mm;font-size:6pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 3 -->
					<!-- BEGIN LINE 3a -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBoxSD" style="text-align:center;">a</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line3aText"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">........</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>3a
								</div>
								<div class="styLNAmountBox" style="width:30mm;">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityQlfyPdSLTaxAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox" style="height:7.5mm;">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>3a
								</div>
								<div class="styLNAmountBox" style="height:7.5mm;width:30mm;">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityQlfyPdSLTaxAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:otherwise>
						</xsl:choose>
						--><!--<div class="styLNRightNumBox">3a</div>
						<div class="styLNAmountBox" style="width:30mm;font-size:6pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityQlfyPdSLTaxAmt"/>
							</xsl:call-template>
						</div>--><!--
					</div>
-->					<!-- END LINE 3a -->
					<!-- BEGIN LINE 3b -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBoxSD" style="text-align:center;">b</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line3bText"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">........</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">...............................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>3b
								</div>
								<div class="styLNAmountBox" style="width:30mm;">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityQlfyPdFMLTaxAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox" style="height:7.5mm;">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>3b
								</div>
								<div class="styLNAmountBox" style="height:7.5mm;width:30mm;">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityQlfyPdFMLTaxAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:otherwise>
						</xsl:choose>
						--><!--<div class="styLNRightNumBox">3b</div>
						<div class="styLNAmountBox" style="width:30mm;font-size:6pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityQlfyPdFMLTaxAmt"/>
							</xsl:call-template>
						</div>--><!--
					</div>
-->					<!-- END LINE 3b -->
					<!-- BEGIN LINE 4 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:102.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line4Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="padding-right:2mm;float:right;">..............</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:3mm;">..........</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox" style="font-size:6pt;width:30mm;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MedicareTaxCashWagesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;border-top-width:0px;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px; border-top-width:0px;width:30mm;"/>
					</div>
					<!-- END LINE 4 -->
					<!-- BEGIN LINE 5 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line5Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">....................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox" style="font-size:6pt;width:30mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MedicareTaxWithheldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 5 -->
					<!-- BEGIN LINE 6 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:102.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line6Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;padding-right:2mm;">.......</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox" style="font-size:6pt;width:30mm;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotMedcrTaxCashWagesAddnlWhAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;border-top-width:0px;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px; border-top-width:0px;width:30mm;"/>
					</div>
					<!-- END LINE 6 -->
					<!-- BEGIN LINE 7 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line7Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">.............</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styLNRightNumBox">7</div>
						<div class="styLNAmountBox" style="font-size:6pt;width:30mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AddnlMedicareTaxWithholdingAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 7 -->
					<!-- BEGIN LINE 8 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line8Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">..........................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox">8</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox">8</div>
							</xsl:otherwise>
						</xsl:choose>
						<div class="styLNAmountBox" style="font-size:6pt;width:30mm;">
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- END LINE 8 -->
					<!-- BEGIN LINE 9 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line9Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox" style="font-size:6pt;width:30mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxBeforeAdjustmentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 9 -->
					<!-- BEGIN LINE 10 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line10Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">..........................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox" style="font-size:6pt;width:30mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CurrentYearAdjustmentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 10 -->
					<!-- BEGIN LINE 11 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line11Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox" style="font-size:6pt;width:30mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAfterAdjustmentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 11 -->
					<!-- 8/1/17 New line 12 and 13, remove Line 13b shaded and reserved, and old line 12 is now line 14 (English only)-->
					<!-- 9/13/17 New lines 12-14 added in Spanish version -->
					<!-- BEGIN LINE 12 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line12aText"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PayrollTaxCreditAmt"/>
							</xsl:call-template>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">....</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>12
								</div>
								<div class="styLNAmountBox" style="width:30mm;">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PayrollTaxCreditAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox" style="height:6.5mm;">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>12
								</div>
								<div class="styLNAmountBox" style="height:6.5mm;width:30mm;">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PayrollTaxCreditAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<!-- END LINE 12 -->
					<!-- BEGIN LINE 12b -->
<!--					<xsl:choose>
						<xsl:when test="$Language='ENGLISH'">
							<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;height:auto">
								<div class="styLNLeftNumBox" style="text-align:center;padding-left:2mm">b</div>
								<div class="styLNDesc" style="width:140.8mm;">
									<xsl:value-of disable-output-escaping="yes" select="$Line12bText"/>
									<span class="styDotLn" style="float:right;">.</span>
								</div>
								<div class="styLNRightNumBox">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>12b
								</div>
								<div class="styLNAmountBox" style="width:30mm;">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NrfdblCrQlfySLFMLWagesAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</div>						
						</xsl:when>
						<xsl:otherwise>
							<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;height:7mm">
								<div class="styLNLeftNumBox" style="text-align:center;padding-left:2mm">b</div>
								<div class="styLNDesc" style="width:140.8mm;">
									<xsl:value-of disable-output-escaping="yes" select="$Line12bText"/>
--><!--									<span class="styDotLn" style="float:right;">.</span>--><!--
								</div>
								<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">
									--><!--<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>--><!--12b
								</div>
								<div class="styLNAmountBox" style="width:30mm;height:7mm;padding-top:3.5mm;">
									--><!--<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>--><!--
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NrfdblCrQlfySLFMLWagesAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</div>				
						</xsl:otherwise>
					</xsl:choose>-->
					<!-- END LINE 12b -->
					<!-- BEGIN LINE 12c -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="text-align:center;padding-left:2mm">c</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line12cText"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">...........................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>12c
								</div>
								<div class="styLNAmountBox" style="width:30mm;background-color:lightgrey">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										--><!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NrfdblEmplRtntnCrCOVIDAmt"/>
										</xsl:call-template>--><!--
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox">12c</div>
								<div class="styLNAmountBox" style="font-size:6pt;width:30mm;background-color:lightgrey">
									--><!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NrfdblEmplRtntnCrCOVIDAmt"/>
									</xsl:call-template>--><!--
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>-->
					<!-- END LINE 12c -->
					<!-- BEGIN LINE 12d -->
<!--					<div class="styBB" style="width:187mm;height:7mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="text-align:center;padding-left:2mm">d</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line12dText"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">.........................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>12d
								</div>
								<div class="styLNAmountBox" style="width:30mm;height:7mm;padding-top:3mm">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NrfdblCrQlfySLFMLWagesAftrAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm">12d</div>
								<div class="styLNAmountBox" style="font-size:6pt;width:30mm;height:7mm;padding-top:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NrfdblCrQlfySLFMLWagesAftrAmt"/>
									</xsl:call-template>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>-->
					<!-- END LINE 12d -->
					<!-- BEGIN LINE 12e -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="text-align:center;padding-left:2mm">e</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line12eText"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">...........................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;">..........................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>12e
								</div>
								<div class="styLNAmountBox" style="width:30mm;background-color:lightgrey">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NrfdblCOBRAPremiumSubsidyAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox">12e</div>
								<div class="styLNAmountBox" style="width:30mm;background-color:lightgrey">									
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NrfdblCOBRAPremiumSubsidyAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>-->
					<!-- END LINE 12e -->
					<!-- BEGIN LINE 12f -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="text-align:center;padding-left:2mm">f</div>
						<div class="styLNDesc" style="width:102.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line12fText"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;padding-right:2mm;">.................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:2mm;">................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox">12f</div>
								<div class="styLNAmountBox" style="font-size:6pt;width:30mm;padding-right:.5mm;background-color:lightgrey">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/COBRAPremiumSubsidyRcpntCnt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;border-top-width:0px;"/>
								<div class="styLNAmountBox" style="border-bottom-width:0px; border-top-width:0px;width:30mm;"/>
							</xsl:when>
							<xsl:otherwise>
--><!--								<div class="styLNRightNumBox"></div>--><!--
								<div class="styLNAmountBox" style="font-size:6pt;width:38mm;padding-right:.5mm;background-color:lightgrey">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/COBRAPremiumSubsidyRcpntCnt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;border-top-width:0px;"/>
								<div class="styLNAmountBox" style="border-bottom-width:0px; border-top-width:0px;width:30mm;"/>
							</xsl:otherwise>
						</xsl:choose>
					</div>-->
					<!-- END LINE 12f -->
					<!-- BEGIN LINE 12g -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="text-align:center;padding-left:2mm">g</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line12gText"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">...............</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;">......</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>12g
								</div>
								<div class="styLNAmountBox" style="width:30mm;">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalNonrefundableCreditsAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox">12g</div>
								<div class="styLNAmountBox" style="width:30mm;">
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalNonrefundableCreditsAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>-->
					<!-- END LINE 12g -->
					<!-- BEGIN LINE 13 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line13Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">........</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styLNRightNumBox">13</div>
						<div class="styLNAmountBox" style="font-size:6pt;width:30mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 13 -->
					<!-- Message -->
<!--					<div class="styBB" style="width:187mm;font-size:8pt;border-bottom-width:2px;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:8mm;"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<div class="styLNDesc" style="width:130mm;padding-left:28mm;font-weight:bold;">
										You MUST complete all three pages of Form 943 and SIGN it.
									</div>
								</xsl:when>
								<xsl:otherwise> 
									<div class="styLNDesc" style="width:140mm;padding-left:12mm;">
										--><!--<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>--><!--
										<b> TIENE que completar las tres páginas del Formulario 943 y luego FIRMARLO</b>.
									</div>
								</xsl:otherwise>
							</xsl:choose>
						</span>
						<span style="float:right;">
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<div style="width:30mm;text-align:right;padding-bottom:0mm;">
										<img src="{$ImagePath}/944_Next.gif" alt="Next Page Arrow Image"/>
									</div>
								</xsl:when>
								<xsl:otherwise>
--><!--									<div style="width:35mm;text-align:right;padding-bottom:0mm;">
										<img src="{$ImagePath}/941SSPR_NextES.GIF" alt="Pagina siguiente Flecha imagen"/>
									</div>--><!--
								</xsl:otherwise>
							</xsl:choose>
						</span>
					</div>
-->					<!-- End of Message -->
					<!-- Page Break and Footer-->
<!--					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="width:115mm;float:left;">
							<span class="styBoldText" style="font-size:6pt;">
								<xsl:value-of disable-output-escaping="yes" select="$PrivacyText"/>
							</span>
						</div>
						<div style="float:left;text-align:center;width:24mm;font-size:6pt;">
							<xsl:value-of disable-output-escaping="yes" select="$CatNoText"/>
						</div>
						<div style="float:right;">
							<span style="width:50px;"/>
							<xsl:if test="$Language='ENGLISH'">
								<xsl:value-of disable-output-escaping="yes" select="$FormText"/>
								<span class="styBoldText" style="font-size:6pt;">
									<xsl:value-of disable-output-escaping="yes" select="$FormNoText"/>
								</span> (2024)
							</xsl:if>
							<xsl:if test="$Language='SPANISH'">
								Form
								<span class="styBoldText" style="font-size:8pt;">
									943 (sp)
								</span> (2024)
							</xsl:if>
						</div>
					</div>
					<p style="page-break-before: always"/>-->
					<!-- END Page Break and Footer-->
					<!-- Page 2 Header-->
<!--					<div class="styBB" style="width:187mm;padding-top:1mm;">
						<div style="font-size:12pt;font-family:Courier New;font-weight:bold;text-align:right;float:right">
							<xsl:if test="$Language='ENGLISH'">
								<xsl:value-of disable-output-escaping="yes" select="$FormUpperRightNumber2"/>
							</xsl:if>
						</div><br/>
						<div style="width:170mm;float:left;padding-top:1mm">
							<xsl:value-of disable-output-escaping="yes" select="$FormText"/>
							<b>943</b> (2024)
						</div>
						<div style="float:right;">							
							<xsl:if test="$Language='ENGLISH'">
								<span class="styBoldText" style="font-size:6pt;">
									<xsl:value-of disable-output-escaping="yes" select="$Page2Text"/>
								</span>
							</xsl:if>
							<xsl:if test="$Language='SPANISH'">
								<span style="font-size:7pt;padding-top:1mm;">
									Página <b>2</b>
								</span>
							</xsl:if>
						</div>
					</div>
-->					<!-- END Page 2 Header-->
					<!-- BEGIN LINE 14a -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line14aText"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">......</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>14
								</div>
								<div class="styLNAmountBox" style="width:30mm;">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalTaxDepositAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox" style="height:6.5mm;">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>14
								</div>
								<div class="styLNAmountBox" style="height:6.5mm;width:30mm;">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalTaxDepositAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<!-- END LINE 14a -->
					<!-- BEGIN LINE 14b -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="text-align:center;padding-left:2mm">b</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line14bText"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">...........................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>14b
								</div>
								<div class="styLNAmountBox" style="width:30mm;background-color:lightgrey">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										--><!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DeferredPaymentEmplrShrSSTAmt"/>
										</xsl:call-template>--><!--
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox">14b</div>
								<div class="styLNAmountBox" style="font-size:6pt;width:30mm;background-color:lightgrey">
									--><!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/DeferredPaymentEmplrShrSSTAmt"/>
									</xsl:call-template>--><!--
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
-->					<!-- END LINE 14b -->
					<!-- BEGIN LINE 14c -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="text-align:center;padding-left:2mm">c</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line14cText"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">...........................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>14c
								</div>
								<div class="styLNAmountBox" style="width:30mm;background-color:lightgrey">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										--><!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DeferredPymtEmployeeShrSSTAmt"/>
										</xsl:call-template>--><!--
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox">14c</div>
								<div class="styLNAmountBox" style="width:30mm;background-color:lightgrey">
									<span style="font-size:6pt;">
										--><!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DeferredPymtEmployeeShrSSTAmt"/>
										</xsl:call-template>--><!--
									</span>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
-->					<!-- END LINE 14c -->
					<!-- BEGIN LINE 14d -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="text-align:center;padding-left:2mm">d</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line14dText"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">.</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>14d
								</div>
								<div class="styLNAmountBox" style="width:30mm;">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RfdblCrQlfySLFMLWagesAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm">14d</div>
								<div class="styLNAmountBox" style="font-size:6pt;width:30mm;height:7mm;padding-top:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RfdblCrQlfySLFMLWagesAmt"/>
									</xsl:call-template>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
-->					<!-- END LINE 14d -->
					<!-- BEGIN LINE 14e -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="text-align:center;padding-left:2mm">e</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line14eText"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">..........................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>14e
								</div>
								<div class="styLNAmountBox" style="width:30mm;background-color:lightgrey">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										--><!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RfdblEmplRtntnCrCOVIDAmt"/>
										</xsl:call-template>--><!--
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox">14e</div>
								<div class="styLNAmountBox" style="font-size:6pt;width:30mm;background-color:lightgrey">
									--><!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RfdblEmplRtntnCrCOVIDAmt"/>
									</xsl:call-template>--><!--
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
-->					<!-- END LINE 14e -->
					<!-- BEGIN LINE 14f -->
<!--					<div class="styBB" style="width:187mm;height:7mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="text-align:center;padding-left:2mm">f</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line14fText"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">..........................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;">..........</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>14f
								</div>
								<div class="styLNAmountBox" style="width:30mm;height:7mm;padding-top:3.5mm">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RfdblCrQlfySLFMLWagesAftrAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm">14f</div>
								<div class="styLNAmountBox" style="width:30mm;height:7mm;padding-top:3.5mm">
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RfdblCrQlfySLFMLWagesAftrAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
-->					<!-- END LINE 14f -->
					<!-- BEGIN LINE 14g -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="text-align:center;padding-left:2mm">g</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line14gText"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">...........................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;">..........................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>14g
								</div>
								<div class="styLNAmountBox" style="width:30mm;background-color:lightgrey">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RfdblCOBRAPremiumSubsidyAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox">14g</div>
								<div class="styLNAmountBox" style="width:30mm;background-color:lightgrey">
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RfdblCOBRAPremiumSubsidyAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
-->					<!-- END LINE 14g -->
					<!-- BEGIN LINE 14h -->
<!--						<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
							<div class="styLNLeftNumBox" style="text-align:center;padding-left:2mm">h</div>
							<div class="styLNDesc" style="width:140.8mm;">
								<xsl:value-of disable-output-escaping="yes" select="$Line14hText"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">.............</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;">..........</span>
								</xsl:otherwise>
							</xsl:choose>
							</div>--><!--
							<div class="styLNRightNumBox" style="background-color:plum">
								<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>14h
							</div>--><!--
							<div class="styLNRightNumBox">14h</div>
							<div class="styLNAmountBox" style="font-size:6pt;width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentRefundableCrAmt"/>
								</xsl:call-template>
							</div>
							--><!--<div class="styLNAmountBox" style="width:30mm;">
								<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
								<span style="font-size:6pt;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentRefundableCrAmt"/>
									</xsl:call-template>
								</span>
							</div>--><!--
						</div>
-->						<!-- END LINE 14h -->
						<!-- BEGIN LINE 14i -->
<!--						<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
							<div class="styLNLeftNumBox" style="text-align:center;padding-left:2mm">i</div>
							<div class="styLNDesc" style="width:140.8mm;">
								<xsl:value-of disable-output-escaping="yes" select="$Line14iText"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">...........................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;">..........................</span>
								</xsl:otherwise>
							</xsl:choose>
							</div>
							<div class="styLNRightNumBox">14i</div>
							<div class="styLNAmountBox" style="font-size:6pt;width:30mm;background-color:lightgrey">
								--><!--<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotAdvncPymtEmplrCrReqQtrAmt"/>
								</xsl:call-template>--><!--
							</div>
							--><!--<div class="styLNRightNumBox">
								<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>14i
							</div>
							<div class="styLNAmountBox" style="width:30mm;">
								<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
								<span style="font-size:6pt;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotAdvncPymtEmplrCrReqQtrAmt"/>
									</xsl:call-template>
								</span>
							</div>--><!--
						</div>
-->						<!-- END LINE 14i -->
						<!-- BEGIN LINE 14j -->
<!--						<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
							<div class="styLNLeftNumBox" style="text-align:center;padding-left:2mm">j</div>
							<div class="styLNDesc" style="width:140.8mm;">
								<xsl:value-of disable-output-escaping="yes" select="$Line14jText"/>
								<xsl:choose>
									<xsl:when test="$Language='ENGLISH'">
										<span class="styDotLn" style="float:right;">...........................</span>
									</xsl:when>
									<xsl:otherwise>
										<span class="styDotLn" style="float:right;">..........................</span>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="styLNRightNumBox">14j</div>
							<div class="styLNAmountBox" style="font-size:6pt;width:30mm;background-color:lightgrey">
								--><!--<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetTotalPaymentRefundableCrAmt"/>
								</xsl:call-template>--><!--
							</div>
							--><!--<div class="styLNRightNumBox">
								<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>14j
							</div>
							<div class="styLNAmountBox" style="width:30mm;">
								<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
								<span style="font-size:6pt;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NetTotalPaymentRefundableCrAmt"/>
									</xsl:call-template>
								</span>
							</div>--><!--
						</div>
-->						<!-- END LINE 14j -->					
					<!-- END LINES 14h, 14i and 14j ENGLISH (Spanish version done in ENG also) -->				
					<!-- BEGIN LINE 15 SPANISH-->
					<xsl:if test="$Language='SPANISH'">
						<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
							<div class="styLNLeftNumBox">15</div>
							<div class="styLNDesc" style="width:140.8mm;">
								<xsl:value-of disable-output-escaping="yes" select="$Line15Text"/>
								<span style="float:right;">
									<span class="styDotLn">..</span>
<!--									<img style="float:right;padding-right:3.0mm;padding-top:.5mm;" src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>-->
								</span>
							</div>
							<div class="styLNRightNumBox">15</div>
							<div class="styLNAmountBox" style="font-size:6pt;width:30mm;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:if>
					<!-- END LINE 15 SPANISH -->					
					<!-- BEGIN LINE 16 SPANISH -->
					<xsl:if test="$Language='SPANISH'">
						<div class="styBB" style="width:187mm;padding-bottom:1mm;float:none;clear:both;border-bottom-width:1px">
							<div class="styLNLeftNumBox">16</div>
							<div class="styLNDesc" style="width:140.8mm;float:left;">
								<span style="float:left;">
									<b>Cantidad pagada en exceso.</b> Si la línea <b>14</b> es mayor que la línea <b>13</b>, anote la diferencia</span>
								<!--Dotted Line-->
<!--								<img style="float:right;padding-right:3.0mm;padding-top:.5mm;" src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>-->
								<span class="styDotLn" style="float:right;">.....</span>
							</div>
							<div class="styLNRightNumBox">16</div>
							<div class="styLNAmountBox" style="font-size:6pt;width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/OverpaidAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:187mm;font-size:6.5pt;padding-left:8mm;padding-top:0mm;padding-bottom:3.5mm;">
							<div class="styLNDesc" style="width:140.8mm;float:left;">
								<span style="padding-right:6mm;">Marque uno: </span>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
											<xsl:with-param name="BackupName">IRS943ApplyOverpaymentNextReturnInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
											<xsl:with-param name="BackupName">IRS943ApplyOverpaymentNextReturnInd</xsl:with-param>
										</xsl:call-template>
										<span style="width:2mm;"/>Aplíquese a la próxima declaración. <span style="width:6mm;"/>
									</label>
								</span>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
											<xsl:with-param name="BackupName">IRS943RefundOverpaymentInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
											<xsl:with-param name="BackupName">IRS943RefundOverpaymentInd</xsl:with-param>
										</xsl:call-template>
										<span style="width:2mm;"/>Envíe un reembolso.
									</label>
								</span>
							</div>
								<div class="styLNRightNumBox" style="background-color:lightgrey;height:5mm;border-bottom-width:0px"></div>
								<div class="styLNAmountBox" style="width:30mm;background-color:lightgrey;height:5mm;border-bottom-width:0px"></div>
							</div>
						</div>
					</xsl:if>
					<!-- END LINE 16 SPANISH -->
					<!-- BEGIN LINE 15 ENGLISH -->
					<xsl:if test="$Language='ENGLISH'">
						<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
							<div class="styLNLeftNumBox">15</div>
							<div class="styLNDesc" style="width:140.8mm;">
								<xsl:value-of disable-output-escaping="yes" select="$Line15Text"/>
									<span class="styDotLn">.......</span>
									<!--<img style="float:right;padding-right:1.5mm;padding-top:.5mm;" src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>		-->	
							</div>
							<div class="styLNRightNumBox">15</div>
							<div class="styLNAmountBox" style="font-size:6pt;width:30mm;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:if>
					<!-- END LINE 15 ENGLISH-->
					<!-- 9/11/2014 Line 16 font size 6pt which will not cause it to wrap -->
					<!-- BEGIN LINE 16 ENGLISH-->
					<xsl:if test="$Language='ENGLISH'">
						<div class="styBB" style="width:187mm;float:none;clear:both;">
							<div class="styLNLeftNumBox">16</div>
							<div class="styLNDesc" style="width:140.8mm;float:left;">
								<b>Overpayment.</b> If line 14 is more than line 13, enter the difference
								<span style="float:right">								
									<span class="styDotLn">.............</span> 
									<!--<img style="padding-right:1.5mm;padding-top:.5mm;" src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>-->
								</span>
							</div>							
							<div class="styLNRightNumBox">16</div>
							<div class="styLNAmountBox" style="font-size:6pt;width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/OverpaidAmt"/>
								</xsl:call-template>
							</div>
							<div class="styBB" style="width:187mm;height:5mm;float:none;clear:both;border-bottom-width:0px">
								<div class="styLNLeftNumBox"></div>
								<div class="styLNDesc" style="width:140.8mm;">
									Check one:
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
												<xsl:with-param name="BackupName">IRS943ApplyOverpaymentNextReturnInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
												<xsl:with-param name="BackupName">IRS943ApplyOverpaymentNextReturnInd</xsl:with-param>
											</xsl:call-template>
											<span style="font-size:6pt;"/>Apply to next return.
										</label>
									</span>
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
												<xsl:with-param name="BackupName">IRS943RefundOverpaymentInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
												<xsl:with-param name="BackupName">IRS943RefundOverpaymentInd</xsl:with-param>
											</xsl:call-template>
											<span>Send a refund.</span>
										</label>
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:5mm;background-color:lightgrey;border-bottom-width:0px"></div>
								<div class="styLNAmountBox" style="width:30mm;height:5mm;background-color:lightgrey;border-bottom-width:0px">
								</div>							
							</div>
						</div>
					</xsl:if>
					<!-- END LINE 16 ENGLISH -->
					<!-- BEGIN ALL FILERS SECTION -->
					<div class="styGenericDiv" style="width:187mm;padding-top:0.5mm;padding-bottom:0.5mm;float:none;clear:both;">
						<!--<div class="styGenericDiv" style="width:187mm;padding-bottom:1mm;">-->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS943Bullet">•</div>
							<div class="styGenericDiv" style="width:175mm;float:left;">
								<xsl:value-of disable-output-escaping="yes" select="$AllFilersText"/>
							</div>
						</div>
						<xsl:if test="$Language='ENGLISH'">
							<div class="styGenericDiv" style="width:187mm;float:left;">
								<div class="styIRS943Bullet" style="padding-top:1mm;">•</div>
								<div style="float:left;font-size:6.5pt;">
									<xsl:value-of disable-output-escaping="yes" select="$SemiWeeklyText"/>
									<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
									</xsl:call-template>
									<span style="padding-left:3mm;padding-right:1.5mm;">										
										<span class="styDotLn">.....................</span>
										<!--<img style="float:right;padding-right:1.5mm;padding-top:.5mm;" src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>-->
									</span>
									<input type="checkbox" class="styCkbox" alt="SemiWeekly Schedule Depositor Indicator">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
											<xsl:with-param name="BackupName">IRS943SemiweeklyScheduleDepositorInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
											<xsl:with-param name="BackupName">IRS943SemiweeklyScheduleDepositorInd</xsl:with-param>
										</xsl:call-template>
									</label>
								</div>
							</div>
							<div class="styGenericDiv" style="width:187mm;float:left;">
								<div class="styIRS943Bullet" style="padding-top:1mm;">•</div>
								<div style="float:left;font-size:6.5pt;">
									<xsl:value-of disable-output-escaping="yes" select="$MonthlyText"/>
									<span style="padding-left:1.5mm;padding-right:1.5mm;">
										<span class="styDotLn">.........................</span>
										<!--<img style="float:right;padding-right:1.5mm;padding-top:.5mm;" src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>-->
									</span>
									<input type="checkbox" class="styCkbox" alt="Monthly Schedule Depositor Indicator">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorInd"/>
											<xsl:with-param name="BackupName">IRS943MonthlyScheduleDepositorInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorInd"/>
											<xsl:with-param name="BackupName">IRS943MonthlyScheduleDepositorInd</xsl:with-param>
										</xsl:call-template>
									</label>
								</div>
							</div>
						</xsl:if>
						<xsl:if test="$Language='SPANISH'">
							<div class="styGenericDiv" style="width:187mm;float:left;">
								<div class="styIRS943Bullet" style="padding-top:1mm;">•</div>
								<div class="styGenericDiv" style="width:184mm;float:left;">
									<xsl:value-of disable-output-escaping="yes" select="$SemiWeeklyText"/>
									<span style="width:67mm;padding-left:1mm;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
										</xsl:call-template>
										<!--Dotted Line-->
<!--										<img style="float:right;padding-right:1.5mm;padding-top:.5mm;" src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>-->
										<span class="styDotLn" style="float:right;">...............</span>
									</span>
									<input type="checkbox" class="styCkbox" alt="Itinerario Bisemanal Indicador Depositante" style="padding-left:1mm;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
											<xsl:with-param name="BackupName">IRS943SemiweeklyScheduleDepositorInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
											<xsl:with-param name="BackupName">IRS943SemiweeklyScheduleDepositorInd</xsl:with-param>
										</xsl:call-template>
									</label>
								</div>
							</div>
							<div class="styGenericDiv" style="width:187mm;float:left;">
								<div class="styIRS943Bullet" style="padding-top:1mm;">•</div>
								<div style="float:left;font-size:7pt;">
									<xsl:value-of disable-output-escaping="yes" select="$MonthlyText"/>
									<!--Dotted Line-->
									<span style="padding-left:4mm;">
<!--										<img style="float:right;padding-right:1.5mm;padding-top:.5mm;" src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>-->
										<span class="styDotLn" style="float:right;">...................</span>
									</span>
									<input type="checkbox" class="styCkbox" alt="Mensual Horario Indicador Depositante">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorInd"/>
											<xsl:with-param name="BackupName">IRS943MonthlyScheduleDepositorInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorInd"/>
											<xsl:with-param name="BackupName">IRS943MonthlyScheduleDepositorInd</xsl:with-param>
										</xsl:call-template>
									</label>
								</div>
							</div>
						</xsl:if>
					</div>
					<!-- END ALL FILERS SECTION -->
					<!-- BEGIN LINE 17 -->
					<div class="styBB" style="width:187mm;border:2px solid black;float:none;clear:both;">
						<!--<div class="styGenericDiv" style="width:187mm;border:2px solid black;float:none;clear:both;"> -->
						<div class="styBB" style="width:186mm;">
							<div class="styLNLeftNumBox">17</div>
							<div class="styLNDesc" style="width:170mm;">
								<xsl:value-of disable-output-escaping="yes" select="$Line17Text"/>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;height:26mm;">
							<!-- Start of Line 17, Column 1 -->
							<div class="styIRS943MonthlyGrp">
								<div class="styIRS943MonthNm"/>
								<div style="width:31mm;height:6mm;border-left:1px solid black;float:left;border-right:1px solid black;border-bottom:1px solid black;font-size:7px;text-align:center;padding-top:.5mm;">
									<b>
										<xsl:value-of disable-output-escaping="yes" select="$TaxLiabilityMonthText"/>
									</b>
								</div>
								<div class="styIRS943MonthNm">
									<div class="styIRS943MonthLetter">A</div>
									<div class="styIRS943Month">
										<xsl:value-of disable-output-escaping="yes" select="$JanuaryText"/>
										<xsl:choose>
											<xsl:when test="$Language='ENGLISH'">
												<span class="styDotLn" style="float:right;">....</span>
											</xsl:when>
											<xsl:otherwise>
												<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
								<div class="styIRS943MonthAmt">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'JANUARY']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<div class="styIRS943MonthNm">
									<div class="styIRS943MonthLetter">B</div>
									<div class="styIRS943Month">
										<xsl:value-of disable-output-escaping="yes" select="$FebruaryText"/>
										<xsl:choose>
											<xsl:when test="$Language='ENGLISH'">
												<span class="styDotLn" style="float:right;">....</span>
											</xsl:when>
											<xsl:otherwise>
												<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
								<div class="styIRS943MonthAmt">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'FEBRUARY']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<div class="styIRS943MonthNm">
									<div class="styIRS943MonthLetter">C</div>
									<div class="styIRS943Month">
										<xsl:value-of disable-output-escaping="yes" select="$MarchText"/>
										<xsl:choose>
											<xsl:when test="$Language='ENGLISH'">
												<span class="styDotLn" style="float:right;">....</span>
											</xsl:when>
											<xsl:otherwise>
												<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
								<div class="styIRS943MonthAmt">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'MARCH']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<div class="styIRS943MonthNm">
									<div class="styIRS943MonthLetter">D</div>
									<div class="styIRS943Month">
										<xsl:value-of disable-output-escaping="yes" select="$AprilText"/>
										<xsl:choose>
											<xsl:when test="$Language='ENGLISH'">
												<span class="styDotLn" style="float:right;">....</span>
											</xsl:when>
											<xsl:otherwise>
												<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
								<div class="styIRS943MonthAmt">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'APRIL']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<div class="styIRS943MonthNm">
									<div class="styIRS943MonthLetter">E</div>
									<div class="styIRS943Month">
										<xsl:value-of disable-output-escaping="yes" select="$MayText"/>
										<xsl:choose>
											<xsl:when test="$Language='ENGLISH'">
												<span class="styDotLn" style="float:right;">....</span>
											</xsl:when>
											<xsl:otherwise>
												<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
								<div class="styIRS943MonthAmt" style="border-bottom:0px;">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'MAY']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
							</div>
							<!-- End of Line 17, Column 1 -->
							<!-- Start of Line 17, Column 2 -->
							<div class="styIRS943MonthlyBGrp">
								<div style="width:31mm;height:6mm;float:left;"/>
								<div class="styIRS943MonthBAmt" style="height:6mm;font-size:7px;text-align:center;padding-top:.5mm;">
									<b>
										<xsl:value-of disable-output-escaping="yes" select="$TaxLiabilityMonthText"/>
									</b>
								</div>
								<div class="styIRS943MonthBNm">
									<div class="styIRS943MonthBLetter">F</div>
									<div class="styIRS943Month">
										<xsl:value-of disable-output-escaping="yes" select="$JuneText"/>
										<xsl:choose>
											<xsl:when test="$Language='ENGLISH'">
												<span class="styDotLn" style="float:right;">....</span>
											</xsl:when>
											<xsl:otherwise>
												<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
								<div class="styIRS943MonthBAmt">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'JUNE']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<div class="styIRS943MonthBNm">
									<div class="styIRS943MonthBLetter">G</div>
									<div class="styIRS943Month">
										<xsl:value-of disable-output-escaping="yes" select="$JulyText"/>
										<xsl:choose>
											<xsl:when test="$Language='ENGLISH'">
												<span class="styDotLn" style="float:right;">....</span>
											</xsl:when>
											<xsl:otherwise>
												<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
								<div class="styIRS943MonthBAmt">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'JULY']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<div class="styIRS943MonthBNm">
									<div class="styIRS943MonthBLetter">H</div>
									<div class="styIRS943Month">
										<xsl:value-of disable-output-escaping="yes" select="$AugustText"/>
										<xsl:choose>
											<xsl:when test="$Language='ENGLISH'">
												<span class="styDotLn" style="float:right;">....</span>
											</xsl:when>
											<xsl:otherwise>
												<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
								<div class="styIRS943MonthBAmt">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'AUGUST']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<div class="styIRS943MonthBNm">
									<div class="styIRS943MonthBLetter">I</div>
									<div class="styIRS943Month">
										<xsl:value-of disable-output-escaping="yes" select="$SeptemberText"/>
										<xsl:choose>
											<xsl:when test="$Language='ENGLISH'">
												<span class="styDotLn" style="float:right;">...</span>
											</xsl:when>
											<xsl:otherwise>
												<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
								<div class="styIRS943MonthBAmt">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'SEPTEMBER']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<div class="styIRS943MonthBNm">
									<div class="styIRS943MonthBLetter">J</div>
									<div class="styIRS943Month">
										<xsl:value-of disable-output-escaping="yes" select="$OctoberText"/>
										<xsl:choose>
											<xsl:when test="$Language='ENGLISH'">
												<span class="styDotLn" style="float:right;">...</span>
											</xsl:when>
											<xsl:otherwise>
												<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
								<div class="styIRS943MonthBAmt" style="border-bottom:0px;">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'OCTOBER']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
							</div>
							<!-- End of Line 17, Column 2 -->
							<!-- Start of Line 17, Column 3 -->
							<div class="styIRS943MonthlyBGrp" style="width:62mm;">
								<div class="styIRS943MonthBNm" style="width:31mm;float:left;height:6mm;"/>
								<div class="styIRS943MonthCAmt" style="float:right;height:6mm;font-size:7px;text-align:center;padding-top:.5mm;">
									<b>
										<xsl:value-of disable-output-escaping="yes" select="$TaxLiabilityMonthText"/>
									</b>
								</div>
								<div class="styIRS943MonthBNm" style="width:31mm;float:left;">
									<div class="styIRS943MonthLetter">K</div>
									<div class="styIRS943Month">
										<xsl:value-of disable-output-escaping="yes" select="$NovemberText"/>
										<xsl:choose>
											<xsl:when test="$Language='ENGLISH'">
												<span class="styDotLn" style="float:right;">...</span>
											</xsl:when>
											<xsl:otherwise>
												<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
								<div class="styIRS943MonthCAmt" style="float:right;">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'NOVEMBER']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<div class="styIRS943MonthBNm" style="width:31mm;float:left;">
									<div class="styIRS943MonthLetter">L</div>
									<div class="styIRS943Month">
										<xsl:value-of disable-output-escaping="yes" select="$DecemberText"/>
										<xsl:choose>
											<xsl:when test="$Language='ENGLISH'">
												<span class="styDotLn" style="float:right;">...</span>
											</xsl:when>
											<xsl:otherwise>
												<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
								<div class="styIRS943MonthCAmt" style="float:right;">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'DECEMBER']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<div class="styIRS943MonthBNm" style="width:31mm;padding-top:2mm;float:left;">
									<div class="styIRS943MonthLetter" style="height:12mm;">M</div>
									<div class="styIRS943Month">
										<xsl:value-of disable-output-escaping="yes" select="$MText"/>
										<xsl:choose>
											<xsl:when test="$Language='ENGLISH'">
												<span class="styDotLn" style="float:right;">...</span>
											</xsl:when>
											<xsl:otherwise>
												<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
								<div class="styIRS943MonthCAmt" style="border-bottom:0px;height:12mm;padding-top:8.5mm;float:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- END LINE 17 -->
					<!-- BEGIN LINE 18 -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line18Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">.</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>18
								</div>
								<div class="styLNAmountBox" style="width:30mm;">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QHPExpnssSSQlfyPdSLWageAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">18</div>
								<div class="styLNAmountBox" style="font-size:6pt;width:30mm;height:7mm;padding-top:3.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QHPExpnssSSQlfyPdSLWageAmt"/>
									</xsl:call-template>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
-->					<!-- END LINE 18 -->
					<!-- BEGIN LINE 19 -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line19Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">.</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>19
								</div>
								<div class="styLNAmountBox" style="width:30mm;">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QHPExpnssSSQlfyPdFMLWageAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">19</div>
								<div class="styLNAmountBox" style="font-size:6pt;width:30mm;height:7mm;padding-top:3.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QHPExpnssSSQlfyPdFMLWageAmt"/>
									</xsl:call-template>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
-->					<!-- END LINE 19 -->
					<!-- BEGIN LINE 20 -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line20Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">...........................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>20
								</div>
								<div class="styLNAmountBox" style="width:30mm;background-color:lightgrey">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										--><!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QlfyWgsPdRtnEmplCOVIDAmt"/>
										</xsl:call-template>--><!--
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox">20</div>
								<div class="styLNAmountBox" style="font-size:6pt;width:30mm;background-color:lightgrey">
									--><!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyWgsPdRtnEmplCOVIDAmt"/>
									</xsl:call-template>--><!--
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
-->					<!-- END LINE 20 -->
					<!-- BEGIN LINE 21 -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:1px;float:none;clear:both;">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line21Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">...........................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox" style="border-bottom-width:0px;">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>21
								</div>
								<div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;background-color:lightgrey">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										--><!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QHPExpnssWgsPdRtnEmplCOVIDAmt"/>
										</xsl:call-template>--><!--
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox" style="border-bottom-width:0px;">21</div>
								<div class="styLNAmountBox" style="font-size:6pt;width:30mm;border-bottom-width:0px;background-color:lightgrey">
									--><!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QHPExpnssWgsPdRtnEmplCOVIDAmt"/>
									</xsl:call-template>--><!--
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
-->					<!-- END LINE 21 -->
					<!-- Message -->
<!--					<div class="styBB" style="width:187mm;font-size:8pt;border-bottom-width:2px;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:8mm;"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<div class="styLNDesc" style="width:130mm;padding-left:28mm;font-weight:bold;">
										You MUST complete all three pages of Form 943 and SIGN it.
									</div>
								</xsl:when>
								<xsl:otherwise> 
									<div class="styLNDesc" style="width:140mm;padding-left:8mm;">
										--><!--<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>--><!--
										<b> TIENE que completar las tres páginas del Formulario 943 y luego FIRMARLO</b>.
									</div>
								</xsl:otherwise>
							</xsl:choose>
						</span>
						<span style="float:right;">
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<div style="width:30mm;text-align:right;padding-bottom:0mm;">
										<img src="{$ImagePath}/944_Next.gif" alt="Next Page Arrow Image"/>
									</div>
								</xsl:when>
								<xsl:otherwise>
--><!--									<div style="width:35mm;text-align:right;padding-bottom:0mm;">
										<img src="{$ImagePath}/941SSPR_NextES.gif" alt="Pagina siguiente Flecha imagen"/>
									</div>--><!--
								</xsl:otherwise>
							</xsl:choose>
						</span>
					</div>
-->					<!-- End of Message -->
					<!-- Page Break and Footer-->
<!--					<xsl:if test="$Language='ENGLISH'">
						<div class="pageEnd" style="width:187mm;padding-top:1mm;">
							<div style="width:115mm;float:left;">
								<span class="styBoldText" style="font-size:6pt;">
									<xsl:value-of disable-output-escaping="yes" select="$PrivacyText"/>
								</span>
							</div>
							<div style="float:left;text-align:center;width:26mm;font-size:6pt;">
								<xsl:value-of disable-output-escaping="yes" select="$CatNoText"/>
							</div>
							<div style="float:right;">
								<span style="width:50px;"/>
								<xsl:value-of disable-output-escaping="yes" select="$FormText"/>
								<span class="styBoldText" style="font-size:6pt;">
									<xsl:value-of disable-output-escaping="yes" select="$FormNoText"/>
								</span> (2024)
							</div>
						</div>
						<p style="page-break-before: always"/>
					</xsl:if>
					<xsl:if test="$Language='SPANISH'">
						<div class="pageEnd" style="width:187mm;padding-top:1mm;">
							<div style="float:right;">
								<span style="width:50px;"/>Form
								<span class="styBoldText" style="font-size:8pt;">
									943 (sp)
								</span> (2024)
							</div>
						</div>
						<p style="page-break-before: always"/>
					</xsl:if>
-->					<!-- END Page Break and Footer-->
					<!-- Page 3 Header-->
<!--					<div class="styBB" style="width:187mm;padding-top:1mm;">
						<div style="font-size:12pt;font-family:Courier New;font-weight:bold;text-align:right;float:right">
							<xsl:if test="$Language='ENGLISH'">
								<xsl:value-of disable-output-escaping="yes" select="$FormUpperRightNumber3"/>
							</xsl:if>
						</div><br/>
						<div style="width:170mm;float:left;padding-top:1mm">
							<xsl:value-of disable-output-escaping="yes" select="$FormText"/>
							<b>943</b> (2024)
						</div>
						<div style="float:right;">							
							<xsl:if test="$Language='ENGLISH'">
								<span class="styBoldText" style="font-size:6pt;">
									<xsl:value-of disable-output-escaping="yes" select="$Page3Text"/>
								</span>
							</xsl:if>
							<xsl:if test="$Language='SPANISH'">
								<span style="font-size:7pt;padding-top:1mm;">
									Página <b>3</b>
								</span>
							</xsl:if>
						</div>
					</div>
-->					<!-- END Page 3 Header-->
					<!-- BEGIN LINE 22 -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line22Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">......</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;">...........................</span>
								</xsl:otherwise>
							</xsl:choose>						
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox" style="border-bottom-width:1px">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>22
								</div>
								<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QlfySLWgsAftrAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox" style="border-bottom-width:1px;height:6mm;padding-top:2.5mm">22</div>
								<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:6mm;padding-top:2.5mm">
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QlfySLWgsAftrAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
-->					<!-- END LINE 22 -->
					<!-- BEGIN LINE 23 -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox">23</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line23Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">.......</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;">..............................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox" style="border-bottom-width:1px">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>23
								</div>
								<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QHPExpnssQlfySLWgsAftrAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox" style="height:6mm;padding-top:2.5mm">23</div>
								<div class="styLNAmountBox" style="font-size:6pt;width:30mm;height:6mm;padding-top:2.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QHPExpnssQlfySLWgsAftrAmt"/>
									</xsl:call-template>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
-->					<!-- END LINE 23 -->
					<!-- BEGIN LINE 24 -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox">24</div>
						<div class="styLNDesc" style="width:140.8mm;height:6mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line24Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">...............................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;">.......................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox" style="border-bottom-width:1px;height:6mm;padding-top:2.5mm">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>24
								</div>
								<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:6mm;padding-top:2.5mm">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CrtnBrgnAgrmtQlfySLWgsAftrAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox" style="height:6mm;padding-top:2.5mm">24</div>
								<div class="styLNAmountBox" style="font-size:6pt;width:30mm;height:6mm;padding-top:2.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CrtnBrgnAgrmtQlfySLWgsAftrAmt"/>
									</xsl:call-template>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
-->					<!-- END LINE 24 -->
					<!-- BEGIN LINE 25 -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox">25</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line25Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">.....</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;">.............................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox" style="border-bottom-width:1px">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>25
								</div>
								<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QlfyFMLWgsAftrAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox" style="height:6mm;padding-top:2.5mm">25</div>
								<div class="styLNAmountBox" style="font-size:6pt;width:30mm;height:6mm;padding-top:2.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyFMLWgsAftrAmt"/>
									</xsl:call-template>
								</div>
							</xsl:otherwise>
						</xsl:choose>	
					</div>
-->					<!-- END LINE 25 -->
					<!-- BEGIN LINE 26 -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox">26</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line26Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">......</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;">..................................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox" style="border-bottom-width:1px">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>26
								</div>
								<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QHPExpnssQlfyFMLWgsAftrAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox" style="height:6mm;padding-top:2.5mm">26</div>
								<div class="styLNAmountBox" style="font-size:6pt;width:30mm;height:6mm;padding-top:2.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QHPExpnssQlfyFMLWgsAftrAmt"/>
									</xsl:call-template>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
-->					<!-- END LINE 26 -->
					<!-- BEGIN LINE 27 -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox">27</div>
						<div class="styLNDesc" style="width:140.8mm;height:6.5mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line27Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">								
									<span class="styDotLn" style="float:right;">...............................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;">..........................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox" style="border-bottom-width:1px;height:6.5mm;padding-top:2.5mm">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>27
								</div>
								<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;height:6.5mm;padding-top:2.5mm">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CrtnBrgnAgrmtQlfyFMLWgsAftrAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox" style="height:6.5mm;padding-top:2.5mm">27</div>
								<div class="styLNAmountBox" style="font-size:6pt;width:30mm;height:6.5mm;padding-top:2.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CrtnBrgnAgrmtQlfyFMLWgsAftrAmt"/>
									</xsl:call-template>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
-->					<!-- END LINE 27 -->
					<!-- BEGIN LINE 28 -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox">28</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line28Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">...........................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;">..........................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox" style="border-bottom-width:1px;">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>28
								</div>
								<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;background-color:lightgrey">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
									--><!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/EligEmplRtntnCrRcvryStUp3rdAmt"/>
										</xsl:call-template>--><!--
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox">28</div>
								<div class="styLNAmountBox" style="font-size:6pt;width:30mm;background-color:lightgrey">
								--><!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/EligEmplRtntnCrRcvryStUp3rdAmt"/>
									</xsl:call-template>--><!--
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
-->					<!-- END LINE 28 -->
					<!-- BEGIN LINE 29 -->
<!--					<div class="styBB" style="width:187mm;border-bottom-width:1px;float:none;clear:both;">
						<div class="styLNLeftNumBox">29</div>
						<div class="styLNDesc" style="width:140.8mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line29Text"/>
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span class="styDotLn" style="float:right;">...........................</span>
								</xsl:when>
								<xsl:otherwise>
									<span class="styDotLn" style="float:right;">..........................</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div class="styLNRightNumBox" style="border-bottom-width:0px;">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>29
								</div>
								<div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;background-color:lightgrey">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<span style="font-size:6pt;">
									--><!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/EligEmplRtntnCrRcvryStUp4thAmt"/>
										</xsl:call-template>--><!--
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNRightNumBox" style="border-bottom-width:0px;">29</div>
								<div class="styLNAmountBox" style="font-size:6pt;width:30mm;border-bottom-width:0px;background-color:lightgrey">
								--><!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/EligEmplRtntnCrRcvryStUp4thAmt"/>
									</xsl:call-template>--><!--
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
-->					<!-- END LINE 29 -->
					<!-- 3rd party -->
					<div style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;float:none;clear:both;">
						<div style="width:21mm;height:12.4mm;float:left;clear:none;">
							<span class="styMainTitle" style="font-size:8.5pt;padding-top:2mm;padding-left:2mm;">
								<xsl:value-of disable-output-escaping="yes" select="$DesigneeText"/>
							</span>
						</div>
						<div style="width:166mm;height:12.4mm;float:left;clear:none;border-left:1px solid black;">
							<div style="width:166mm;float:left;clear:none;">
								<div style="font-size:6.5pt;float:left;clear:none;padding-left:2mm;padding-top:1.5mm;">
									<xsl:value-of disable-output-escaping="yes" select="$DiscussText"/>
								</div>
								<!--ENGLISH-->
								<xsl:if test="$Language='ENGLISH'">
									<div style="float:left;clear:none;font-size:6pt;">
										<!--  Yes Checkbox -->
										<input type="Checkbox" class="styCkbox" alt="Yes, discuss with third party indicator">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
												<xsl:with-param name="BackupName">IRS943DiscussWithThirdPartyYesInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
												<xsl:with-param name="BackupName">IRS943DiscussWithThirdPartyYesInd</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of disable-output-escaping="yes" select="$YesText"/>
										</label>
									</div>
									<div style="float:left;clear:none;font-size:6pt;">
										<!-- No Checkbox -->
										<input type="Checkbox" class="styCkbox" alt="Do not discuss with third party indicator">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
												<xsl:with-param name="BackupName">IRS943DiscussWithThirdPartyNoInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
												<xsl:with-param name="BackupName">IRS943DiscussWithThirdPartyNoInd</xsl:with-param>
											</xsl:call-template>
										No.	
									</label>
									</div>
								</xsl:if>
								<!--SPANISH-->
								<xsl:if test="$Language='SPANISH'">
									<div style="float:left;clear:none;font-size:6pt;padding-left:3mm;">
										<!--  Yes Checkbox -->
										<input type="Checkbox" class="styCkbox" alt="Sí, Complete lo siguiente Check Box">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
												<xsl:with-param name="BackupName">IRS943DiscussWithThirdPartyYesInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
												<xsl:with-param name="BackupName">IRS943DiscussWithThirdPartyYesInd</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of disable-output-escaping="yes" select="$YesText"/>
										</label>
									</div>
									<div style="float:left;clear:none;font-size:6pt;padding-left:5mm;">
										<!-- No Checkbox -->
										<input type="Checkbox" class="styCkbox" alt="No discuta con indicador de terceros">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
												<xsl:with-param name="BackupName">IRS943DiscussWithThirdPartyNoInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
												<xsl:with-param name="BackupName">IRS943DiscussWithThirdPartyNoInd</xsl:with-param>
											</xsl:call-template>
										<b>No.</b>	
									</label>
									</div>
								</xsl:if>
							</div>
							<div style="height:9mm;float:left;clear:none;width:166mm;padding-top:1.5mm;">
								<div style="height:7mm;float:left;clear:none;width:auto;padding-left:2mm;font-weight:bold;font-size:6pt;">
									<xsl:value-of disable-output-escaping="yes" select="$DesigneeNameText"/>
									<span style="width:9px;"/>
<!--									<xsl:if test="$Language='ENGLISH'">
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									</xsl:if>-->
								</div>
								<div style="width:50mm;float:left;clear:none;font-size:6pt;padding-top:2.5mm;padding-left:2mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeNm"/>
										<xsl:with-param name="BackupName">IRS943ThirdPartyDesigneeNm</xsl:with-param>
									</xsl:call-template>
								</div>
								<div style="float:left;clear:none;width:auto;padding-left:.5mm;font-weight:bold;font-size:6pt;">
									<xsl:value-of disable-output-escaping="yes" select="$DesigneePhoneText"/>
									<span style="width:5px;"/>
<!--									<xsl:if test="$Language='ENGLISH'">
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									</xsl:if>-->
								</div>
								<div style="float:left;padding-left:2mm;clear:none;width:40mm;padding-top:2mm;">
									<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum">
										<span style="font-size:5.5pt;">
											<xsl:call-template name="PopulatePhoneNumber">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum"/>
												<xsl:with-param name="BackupName">IRS943ThirdPartyDesigneePhoneNum</xsl:with-param>
											</xsl:call-template>
										</span>
									</xsl:if>
									<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum">
										<span style="font-size:5.5pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum"/>
												<xsl:with-param name="BackupName">IRS943ThirdPartyDesigneeFrgnPhoneNum</xsl:with-param>
											</xsl:call-template>
										</span>
									</xsl:if>
								</div>
								<div style="float:left;clear:none;width:{$PrintWidth}mm;padding-left:.5mm;font-weight:bold;font-size:{$PrintSize}pt;">
									<xsl:value-of disable-output-escaping="yes" select="$PINText"/>
									<span style="width:{$PrintSpan}mm;"/>
<!--									<xsl:if test="$Language='ENGLISH'">
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									</xsl:if>-->
								</div>
								<div style="padding-top:1.5mm;float:right;clear:none;">
									<div class="styLNCtrNumBox" style="float:right;width:20mm;border-top-width:1px;padding-top:1mm;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePIN"/>
											<xsl:with-param name="BackupName">IRS943ThirdPartyDesigneePIN</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Sign Here -->
					<xsl:if test="$Language='ENGLISH'">
						<div style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;float:none;clear:both;{$SpanishPageBreakAfter};{$EnglishPageBreakAfter}">
							<div style="width:21mm;height:auto;float:left;clear:none;padding-top:3.5mm;">
								<span class="styMainTitle" style="font-size:12pt;padding-left:2mm;">
									<xsl:value-of disable-output-escaping="yes" select="$SignHereText"/>
								</span>
							</div>
							<div style="float:left;clear:none;width:166mm;padding-top:.5mm;border-left:1px solid black;">
								<div style="float:left;clear:none;width:166mm;padding-top:.5mm;">
									<div style="font-size:6.5pt;float:left;clear:none;padding-left:2mm;">
										<xsl:value-of disable-output-escaping="yes" select="$PenaltiesText"/>
									</div>
								</div>
								<div style="float:left;clear:none;width:166mm;padding-bottom:1mm;">
									<div style="float:left;clear:none;width:19mm;padding-left:2mm;font-weight:bold;font-size:6pt;padding-top:{$SignHere1Padding}mm;">
										<xsl:value-of disable-output-escaping="yes" select="$SignatureText"/>
										<span style="width:7px;"/>
<!--										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
-->									</div>
									<div style="padding-left:2mm;width:35mm;float:left;clear:none;padding-top:{$SignHere1Padding}mm;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/SignatureOptionCd"/>
										</xsl:call-template>
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/PIN"/>
										</xsl:call-template>
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN"/>
										</xsl:call-template>
									</div>
									<div style="float:left;clear:none;width:25mm;padding-left:1mm;font-weight:bold;font-size:6pt;padding-top:{$SignHere2Padding}mm;">
										<xsl:value-of disable-output-escaping="yes" select="$PrintText"/>
										<span style="width:9px;"/>
<!--										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
-->									</div>
									<div style="float:left;clear:none;width:57mm;padding-top:{$SignHere2Padding}mm;">
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PersonNm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PersonNm"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerNm"/>
										</xsl:call-template>
										<br/>
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/Title">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/Title"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PractitionerPINGrp/Title">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/Title"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/ReportingAgentPINGrp/RAPINEnteredByCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/RAPINEnteredByCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd"/>
											</xsl:call-template>
										</xsl:if>
									</div>
									<div style="float:left;clear:none;width:auto;padding-left:.5mm;font-weight:bold;font-size:6pt;padding-top:{$SignHere1Padding}mm;">
										<xsl:value-of disable-output-escaping="yes" select="$DateText"/>
										<span style="width:2mm;"/>
<!--										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
-->										<span style="width:1mm;"/>
									</div>
									<div style="height:5mm;width:auto;float:right;clear:none;padding-top:{$SignHere1Padding}mm;">
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/SignatureDt">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/SignatureDt"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt"/>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
							</div>
						</div>
					</xsl:if>
					<xsl:if test="$Language='SPANISH'">
						<div style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;float:none;clear:both;{$SpanishPageBreakAfter};{$EnglishPageBreakAfter}">
							<div style="width:21mm;height:auto;float:left;clear:none;padding-top:3.5mm;">
								<span class="styMainTitle" style="font-size:12pt;padding-left:6mm;">
									<xsl:value-of disable-output-escaping="yes" select="$SignHereText"/>
								</span>
							</div>
							<div style="float:left;clear:none;width:166mm;border-left:1px solid black;">
								<div style="float:left;clear:none;width:166mm;padding-top:.5mm;">
									<div style="font-size:6.5pt;float:left;clear:none;padding-left:2mm;">
										<xsl:value-of disable-output-escaping="yes" select="$PenaltiesText"/>
									</div>
								</div>
								<div style="float:left;clear:none;width:166mm;padding-bottom:1mm;">
									<div style="float:left;clear:none;width:12mm;padding-left:2mm;font-weight:bold;font-size:7pt;padding-top:{$SignHere1Padding}mm;backgroun">
										<xsl:value-of disable-output-escaping="yes" select="$SignatureText"/>
										<span style="width:7px;"/>
										<!--<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>-->
									</div>
									<div class="styBB" style="padding-left:2mm;width:75mm;float:left;clear:none;padding-top:{$SignHere1Padding}mm;border-bottom-width:1px;">
	<!--style="width:187mm;border-bottom-width:0px;float:none;clear:both;"-->
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/SignatureOptionCd"/>
										</xsl:call-template>
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/PIN"/>
										</xsl:call-template>
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN"/>
										</xsl:call-template>
									</div>
									<div style="float:left;clear:none;width:auto;padding-left:5mm;font-weight:bold;padding-top:{$SignHere1Padding}mm;">
										<xsl:value-of disable-output-escaping="yes" select="$DateText"/>
										<span style="width:2mm;"/>
									</div>
									<div class="styBB" style="padding-left:2mm;width:60mm;float:left;clear:none;padding-top:{$SignHere1Padding}mm;border-bottom-width:1px;">
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/SignatureDt">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/SignatureDt"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt"/>
											</xsl:call-template>
										</xsl:if>
									</div>
								<div style="width:165mm;padding-top:2mm;">
									<div style="float:left;clear:none;width:52mm;padding-left:2mm;font-weight:bold;padding-top:{$SignHere2Padding}mm;">
										<xsl:value-of disable-output-escaping="yes" select="$PrintText"/>
										<span style="width:9px;"/>
									</div>
									<div style="float:left;clear:none;width:87mm;padding-left:4mm;padding-top:{$SignHere2Padding}mm;">
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PersonNm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PersonNm"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerNm"/>
										</xsl:call-template>
										<br/>
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/Title">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/Title"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PractitionerPINGrp/Title">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/Title"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/ReportingAgentPINGrp/RAPINEnteredByCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/RAPINEnteredByCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd"/>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								</div>
							</div>
						</div>
					</xsl:if>
					<!-- paid preparer -->
					<div class="styBB" style="width:187mm;font-size:6pt;">
						<div style="width:21mm;height:18.5mm;padding-top:.5mm;float:left;clear:none;">
							<span class="styMainTitle" style="font-size:9.5pt;padding-left:2mm;padding-top:6mm;">
								<xsl:value-of disable-output-escaping="yes" select="$PaidPreparerText"/>
							</span>
						</div>
						<div style="width:166mm;border-left:1px solid black;float:left;clear:none;">
							<div style="width:166mm;height:100%;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:{$HeightCell}mm;width:46.95mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
									<xsl:value-of disable-output-escaping="yes" select="$PreparerNameText"/>
									<br/>
									<span style="padding-top:0.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerPersonNm</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
								<div class="styLNDesc" style="height:{$HeightCell}mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
									<xsl:value-of disable-output-escaping="yes" select="$PreparerSignatureText"/>
								</div>
								<div class="styLNDesc" style="height:{$HeightCell}mm;width:15mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">
									<xsl:value-of disable-output-escaping="yes" select="$DateText"/>
									<br/>
									<span style="padding-top:0.5mm;">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SignatureDt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styLNDesc" style="height:{$HeightCell}mm;width:25mm;border-right:1px solid black;padding-bottom:0mm;padding-left:1mm;">
									<label>									
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployediSelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployedInd</xsl:with-param>
										</xsl:call-template>
										<span style="vertical-align:top;padding-top:1mm;">
											<xsl:value-of disable-output-escaping="yes" select="$CheckText"/>
										</span>
										<input class="styCkbox" type="checkbox" style="width:3mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployedInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="vertical-align:top;">
											<xsl:value-of disable-output-escaping="yes" select="$SelfEmployedText"/>
										</span>
									</label>

								</div>
								<div class="styLNDesc" style="height:{$HeightCell}mm;width:26mm;padding-top:0mm;padding-left:1mm;">
									<xsl:if test="$Language='SPANISH'">
										<i>PTIN</i>
									</xsl:if>
									<xsl:if test="$Language='ENGLISH'">PTIN</xsl:if>
									<br/>
									<span style="padding-top:0.5mm;">
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
									</span>
								</div>
							</div>
							<div style="width:166mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:8.5mm;width:118.5mm;border-right:1px solid black;padding-left:1mm;">
									<div class="styGenericDiv">
										<xsl:value-of disable-output-escaping="yes" select="$FirmNameText"/>
										<span style="width:1mm;"/>
										<xsl:if test="$Language='ENGLISH'">
<!--											<img src="{$ImagePath}/943A_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
-->											<span style="width:11px;"/>
										</xsl:if>
									</div>
									<div class="styGenericDiv" style="padding-right:2mm;">
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1Txt">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1Txt"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styLNDesc" style="height:6mm;width:45.5mm;padding-left:1mm;">
									<xsl:value-of disable-output-escaping="yes" select="$FirmEINText"/>
<!--									<xsl:if test="$Language='ENGLISH'">
										<img style="padding-left:1mm;" src="{$ImagePath}/943A_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
									</xsl:if>-->
									<span style="width:12px;"/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<!-- 9/24/2015 Adjusted address height form 11mm to auto -->
							<div style="width:166mm;float:left;clear:none;">
								<div class="styLNDesc" style="width:118.5mm;padding-left:1mm;border-right:1px solid black;height:auto;">
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:value-of disable-output-escaping="yes" select="$FirmAddressText"/>
<!--										<xsl:if test="$Language='ENGLISH'">
											<img style="padding-left:1.5mm;" src="{$ImagePath}/943A_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
										</xsl:if>-->
									</div>
									<div class="styGenericDiv" style="padding-left:1mm;padding-right:.5mm;">
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine2Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/CityNm"/>
											</xsl:call-template>,<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/StateAbbreviationCd"/>
											</xsl:call-template>
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/ZIPCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine2Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CityNm"/>
											</xsl:call-template>,<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ProvinceOrStateNm"/>
											</xsl:call-template>
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ForeignPostalCd"/>
											</xsl:call-template>
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CountryCd"/>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styLNDesc" style="width:45.5mm;padding-left:1mm;">
									<xsl:value-of disable-output-escaping="yes" select="$FirmPhoneText"/>
									<span style="padding-left:3mm;;">
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum">
											<xsl:call-template name="PopulatePhoneNumber">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum"/>
											</xsl:call-template>
										</xsl:if>
									</span>
								</div>
							</div>
						</div>
					</div>
					<!-- END PREPARER SIGNATURE SECTION -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="width:115mm;float:left;">
							<span class="styBoldText" style="font-size:6pt;">
								<xsl:value-of disable-output-escaping="yes" select="$PrivacyText"/>
							</span>
						</div>
						<div style="float:left;text-align:center;width:26mm;font-size:6pt;">
							<xsl:value-of disable-output-escaping="yes" select="$CatNoText"/>
						</div>
						<div style="width:46mm; text-align:right;">
							Form
							<!--<xsl:value-of disable-output-escaping="yes" select="$FormText"/>-->
							<span class="styBoldText" style="font-size:8pt;">
								<xsl:value-of disable-output-escaping="yes" select="$FormNoText"/>
							</span> (2024)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
						<div class="styLeftOverTitle">Additional Data </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<xsl:variable name="TableWidth">100</xsl:variable>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
