<?xml version="1.0" encoding="UTF-8"?>
<!-- Решение Коллегии Евразийской экономической комиссии от 06.11.2014 № 199, + письмо ГУИТ от 09.12.2016 № 14-147/0136  -->
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:minprl="urn:customs.ru:Information:SQDocuments:MinPromLicence:5.13.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:decimal-format name="spaces" decimal-separator="," grouping-separator=" "/>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="minprl:MinPromLicence">
		<html>
			<head>
				<title>Ответ на запрос сведений о лицензии на ввоз/вывоз товара с территории Таможенного союза</title>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style type="text/css">
				body {
					background: #cccccc;
				}

				div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}

				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}
				
				.remark {
					text-align:right;
					font: 15;
					font-family: Times New Roman;
					text-decoration: underline;
				}
				
				.header {
					font: 12;
					font-family: Times New Roman;
					font-weight:bold;
				}
				
				table {
					width: 100%;
					border-collapse: collapse;
				}

				.signature {
					font-family: Arial, serif;
					font: 10;
					border-bottom: 0;
					border-right: 0;
					border-left: 0;
				}
				.bordered{
					border:1px solid black;
				}
				.arial{
					font-family: Arial;
				}
			</style>
			</head>
			<body>
				<div class="page">
					<xsl:variable name="typeLic" select="translate(minprl:License/minprl:LicOperation,'имэкспорт','ИМЭКСПОРТ')"/>
					<table class="w190" cellpadding="3">
						<tr class="header">
							<td class="bordered" colspan="6" align="center">МИНИСТЕРСТВО ПРОМЫШЛЕННОСТИ И ТОРГОВЛИ РОССИЙСКОЙ ФЕДЕРАЦИИ</td>
						</tr>
						<tr valign="top">
							<td class="bordered" colspan="3">
								1. Лицензия<br/>
								<span class="arial">
									№ <xsl:value-of select="minprl:License/minprl:Licence/cat_ru:PrDocumentNumber"/>
								</span>
							</td>
							<td class="bordered" colspan="3">
								2. Период действия<br/>
								<span class="arial">
									<xsl:if test="minprl:License/minprl:StartDate">
										<xsl:text>c </xsl:text>
										<xsl:apply-templates mode="russian_date" select="minprl:License/minprl:StartDate"/>
									</xsl:if>
									<xsl:if test="minprl:License/minprl:DateTo">
										<xsl:text> по </xsl:text>
										<xsl:apply-templates mode="russian_date" select="minprl:License/minprl:DateTo"/>
									</xsl:if>
								</span>
								<xsl:if test="minprl:IsCanceled">
									<br/>
									<xsl:choose>
										<xsl:when test="minprl:IsCanceled=true()"><b><span class="arial" style="color: green;">действителен</span></b></xsl:when>
										<xsl:when test="minprl:IsCanceled=false()"><b><span class="arial" style="color: red;">не действителен</span></b></xsl:when>
									</xsl:choose>
								</xsl:if>
							</td>
						</tr>
						<tr valign="top">
							<td class="bordered" colspan="3" style="border-bottom:0; width:50%">3. Тип лицензии</td>
							<td class="bordered" colspan="3" style="border-bottom:0; width:50%">4. Контракт</td>
						</tr>
						<tr valign="top">
							<td class="bordered" style="border-top:0; width:25%" align="center">
								<xsl:value-of select="minprl:License/minprl:LicType"/>
							</td>	
							<td class="bordered" colspan="2" style="border-top:0; width:25%" align="center">
								<xsl:value-of select="$typeLic"/>
							</td>
							<td class="bordered" colspan="3" style="border-top:0; width:50%">
								<span class="arial">
									<xsl:text>№ </xsl:text>
									<xsl:choose>
										<xsl:when test="minprl:Contract/cat_ru:PrDocumentNumber"><xsl:value-of select="minprl:Contract/cat_ru:PrDocumentNumber"/></xsl:when>
										<xsl:otherwise>б/н</xsl:otherwise>
									</xsl:choose>
									<xsl:if test="minprl:Contract/cat_ru:PrDocumentDate">
										<xsl:text> от </xsl:text>
										<xsl:apply-templates mode="russian_date" select="minprl:Contract/cat_ru:PrDocumentDate"/>
									</xsl:if>
								</span>
							</td>
						</tr>
						<tr valign="top">
							<td class="bordered" colspan="2" style="border-bottom:0; width:38%">5. Заявитель</td>
							<td class="bordered" style="border-bottom:0; width:12%" align="center">
								<span class="arial">
									<xsl:choose>
										<xsl:when test="minprl:License/minprl:Holder/cat_ru:RFOrganizationFeatures">
											<xsl:value-of select="minprl:License/minprl:Holder/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
										</xsl:when>
										<xsl:when test="minprl:License/minprl:Holder/cat_ru:RKOrganizationFeatures">
											<xsl:value-of select="minprl:License/minprl:Holder/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
										</xsl:when>
										<xsl:when test="minprl:License/minprl:Holder/cat_ru:RBOrganizationFeatures">
											<xsl:value-of select="minprl:License/minprl:Holder/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
										</xsl:when>
										<xsl:when test="minprl:License/minprl:Holder/cat_ru:RAOrganizationFeatures">
											<xsl:value-of select="minprl:License/minprl:Holder/cat_ru:RAOrganizationFeatures/cat_ru:UNN"/>
										</xsl:when>
										<xsl:when test="minprl:License/minprl:Holder/cat_ru:KGOrganizationFeatures">
											<xsl:value-of select="minprl:License/minprl:Holder/cat_ru:KGOrganizationFeatures/cat_ru:KGINN"/>
										</xsl:when>
									</xsl:choose>
								</span>
							</td>
							<td class="bordered" colspan="3" style="border-bottom:0; width:50%">
								<xsl:choose>
									<xsl:when test="substring($typeLic,1,1)='И'">6. Продавец</xsl:when>
									<xsl:when test="substring($typeLic,1,1)='Э'">6. Покупатель</xsl:when>
									<xsl:otherwise>6. Продавец / Покупатель</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr valign="top" style="height:30mm">
							<td class="bordered" colspan="3" style="border-top:0; width:50%">
								<xsl:apply-templates mode="company" select="minprl:License/minprl:Holder"/>
							</td>
							<td class="bordered" colspan="3" style="border-top:0; width:50%">
								<xsl:apply-templates mode="company" select="minprl:Dealer"/>
							</td>
						</tr>
						<tr valign="top">
							<td class="bordered" colspan="2" style="border-bottom:0; width:38%">
								<xsl:choose>
									<xsl:when test="substring($typeLic,1,1)='И'">7. Страна отправления</xsl:when>
									<xsl:when test="substring($typeLic,1,1)='Э'">7. Страна назначения</xsl:when>
									<xsl:otherwise>7. Страна отправления / назначения</xsl:otherwise>
								</xsl:choose>
							</td>
							<td class="bordered" style="border-bottom:0; width:12%" align="center">
								<span class="arial"><xsl:value-of select="minprl:Country7Info/minprl:CountryAlpha2"/></span>
							</td>
							<td class="bordered" colspan="2" style="border-bottom:0; width:38%">
								<xsl:choose>
									<xsl:when test="substring($typeLic,1,1)='И'">8. Страна продавца</xsl:when>
									<xsl:when test="substring($typeLic,1,1)='Э'">8. Страна покупателя</xsl:when>
									<xsl:otherwise>8. Страна продавца / покупателя</xsl:otherwise>
								</xsl:choose>
							</td>
							<td class="bordered" style="border-bottom:0; width:12%" align="center">
								<span class="arial">
									<xsl:if test="minprl:Dealer/minprl:DealerAddress/RUScat_ru:CountryCode!='EU'">
										<xsl:value-of select="minprl:Dealer/minprl:DealerAddress/RUScat_ru:CountryCode"/>
									</xsl:if>
								</span>
							</td>
						</tr>
						<tr valign="top">
							<td class="bordered" colspan="3" style="border-top:0; width:50%">
								<span class="arial"><xsl:value-of select="minprl:Country7Info/minprl:CountryName"/></span>
							</td>
							<td class="bordered" colspan="3" style="border-top:0; width:50%">
								<span class="arial">
									<xsl:choose>
										<xsl:when test="minprl:Dealer/minprl:DealerAddress/RUScat_ru:CounryName">
											<xsl:value-of select="minprl:Dealer/minprl:DealerAddress/RUScat_ru:CounryName"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="minprl:Dealer/minprl:DealerAddress/RUScat_ru:CountryCode='EU'">Страны ЕС</xsl:if> 
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</td>
						</tr>
						<tr valign="top">
							<td class="bordered" colspan="2" style="border-bottom:0; width:38%">9. Валюта контракта</td>
							<td class="bordered" style="border-bottom:0; width:12%" align="center">
								<span class="arial"><xsl:value-of select="minprl:Cost/minprl:ContractCurrencyCode"/></span>
							</td>
							<td class="bordered" style="border-bottom:0; width:20%">10. Стоимость</td>
							<td class="bordered" colspan="2" style="border-bottom:0; width:30%">11. Статистическая стоимость</td>
						</tr>
						<tr valign="top">
							<td class="bordered" colspan="3" style="border-top:0; width:50%">
								<span class="arial"><xsl:value-of select="minprl:Cost/minprl:ContractCurrencyName"/></span>
							</td>
							<td class="bordered" style="border-top:0; width:20%" align="center">
								<span class="arial">
									<xsl:choose>
										<xsl:when test="minprl:Cost/minprl:CurrencyCost &gt; 0">
											<xsl:value-of select="format-number(minprl:Cost/minprl:CurrencyCost, '# ###,##', 'spaces')"/>
										</xsl:when>
										<xsl:otherwise>0</xsl:otherwise>
									</xsl:choose>
								</span>
							</td>
							<td class="bordered" colspan="2" style="border-top:0; width:30%" align="center">
								<span class="arial">
									<xsl:choose>
										<xsl:when test="minprl:Cost/minprl:StatCost &gt; 0">
											<xsl:value-of select="format-number(minprl:Cost/minprl:StatCost, '# ###,##', 'spaces')"/>
										</xsl:when>
										<xsl:otherwise>0</xsl:otherwise>
									</xsl:choose>
								</span>
							</td>
						</tr>
						<tr valign="top">
							<td class="bordered" colspan="2" style="border-bottom:0; width:38%">12. Страна происхождения</td>
							<td class="bordered" style="border-bottom:0; width:12%" align="center">
								<span class="arial">
									<xsl:choose>
										<xsl:when test="minprl:OriginCountry/minprl:CountryAlpha2='EU' or minprl:OriginCountry/minprl:CountryAlpha2='00' or minprl:OriginCountry/minprl:CountryAlpha2='99'">&#160;</xsl:when>
										<xsl:otherwise><xsl:value-of select="minprl:OriginCountry/minprl:CountryAlpha2"/></xsl:otherwise>
									</xsl:choose>
								</span>	
							</td>
							<td class="bordered" style="border-bottom:0; width:20%">13. Количество</td>
							<td class="bordered" colspan="2" style="border-bottom:0; width:30%">14. Единица измерения</td>
						</tr>
						<tr valign="top">
							<td class="bordered" colspan="3" style="border-top:0; width:50%">
								<span class="arial">
									<xsl:choose>
										<xsl:when test="minprl:OriginCountry/minprl:CountryName"><xsl:value-of select="minprl:OriginCountry/minprl:CountryName"/></xsl:when>
										<xsl:when test="minprl:OriginCountry/minprl:CountryAlpha2='EU'">Страны ЕС</xsl:when>
										<xsl:when test="minprl:OriginCountry/minprl:CountryAlpha2='00' or minprl:OriginCountry/minprl:CountryAlpha2='99'">В соответствии с условиями контрактов (договоров)</xsl:when>
									</xsl:choose>
								</span>
							</td>
							<td class="bordered" style="border-top:0; width:20%" align="center">
								<span class="arial">
									<xsl:choose>
										<xsl:when test="minprl:Quantity/cat_ru:GoodsQuantity &gt; 0">
											<xsl:value-of select="format-number(minprl:Quantity/cat_ru:GoodsQuantity, '# ###,#####', 'spaces')"/>
										</xsl:when>
										<xsl:otherwise>0</xsl:otherwise>
									</xsl:choose>
									<xsl:if test="minprl:AddQuantity">
										<br/>
										<xsl:choose>
											<xsl:when test="minprl:AddQuantity/cat_ru:GoodsQuantity &gt; 0">
												<xsl:value-of select="format-number(minprl:AddQuantity/cat_ru:GoodsQuantity, '# ###,#####', 'spaces')"/>
											</xsl:when>
											<xsl:otherwise>0</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
								</span>
							</td>
							<td class="bordered" colspan="2" style="border-top:0; width:30%" align="center">
								<span class="arial">
									<xsl:value-of select="minprl:Quantity/cat_ru:MeasureUnitQualifierName"/>
									<xsl:if test="minprl:AddQuantity">
										<br/><xsl:value-of select="minprl:AddQuantity/cat_ru:MeasureUnitQualifierName"/>
									</xsl:if>
								</span>
							</td>
						</tr>
						<tr valign="top">
							<td class="bordered" colspan="5" style="border-bottom:0; width:88%">15. Код товара по ЕТН ВЭД и его описание</td>
							<td class="bordered" style="border-bottom:0; width:12%" align="center">
								<span class="arial">
									<xsl:value-of select="minprl:NomenclatureCode"/>
								</span>
							</td>
						</tr>
						<tr valign="top" style="height:30mm">
							<td class="bordered" colspan="6" style="border-top:0">
								<span class="arial">
									<xsl:value-of select="minprl:NomenclatureDescription"/>
									<xsl:if test="minprl:Addendum">
										<br/>(см. приложение на&#160;<u>&#160;1&#160;</u>&#160;листе)
										<!--xsl:choose>
											<xsl:when test="minprl:Addendum &gt; 1"><u>&#160;<xsl:value-of select="minprl:AddendumTotalPages"/>&#160;</u>&#160;листах)</xsl:when>
											<xsl:otherwise><u>&#160;1&#160;</u>&#160;листе)</xsl:otherwise>
										</xsl:choose-->
									</xsl:if>
								</span>
							</td>
						</tr>
						<tr valign="top" style="height:30mm">
							<td class="bordered" colspan="6">
								16. Дополнительная информация<br/>
								<span class="arial">
									<xsl:value-of select="minprl:AddInfo"/>
								</span>
							</td>
						</tr>
						<tr valign="top">
							<td class="bordered" colspan="3" style="width:50%">
								17. Основание для выдачи лицензии<br/>
								<span class="arial">
									<xsl:for-each select="minprl:License/minprl:Reason">
										<xsl:value-of select="cat_ru:PrDocumentName"/>
										<xsl:if test="cat_ru:PrDocumentNumber">
											<xsl:text> № </xsl:text>
											<xsl:value-of select="cat_ru:PrDocumentNumber"/>
										</xsl:if>
										<xsl:if test="cat_ru:PrDocumentDate">
											<xsl:text> от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
										</xsl:if>
										<xsl:if test="position()!=last()"><br/></xsl:if>
									</xsl:for-each>
								</span>
							</td>
							<td class="bordered" colspan="3" style="width:50%">
								<xsl:apply-templates select="minprl:License/minprl:SignPerson" mode="sign"/>
							</td>
						</tr>
					</table>
				</div>
				<xsl:if test="minprl:Addendum">
					<div class="page">
						<table class="w190" cellpadding="3">
							<tr class="header">
								<td class="bordered" colspan="4" align="center">МИНИСТЕРСТВО ПРОМЫШЛЕННОСТИ И ТОРГОВЛИ РОССИЙСКОЙ ФЕДЕРАЦИИ</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="4" align="center">
									ПРИЛОЖЕНИЕ К ЛИЦЕНЗИИ № <span class="arial"><xsl:value-of select="minprl:License/minprl:Licence/cat_ru:PrDocumentNumber"/></span>
									&#160;ОТ <span class="arial"><xsl:apply-templates mode="russian_date" select="minprl:License/minprl:SignPerson/cat_ru:IssueDate"/></span>
								</td>
							</tr>
							<xsl:for-each select="minprl:Addendum">
								<tr valign="top">
									<td class="bordered" rowspan="4" style="width:5%" align="center"><xsl:value-of select="minprl:PositionNumber"/></td>
									<td class="bordered" style="border-bottom:0; width:45%">Описание товара</td>
									<td class="bordered" style="border-bottom:0; width:30%">Количество</td>
									<td class="bordered" style="border-bottom:0; width:20%">Единица измерения</td>
								</tr>
								<tr valign="top">
									<td class="bordered" rowspan="3" style="border-top:0; width:45%">
										<span class="arial"><xsl:apply-templates select="minprl:CommodityName"/></span>
									</td>
									<td class="bordered" style="border-top:0; width:30%" align="center">
										<span class="arial">
											<xsl:choose>
												<xsl:when test="minprl:LicAddendumMeasureItem/cat_ru:GoodsQuantity &gt; 0">
													<xsl:value-of select="format-number(minprl:LicAddendumMeasureItem/cat_ru:GoodsQuantity, '# ###,#####', 'spaces')"/>
												</xsl:when>
												<xsl:otherwise>0</xsl:otherwise>
											</xsl:choose>
										</span>
									</td>
									<td class="bordered" rowspan="3" style="border-top:0; width:20%" align="center">
										<span class="arial"><xsl:value-of select="minprl:LicAddendumMeasureItem/cat_ru:MeasureUnitQualifierName"/></span>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" style="border-bottom:0; width:30%">Стоимость</td>
								</tr>
								<tr valign="top">
									<td class="bordered" style="border-top:0; width:30%" align="center">
										<span class="arial"><xsl:value-of select="format-number(minprl:Cost, '# ###,##', 'spaces')"/></span>
									</td>
								</tr>
							</xsl:for-each>
							<tr valign="top">
								<td class="bordered" colspan="2" style="width:50%" align="center" valign="middle">
									<span class="arial">ЛИСТ 1 ВСЕГО ЛИСТОВ 1</span>
								</td>
								<td class="bordered" colspan="2" style="width:50%">
									<xsl:apply-templates select="minprl:License/minprl:SignPerson" mode="sign"/>
								</td>
							</tr>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="RUScat_ru:SubjectAddressDetails| minprl:DealerAddress">
		<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">
			<xsl:value-of select="RUScat_ru:CounryName"/>
			<xsl:if test="not(RUScat_ru:CounryName)"><xsl:value-of select="RUScat_ru:CountryCode"/></xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town or RUScat_ru:City">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Town"/>
			<xsl:if test="not(RUScat_ru:Town)"><xsl:value-of select="RUScat_ru:City"/></xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:Town or RUScat_ru:City">, </xsl:if>
			<xsl:value-of select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="RUScat_ru:House"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Room"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText and not(RUScat_ru:Region or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room)">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:AddressText"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:value-of select="RUScat_ru:CountryCode"/>
		<xsl:if test="cat_ru:IdentityCardName">
			<xsl:if test="RUScat_ru:CountryCode">, </xsl:if>
			<xsl:value-of select="cat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
			<xsl:if test="RUScat_ru:CountryCode or cat_ru:IdentityCardName">, </xsl:if>
			<xsl:if test="cat_ru:IdentityCardSeries">серия <xsl:value-of select="cat_ru:IdentityCardSeries"/>&#160;</xsl:if>
			<xsl:if test="cat_ru:IdentityCardNumber">№ <xsl:value-of select="cat_ru:IdentityCardNumber"/></xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<xsl:if test="RUScat_ru:CountryCode or cat_ru:IdentityCardName or cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">, </xsl:if>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="sign" match="*">
		18. Уполномоченное лицо<br/>
		<table>
			<tr>
				<td  style="width:25mm;">Ф.И.О.</td>
				<td colspan="2">
					<span class="arial">
						<xsl:value-of select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
						<xsl:text>.</xsl:text>
						<xsl:if test="cat_ru:PersonMiddleName">
							<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
							<xsl:text>.</xsl:text>
						</xsl:if>
					</span>
				</td>
			</tr>
			<tr>
				<td style="width:25mm;">Должность</td>
				<td colspan="2">
					<span class="arial"><xsl:value-of select="cat_ru:PersonPost"/></span>
				</td>
			</tr>
			<tr>
				<td style="width:25mm;">Подразделение</td>
				<td colspan="2">
					<span class="arial">
						<xsl:value-of select="../minprl:DepartmentShortName"/>
						<xsl:if test="../minprl:DepartmentCode"> (код: <xsl:value-of select="../minprl:DepartmentCode"/>)</xsl:if>
					</span>
				</td>
			</tr>
			<tr>
				<td colspan="3"><br/></td>
			</tr>
			<tr>
				<td colspan="2">Подпись и печать</td>
				<td  style="width:35mm">Дата 
					<span class="arial"><xsl:apply-templates mode="russian_date" select="cat_ru:IssueDate"/></span>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template mode="company" match="*">
		<span class="arial">
			<xsl:value-of select="cat_ru:OrganizationName"/>
			<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
				<xsl:value-of select="cat_ru:ShortName"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:SubjectAddressDetails or minprl:DealerAddress">
				<br/>
				<xsl:for-each select="RUScat_ru:SubjectAddressDetails| minprl:DealerAddress">
					<xsl:apply-templates select="."/>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="cat_ru:Address">
				<br/><xsl:apply-templates mode="address" select="cat_ru:Address|minprl:DealerAddress"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCard">
				<br/><xsl:apply-templates select="RUScat_ru:IdentityCard"/>
			</xsl:if>
		</span>
	</xsl:template>
	<xsl:template mode="address" match="*">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="russian_date" match="*">
		<xsl:choose>
			<xsl:when test="substring(.,5,1)='-' and substring(.,8,1)='-'">
				<xsl:value-of select="substring(.,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring(.,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring(.,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
