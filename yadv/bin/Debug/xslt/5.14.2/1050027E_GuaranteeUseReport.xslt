<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gure="urn:customs.ru:GuaranteeUseReport:5.13.4" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа GuaranteeUseReportType -->
	<xsl:template match="gure:GuaranteeUseReport">
		<xsl:param name="w" select="277"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
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
										<b>Отчет от использовании генерального обеспечения исполнения обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr valign="top">
								<td class="bordered" align="center" colspan="2">
									<b><xsl:text>Общие сведения о генерально обеспечении</xsl:text></b>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" width="60%">Дата и время формирования отчета</td>
								<td class="bordered" width="40%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="gure:ReportDateTime"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(gure:ReportDateTime, 12, 8)"/>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered">Период формирования отчета</td>
								<td class="bordered">
									<xsl:text> c </xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="gure:ReportStart"/>
									</xsl:call-template>
									<xsl:text> по </xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="gure:ReportEnd"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered">Способ обеспечения исполнения обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин</td>
								<td class="bordered">
									<xsl:text>Код способа обеспечения: </xsl:text>
									<xsl:value-of select="gure:GuaranteeType"/>
									<br/>
									<xsl:text>Признак генерального обеспечения: </xsl:text>
									<xsl:choose>
										<xsl:when test="gure:IsGeneral='true' or gure:IsGeneral=1">есть</xsl:when>
										<xsl:when test="gure:IsGeneral='false' or gure:IsGeneral=0">есть</xsl:when>
									</xsl:choose>
									<br/>
									<xsl:text>Сумма принятного обеспечения: </xsl:text>
									<xsl:value-of select="gure:GuaranteeAmount"/>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered">Регистрационный номер таможенной расписки</td>
								<td class="bordered">
									<xsl:apply-templates select="gure:TRRegistrationNumber"/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:apply-templates select="gure:ResumStart"/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td class="bordered" colspan="9" align="center"><b>Сведения об использовании генерального обеспечения в течение периода формирования отчета</b></td>
							</tr>
							<tr valign="top" align="center">
								<td class="bordered" rowspan="2" width="10%">№ п/п</td>
								<td class="bordered" rowspan="2" width="15%">Наименование обеспеченного обязательства</td>
								<td class="bordered" rowspan="2" width="15%">№ документа, под который осуществлено резервирование (декларация на товары, сертификат обеспечения исполнения обязанности по уплате таможенных пошлин, налогов, иные)</td>
								<td class="bordered" colspan="2" width="20%">Резервирование</td>
								<td class="bordered" colspan="2" width="20%">Разрезервирование</td>
								<td class="bordered" colspan="2" width="20%">Взыскание таможенных платежей</td>
							</tr>
							<tr align="center" >
								<td class="bordered" width="10%">Сумма</td>
								<td class="bordered" width="10%">Дата</td>
								<td class="bordered" width="10%">Сумма</td>
								<td class="bordered" width="10%">Дата</td>
								<td class="bordered" width="10%">Сумма</td>
								<td class="bordered" width="10%">Дата</td>
							</tr>
							<xsl:for-each select="gure:UsedList">
								<tr valign="top">
									<td class="bordered">
										<xsl:value-of select="gure:Number"/>
									</td>
									<td class="bordered">
										<xsl:value-of select="gure:CustDocument/cat_ru:PrDocumentName"/>
									</td>
									<td class="bordered">
										<xsl:value-of select="gure:CustDocument/cat_ru:PrDocumentNumber"/>
									</td>

									<td class="bordered">
										<xsl:value-of select="gure:UsedAmount/gure:UAmount"/>
									</td>
									<td class="bordered">
										<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="gure:UsedAmount/gure:AmountDate"/></xsl:call-template>
									</td>
									<td class="bordered">
										<xsl:value-of select="gure:RefundAmount/gure:UAmount"/>
									</td>
									<td class="bordered">
										<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="gure:RefundAmount/gure:AmountDate"/></xsl:call-template>
									</td>
									<td class="bordered">
										<xsl:value-of select="gure:PenaltyAmount/gure:UAmount"/>
									</td>
									<td class="bordered">
										<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="gure:PenaltyAmount/gure:AmountDate"/></xsl:call-template>
									</td>

								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<xsl:apply-templates select="gure:ResumEnd"/>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="gure:ResumStart|gure:ResumEnd">
		<table>
			<tbody>
				<tr valign="top">
					<td class="bordered" valign="top" align="center" colspan="2">
						<b>
							<xsl:text>Сведения об использовании генерального обеспечения </xsl:text>
							<xsl:if test="local-name(.) = 'ResumStart'">на начало периода</xsl:if>
							<xsl:if test="local-name(.) = 'ResumEnd'">на дату</xsl:if>
							<xsl:text> формирования отчета</xsl:text>
						</b>
					</td>
				</tr>
				<tr valign="top">
					<td class="bordered" width="60%">Зарезервированная сумма генерального обеспечения</td>
					<td class="bordered" width="40%">
						<xsl:value-of select="gure:UsedAmount"/>
					</td>
				</tr>
				<tr valign="top">
					<td class="bordered">Свободный остаток генерального обеспечения</td>
					<td class="bordered">
						<xsl:value-of select="gure:AvailableAmount"/>
					</td>
				</tr>
				<tr valign="top">
					<td class="bordered">Сумма генерального обеспечения, на которую обращено взыскание таможенных пошлин, налогов</td>
					<td class="bordered">
						<xsl:value-of select="gure:PenaltyAmount"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="gure:CustDocument">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PrDocumentName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:PrDocumentName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:PrDocumentNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа gure:AmountDType -->
	<xsl:template match="gure:PenaltyAmount">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Учтенная сумма</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(gure:UAmount, '.', ',')"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата учета</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="gure:AmountDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа gure:AmountDType -->
	<xsl:template match="gure:RefundAmount">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Учтенная сумма</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(gure:UAmount, '.', ',')"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата учета</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="gure:AmountDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа gure:RegistrationNumberType -->
	<xsl:template match="gure:TRRegistrationNumber">
		<xsl:value-of select="gure:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="num_date">
			<xsl:with-param name="dateIn" select="gure:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="gure:Number"/>
	</xsl:template>
	<!-- Шаблон для типа gure:AmountDType -->
	<xsl:template match="gure:UsedAmount">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Учтенная сумма</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(gure:UAmount, '.', ',')"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата учета</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="gure:AmountDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа gure:UsedListType -->
	<xsl:template match="gure:UsedList">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер по порядку</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="gure:Number"/>
					</td>
				</tr>
			</table>
			<xsl:if test="gure:CustDocument">
				<div class="title marg-top">Документ, по которому осуществленно резервирование</div>
				<div>
					<xsl:apply-templates select="gure:CustDocument">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="gure:UsedAmount">
				<div class="title marg-top">Зарезервированная сумма  обеспечения</div>
				<div>
					<xsl:apply-templates select="gure:UsedAmount">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="gure:RefundAmount">
				<div class="title marg-top">Разрарезервированная сумма  обеспечения</div>
				<div>
					<xsl:apply-templates select="gure:RefundAmount">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="gure:PenaltyAmount">
				<div class="title marg-top">Сумма обеспечения, на которую обращено взыскание таможенных пошлин и налогов</div>
				<div>
					<xsl:apply-templates select="gure:PenaltyAmount">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
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
