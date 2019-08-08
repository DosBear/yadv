<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:grn_cat="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeCommonAggregateTypesCust:5.13.1" xmlns:BnkInf="urn:customs.ru:Information:GuaranteeDocuments:BankInfo:5.13.3">
	<!-- Шаблон для типа BankInfoType -->
	<xsl:decimal-format name="spaces" decimal-separator="," grouping-separator=" "/>
	<xsl:template match="BnkInf:BankInfo">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					}

					div
					{
					/*white-space: nowrap;*/
					}

					div.page {
					width: 190mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
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
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>Сведения о кредитной организации</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<div class="title marg-top">Сведения о кредитной организации</div>
					<xsl:apply-templates select="BnkInf:BankInfo" mode="mode1"/>
					<xsl:if test="BnkInf:GuaranteeInformation">
						<div class="title marg-top">Сведения об установленных для банка максимальных суммах одной банковской гарантии и всех одновременно действующих на момент запроса банковских гарантий</div>
						<xsl:apply-templates select="BnkInf:GuaranteeInformation"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа grn_cat:AmountType -->
	<xsl:template match="BnkInf:ActualReceiveAmount| BnkInf:AllActualMaxAmount| BnkInf:OneMaxAmount| BnkInf:RestAmount| BnkInf:Amount15Start| BnkInf:Amount15End">
		<xsl:value-of select="format-number(grn_cat:Amount, '# ###,##', 'spaces')"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="currencyCode" select="grn_cat:CurrencyCode"/>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="BnkInf:Address">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text>Вид адреса - </xsl:text>
			<xsl:value-of select="RUScat_ru:AddressKindCode"/>
			<xsl:text>: </xsl:text>
		</xsl:if>
		<xsl:value-of select="RUScat_ru:PostalCode"/>
		<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">
			<xsl:if test="RUScat_ru:PostalCode">, </xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<xsl:if test="RUScat_ru:CounryName">(<xsl:value-of select="RUScat_ru:CountryCode"/>) </xsl:if>
				<xsl:value-of select="RUScat_ru:CounryName"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:value-of select="RUScat_ru:District"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Town"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town">, </xsl:if>
			<xsl:value-of select="RUScat_ru:City"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City">, </xsl:if>
			<xsl:value-of select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="RUScat_ru:House"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Room"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room">, </xsl:if>
			<xsl:value-of select="RUScat_ru:AddressText"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText">, </xsl:if>
			<xsl:text> номер а/я: </xsl:text>
			<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:TerritoryCode">
			<xsl:text>, (</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/>
			</xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="BnkInf:BankInfo" mode="mode1">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">ИНН банка</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="BnkInf:BankINN"/>
				</td>
			</tr>
		</table>
		<xsl:if test="BnkInf:BankName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Сокращенное наименование банка (филиала банка), учреждения Банка России</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="BnkInf:BankName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="BnkInf:Address">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="BnkInf:Address"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<br/>
		<xsl:if test="BnkInf:BICID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">БИК</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="BnkInf:BICID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="BnkInf:CorrAccount">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Корреспондентский счет</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="BnkInf:CorrAccount"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="BnkInf:BankAccount">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Расчетный счет</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="BnkInf:BankAccount"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="BnkInf:TransitCurrencyAccount">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Валютный счет</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="BnkInf:TransitCurrencyAccount"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="BnkInf:OKPOID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ОКПО организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="BnkInf:OKPOID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="BnkInf:CBRLicense">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Лицензия ЦБ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="BnkInf:CBRLicense"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="BnkInf:GuaranteeBankStatus">
			<div class="title marg-top">Статус банка</div>
			<xsl:apply-templates select="BnkInf:GuaranteeBankStatus"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="BnkInf:CBRLicense| BnkInf:ChangeOrder| BnkInf:FTSOrder">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа BnkInf:GuaranteeBankStatusType -->
	<xsl:template match="BnkInf:GuaranteeBankStatus">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Статус банка</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="BnkInf:BankStatus=0">документы на рассмотрении</xsl:when>
						<xsl:when test="BnkInf:BankStatus=1">включен</xsl:when>
						<xsl:when test="BnkInf:BankStatus=2">исключен</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="BnkInf:BankStatus"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<xsl:if test="BnkInf:FTSOrder">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Приказ ФТС о включении/исключении</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="BnkInf:FTSOrder"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="BnkInf:ChangeOrder">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Приказ о внесении изменений</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="BnkInf:ChangeOrder[1]"/>
					</td>
				</tr>
				<xsl:for-each select="BnkInf:ChangeOrder[position() &gt; 1]">
					<tr>
						<td class="annot graphMain" style="width:50%"/>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="."/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа BnkInf:GuaranteeInformationType -->
	<xsl:template match="BnkInf:GuaranteeInformation">
		<xsl:if test="BnkInf:OneMaxAmount">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Максимальная сумма одной банковской гарантии</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="BnkInf:OneMaxAmount"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="BnkInf:AllActualMaxAmount">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Максимальная сумма всех одновременно действующих банковских гарантий</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="BnkInf:AllActualMaxAmount"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="BnkInf:Amount15Start">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Cумма банковских гарантий, которые вступают в силу в течение 15 дней</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="BnkInf:Amount15Start"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="BnkInf:Amount15End">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Cумма банковских гарантий, которые прекращают свое действие в течение 15 дней</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="BnkInf:Amount15End"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="BnkInf:ActualReceiveAmount">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Общая сумма принятых и действующих на текущий момент банковских гарантий</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="BnkInf:ActualReceiveAmount"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="BnkInf:RestAmount">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Сумма, на которую банк может еще выдать гарантии (Максимальная сумма всех минус общая сумма принятых)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="BnkInf:RestAmount"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="BnkInf:SoftQuantity">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Количество принятых банковских гарантий, выданных в электронном виде</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="BnkInf:SoftQuantity"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="BnkInf:HardQuantity">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Количество принятых банковских гарантий, выданных на бумажном носителе</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="BnkInf:HardQuantity"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="currencyCode" match="*">
		<xsl:choose>
			<xsl:when test=".='643'">RUB</xsl:when>
			<xsl:when test=".='840'">USD</xsl:when>
			<xsl:when test=".='978'">EUR</xsl:when>
			<xsl:otherwise>
				<xsl:text>(код:</xsl:text>
				<xsl:value-of select="."/>
				<xsl:text>) </xsl:text>
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
