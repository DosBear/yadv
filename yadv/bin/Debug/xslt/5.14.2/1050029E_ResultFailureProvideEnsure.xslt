<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rfpe="urn:customs.ru:Information:GuaranteeDocuments:ResultFailureProvideEnsure:5.14.2" xmlns:xs="http://www.w3.org/2001/XMLSchema">

	<!-- Шаблон для типа ResultFailureProvideEnsureType -->
	<xsl:template match="rfpe:ResultFailureProvideEnsure">
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
										<b>Уведомление таможенного органа о результатах рассмотрения обращения таможенного представителя о непредоставлении обеспечения исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tr>
							<td class="annot graphMain bordered" style="width:70%">1. Наименование и код таможенного органа</td>
							<td class="annot graphMain bordered" style="width:30%">
								<xsl:apply-templates select="rfpe:Customs"/>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain bordered">2. Номер декларации на товары</td>
							<td class="annot graphMain bordered">
								<xsl:apply-templates select="rfpe:NumberDeclaration"/>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain bordered" colspan="2">3. Результат рассмотрения обращения таможенного представителя</td>
						</tr>
						<tr valign="middle">
							<td class="annot bordered">3.1. Обеспечение исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела, использовано в качестве обеспечения исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин</td>
							<td class="annot bordered" align="center">
								<xsl:if test="rfpe:UsePossibleSign='true' or rfpe:UsePossibleSign=1">
									<b>V</b>
								</xsl:if>
							</td>
						</tr>
						<tr valign="middle">
							<td class="annot bordered">3.2. Обеспечение исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела, не может быть использовано в качестве обеспечения исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин</td>
							<td class="annot bordered" align="center">
								<xsl:if test="rfpe:UsePossibleSign='false' or rfpe:UsePossibleSign=0">
									<b>V</b>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain bordered" colspan="2">4. Причины невозможности использования обеспечения исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела, в качестве обеспечения исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин</td>
						</tr>
						<tr valign="middle">
							<td class="annot bordered">4.1. Не соблюдены условия, установленные пунктом 1 части 13 статьи 55 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации»</td>
							<td class="annot bordered" align="center">
								<xsl:apply-templates mode="bool" select="rfpe:ReasonNotUsePossible/rfpe:NotComplCondition1Sign"/>
							</td>
						</tr>
						<tr valign="middle">
							<td class="annot bordered">4.2. Не соблюдены условия, установленные пунктом 2 части 13 статьи 55 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации»</td>
							<td class="annot bordered" align="center">
								<xsl:apply-templates mode="bool" select="rfpe:ReasonNotUsePossible/rfpe:NotComplCondition2Sign"/>
							</td>
						</tr>
						<tr valign="middle">
							<td class="annot bordered">4.3. Не соблюдены условия, установленные пунктом 3 части 13 статьи 55 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации»</td>
							<td class="annot bordered" align="center">
								<xsl:apply-templates mode="bool" select="rfpe:ReasonNotUsePossible/rfpe:NotComplCondition3Sign"/>
							</td>
						</tr>
						<!--tr valign="middle">
							<td class="annot bordered">4.4. Не совпадает ИНН таможенного представителя в Обращении и гр 54 ДТ</td>
							<td class="annot bordered" align="center">
								<xsl:apply-templates mode="bool" select="rfpe:ReasonNotUsePossible/rfpe:CompINN"/>
							</td>
						</tr>
						<tr valign="middle">
							<td class="annot bordered">4.5. Не совпадает сумма резевирования в Обращении с расчетной</td>
							<td class="annot bordered" align="center">
								<xsl:apply-templates mode="bool" select="rfpe:ReasonNotUsePossible/rfpe:CompSum"/>
							</td>
						</tr-->
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="*" mode="bool">
		<xsl:if test=".='true' or .=1">
			<b>V</b>
		</xsl:if>
	</xsl:template>
	<xsl:template match="rfpe:Customs">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:Code"/>
	</xsl:template>
	<xsl:template match="rfpe:NumberDeclaration">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="num_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
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
