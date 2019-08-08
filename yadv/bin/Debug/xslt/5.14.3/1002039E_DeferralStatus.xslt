<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:defs="urn:customs.ru:Information:CommercialFinanceDocuments:DeferralStatus:5.14.3">
	<!-- Шаблон для типа DeferralStatusType -->
	<xsl:template match="defs:DeferralStatus">
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
										<xsl:choose>
											<xsl:when test="defs:DocType='0'">
												<b>Cтатус Решения о предоставлении отсрочки или рассрочки уплаты ввозных таможенных пошлин, налогов</b>
											</xsl:when>
											<xsl:when test="defs:DocType='1'">
												<b>Результат резервирования сумм по Решению</b>
											</xsl:when>
										</xsl:choose>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="defs:ResType">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Результат резервирования</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="defs:ResType='0'">
											<xsl:text>успешное резервирование</xsl:text>
										</xsl:when>
										<xsl:when test="defs:ResType='1'">
											<xsl:text>отказ в резервировании</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="defs:ResType"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="defs:ResCode">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Код ошибки резервирования</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="defs:ResCode"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="defs:ResCodeDesc">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Описание ошибки резервирования</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="defs:ResCodeDesc"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Признак блокировки Решения</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="defs:BlockStatus='0'">
										<xsl:text>действует</xsl:text>
									</xsl:when>
									<xsl:when test="defs:BlockStatus='1'">
										<xsl:text>заблокировано</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="defs:BlockStatus"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="defs:BlockDate">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Дата блокировки Решения</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="defs:BlockDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<br/>
					<table>
						<tr>
							<td class="title marg-top" style="width:50%">Регистрационный номер Решения</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="defs:DecisionRegNumber">
									<xsl:with-param name="wdth" select="$w"/>
								</xsl:apply-templates>
							</td>
						</tr>
					</table>
					<br/>
					<xsl:if test="defs:DTNumber">
						<table>
							<tr>
								<td valign="top" class="title marg-top" style="width:50%">Регистрационные номера ДТ, по которым ранее было проведено резервирование по Решению</td>
								<td style="width:50%">
									<table>
										<tbody>
											<xsl:for-each select="defs:DTNumber">
												<tr>
													<td class="value graphMain">
														<xsl:apply-templates select="."/>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="defs:BeforeAmount">
						<div class="title marg-top">Исходный остаток до резервирования</div>
						<div>
							<xsl:apply-templates select="defs:BeforeAmount">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="defs:AfterAmount">
						<div class="title marg-top">Остаток в результате планируемого / совершенного резервирования</div>
						<div>
							<xsl:apply-templates select="defs:AfterAmount">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа defs:PaymentType -->
	<xsl:template match="defs:AfterAmount">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="defs:ImportCustomsDuty">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Остаток суммы по ввозной таможенной пошлине (+.-)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="translate(defs:ImportCustomsDuty, '.', ',')"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="defs:Excise">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Остаток суммы акцизов (+.-)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="translate(defs:Excise, '.', ',')"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="defs:ValueAddedTax">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Остаток суммы НДС (+.-)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="translate(defs:ValueAddedTax, '.', ',')"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа defs:PaymentType -->
	<xsl:template match="defs:BeforeAmount">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="defs:ImportCustomsDuty">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Остаток суммы по ввозной таможенной пошлине (+.-)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="translate(defs:ImportCustomsDuty, '.', ',')"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="defs:Excise">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Остаток суммы акцизов (+.-)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="translate(defs:Excise, '.', ',')"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="defs:ValueAddedTax">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Остаток суммы НДС (+.-)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="translate(defs:ValueAddedTax, '.', ',')"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="defs:DTNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date_gtd">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа defs:DecisionRegNumberType -->
	<xsl:template match="defs:DecisionRegNumber">
		<xsl:value-of select="defs:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date_gtd">
			<xsl:with-param name="dateIn" select="defs:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="defs:AbbTermsPay"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="defs:AbbBasis"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="defs:SerialNumberPrefix"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="defs:SerialNumber"/>
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