<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:grn_cat="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeCommonAggregateTypesCust:5.13.1" xmlns:grn_bnki="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeBankInfo:5.13.2">
	<!-- Шаблон для типа GuaranteeBankInfoType -->
	<xsl:decimal-format name="spaces" decimal-separator="," grouping-separator=" "/>
	<xsl:template match="grn_bnki:GuaranteeBankInfo">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					}

					div
					{
					white-space: nowrap;
					}

					div.page {
					width: 270mm;
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
					font-size: 10pt;
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
										<b>Сведения о принятых банковских гарантиях</b>
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
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:30%">ИНН банка</td>
							<td class="value graphMain" style="width:70%">
								<xsl:value-of select="grn_bnki:BankINN"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:30%">Период, в который приняты гарантии</td>
							<td class="value graphMain" style="width:70%">
								<xsl:apply-templates select="grn_bnki:PeriodAcceptedGuarantee"/>
							</td>
						</tr>
					</table>
					<xsl:if test="grn_bnki:GuaranteeInformation">
						<div class="title marg-top">Сведения о банковских гарантиях, принятых за указанный в запросе период</div>
						<table class="bordered w190">
							<tr class="title">
								<td class="graphMain bordered" style="vertical-align: middle">Сведения о банковской гарантии</td>
								<td class="graphMain bordered" style="vertical-align: middle">Гарант</td>
								<td class="graphMain bordered" style="vertical-align: middle">Номер предшествующей банковской гарантии</td>
								<xsl:if test="//grn_cat:ConsentDebiting">
									<td class="graphMain bordered" style="vertical-align: middle">Согласие гаранта на беспорное списание таможенным органом причитающейся суммы в случае неисполнения гарантом обязательств по банковской гарантии</td>
								</xsl:if>
								<xsl:if test="//grn_cat:ConsentPayment">
									<td class="graphMain bordered" style="vertical-align: middle">Согласие гаранта уплатить таможенному органу неустойку в размере 0,1 процента суммы, подлежащей уплате за каждый календарный день просрочки</td>
								</xsl:if>
								<xsl:if test="//grn_cat:ConsentGuarantor">
									<td class="graphMain bordered" style="vertical-align: middle">Согласие гаранта по банковской гарантии, что исполнением обязательств является фактическое поступление денежных средств на счет Федерального казначейства и (или) на счет, определенный международным договором государств - членов ТС</td>
								</xsl:if>
								<td class="graphMain bordered" style="vertical-align: middle">Сумма банковской гарантии и код валюты</td>
								<td class="graphMain bordered" style="vertical-align: middle">Информация о видах обязательств</td>
								<td class="graphMain bordered" style="vertical-align: middle">Информация об исполнении (прекращении) обязательств</td>
							</tr>
							<xsl:for-each select="grn_bnki:GuaranteeInformation">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа grn_bnki:GuaranteeInformationType -->
	<xsl:template match="grn_bnki:GuaranteeInformation">
		<tr>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="grn_cat:IrrevocableSign=0">безотзывная </xsl:when>
					<xsl:when test="grn_cat:IrrevocableSign=1">отзывная </xsl:when>
				</xsl:choose>
				<xsl:text>банковская гарантия № </xsl:text>
				<xsl:value-of select="grn_cat:GuaranteeOriginalNumber"/>
				<xsl:text> от </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="grn_cat:GuaranteeOriginalDate"/>
				</xsl:call-template>
				<xsl:choose>
					<xsl:when test="grn_cat:GuaranteeFormat=0"> в бумажном виде</xsl:when>
					<xsl:when test="grn_cat:GuaranteeFormat=1"> в электронном виде</xsl:when>
				</xsl:choose>
				<br/>
				<xsl:text> период действия: с </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="grn_cat:StartDate"/>
				</xsl:call-template>
				<xsl:text> по </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="grn_cat:ExpireDate"/>
				</xsl:call-template>
				<br/>
				<xsl:choose>
					<xsl:when test="grn_cat:GuaranteeType=0">Простое обеспечение<br/>
					</xsl:when>
					<xsl:when test="grn_cat:GuaranteeType=1">Генеральное обеспечение<br/>
					</xsl:when>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="grn_cat:RenewalGuarantee=0">не переоформляется (не заменяется)</xsl:when>
					<xsl:when test="grn_cat:RenewalGuarantee=1">переоформляется (заменяется)</xsl:when>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="grn_bnki:OrgShortName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="grn_cat:OldGuaranteeNumber"/>
			</td>
			<xsl:if test="//grn_cat:ConsentDebiting">
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="grn_cat:ConsentDebiting=0">согласен</xsl:when>
						<xsl:when test="grn_cat:ConsentDebiting=1">не согласен</xsl:when>
					</xsl:choose>
				</td>
			</xsl:if>
			<xsl:if test="//grn_cat:ConsentPayment">
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="grn_cat:ConsentPayment=0">согласен</xsl:when>
						<xsl:when test="grn_cat:ConsentPayment=1">не согласен</xsl:when>
					</xsl:choose>
				</td>
			</xsl:if>
			<xsl:if test="//grn_cat:ConsentGuarantor">
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="grn_cat:ConsentGuarantor=0">согласен</xsl:when>
						<xsl:when test="grn_cat:ConsentGuarantor=1">не согласен</xsl:when>
					</xsl:choose>
				</td>
			</xsl:if>
			<td class="graphMain bordered">
				<xsl:apply-templates select="grn_cat:GuaranteeAmount"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="grn_cat:ObligationTypeInfo"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="grn_bnki:StatusObligation=0 or grn_bnki:StatusObligation='false'">действует</xsl:when>
					<xsl:when test="grn_bnki:StatusObligation=1 or grn_bnki:StatusObligation='true'">исполнено</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="grn_bnki:StatusObligation"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа grn_bnki:PeriodAcceptedGuaranteeType -->
	<xsl:template match="grn_bnki:PeriodAcceptedGuarantee">
		<xsl:text>с </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="grn_bnki:BeginDate"/>
		</xsl:call-template>
		<xsl:text> по </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="grn_bnki:EndDate"/>
		</xsl:call-template>
	</xsl:template>
	<!-- Шаблон для типа grn_cat:AmountType -->
	<xsl:template match="grn_cat:GuaranteeAmount">
		<xsl:value-of select="format-number(grn_cat:Amount, '# ###,##', 'spaces')"/>
		<xsl:text>  </xsl:text>
		<xsl:apply-templates mode="currencyCode" select="grn_cat:CurrencyCode"/>
	</xsl:template>
	<!-- Шаблон для типа grn_cat:ObligationTypeInfoType -->
	<xsl:template match="grn_cat:ObligationTypeInfo">
		<xsl:for-each select="grn_cat:ObligationCode">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
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
