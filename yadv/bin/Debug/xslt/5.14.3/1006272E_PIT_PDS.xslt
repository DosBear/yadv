<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pitp="urn:customs.ru:Information:CustomsDocuments:PIT_PDS:5.14.3" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.14.3">
	<!-- Шаблон для типа PIT_PDSType -->
	<xsl:template match="pitp:PIT_PDS">
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
										<b>
											<xsl:choose>
												<xsl:when test="pitp:DocSign=0">
													<xsl:text>Уведомление о привязки ПИТ к ПДС</xsl:text>
												</xsl:when>
												<xsl:when test="pitp:DocSign=1">
													<xsl:text>Уведомление о регистрации сообщения прибытия</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													Уведомление о привязке ПИТ к ПДС / уведомление о регистрации сообщения прибытия
												</xsl:otherwise>
											</xsl:choose>
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата и время создания документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="pitp:DateDoc"/></xsl:call-template>
								<xsl:text> </xsl:text>
								<xsl:value-of select="substring(pitp:DateDoc, 12, 9)"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">УИН ПИТ</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="pitp:PIT"/>
							</td>
						</tr>
					</table>
					<div class="title marg-top">Пакет электронных документов и сведений</div>
					<table class="bordered">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">УИН ПДС</td>
								<td class="graphMain bordered">Информация о коносаменте</td>
							</tr>
							<xsl:for-each select="pitp:PDS">
								<xsl:apply-templates select=".">
									<xsl:with-param name="wdth" select="$w"/>
								</xsl:apply-templates>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:if test="pitp:Vessel">
						<div class="title marg-top">Реквизиты судна</div>
						<div>
							<xsl:apply-templates select="pitp:Vessel">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="pitp:VesselFile">
						<div class="title marg-top">Номер судового дела</div>
						<div>
							<xsl:apply-templates select="pitp:VesselFile">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа pitp:PDSType -->
	<xsl:template match="pitp:PDS">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:value-of select="pitp:PDSId"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="pitp:RegBillofLading">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="pitp:RegBillofLading">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
			<xsl:if test="position() &gt; 1"><br/></xsl:if>
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:if test="cat_ru:PrDocumentNumber">
				<xsl:text> № </xsl:text>
				<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate">
				<xsl:text> от </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
				</xsl:call-template>
			</xsl:if>
		<!--/div-->
	</xsl:template>
	<!-- Шаблон для типа catTrans_ru:VesselType -->
	<xsl:template match="pitp:Vessel">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование судна</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="catTrans_ru:Name"/>
					</td>
				</tr>
			</table>
			<xsl:if test="catTrans_ru:Shipmaster">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Фамилия капитана судна</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="catTrans_ru:Shipmaster"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catTrans_ru:NationalityCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код страны принадлежности судна</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="catTrans_ru:NationalityCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catTrans_ru:NationalityVessel">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Национальная принадлежность судна</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="catTrans_ru:NationalityVessel"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catTrans_ru:NationalityVesselCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Буквенный код страны принадлежности судна</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="catTrans_ru:NationalityVesselCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="pitp:VesselFile">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CustomsCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:GTDNumber"/>
					</td>
				</tr>
			</table>
		</div>
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
