<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:sq_clt="urn:customs.ru:Information:SQDocuments:SQCommonLeafTypesCust:5.0.10" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:crdnt="urn:customs.ru:Information:SQDocuments:CommonRDNoTarif:5.13.3">
	<!-- Шаблон для типа CommonRDNoTarifType -->
	<xsl:template match="crdnt:CommonRDNoTarif">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
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
					max-width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}

					.inlinetable
					{
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;
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
					.descr{
						font-size: 8pt;
						text-align: center;
					}
					.indent{
						text-indent: 1.5em;
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
										<b>ЗАКЛЮЧЕНИЕ<br/>(разрешительный документ)</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr>
								<td align="right">
									№ <xsl:apply-templates select="crdnt:Permission"/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:call-template name="inlinetable">
						<xsl:with-param name="data">
							<xsl:value-of select="crdnt:PermitOrganizationName"/>
						</xsl:with-param>
						<xsl:with-param name="description">(Наименование органа государственной власти государства - члена Таможенного союза, выдавшего заключение)</xsl:with-param>
						<xsl:with-param name="width">100%</xsl:with-param>
					</xsl:call-template>
					<br/>
					<xsl:text>Выдано </xsl:text>
					<xsl:call-template name="inlinetable">
						<xsl:with-param name="data">
							<xsl:apply-templates select="crdnt:Organization" mode="org"/>
						</xsl:with-param>
						<xsl:with-param name="description">(Название организаии, юридичекий адрес, страна, /для физических лиц Ф.И.О.)</xsl:with-param>
						<xsl:with-param name="width">100%</xsl:with-param>
					</xsl:call-template>
					<br/>
					<xsl:text>Вид перемещения </xsl:text>
					<xsl:call-template name="inlinetable">
						<xsl:with-param name="data" select="crdnt:MoveDirection"/>
						<xsl:with-param name="description">(Вид перемещения)</xsl:with-param>
						<xsl:with-param name="width">80%</xsl:with-param>
					</xsl:call-template>
					<table>
						<tbody>
							<tr>
								<td width="25%" style="border-bottom: 1px solid black; border-right: 1px solid black;" align="center"><xsl:value-of select="crdnt:Goods[1]/crdnt:SectionList"/></td>
								<td></td>
								<td width="25%" style="border-bottom: 1px solid black; border-left: 1px solid black;" align="center"><xsl:value-of select="crdnt:Goods[1]/crdnt:ETNVEDCode"/></td>
							</tr>
							<tr>
								<td class="descr">(Раздел Единого перечня товаров)</td>
								<td></td>
								<td class="descr">(Код ТН ВЭД ТС*)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr align="center" valign="top">
								<td style="width:70%" class="bordered">Наименование товара</td>
								<td style="width:15%" class="bordered">Количество</td>
								<td style="width:15%" class="bordered">Единица измерения</td>
							</tr>
							<xsl:for-each select="crdnt:Goods">
								<tr align="center" valign="top">
									<td style="width:70%" class="bordered">
										<xsl:apply-templates select="crdnt:Description"/>
									</td>
									<td style="width:15%" class="bordered">
										<xsl:value-of select="crdnt:Quantity/cat_ru:GoodsQuantity"/>
									</td>
									<td style="width:15%" class="bordered">
										<xsl:value-of select="crdnt:Quantity/cat_ru:MeasureUnitQualifierName"/>
										<xsl:if test="crdnt:Quantity/cat_ru:MeasureUnitQualifierCode">
											<xsl:text> (</xsl:text>
											<xsl:value-of select="crdnt:Quantity/cat_ru:MeasureUnitQualifierCode"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>	
					<br/>
					<xsl:text>Получатель/отправитель *: </xsl:text>
					<xsl:call-template name="inlinetable">
						<xsl:with-param name="data">
							<xsl:for-each select="crdnt:Consignor|crdnt:Consignee">
								<xsl:apply-templates select="." mode="org"/>
								<xsl:if test="position()!=last()"> / </xsl:if>
							</xsl:for-each>
						</xsl:with-param>
						<xsl:with-param name="description">(Наименование, юридический адрес, страна)</xsl:with-param>
						<xsl:with-param name="width">100%</xsl:with-param>
					</xsl:call-template>
					<br/>
					<xsl:text>Страна назначения/отправления *: </xsl:text>
					<xsl:for-each select="crdnt:DestinationCountry|crdnt:DepartureCountry">
						<xsl:apply-templates select="." mode="country"/>
						<xsl:if test="position()!=last()"> / </xsl:if>
					</xsl:for-each>
					<br/><br/>
					<xsl:text>Цель ввоза (вывоза): </xsl:text>
					<xsl:value-of select="crdnt:GoalAction"/>
					<br/><br/>
					<xsl:text>Срок временного ввоза (вывоза): </xsl:text>
					<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="crdnt:InitialPeriod"/></xsl:call-template>
					<br/><br/>
					<xsl:text>Основание: </xsl:text>
					<xsl:for-each select="crdnt:BaseDocument">
						<xsl:apply-templates mode="doc" select="."/>
						<xsl:if test="position()!=last()">; </xsl:if>
					</xsl:for-each>
					<br/><br/>
					<xsl:text>Дополнительная информация: </xsl:text>
					<xsl:value-of select="crdnt:AddInfo"/>
					<br/><br/>
					<xsl:text>Страна транзита *: </xsl:text>
					<xsl:apply-templates mode="country" select="crdnt:TransitCountry"/>
					<table>
						<tbody>
							<tr>
								<td></td>
								<td width="15%" align="right">Подпись</td>
								<td width="20%" style="border-bottom:1px solid black;"></td>
								<td width="15%" align="right">Дата</td>
								<td width="20%" style="border-bottom:1px solid black;" align="center">
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="crdnt:Signer/cat_ru:IssueDate"/></xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="30%">Заключение действительно по </td>
								<td width="30%" style="border-bottom:1px solid black;">
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="crdnt:LimitDate"/></xsl:call-template>
								</td>
								<td></td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td width="70%"></td>
								<td style="border-bottom: 1px solid black;">
									<xsl:for-each select="crdnt:Signer/cat_ru:PersonSurname|crdnt:Signer/cat_ru:PersonName|crdnt:Signer/cat_ru:PersonMiddleName">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td></td>
								<td class="descr">(Ф.И.О.)</td>
							</tr>
							<tr>
								<td align="center">МП</td>
								<td style="border-bottom: 1px solid black;"><xsl:value-of select="crdnt:Signer/cat_ru:PersonPost"/></td>
							</tr>
							<tr>
								<td></td>
								<td class="descr">(должность)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<div class="descr" style="text-align:left;">* - строки заполняются с учетом требований к категориям товаров</div>
					<br/>
					<div class="descr" style="text-align:left;">
						<xsl:if test="crdnt:DocType=1">заключение (разрешительный документ), на основании которого осуществляется перемещение озоноразрушающих веществ и содержащей их продукции по таможенной территории Евразийского экономического союза</xsl:if>
						<xsl:if test="crdnt:DocType=2">разрешительный документ, на основании которого осуществляется перемещение и внутренний транзит служебного и гражданского оружия по таможенной территории Евразийского экономического союза</xsl:if>
						<xsl:if test="crdnt:DocType=3">заключение (разрешительный документ) на вывоз минерального сырья</xsl:if>
						<xsl:if test="crdnt:DocType=4">заключение (разрешительный документ) на вывоз диких живых животных, отдельных дикорастущих растений и дикорастущего лекарственного сырья</xsl:if>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template mode="doc" match="*">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/></xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template mode="country" match="*">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template mode="org" match="*">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text> адрес(а): </xsl:text>
		</xsl:if>
		<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
			<xsl:apply-templates mode="address" select="."/>
			<xsl:if test="position()!=last()">; </xsl:if>
		</xsl:for-each>
		<xsl:text> </xsl:text>
		<xsl:value-of select="RUScat_ru:CountryA2Code"/>
	</xsl:template>

	<xsl:template match="*" mode="address">
		<xsl:for-each select="RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="crdnt:Permission">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">/</xsl:if>
		</xsl:for-each>
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
