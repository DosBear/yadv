<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:irg="urn:customs.ru:Information:CustomsDocuments:InqRecallGTD:5.13.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Версия 4.7.0.0 от 25.02.2009.   -->
   <xsl:template match="/">
      <html>
         <head>
			 <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
			<style>
				body {
				background: #cccccc;
				}

				div.page {
				width: 210mm;
				max-width: 210mm;
				margin: 10px auto;
				margin-top: 6pt;
				margin-bottom: 6pt;
				padding: 10mm 10mm 10mm 20mm;
				background: #ffffff;
				border: solid 1pt #000000;
				}

				.marg-top
				{
				margin-top:5mm;
				}

				table
				{
				width: 100%;
				border: 0;
				empty-cells: show;
				border-collapse: collapse;
				margin-top: 1px;
				}

				table.border tr td
				{
				border: 1px solid gray;
				}

				.graph {
				font-family: Arial;
				font-size: 10pt;
				}

				.value
				{
				border-bottom: solid 1px black;
				}

				div.title, tr.title td { font-weight:bold;  }
				.bordered { border-collapse: collapse; }
				td.bordered
				{
				border: solid 1px windowtext;
				}

				td.graphMain
				{
				vertical-align:top;
				}
				td.value.graphMain
				{
				vertical-align:bottom;
				}
			</style>
		</head>
		<body>
			<div class="page">
				<table width="100%">
				   <tbody>
					  <tr>
						 <td align="center">
							<span style="font-weight:bold; font-size:18pt;">Обращение об отзыве декларации </span>
							<br/>
							<span style="font-weight:bold;font-size:18pt; ">№</span>
							<span style="font-weight:bold;font-size:18pt; "> </span>
							<span style="font-weight:bold;font-size:18pt;">
								<xsl:apply-templates select="irg:InqRecallGTD/irg:GTDNumber"/>
							</span>
							<br/>
						 </td>
					  </tr>
				   </tbody>
				</table>
				<br/>
				<table class="w190">
					<tr>
						<td class="annot graphMain" style="width:100%">
							<b>Прошу отозвать декларацию
							<xsl:if test="irg:InqRecallGTD/irg:RecallReason"> по причине</xsl:if>:</b>
						</td>
					</tr>
					<tr>
						<td class="value graphMain" style="width:50%">
							<xsl:for-each select="irg:InqRecallGTD/irg:RecallReason">
								<xsl:value-of select="."/>
							</xsl:for-each>
						</td>
						<br/>
					</tr>
				</table>
				<br/>
				<table class="w190">
					<tr>
						<td class="annot graphMain" style="width:50%">
							Наименование организации/Ф.И.О. физ. лица:
						</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select=".//cat_ru:OrganizationName"/>
						</td>
					</tr>
					<tr><td><br/></td></tr>
					<tr>
						<td class="annot graphMain" style="width:50%">
							Краткое наименование организации:
						</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select=".//cat_ru:ShortName"/>
						</td>
					</tr>
					<tr><td><br/></td></tr>
					<tr>
						<td class="annot graphMain" style="width:50%">
							Адрес:
						</td>
						<td class="value graphMain" style="width:50%">
						   <xsl:if test=".//cat_ru:Address/cat_ru:PostalCode">
							  <xsl:value-of select=".//cat_ru:Address/cat_ru:PostalCode"/>
							  <xsl:text> </xsl:text>
						   </xsl:if>
						   <xsl:if test=".//cat_ru:Address/cat_ru:CountryCode">
							  <xsl:text>, </xsl:text>
							  <xsl:value-of select=".//cat_ru:Address/cat_ru:CountryCode"/>
							  <xsl:text> </xsl:text>
						   </xsl:if>
						   <xsl:if test=".//cat_ru:Address/cat_ru:CounryName">
							  <xsl:text>, </xsl:text>
							  <xsl:value-of select=".//cat_ru:Address/cat_ru:CounryName"/>
							  <xsl:text> </xsl:text>
						   </xsl:if>
						   <xsl:if test=".//cat_ru:Address/cat_ru:Region">
							  <xsl:text>, </xsl:text>
							  <xsl:value-of select=".//cat_ru:Address/cat_ru:Region"/>
							  <xsl:text> </xsl:text>
						   </xsl:if>
						   <xsl:if test=".//cat_ru:Address/cat_ru:City">
							  <xsl:text>, </xsl:text>
							  <xsl:value-of select=".//cat_ru:Address/cat_ru:City"/>
							  <xsl:text> </xsl:text>
						   </xsl:if>
						   <xsl:if test=".//cat_ru:Address/cat_ru:StreetHouse">
							  <xsl:text>, </xsl:text>
							  <xsl:value-of select=".//cat_ru:Address/cat_ru:StreetHouse"/>
						   </xsl:if>
						</td>
					</tr>
				</table>
				<br/>
				<table class="w190">
					<tr>
						<td class="annot graphMain" style="width:50%">
							УИН:
						</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="irg:InqRecallGTD/irg:UIN"/>
						</td>
					</tr>
				</table>
				<br/>
				<table class="w190">
					<tr>
						<td class="annot graphMain" style="width:50%">
							<b>Дата и время направления сообщения:</b>
						</td>
						<td class="value graphMain" style="width:50%">
							<xsl:for-each select="irg:InqRecallGTD">
							   <xsl:for-each select="irg:SendDate">
								  <xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
								  <xsl:text>.</xsl:text>
								  <xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
								  <xsl:text>.</xsl:text>
								  <xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
							   </xsl:for-each>
							</xsl:for-each>
							<xsl:text> </xsl:text>
							<xsl:for-each select="irg:InqRecallGTD">
							   <xsl:for-each select="irg:SendTime">
								   <xsl:value-of select="substring(., 1, 8)"/>
							   </xsl:for-each>
							</xsl:for-each>

						</td>
					</tr>
				</table>
			 </div>	
			</body>
      </html>
   </xsl:template>
   <!--<xsl:template match="cat_ru:Address">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="cat_ru:Address/*">
		<xsl:if test="preceding-sibling::*[1]">, </xsl:if>
		<xsl:value-of select="."/>
	</xsl:template>-->
	<xsl:template match="irg:GTDNumber | irg:UIN">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		 <xsl:text>/</xsl:text>
		 <xsl:call-template name="russian_date_gtd">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		 </xsl:call-template>
		 <xsl:text>/</xsl:text>
		 <xsl:if test="irg:AddNumber">
		   <xsl:value-of select="irg:AddNumber"/>
		 </xsl:if>
		 <xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template name="russian_date_gtd">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>
            <xsl:value-of select="substring($dateIn,6,2)"/>
            <xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>
