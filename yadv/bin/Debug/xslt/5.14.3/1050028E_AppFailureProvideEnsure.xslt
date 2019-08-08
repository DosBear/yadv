<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:afpe="urn:customs.ru:Information:GuaranteeDocuments:AppFailureProvideEnsure:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа AppFailureProvideEnsureType -->
	<xsl:template match="afpe:AppFailureProvideEnsure">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
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
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



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
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Обращение таможенного представителя о непредоставлении обеспечения исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tr>
							<td class="annot graphMain bordered" colspan="2">1. Сведения о таможенном представителе</td>
						</tr>
						<tr>
							<td class="annot graphMain bordered" width="50%">1.1.	Наименование юридического лица</td>
							<td class="annot graphMain bordered" width="50%">
								<xsl:value-of select="afpe:BrokerInfo/cat_ru:OrganizationName"/>
								<xsl:if test="afpe:BrokerInfo/cat_ru:ShortName and not(afpe:BrokerInfo/cat_ru:OrganizationName)">
									<xsl:value-of select="afpe:BrokerInfo/cat_ru:ShortName"/>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain bordered" width="50%">1.2. Идентификационный номер налогоплательщика</td>
							<td class="annot graphMain bordered" width="50%">
								<xsl:value-of select="afpe:BrokerInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain bordered" width="50%">1.3. Основной государственный регистрационный номер</td>
							<td class="annot graphMain bordered" width="50%">
								<xsl:value-of select="afpe:BrokerInfo/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain bordered" width="50%">1.4. Номер решения о включении юридического лица в реестр таможенных представителей</td>
							<td class="annot graphMain bordered" width="50%">
								<xsl:value-of select="afpe:BrokerInfo/afpe:BrokerReestrNumber"/>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain bordered" colspan="2">2.	Сведения об обеспечении исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин</td>
						</tr>
						<tr>
							<td class="annot graphMain bordered" width="50%">2.1. Наименование декларанта</td>
							<td class="annot graphMain bordered" width="50%">
								<xsl:value-of select="afpe:Declarant/cat_ru:OrganizationName"/>
								<xsl:if test="afpe:Declarant/cat_ru:ShortName and not(afpe:Declarant/cat_ru:OrganizationName)">
									<xsl:value-of select="afpe:Declarant/cat_ru:ShortName"/>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain bordered" width="50%">2.2. Идентификационный номер налогоплательщика</td>
							<td class="annot graphMain bordered" width="50%">
								<xsl:value-of select="afpe:Declarant/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain bordered" width="50%">2.3. Основной государственный регистрационный номер</td>
							<td class="annot graphMain bordered" width="50%">
								<xsl:value-of select="afpe:Declarant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain bordered" width="50%">2.4. Номер декларации на товары</td>
							<td class="annot graphMain bordered" width="50%">
								<xsl:apply-templates select="afpe:NumberDeclaration"/>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain bordered" width="50%">2.5. Сумма обеспечения исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин в соответствии с расчетом размера обеспечения исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин (в российских рублях)</td>
							<td class="annot graphMain bordered" width="50%">
								<xsl:value-of select="afpe:GuaranteeAmount"/>
							</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="afpe:NumberDeclaration">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="num_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:if test="afpe:AddNumber">
			<xsl:value-of select="afpe:AddNumber"/>
		</xsl:if>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
