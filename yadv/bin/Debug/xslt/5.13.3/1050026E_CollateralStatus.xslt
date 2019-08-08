<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asgcat_ru="urn:customs.ru:ASG_CommonAggregateTypes:5.13.3" xmlns:asgclt_ru="urn:customs.ru:ASG_CommonLeafTypes:5.13.2" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:clltrl_stat="urn:customs.ru:CollateralStatus:5.13.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа CollateralStatusType -->
	<xsl:template match="clltrl_stat:CollateralStatus">
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
									max-width:100%;
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
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>Уведомление об изменении сведений в использованном обеспечении</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата и время создания/изменения электронного документа.</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="clltrl_stat:DocumentDateTime"/>
								</xsl:call-template>
								<xsl:text> </xsl:text>
								<xsl:value-of select="substring(clltrl_stat:DocumentDateTime,12,8)"/>
							</td>
						</tr>
					</table>
					<xsl:if test="clltrl_stat:CollateralInfo">
						<div class="title marg-top">Информация об обеспечении</div>
					</xsl:if>
					<xsl:apply-templates select="clltrl_stat:CollateralInfo"/>
					<xsl:if test="clltrl_stat:Status">
						<div class="title marg-top">Статусное состояние обеспечения</div>
					</xsl:if>
					<xsl:apply-templates select="clltrl_stat:Status"/>
					<xsl:if test="clltrl_stat:ChangeInfo"/>
					<xsl:if test="clltrl_stat:ChangeInfo">
						<div class="title marg-top">Информация об изменениях в обеспечении</div>
					</xsl:if>
					<xsl:apply-templates select="clltrl_stat:ChangeInfo"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:AmountType -->
	<xsl:template match="asgcat_ru:Amount">
		<xsl:value-of select="translate(translate(format-number(RUScat_ru:Amount, '#,###.00'), ',', ' '), '.', ',')"/>&#160;
		<xsl:apply-templates mode="currencyCode" select="RUScat_ru:CurrencyCode"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="asgcat_ru:CBRLicense">
		<xsl:if test="cat_ru:PrDocumentName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PrDocumentName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PrDocumentNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<table class="w190">
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
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="asgcat_ru:ChangeDocument">
		<xsl:if test="cat_ru:PrDocumentName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PrDocumentName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PrDocumentNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<table class="w190">
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
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="asgcat_ru:Customs">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:Code"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:OfficeName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OfficeName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа asgcat_ru:CustomsOrderInfoType -->
	<xsl:template match="asgcat_ru:CustomsOrderInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Тип документа обеспечения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="asgcat_ru:CustomsOrderKind=5">
							<xsl:text>ТПО</xsl:text>
						</xsl:when>
						<xsl:when test="asgcat_ru:CustomsOrderKind=6">
							<xsl:text>ТР</xsl:text>
						</xsl:when>
						<xsl:when test="asgcat_ru:CustomsOrderKind=7">
							<xsl:text>Дополнение к договору поручительства</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="asgcat_ru:CustomsOrderKind"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер подтверждающего документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="asgcat_ru:CustomsOrderNumber"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа, в котором зарегистрирован документ.</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="asgcat_ru:CustomsOrderCustomsCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации подтверждающего документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="asgcat_ru:CustomsOrderDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа asgcat_ru:DocInfoType -->
	<xsl:template match="asgcat_ru:DebtDoc">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:PrDocumentName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="asgcat_ru:DocKind=1">
						<xsl:text>Информация о расходовании денежных средств</xsl:text>
					</xsl:when>
					<xsl:when test="asgcat_ru:DocKind=2">
						<xsl:text>Информация о взыскании</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="asgcat_ru:DocKind"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="asgcat_ru:Amount"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа asgcat_ru:BankOrganizationType -->
	<xsl:template match="asgcat_ru:Guarantor">
		<xsl:if test="asgcat_ru:CBRLicense"/>
		<xsl:if test="asgcat_ru:CBRLicense">
			<div class="title marg-top">Лицензия ЦБ</div>
		</xsl:if>
		<xsl:apply-templates select="asgcat_ru:CBRLicense"/>
	</xsl:template>
	<!-- Шаблон для типа asgcat_ru:ObligationTypeInfoType -->
	<xsl:template match="asgcat_ru:ObligationTypeInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код вида обязательства</td>
				<td class="graphMain value" style="width:50%">
					<xsl:for-each select="asgcat_ru:ObligationCode">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа asgcat_ru:ChangeInfoType -->
	<xsl:template match="clltrl_stat:ChangeInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата внесения изменений</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="asgcat_ru:ChangeDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<xsl:if test="asgcat_ru:ChangeReason">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Причина внесения изменений</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="asgcat_ru:ChangeReason"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="asgcat_ru:ChangeStartDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата вступления изменений в силу</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="asgcat_ru:ChangeStartDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="asgcat_ru:ChangeDocument"/>
		<xsl:if test="asgcat_ru:ChangeDocument">
			<div class="title marg-top">Документ на основании которого были внесены изменения</div>
		</xsl:if>
		<xsl:apply-templates select="asgcat_ru:ChangeDocument"/>
		<xsl:if test="asgcat_ru:Customs"/>
		<xsl:if test="asgcat_ru:Customs">
			<div class="title marg-top">Таможенный орган, внесший изменения</div>
		</xsl:if>
		<xsl:apply-templates select="asgcat_ru:Customs"/>
	</xsl:template>
	<!-- Шаблон для типа asgcat_ru:CollateralType -->
	<xsl:template match="clltrl_stat:CollateralInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код способа обеспечения по классификатору НСИ.</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="asgcat_ru:GuaranteeType"/>
				</td>
			</tr>
		</table>
		<xsl:if test="asgcat_ru:GuaranteeKind">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Тип документа обеспечения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="asgcat_ru:GuaranteeKind=1">
								<xsl:text>Денежный залог</xsl:text>
							</xsl:when>
							<xsl:when test="asgcat_ru:GuaranteeKind=2">
								<xsl:text>Банковская гарантия</xsl:text>
							</xsl:when>
							<xsl:when test="asgcat_ru:GuaranteeKind=3">
								<xsl:text>Залог имущества</xsl:text>
							</xsl:when>
							<xsl:when test="asgcat_ru:GuaranteeKind=4">
								<xsl:text>Договор поручительства</xsl:text>
							</xsl:when>
							<xsl:when test="asgcat_ru:GuaranteeKind=5">
								<xsl:text>Дополнение к договору поручительства (245)</xsl:text>
							</xsl:when>
							<xsl:when test="asgcat_ru:GuaranteeKind=6">
								<xsl:text>Дополнение к договору поручительства (397)</xsl:text>
							</xsl:when>
							<xsl:when test="asgcat_ru:GuaranteeKind=7">
								<xsl:text>Договор поручительства в рамках генерального</xsl:text>
							</xsl:when>
							<xsl:when test="asgcat_ru:GuaranteeKind=8">
								<xsl:text>иное обеспечение</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="asgcat_ru:GuaranteeKind"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Признак генерального обеспечения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="asgcat_ru:IsGeneral='true'">
							<xsl:text>есть</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>нет</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Регистрационный номер обеспечения.</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="asgcat_ru:GuaranteeRegNumber"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации  документа.</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="asgcat_ru:GuaranteeRegDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа, в котором зарегистрировано обеспечение.</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="asgcat_ru:GuaranteeCustomCode"/>
				</td>
			</tr>
		</table>
		<xsl:if test="asgcat_ru:GuaranteeOriginalNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Оригинальный номер обеспечения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="asgcat_ru:GuaranteeOriginalNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="asgcat_ru:GuaranteeOriginalDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата обеспечения (дата заключения договора, дата гарантии)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="asgcat_ru:GuaranteeOriginalDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата начала действия</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="asgcat_ru:GuaranteeStartDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<xsl:if test="asgcat_ru:GuaranteeSubmitDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата предоставления обеспечения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="asgcat_ru:GuaranteeSubmitDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="asgcat_ru:GuaranteeExpireDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Срок действия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="asgcat_ru:GuaranteeExpireDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="asgcat_ru:GuaranteeActualExpireDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата фактического завершения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="asgcat_ru:GuaranteeActualExpireDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Цифровой код валюты обеспечения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="asgcat_ru:GuaranteeCurrencyCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Сумма обеспечения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(asgcat_ru:GuaranteeAmount, '.', ',')"/>
				</td>
			</tr>
		</table>
		<xsl:if test="asgcat_ru:UsedAmount">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Атрибут содержит  общую сумму неисполненных обязательств в валюте обеспечения, при условии, что информация об обязательствах присутствует в системе.</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(asgcat_ru:UsedAmount, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="asgcat_ru:AvailableAmount">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Атрибут содержит доступную для использования таможенным органом сумму</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(asgcat_ru:AvailableAmount, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="asgcat_ru:ObligationTypeInfo"/>
		<xsl:if test="asgcat_ru:ObligationTypeInfo">
			<div class="title marg-top">Информация о видах обязательств</div>
		</xsl:if>
		<xsl:apply-templates select="asgcat_ru:ObligationTypeInfo"/>
		<xsl:if test="asgcat_ru:CustomsOrderInfo"/>
		<xsl:if test="asgcat_ru:CustomsOrderInfo">
			<div class="title marg-top">Информация о документах подтверждающих предоставление обеспечения</div>
		</xsl:if>
		<xsl:apply-templates select="asgcat_ru:CustomsOrderInfo"/>
		<xsl:if test="asgcat_ru:Guarantor"/>
		<xsl:if test="asgcat_ru:Guarantor">
			<div class="title marg-top">Информация об организации-гаранте</div>
		</xsl:if>
		<xsl:apply-templates select="asgcat_ru:Guarantor"/>
		<xsl:if test="asgcat_ru:DebtDoc">
			<div class="title marg-top">Информация о расходовании денежных средств, принятых в качестве обеспечения/ Информация о взыскании</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Наименование документа</td>
						<td class="graphMain bordered">Номер документа</td>
						<td class="graphMain bordered">Дата документа</td>
						<td class="graphMain bordered">Вид информации</td>
						<td class="graphMain bordered">Сумма списанных средств/ сумма средств, взысканных за счет обеспечения</td>
					</tr>
					<xsl:for-each select="asgcat_ru:DebtDoc">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="asgcat_ru:RequisitesLetterIn">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Реквизиты входящего письма ФТС России</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="asgcat_ru:RequisitesLetterIn"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="asgcat_ru:RequisitesLetterOut">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Реквизиты исходящего письма</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="asgcat_ru:RequisitesLetterOut"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="asgcat_ru:GuaranteeFormat">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Признак выдачи банковской гарантии</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="asgcat_ru:GuaranteeFormat=0">
								<xsl:text>в бумажном виде</xsl:text>
							</xsl:when>
							<xsl:when test="asgcat_ru:GuaranteeFormat=1">
								<xsl:text>в электронном виде</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="asgcat_ru:GuaranteeFormat"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="asgcat_ru:SecurityStatus">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Статус обеспечения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="asgcat_ru:SecurityStatus"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа asgcat_ru:StatusType -->
	<xsl:template match="clltrl_stat:Status">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование статусного состояния</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="asgcat_ru:Name"/>
				</td>
			</tr>
		</table>
		<xsl:if test="asgcat_ru:Reason">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Причина перехода в статусное состояние</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="asgcat_ru:Reason"/>
					</td>
				</tr>
			</table>
		</xsl:if>
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
