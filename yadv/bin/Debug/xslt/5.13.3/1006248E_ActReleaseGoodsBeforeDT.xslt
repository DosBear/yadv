<?xml version="1.0" encoding="utf-8"?>
<!-- Форма бланка из письма ГУИТ № 09-125/54006 от 24.10.2016 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.13.3" xmlns:acrgb="urn:customs.ru:Information:CustomsDocuments:ActReleaseGoodsBeforeDT:5.13.3">
	<!-- Шаблон для типа ActReleaseGoodsBeforeDTType -->
	<xsl:template match="acrgb:ActReleaseGoodsBeforeDT">
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
					<table>
						<tbody>
							<tr align="center">
								<td>
									ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА
								</td>
							</tr>
							<tr align="center">
								<td style="border-bottom:1px solid black;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:for-each select="acrgb:Customs/*">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr align="center">
								<td style="font-size:8pt;">
									(наименование таможенного поста)
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<br/>Акт
									<br/>проверки документов и сведений
									<br/>после выпуска до подачи таможенной декларации
									<br/>№ <xsl:value-of select="acrgb:DocNumber"/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td align="center" width="33%" style="border-bottom:1px solid black;">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="acrgb:ACTDate"/>
									</xsl:call-template>
								</td>
								<td width="34%"></td>
								<td align="center" width="33%" style="border-bottom:1px solid black;">
									<xsl:value-of select="acrgb:Location"/>
								</td>
							</tr>
							<tr align="center">
								<td style="font-size:8pt">(дата)</td>
								<td></td>
								<td style="font-size:8pt">(место составления)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>На основании статей 95, 111 Таможенного кодекса Таможенного союза проведена проверка документов и сведений, представленных уполномоченным экономическим оператором</td>
							</tr>
							<tr>
								<td style="border-bottom:1px solid black;" align="center">
									<xsl:apply-templates select="acrgb:DeclarantDetails"/>
								</td>
							</tr>
							<tr>
								<td style="font-size:8pt;" align="center">(наименование УЭО, ИНН, дата и номер свидетельства о включении в реестр УЭО)</td>
							</tr>
							<tr>
								<td>при выпуске товаров до подачи таможенной декларации в соответствии с обязательством о подаче таможенной декларации 
									<u> <xsl:apply-templates select="acrgb:AppNumber"/> </u>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									По результатам проведенного таможенного контроля
								</td>
							</tr>
							<tr>
								<td align="center">
									<br/>
									УСТАНОВЛЕН:
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									Факт нарушения срока подачи декларации на товары в отношении следующих товаров:
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr valign="middle">
												<td rowspan="2" style="border:1px solid black;">№ п/п</td>
												<td rowspan="2" style="border:1px solid black;">Наименование товара</td>
												<td rowspan="2" style="border:1px solid black;">Классификационный код товаров и транспортных средств в соответствии с ТН ВЭД</td>
												<td rowspan="2" style="border:1px solid black;">Стоимость товаров и транспортных средств, руб.</td>
												<td colspan="2" style="border:1px solid black;">Физические характеристики в натуральном выражении</td>
											</tr>
											<tr align="center">
												<td style="border:1px solid black;">Кол-во</td>
												<td style="border:1px solid black;">Ед. изм.</td>
											</tr>
											<xsl:for-each select="acrgb:Goods">
												<tr valign="top">
													<td style="border:1px solid black;"><xsl:value-of select="RUScat_ru:GoodsNumeric"/></td>
													<td style="border:1px solid black;"><xsl:for-each select="RUScat_ru:GoodsDescription"><xsl:value-of select="."/></xsl:for-each></td>
													<td style="border:1px solid black;"><xsl:value-of select="RUScat_ru:GoodsTNVEDCode"/></td>
													<td style="border:1px solid black;">
														<xsl:for-each select="acrgb:ValueAmount/*">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
														</xsl:for-each>
													</td>
													<td align="center" style="border:1px solid black;"><xsl:value-of select="acrgb:GoodsMeasureDetails/cat_ru:GoodsQuantity"/></td>
													<td align="center" style="border:1px solid black;">
														<xsl:for-each select="acrgb:GoodsMeasureDetails">
															<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
															<xsl:if test="not(cat_ru:MeasureUnitQualifierName) and cat_ru:MeasureUnitQualifierCode">
																код: <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
															</xsl:if>
														</xsl:for-each>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
								    <br/>
									выпущенных на основании <u> <xsl:apply-templates select="acrgb:AppNumber"/> </u>, влекущий наступление срока уплаты таможенных пошлин, налогов <u> <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="acrgb:PayDate"/></xsl:call-template> </u> в соответствии со статьей 197 Таможенного кодекса Таможенного союза у уполномоченного экономического оператора <u> <xsl:apply-templates select="acrgb:DeclarantDetails"/> </u>.
								</td>
							</tr>
							<tr>
								<td style="border-bottom:1px solid black;">
									<br/>
									Информация об уплаченных таможенных платежах (обеспечении):
									<br/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:apply-templates select="acrgb:PaymentGuaranteeDetails"/>
								</td>
							</tr>
							<tr align="center">
								<td style="font-size:8pt;">(сумма уплаченных таможенных пошлин, налогов в рублях, номер таможенной расписки)</td>
							</tr>
							<tr>
								<td>
									<br/><xsl:text>Статус: </xsl:text>
									<u>
									<xsl:choose>
										<xsl:when test="acrgb:Status=0"> создан</xsl:when>
										<xsl:when test="acrgb:Status=1"> подписан</xsl:when>
										<xsl:when test="acrgb:Status=2"> направлен</xsl:when>
										<xsl:when test="acrgb:Status=3"> отменен</xsl:when>
										<xsl:when test="acrgb:Status=4"> восстановлен</xsl:when>
									</xsl:choose>
									<xsl:text> </xsl:text>
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="acrgb:DateStatus"/></xsl:call-template>
									</u>
								</td>
							</tr>
							<xsl:if test="acrgb:AddList and acrgb:AddList &gt; 0">
								<tr>
									<td>
										<br/>Приложение: на <u> <xsl:value-of select="acrgb:AddList"/> </u> л.
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td><br/>
									<table>
										<tbody>
											<tr align="center">
												<td style="border-bottom:1px solid black" width="38%">
													<xsl:choose>
														<xsl:when test="acrgb:CustomsPerson/cat_ru:PersonPost">
															<xsl:value-of select="acrgb:CustomsPerson/cat_ru:PersonPost"/>
														</xsl:when>
														<xsl:otherwise>Начальник таможенного поста</xsl:otherwise>
													</xsl:choose>
												</td>
												<td/>
												<td style="border-bottom:1px solid black" width="25%"></td>
												<td/>
												<td style="border-bottom:1px solid black" width="35%" align="center">
													<xsl:value-of select="acrgb:CustomsPerson/cat_ru:PersonSurname"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="acrgb:CustomsPerson/cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="acrgb:CustomsPerson/cat_ru:PersonMiddleName"/>
												</td>
											</tr>
											<tr style="font-size:8pt" align="center">
												<td>(Должность)</td>
												<td/>
												<td>(Подпись)</td>
												<td/>
												<td>(ФИО)</td>
											</tr>
											<tr align="center">
												<td colspan="2"/>
												<td><br/><br/>М.П.</td>
												<td colspan="2"/>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="acrgb:PaymentGuaranteeDetails">
		<xsl:for-each select="RUDECLcat:GuaranteeAmount/*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
		</xsl:for-each>
		<xsl:if test="RUDECLcat:GuaranteeDocDetails">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="RUDECLcat:GuaranteeDocDetails"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUDECLcat:GuaranteeDocDetails">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/></xsl:call-template>
		</xsl:if>
		<xsl:if test="RUScat_ru:DocStartDate or RUScat_ru:DocValidityDate">
			<xsl:text>, действует </xsl:text>
			<xsl:if test="RUScat_ru:DocStartDate">
				<xsl:text> c </xsl:text>
				<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="RUScat_ru:DocStartDate"/></xsl:call-template>
			</xsl:if>
			<xsl:if test="RUScat_ru:DocValidityDate">
				<xsl:text> по </xsl:text>
				<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="RUScat_ru:DocValidityDate"/></xsl:call-template>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="acrgb:AppNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="num_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="acrgb:AddNumber"/>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template match="acrgb:DeclarantDetails">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
			, ИНН <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/> 
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="RUDECLcat:AEORegistryIdDetails"/>
	</xsl:template>
	<xsl:template match="RUDECLcat:AEORegistryIdDetails">
		<xsl:text>код типа реестра УЭО: </xsl:text>
		<xsl:value-of select="RUScat_ru:RegistryOwnerCode"/>
		<xsl:if test="RUScat_ru:CountryA2Code"> (<xsl:value-of select="RUScat_ru:CountryA2Code"/>) </xsl:if>
		 № <xsl:value-of select="RUScat_ru:DocId"/>
		 тип свидетельства: <xsl:value-of select="RUScat_ru:AEORegistryKindCode"/>
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
