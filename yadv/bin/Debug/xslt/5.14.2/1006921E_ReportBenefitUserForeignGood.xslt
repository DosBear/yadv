<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.0" xmlns:rbufg="urn:customs.ru:Information:CustomsAuditDocuments:ReportBenefitUserForeignGood:5.14.0">
	<!--Проект приказа ФТС России "Об утверждении формы отчета и порядка ее заполнения, порядка, сроков и способов представления отчетности лицами, владеющими и (или) пользующимися условно выпущенными товарами, помещенными под таможенную процедуру выпуска для внутреннего потребления с предоставлением льгот по уплате таможенных платежей, сопряженных с ограничениями по пользованию и (или) распоряжению этими товарами"
Письмо ГУТКПВТ от 13.11.2018 № 23-20/71014-->
	<xsl:template match="rbufg:ReportBenefitUserForeignGood">
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
			width: 267mm;
			/*max-width:267mm;*/
			width: 100%;
			max-width: 100%;
			margin: 10px auto;
			margin-top: 6pt;
			margin-bottom: 6pt;
			padding: 10mm;
			padding-left: 20mm;
			background: #ffffff;
			border: solid 1pt #000000;
			page-break-after: always;
			}

			.marg-top
			{
			margin-top:5mm;
			}

			table
			{
			width: 100%;
			border: 1;
			empty-cells: show;
			border-collapse: collapse;
			margin-top: 1px;
			}
            
			table.border tr td
			{
			border: 1px solid windowtext;
			vertical-align:top;
			}

			.graph {
			font-family: Arial;
			font-size: 10pt;
			}

			.value
			{
			border-bottom: solid 1px black;
			}
			
			
			.hide_line
			{		
		    border-top: hide;
		    border-bottom: hide;
			border-right: solid 1px black;
			border-left: solid 1px black;
			}			
			
			div.title, tr.title td { font-weight:bold;  }
			.bordered { border-collapse: collapse; }
			td.bordered
			{
				border: solid 1px windowtext;
				vertical-align:top;
			}

			.border_bottom
			{
			border-bottom: 1px solid black;
			}
          
			.graphMain
			{
			font-family: Arial;
			font-size: 11pt;
			}

			.graphLittle 
			{
			font-family: Arial;
			font-size: 7pt;
			}
	
			.graphDelim 
			{
			font-family: Arial;
			font-size: 4pt;
			}

			td.graphMain
			{
			vertical-align:top;
			}
			td.value.graphMain
			{
			vertical-align:top;
			}

			.graphHeader
			{
			font-family: Arial;
			font-size: 11pt;
			font-weight:bold;
			}

			td.graphHeader
			{
			vertical-align:top;
			}
			td.value.graphHeader
			{
			vertical-align:bottom;
			}

			.normal
			{
			font-size: 11pt;
			font-family:Arial;
			}			

			.bold
			{
			font-weight: bold;
			font-family:Arial;
			font-size: 9pt;
			}			

			.italic
			{
			font-style: italic;
			font-family:Arial;
			font-size: 11pt;
			}		
			
			.delim {
				height: 7pt;
			}

			.delim_3 {
				height: 3pt;
			}

		</style>
			</head>
			<body>
				<div class="page">
					<br/>
					<tr>
						<td>
							<table>
								<tbody width="100%" class="graphMain">
									<tr align="center" class="graphHeader">
										<td>Отчетность лица, владеющего и (или) пользующегося условно выпущенными товарами, помещенными под таможенную процедуру выпуска для внутреннего потребления с предоставлением льгот по уплате таможенных платежей, сопряженных с ограничениями по пользованию и (или) распоряжению этими товарами, в том числе в электронном виде</td>
									</tr>
									<tr>
										<td class="delim">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="value" style="text-align: justify;">
											<xsl:apply-templates select="rbufg:Organization"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">(наименование лица, представляющего отчет, ИНН, КПП, местонахождение)</td>
									</tr>
									<tr>
										<td class="delim">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="left" class="normal">
											<table>
												<tbody>
													<tr>
														<td width="10%">за период с</td>
														<td width="15%" class="value" align="center">
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="rbufg:BeginPeriodDate"/>
															</xsl:call-template>
														</td>
														<td width="3%" align="center">по</td>
														<td width="15%" class="value" align="center">
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="rbufg:EndPeriodDate"/>
															</xsl:call-template>
														</td>
														<td width="3%" align="center">в</td>
														<td width="2%" align="center" class="value"/>
														<td width="40%" class="value" align="center">
															<xsl:if test="rbufg:Customs/cat_ru:OfficeName">
																<xsl:value-of select="rbufg:Customs/cat_ru:OfficeName"/> (
															</xsl:if>
															<xsl:value-of select="rbufg:Customs/cat_ru:Code"/>
															<xsl:if test="rbufg:Customs/cat_ru:OfficeName">
																)
															</xsl:if>
														</td>
														<td width="12%" align="center"/>
													</tr>
													<tr>
														<td align="center" class="graphLittle" colspan="6"/>
														<td align="center" class="graphLittle">(наименование таможенного органа)</td>
														<td align="center" class="graphLittle"/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim">
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table>
								<tbody width="100%" class="graphMain" align="center">
									<tr>
										<td class="bordered" rowspan="2">№ п/п</td>
										<td class="bordered" colspan="3">Регистрационный номер ДТ</td>
										<td class="bordered" rowspan="2">Порядковый номер товара</td>
										<td class="bordered" rowspan="2">Описание и характеристика товара, его идентификационные признаки</td>
										<td class="bordered" rowspan="2">Количество товара</td>
										<td class="bordered" rowspan="2">Единица измерения</td>
										<td class="bordered" rowspan="2">Количество товара</td>
										<td class="bordered" rowspan="2">Дополнительная единица измерения</td>
										<td class="bordered" rowspan="2">Вес нетто товаров, кг</td>
										<td class="bordered" rowspan="2">Таможенная стоимость товара (руб.)</td>
										<td class="bordered" rowspan="2">Код предоставленных льгот по уплате таможенных платежей</td>
										<td class="bordered" colspan="5">Сведения о принятии товаров к бухгалтерскому учету</td>
										<td class="bordered" colspan="3">Хозяйственные операции с товарами</td>
										<td class="bordered" colspan="3">Сведения о списании (выбытии) товаров с бухгалтерского учета</td>
										<td class="bordered" colspan="2">Сведения о контрагенте (договаривающейся стороне)</td>
										<td class="bordered" rowspan="2">Место нахождения товара</td>
										<td class="bordered" rowspan="2">Сведения об отсутствии товара</td>
										<td class="bordered" rowspan="2">Примечание</td>
									</tr>
									<tr>
										<td class="bordered">Код таможенного органа</td>
										<td class="bordered">Дата регистрации ДТ</td>
										<td class="bordered">№ ДТ</td>
										<td class="bordered">Наименование документа</td>
										<td class="bordered">Номер документа</td>
										<td class="bordered">Дата документа</td>
										<td class="bordered">Количество</td>
										<td class="bordered">Единица измерения </td>
										<td class="bordered">Наименование (краткое содержание)</td>
										<td class="bordered">Количество товара</td>
										<td class="bordered">Единица измерения</td>
										<td class="bordered">Наименование документа</td>
										<td class="bordered">Номер документа</td>
										<td class="bordered">Дата документа</td>
										<td class="bordered">Наименование </td>
										<td class="bordered">ИНН</td>
									</tr>
									<tr>
										<td class="bordered">1</td>
										<td class="bordered">2</td>
										<td class="bordered">3</td>
										<td class="bordered">4</td>
										<td class="bordered">5</td>
										<td class="bordered">6</td>
										<td class="bordered">7</td>
										<td class="bordered">8</td>
										<td class="bordered">9</td>
										<td class="bordered">10</td>
										<td class="bordered">11</td>
										<td class="bordered">12</td>
										<td class="bordered">13</td>
										<td class="bordered">14</td>
										<td class="bordered">15</td>
										<td class="bordered">16</td>
										<td class="bordered">17</td>
										<td class="bordered">18</td>
										<td class="bordered">19</td>
										<td class="bordered">20</td>
										<td class="bordered">21</td>
										<td class="bordered">22</td>
										<td class="bordered">23</td>
										<td class="bordered">24</td>
										<td class="bordered">25</td>
										<td class="bordered">26</td>
										<td class="bordered">27</td>
										<td class="bordered">28</td>
										<td class="bordered">29</td>
									</tr>
									<xsl:for-each select="rbufg:TableGoods/rbufg:GoodsList">
										<xsl:variable name="posMain" select="position()"/>
										<xsl:variable name="In" select="count(rbufg:AcceptanceAccounting)"/>
										<xsl:variable name="Out" select="count(rbufg:WriteOffAccounting)"/>
										<xsl:if test="($In>$Out)">
											<xsl:for-each select="rbufg:AcceptanceAccounting">
												<xsl:variable name="pos" select="position()"/>
												<tr>
													<xsl:choose>
														<xsl:when test="$pos=1">
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$In"/></xsl:attribute>
																<xsl:value-of select="../rbufg:StringNumber"/>
															</td>
															<td valign="top" class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$In"/></xsl:attribute>
																<xsl:value-of select="../../rbufg:DTNumber/cat_ru:CustomsCode"/>
															</td>
															<td valign="top" class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$In"/></xsl:attribute>
																<xsl:call-template name="russian_date">
																	<xsl:with-param select="../../rbufg:DTNumber/cat_ru:RegistrationDate" name="dateIn"/>
																</xsl:call-template>
															</td>
															<td valign="top" class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$In"/></xsl:attribute>
																<xsl:value-of select="../../rbufg:DTNumber/cat_ru:GTDNumber"/>
															</td>
															<td valign="top" class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$In"/></xsl:attribute>
																<xsl:value-of select="../rbufg:GoodsNumeric"/>
															</td>
															<td align="left" valign="top" class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$In"/></xsl:attribute>
																<xsl:if test="../rbufg:GoodsTNVEDCode">
																	<xsl:value-of select="../rbufg:GoodsTNVEDCode"/><xsl:text> </xsl:text>
																</xsl:if>
																<xsl:for-each select="../catESAD_cu:GoodsDescription">
																	<!--xsl:apply-templates/-->
																	<xsl:value-of select="."/>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</xsl:for-each>
																	<xsl:for-each select="../catESAD_cu:GoodsGroupInformation">
																		<br/>
																		<br>
																		<xsl:if test="catESAD_cu:Manufacturer">Производитель:&#160;<xsl:value-of select="catESAD_cu:Manufacturer"/>;&#160;</xsl:if>
																		<xsl:if test="catESAD_cu:TradeMark">Тов. знак:&#160;<xsl:value-of select="catESAD_cu:TradeMark"/>;&#160;</xsl:if>
																		<xsl:if test="catESAD_cu:GoodsMark">Торг. знак, марка:&#160;<xsl:value-of select="catESAD_cu:GoodsMark"/>;&#160;</xsl:if>
																		<xsl:if test="catESAD_cu:GoodsModel">Модель:&#160;<xsl:value-of select="catESAD_cu:GoodsModel"/>;&#160;</xsl:if>
																		<xsl:if test="catESAD_cu:GoodsMarking">Артикул:&#160;<xsl:value-of select="catESAD_cu:GoodsMarking"/>;&#160;</xsl:if>
																		<xsl:if test="catESAD_cu:GoodsStandard">Стандарт:&#160;<xsl:value-of select="catESAD_cu:GoodsStandard"/>;&#160;</xsl:if>
																		<xsl:if test="catESAD_cu:GoodsSort">Сорт:&#160;<xsl:value-of select="catESAD_cu:GoodsSort"/>;&#160;</xsl:if>
																		<xsl:if test="catESAD_cu:WoodSortiment">Наименование сортимента:&#160;<xsl:value-of select="catESAD_cu:WoodSortiment"/>;&#160;</xsl:if>
																		<xsl:if test="catESAD_cu:WoodKind">Порода древесины:&#160;<xsl:value-of select="catESAD_cu:WoodKind"/>;&#160;</xsl:if>
																		<xsl:if test="catESAD_cu:Dimensions">Размеры:&#160;<xsl:apply-templates select="catESAD_cu:Dimensions"/>;&#160;</xsl:if>
																		<xsl:if test="catESAD_cu:DateIssue">Дата выпуска:&#160;
																			<xsl:call-template name="russian_date">
																				<xsl:with-param select="catESAD_cu:DateIssue" name="dateIn"/>
																			</xsl:call-template>;&#160;
																		</xsl:if>
																		<xsl:if test="catESAD_cu:SerialNumber">Серийный номер:&#160;<xsl:for-each select="catESAD_cu:SerialNumber">
																				<!--xsl:apply-templates/-->
																				<xsl:value-of select="."/>
																				<xsl:if test="position()!=last()">; </xsl:if>
																			</xsl:for-each>;&#160;
																		</xsl:if>
																		<xsl:if test="catESAD_cu:GoodsGroupQuantity">Количество:&#160;<xsl:for-each select="catESAD_cu:GoodsGroupQuantity">
																				<xsl:call-template name="MeasureUnit">
																					<xsl:with-param name="date" select="catESAD_cu:GoodsGroupQuantity"/>
																				</xsl:call-template>
																				<xsl:if test="position()!=last()"><br/></xsl:if>
																			</xsl:for-each>;&#160;
																		</xsl:if>
																		</br>
																	</xsl:for-each>
																<xsl:if test="../rbufg:PartyUnitNumber[position() = $pos]">Партийный номер:&#160;<xsl:for-each select="../rbufg:PartyUnitNumber">
																		<!--xsl:apply-templates/-->
																		<xsl:value-of select="."/>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:for-each>
																</xsl:if>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$In"/></xsl:attribute>
																<xsl:for-each select="../rbufg:OtherMeasureUnit">
																	<xsl:call-template name="MeasureUnit">
																		<xsl:with-param name="date" select="."/>
																		<xsl:with-param name="type_v" select="2"/>
																	</xsl:call-template>
																	<xsl:if test="position()!=last()"><br/></xsl:if>
																</xsl:for-each>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$In"/></xsl:attribute>
																<xsl:for-each select="../rbufg:OtherMeasureUnit">
																	<xsl:call-template name="MeasureUnit">
																		<xsl:with-param name="date" select="."/>
																		<xsl:with-param name="type_v" select="3"/>
																	</xsl:call-template>
																	<xsl:if test="position()!=last()"><br/></xsl:if>
																</xsl:for-each>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$In"/></xsl:attribute>
																<xsl:for-each select="../rbufg:SupplementaryQuantity">
																	<xsl:call-template name="MeasureUnit">
																		<xsl:with-param name="date" select="."/>
																		<xsl:with-param name="type_v" select="2"/>
																	</xsl:call-template>
																	<xsl:if test="position()!=last()"><br/></xsl:if>
																</xsl:for-each>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$In"/></xsl:attribute>
																<xsl:for-each select="../rbufg:SupplementaryQuantity">
																	<xsl:call-template name="MeasureUnit">
																		<xsl:with-param name="date" select="."/>
																		<xsl:with-param name="type_v" select="3"/>
																	</xsl:call-template>
																	<xsl:if test="position()!=last()"><br/></xsl:if>
																</xsl:for-each>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$In"/></xsl:attribute>
																<xsl:value-of select="../rbufg:NetWeightQuantity"/>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$In"/></xsl:attribute>
																<xsl:value-of select="../rbufg:CustomsCost"/>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$In"/></xsl:attribute>
																<xsl:for-each select="../rbufg:Preferencii">
																	<xsl:value-of select="catESAD_cu:CustomsTax"/>-<xsl:value-of select="catESAD_cu:CustomsDuty"/>-<xsl:value-of select="catESAD_cu:Excise"/>-<xsl:value-of select="catESAD_cu:Rate"/>
																</xsl:for-each>
															</td>
														</xsl:when>
													</xsl:choose>
													<td class="bordered">
														<xsl:value-of select="rbufg:AccountingDocument/cat_ru:PrDocumentName"/>
													</td>
													<td class="bordered">
														<xsl:value-of select="rbufg:AccountingDocument/cat_ru:PrDocumentNumber"/>
													</td>
													<td class="bordered">
														<xsl:call-template name="russian_date">
															<xsl:with-param select="rbufg:AccountingDocument/cat_ru:PrDocumentDate" name="dateIn"/>
														</xsl:call-template>
													</td>
													<td class="bordered">
														<xsl:for-each select="rbufg:Quantity">
															<xsl:value-of select="cat_ru:GoodsQuantity"/>
															<xsl:if test="position()!=last()"><br/></xsl:if>
														</xsl:for-each>
													</td>
													<td class="bordered">
														<xsl:for-each select="rbufg:Quantity">
															<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
															<xsl:if test="cat_ru:MeasureUnitQualifierCode">&#160;(<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
															<xsl:if test="position()!=last()"><br/></xsl:if>
														</xsl:for-each>
													</td>
													<xsl:choose>
														<xsl:when test="$pos=1">
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$In"/></xsl:attribute>
																<xsl:value-of select="../rbufg:BusinessTransactions/rbufg:Description[position() = $pos]"/>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$In"/></xsl:attribute>
																<xsl:for-each select="../rbufg:BusinessTransactions/rbufg:Quantity">
																	<xsl:call-template name="MeasureUnit">
																		<xsl:with-param name="date" select="."/>
																		<xsl:with-param name="type_v" select="2"/>
																	</xsl:call-template>
																	<xsl:if test="position()!=last()"><br/></xsl:if>
																</xsl:for-each>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$In"/></xsl:attribute>
																<xsl:for-each select="../rbufg:BusinessTransactions/rbufg:Quantity">
																	<xsl:call-template name="MeasureUnit">
																		<xsl:with-param name="date" select="."/>
																		<xsl:with-param name="type_v" select="3"/>
																	</xsl:call-template>
																	<xsl:if test="position()!=last()"><br/></xsl:if>
																</xsl:for-each>
															</td>
														</xsl:when>
													</xsl:choose>
													<xsl:choose>
														<xsl:when test="string-length(../rbufg:WriteOffAccounting[position() = $pos]/rbufg:WriteOffAccounting/cat_ru:PrDocumentName) &gt; 0">
															<span>
																<td class="bordered">
																	<xsl:value-of select="../rbufg:WriteOffAccounting[position() = $pos]/rbufg:WriteOffAccounting/cat_ru:PrDocumentName"/>
																</td>
															</span>
														</xsl:when>
														<xsl:otherwise>
															<span>
																<td class="hide_line"/>
															</span>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:choose>
														<xsl:when test="string-length(../rbufg:WriteOffAccounting[position() = $pos]/rbufg:WriteOffAccounting/cat_ru:PrDocumentNumber) &gt; 0">
															<span>
																<td class="bordered">
																	<xsl:value-of select="../rbufg:WriteOffAccounting[position() = $pos]/rbufg:WriteOffAccounting/cat_ru:PrDocumentNumber"/>
																</td>
															</span>
														</xsl:when>
														<xsl:otherwise>
															<span>
																<td class="hide_line"/>
															</span>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:choose>
														<xsl:when test="string-length(../rbufg:WriteOffAccounting[position() = $pos]/rbufg:WriteOffAccounting/cat_ru:PrDocumentDate) &gt; 0">
															<span>
																<td class="bordered">
																	<xsl:call-template name="russian_date">
																		<xsl:with-param select="../rbufg:WriteOffAccounting[position() = $pos]/rbufg:WriteOffAccounting/cat_ru:PrDocumentDate" name="dateIn"/>
																	</xsl:call-template>
																</td>
															</span>
														</xsl:when>
														<xsl:otherwise>
															<span>
																<td class="hide_line"/>
															</span>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:choose>
														<xsl:when test="(string-length(../rbufg:WriteOffAccounting[position() = $pos]/rbufg:Counterparty/cat_ru:OrganizationName) &gt; 0) or (string-length(../rbufg:WriteOffAccounting[position() = $pos]/rbufg:Counterparty/cat_ru:ShortName) &gt; 0)">
															<span>
																<td class="bordered">
																	<xsl:value-of select="../rbufg:WriteOffAccounting[position() = $pos]/rbufg:Counterparty/cat_ru:OrganizationName"/>
																	<xsl:if test="../rbufg:WriteOffAccounting[position() = $pos]/rbufg:Counterparty/cat_ru:ShortName">
																		<br>
																			<xsl:if test="string-length(../rbufg:WriteOffAccounting[position() = $pos]/rbufg:Counterparty/cat_ru:OrganizationName) &gt; 0">(</xsl:if>
																			<xsl:value-of select="../rbufg:WriteOffAccounting[position() = $pos]/rbufg:Counterparty/cat_ru:ShortName"/>
																			<xsl:if test="string-length(../rbufg:WriteOffAccounting[position() = $pos]/rbufg:Counterparty/cat_ru:OrganizationName) &gt; 0">)</xsl:if>
																		</br>
																	</xsl:if>
																</td>
															</span>
														</xsl:when>
														<xsl:otherwise>
															<span>
																<td class="hide_line"/>
															</span>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:choose>
														<xsl:when test="(string-length(../rbufg:WriteOffAccounting[position() = $pos]/rbufg:Counterparty/cat_ru:RFOrganizationFeatures/cat_ru:INN) &gt; 0) or (string-length(../rbufg:WriteOffAccounting[position() = $pos]/rbufg:Counterparty/cat_ru:RKOrganizationFeatures/cat_ru:IIN ) &gt; 0) or (string-length(../rbufg:WriteOffAccounting[position() = $pos]/rbufg:Counterparty/cat_ru:KGOrganizationFeatures/cat_ru:KGINN) &gt; 0)">
															<span>
																<td class="bordered">
																	<xsl:value-of select="../rbufg:WriteOffAccounting[position() = $pos]/rbufg:Counterparty/cat_ru:RFOrganizationFeatures/cat_ru:INN | ../rbufg:WriteOffAccounting[position() = $pos]/rbufg:Counterparty/cat_ru:RKOrganizationFeatures/cat_ru:IIN |../rbufg:WriteOffAccounting[position() = $pos]/rbufg:Counterparty/cat_ru:KGOrganizationFeatures/cat_ru:KGINN"/>
																</td>
															</span>
														</xsl:when>
														<xsl:otherwise>
															<span>
																<td class="hide_line"/>
															</span>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:choose>
														<xsl:when test="$pos=1">
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$In"/></xsl:attribute>
																<xsl:for-each select="../rbufg:GoodsLocation">
																	<br/>
																	<xsl:if test="rbufg:FactAddress">Фактический адрес:&#160;<xsl:for-each select="rbufg:FactAddress">
																			<br>
																				<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
																			</br>
																		</xsl:for-each>
																	</xsl:if>
																	<xsl:if test="rbufg:PreviousAddressInfo">Предшествующий адрес:&#160;
																		<xsl:for-each select="rbufg:PreviousAddressInfo">
																			<br>
																				на дату:&#160;<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="rbufg:DateAct"/></xsl:call-template>&#160;
																				<xsl:for-each select="rbufg:PreviousAddress">
																					<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
																				</xsl:for-each>
																			</br>
																		</xsl:for-each>
																	</xsl:if>
																	<xsl:if test="rbufg:AirRegNumber">Номер борта воздушного судна:&#160;<xsl:for-each select="rbufg:AirRegNumber">
																			<!--xsl:apply-templates/-->
																			<xsl:value-of select="."/>
																			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																		</xsl:for-each>
																	</xsl:if>
																</xsl:for-each>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$In"/></xsl:attribute>
																<xsl:for-each select="../rbufg:LossGods">
																	<xsl:value-of select="."/> 
													</xsl:for-each>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$In"/></xsl:attribute>
																<xsl:for-each select="../rbufg:Comment">
																	<xsl:value-of select="."/> 
													</xsl:for-each>
															</td>
														</xsl:when>
													</xsl:choose>
												</tr>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="($Out>$In) or ($Out=$In)">
											<xsl:for-each select="rbufg:WriteOffAccounting">
												<xsl:variable name="pos" select="position()"/>
												<tr>
													<xsl:choose>
														<xsl:when test="$pos=1">
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$Out"/></xsl:attribute>
																<xsl:value-of select="../rbufg:StringNumber"/>
															</td>
															<td valign="top" class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$Out"/></xsl:attribute>
																<xsl:value-of select="../../rbufg:DTNumber/cat_ru:CustomsCode"/>
															</td>
															<td valign="top" class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$Out"/></xsl:attribute>
																<xsl:call-template name="russian_date">
																	<xsl:with-param select="../../rbufg:DTNumber/cat_ru:RegistrationDate" name="dateIn"/>
																</xsl:call-template>
															</td>
															<td valign="top" class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$Out"/></xsl:attribute>
																<xsl:value-of select="../../rbufg:DTNumber/cat_ru:GTDNumber"/>
															</td>
															<td valign="top" class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$Out"/></xsl:attribute>
																<xsl:value-of select="../rbufg:GoodsNumeric[position() = $pos]"/>
															</td>
															<td align="left" valign="top" class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$Out"/></xsl:attribute>
																<xsl:if test="../rbufg:GoodsTNVEDCode[position() = $pos]">
																	<xsl:value-of select="../rbufg:GoodsTNVEDCode[position() = $pos]"/><xsl:text> </xsl:text>
																</xsl:if>
																<xsl:for-each select="../rbufg:GoodsDescription[position() = $pos]">
																	<!--xsl:apply-templates/-->
																	<xsl:value-of select="."/>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</xsl:for-each>
																<xsl:if test="../rbufg:GoodsGroupInformation[position() = $pos]">
																	<xsl:for-each select="../rbufg:GoodsGroupInformation[position() = $pos]">
																		<br/>
																		<br>
																			<xsl:if test="catESAD_cu:Manufacturer">Производитель:&#160;<xsl:value-of select="catESAD_cu:Manufacturer"/>;&#160;</xsl:if>
																			<xsl:if test="catESAD_cu:TradeMark">Тов. знак:&#160;<xsl:value-of select="catESAD_cu:TradeMark"/>;&#160;</xsl:if>
																			<xsl:if test="catESAD_cu:GoodsMark">Торг. знак, марка:&#160;<xsl:value-of select="catESAD_cu:GoodsMark"/>;&#160;</xsl:if>
																			<xsl:if test="catESAD_cu:GoodsModel">Модель:&#160;<xsl:value-of select="catESAD_cu:GoodsModel"/>;&#160;</xsl:if>
																			<xsl:if test="catESAD_cu:GoodsMarking">Артикул:&#160;<xsl:value-of select="catESAD_cu:GoodsMarking"/>;&#160;</xsl:if>
																			<xsl:if test="catESAD_cu:GoodsStandard">Стандарт:&#160;<xsl:value-of select="catESAD_cu:GoodsStandard"/>;&#160;</xsl:if>
																			<xsl:if test="catESAD_cu:GoodsSort">Сорт:&#160;<xsl:value-of select="catESAD_cu:GoodsSort"/>;&#160;</xsl:if>
																			<xsl:if test="catESAD_cu:WoodSortiment">Наименование сортимента:&#160;<xsl:value-of select="catESAD_cu:WoodSortiment"/>;&#160;</xsl:if>
																			<xsl:if test="catESAD_cu:WoodKind">Порода древесины:&#160;<xsl:value-of select="catESAD_cu:WoodKind"/>;&#160;</xsl:if>
																			<xsl:if test="catESAD_cu:Dimensions">Размеры:&#160;<xsl:apply-templates select="catESAD_cu:Dimensions"/>;&#160;</xsl:if>
																			<xsl:if test="catESAD_cu:DateIssue">Дата выпуска:&#160;
														<xsl:call-template name="russian_date">
																					<xsl:with-param select="catESAD_cu:DateIssue" name="dateIn"/>
																				</xsl:call-template>;&#160;
														</xsl:if>
																			<xsl:if test="catESAD_cu:SerialNumber">Серийный номер:&#160;<xsl:for-each select="catESAD_cu:SerialNumber">
																					<!--xsl:apply-templates/-->
																					<xsl:value-of select="."/>
																					<xsl:if test="position()!=last()">; </xsl:if>
																				</xsl:for-each>;&#160;
														</xsl:if>
																			<xsl:if test="catESAD_cu:GoodsGroupQuantity">Количество:&#160;<xsl:for-each select="catESAD_cu:GoodsGroupQuantity">
																					<xsl:call-template name="MeasureUnit">
																						<xsl:with-param name="date" select="catESAD_cu:GoodsGroupQuantity"/>
																					</xsl:call-template>
																					<xsl:if test="position()!=last()"><br/></xsl:if>
																				</xsl:for-each>;&#160;
														</xsl:if>
																		</br>
																	</xsl:for-each>
																</xsl:if>
																<xsl:if test="../rbufg:PartyUnitNumber[position() = $pos]">Партийный номер:&#160;<xsl:for-each select="../rbufg:PartyUnitNumber">
																		<!--xsl:apply-templates/-->
																		<xsl:value-of select="."/>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:for-each>
																</xsl:if>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$Out"/></xsl:attribute>
																<xsl:for-each select="../rbufg:OtherMeasureUnit">
																	<xsl:call-template name="MeasureUnit">
																		<xsl:with-param name="date" select="."/>
																		<xsl:with-param name="type_v" select="2"/>
																	</xsl:call-template>
																	<xsl:if test="position()!=last()"><br/></xsl:if>
																</xsl:for-each>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$Out"/></xsl:attribute>
																<xsl:for-each select="../rbufg:OtherMeasureUnit">
																	<xsl:call-template name="MeasureUnit">
																		<xsl:with-param name="date" select="."/>
																		<xsl:with-param name="type_v" select="3"/>
																	</xsl:call-template>
																	<xsl:if test="position()!=last()"><br/></xsl:if>
																</xsl:for-each>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$Out"/></xsl:attribute>
																<xsl:for-each select="../rbufg:SupplementaryQuantity">
																	<xsl:call-template name="MeasureUnit">
																		<xsl:with-param name="date" select="."/>
																		<xsl:with-param name="type_v" select="2"/>
																	</xsl:call-template>
																	<xsl:if test="position()!=last()"><br/></xsl:if>
																</xsl:for-each>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$Out"/></xsl:attribute>
																<xsl:for-each select="../rbufg:SupplementaryQuantity">
																	<xsl:call-template name="MeasureUnit">
																		<xsl:with-param name="date" select="."/>
																		<xsl:with-param name="type_v" select="3"/>
																	</xsl:call-template>
																	<xsl:if test="position()!=last()"><br/></xsl:if>
																</xsl:for-each>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$Out"/></xsl:attribute>
																<xsl:value-of select="../rbufg:NetWeightQuantity"/>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$Out"/></xsl:attribute>
																<xsl:value-of select="../rbufg:CustomsCost"/>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$Out"/></xsl:attribute>
																<xsl:for-each select="../rbufg:Preferencii">
																	<xsl:value-of select="catESAD_cu:CustomsTax"/>-<xsl:value-of select="catESAD_cu:CustomsDuty"/>-<xsl:value-of select="catESAD_cu:Excise"/>-<xsl:value-of select="catESAD_cu:Rate"/>
																</xsl:for-each>
															</td>
														</xsl:when>
													</xsl:choose>
													<xsl:choose>
														<xsl:when test="string-length(../rbufg:AcceptanceAccounting[position() = $pos]/rbufg:AccountingDocument/cat_ru:PrDocumentName) &gt; 0">
															<span>
																<td class="bordered">
																	<xsl:value-of select="../rbufg:AcceptanceAccounting[position() = $pos]/rbufg:AccountingDocument/cat_ru:PrDocumentName"/>
																</td>
															</span>
														</xsl:when>
														<xsl:otherwise>
															<span>
																<td class="hide_line"/>
															</span>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:choose>
														<xsl:when test="string-length(../rbufg:AcceptanceAccounting[position() = $pos]/rbufg:AccountingDocument/cat_ru:PrDocumentNumber) &gt; 0">
															<span>
																<td class="bordered">
																	<xsl:value-of select="../rbufg:AcceptanceAccounting[position() = $pos]/rbufg:AccountingDocument/cat_ru:PrDocumentNumber"/>
																</td>
															</span>
														</xsl:when>
														<xsl:otherwise>
															<span>
																<td class="hide_line"/>
															</span>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:choose>
														<xsl:when test="string-length(../rbufg:AcceptanceAccounting[position() = $pos]/rbufg:AccountingDocument/cat_ru:PrDocumentDate) &gt; 0">
															<span>
																<td class="bordered">
																	<xsl:call-template name="russian_date">
																		<xsl:with-param select="../rbufg:AcceptanceAccounting[position() = $pos]/rbufg:AccountingDocument/cat_ru:PrDocumentDate" name="dateIn"/>
																	</xsl:call-template>
																</td>
															</span>
														</xsl:when>
														<xsl:otherwise>
															<span>
																<td class="hide_line"/>
															</span>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:choose>
														<xsl:when test="string-length(../rbufg:AcceptanceAccounting[position() = $pos]/rbufg:Quantity/cat_ru:GoodsQuantity) &gt; 0">
															<span>
																<td class="bordered">
																	<xsl:value-of select="../rbufg:AcceptanceAccounting[position() = $pos]/rbufg:Quantity/cat_ru:GoodsQuantity"/>
																</td>
															</span>
														</xsl:when>
														<xsl:otherwise>
															<span>
																<td class="hide_line"/>
															</span>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:choose>
														<xsl:when test="(string-length(../rbufg:AcceptanceAccounting[position() = $pos]/rbufg:Quantity/cat_ru:MeasureUnitQualifierName) &gt; 0) or (string-length(../rbufg:AcceptanceAccounting[position() = $pos]/rbufg:Quantity/cat_ru:MeasureUnitQualifierCode) &gt; 0)">
															<span>
																<td class="bordered">
																	<xsl:value-of select="../rbufg:AcceptanceAccounting[position() = $pos]/rbufg:Quantity/cat_ru:MeasureUnitQualifierName"/>
																	<xsl:if test="../rbufg:AcceptanceAccounting[position() = $pos]/rbufg:Quantity/cat_ru:MeasureUnitQualifierCode">&#160;(<xsl:value-of select="../rbufg:AcceptanceAccounting[position() = $pos]/rbufg:Quantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
																</td>
															</span>
														</xsl:when>
														<xsl:otherwise>
															<span>
																<td class="hide_line"/>
															</span>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:choose>
														<xsl:when test="$pos=1">
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$Out"/></xsl:attribute>
																<xsl:value-of select="../rbufg:BusinessTransactions/rbufg:Description[position() = $pos]"/>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$Out"/></xsl:attribute>
																<xsl:for-each select="../rbufg:BusinessTransactions/rbufg:Quantity">
																	<xsl:call-template name="MeasureUnit">
																		<xsl:with-param name="date" select="."/>
																		<xsl:with-param name="type_v" select="2"/>
																	</xsl:call-template>
																	<xsl:if test="position()!=last()"><br/></xsl:if>
																</xsl:for-each>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$Out"/></xsl:attribute>
																<xsl:for-each select="../rbufg:BusinessTransactions/rbufg:Quantity">
																	<xsl:call-template name="MeasureUnit">
																		<xsl:with-param name="date" select="."/>
																		<xsl:with-param name="type_v" select="3"/>
																	</xsl:call-template>
																	<xsl:if test="position()!=last()"><br/></xsl:if>
																</xsl:for-each>
															</td>
														</xsl:when>
													</xsl:choose>
													<td class="bordered">
														<xsl:value-of select="rbufg:WriteOffAccounting/cat_ru:PrDocumentName"/>
													</td>
													<td class="bordered">
														<xsl:value-of select="rbufg:WriteOffAccounting/cat_ru:PrDocumentNumber"/>
													</td>
													<td class="bordered">
														<xsl:call-template name="russian_date">
															<xsl:with-param select="rbufg:WriteOffAccounting/cat_ru:PrDocumentDate" name="dateIn"/>
														</xsl:call-template>
													</td>
													<td class="bordered" align="center">
														<xsl:value-of select="rbufg:Counterparty/cat_ru:OrganizationName"/>
														<xsl:if test="rbufg:Counterparty/cat_ru:ShortName">
															<br>
																<xsl:if test="string-length(rbufg:Counterparty/cat_ru:OrganizationName) &gt; 0"> (</xsl:if>
																<xsl:value-of select="rbufg:Counterparty/cat_ru:ShortName"/>
																<xsl:if test="string-length(rbufg:Counterparty/cat_ru:OrganizationName) &gt; 0">)</xsl:if>
															</br>
														</xsl:if>
													</td>
													<td class="bordered">
														<xsl:value-of select="rbufg:Counterparty/cat_ru:RFOrganizationFeatures/cat_ru:INN | rbufg:Counterparty/cat_ru:RKOrganizationFeatures/cat_ru:IIN | rbufg:Counterparty/cat_ru:KGOrganizationFeatures/cat_ru:KGINN"/>
													</td>
													<xsl:choose>
														<xsl:when test="$pos=1">
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$Out"/></xsl:attribute>
																<xsl:for-each select="../rbufg:GoodsLocation">
																	<br/>
																	<xsl:if test="rbufg:FactAddress">Фактический адрес:&#160;<xsl:for-each select="rbufg:FactAddress">
																			<br>
																				<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
																			</br>
																		</xsl:for-each>
																	</xsl:if>
																	<xsl:if test="rbufg:PreviousAddressInfo">Предшествующий адрес:&#160;
																		<xsl:for-each select="rbufg:PreviousAddressInfo">
																			<br>
																				на дату:&#160;<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="rbufg:DateAct"/></xsl:call-template>&#160;
																				<xsl:for-each select="rbufg:PreviousAddress">
																					<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
																				</xsl:for-each>
																			</br>
																		</xsl:for-each>
																	</xsl:if>
																	<xsl:if test="rbufg:AirRegNumber">Номер борта воздушного судна:&#160;<br>
																			<xsl:for-each select="rbufg:AirRegNumber">
																				<!--xsl:apply-templates/-->
																				<xsl:value-of select="."/>
																				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																			</xsl:for-each>
																		</br>
																	</xsl:if>
																</xsl:for-each>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$Out"/></xsl:attribute>
																<xsl:for-each select="../rbufg:LossGods">
																	<xsl:value-of select="."/> 
													</xsl:for-each>
															</td>
															<td class="bordered">
																<xsl:attribute name="rowspan"><xsl:value-of select="$Out"/></xsl:attribute>
																<xsl:for-each select="../rbufg:Comment">
																	<xsl:value-of select="."/> 
													</xsl:for-each>
															</td>
														</xsl:when>
													</xsl:choose>
												</tr>
											</xsl:for-each>
										</xsl:if>
									</xsl:for-each>
								</tbody>
							</table>
						</td>
					</tr>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="RUScat_ru:SubjectAddressDetails" match="RUScat_ru:SubjectAddressDetails">
		<xsl:if test="RUScat_ru:PostalCode">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:PostalCode"/>
			</span>
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</span>
			<xsl:if test="RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:CounryName">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CounryName"/>
			</span>
			<xsl:if test="RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:Region"/>
			</span>
			<xsl:if test="RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:District"/>
			</span>
			<xsl:if test="RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:Town"/>
			</span>
			<xsl:if test="RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:City"/>
			</span>
			<xsl:if test="RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:StreetHouse"/>
			</span>
			<xsl:if test="RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:House"/>
			</span>
			<xsl:if test="RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:Room"/>
			</span>
			<xsl:if test="RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</span>
			<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO">
			<span class="italic">ОКТМО </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:OKTMO"/>
			</span>
			<xsl:if test="RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKATO">
			<span class="italic">OKАTO </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:OKATO"/>
			</span>
			<xsl:if test="RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:KLADR">
			<span class="italic">КЛАДР </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:KLADR"/>
			</span>
			<xsl:if test="RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:AOGUID">
			<span class="italic">Глобальный идентификатор адресного объекта по ФИАС </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AOGUID"/>
			</span>
			<xsl:if test="RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:TerritoryCode">
			<span class="italic">Код единицы административно-территориального деления </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:TerritoryCode"/>
			</span>
			<xsl:if test="RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<span class="italic">а/я </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="rbufg:Organization">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<span class="normal">, </span>
			<span class="italic">Код страны</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<span class="normal">, </span>
			<span class="italic">ОПФ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<span class="normal">, </span>
			<span class="italic">УИ ФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:if test="position()=1">; 
				<span class="normal">
						<br/>
					</span>
					<span class="italic">Адрес(а)</span>
					<span class="normal">: </span>
				</xsl:if>
				<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<span class="normal">
				<xsl:for-each select="RUScat_ru:CommunicationDetails">
					<xsl:call-template name="CommunicationDetails"/>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="normal">, </span>
			<span class="italic">
				<xsl:if test="string-length(cat_ru:INN) &gt; 0">
					<span class="italic">ИНН</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">
					<span class="normal">/</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:KPP) &gt; 0">
					<span class="italic">КПП</span>
				</xsl:if>
				<span class="normal">: </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<span class="normal">, </span>
			<span class="italic">ОГРН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="normal">, </span>
			<span class="italic">БИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">, </span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">, </span>
			<span class="italic">ИТН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal"> / </span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">, </span>
			<span class="italic">УНП</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">, </span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:variable name="posMain" select="position()"/>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">, </span>
			<span class="italic">УНН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">, </span>
			<span class="italic">НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">, </span>
			<span class="italic">№ справки об отсутв. НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<span class="normal"> УИТН</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal"> (</span>
			<span class="normal">страна </span>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<span class="normal">, </span>
		<span class="italic">Код ОПФ: </span>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<span class="normal"> (</span>
			<span class="italic"> по справ. </span>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template name="RUScat_ru:CommunicationDetails" match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<span class="italic">Тел</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:Phone">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<span class="italic">Факс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Fax"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<span class="italic">Телекс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Telex"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<span class="italic">Email</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:E_mail">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:IdentityCard">
		<span class="normal">, </span>
		<span class="italic">Документ, удостоверяющий личность ФЛ</span>
		<span class="normal">: </span>
		<xsl:if test="cat_ru:IdentityCardCode">
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardCode"/>
			</span>
			<span class="normal">&#160;</span>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardName">
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardName"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<xsl:if test="string-length(cat_ru:IdentityCardName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
			</span>
			<xsl:if test="string-length(cat_ru:IdentityCardName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="string-length(cat_ru:IdentityCardSeries) &gt; 0 or string-length(cat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<span class="italic">серия</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardSeries"/>
			</span>
			<xsl:if test="string-length(cat_ru:IdentityCardNumber) &gt; 0">
				<span class="normal">&#160;</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber">
			<span class="italic">№</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardNumber"/>
			</span>
		</xsl:if>
		<xsl:if test="string-length(cat_ru:IdentityCardDate) &gt; 0 or string-length(cat_ru:OrganizationName) &gt; 0">
			<!--xsl:if test="string-length(cat_ru:IdentityCardSeries) &gt; 0 or string-length(cat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if-->
			<span class="normal">, </span>
			<span class="italic">выдан</span>
			<span class="normal">: </span>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<span class="normal">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
				</xsl:call-template>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName">
			<span class="normal">&#160;</span>
			<span class="normal">
				<xsl:value-of select="cat_ru:OrganizationName"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IssuerCode">
			<span class="normal">, </span>
			<span class="italic">код подразделения</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IssuerCode"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">
			<span class="normal">, </span>
			<span class="italic">идентификатор организации</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AuthorityId"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal">, </span>
			<span class="italic">страна в уд.личности</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CommunicationDetails">
		<span class="normal">, </span>
		<span class="italic">Контактные данные</span>
		<span class="normal">: </span>
		<xsl:variable name="temp">
			<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
		</xsl:variable>
		<xsl:value-of select="substring($temp,1,string-length($temp)-2)"/>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<span class="normal">
					<xsl:value-of select="substring($dateIn,9,2)"/>
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,6,2)"/>
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,1,4)"/>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template  match="catESAD_cu:Dimensions">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"> x </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="MeasureUnit">
		<xsl:param name="date"/>
		<xsl:param name="type_v" select="1"/>
		<!--$type_v = 1 - вывод количества и единицы измерения (по умолчанию)-->
		<!--$type_v = 2 - вывод только количества -->
		<!--$type_v = 1 - вывод только единицы измерения -->

		<xsl:if test="$type_v = '1' or $type_v = '2'">
			<xsl:value-of select="$date/cat_ru:GoodsQuantity"/>
		</xsl:if>	
		<xsl:if test="$type_v = '1' or $type_v = '3'">
			<xsl:if test="$date/cat_ru:MeasureUnitQualifierName">
				<xsl:text>&#160;</xsl:text>
				<xsl:value-of select="$date/cat_ru:MeasureUnitQualifierName"/>
				<xsl:text>&#160;</xsl:text>
			</xsl:if>
			<xsl:if test="$date/cat_ru:MeasureUnitQualifierCode">
				<xsl:text>(</xsl:text>
				<xsl:value-of select="$date/cat_ru:MeasureUnitQualifierCode"/>
				<xsl:text>)</xsl:text>
			</xsl:if>
		</xsl:if>	
	</xsl:template>
</xsl:stylesheet>
