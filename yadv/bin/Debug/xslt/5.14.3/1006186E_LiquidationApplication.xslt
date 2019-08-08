<?xml version="1.0" encoding="utf-8"?>

<!-- Для территории ОЭЗ рекомендации по заполнению бланка в Приказе ФТС 228 от 11.02.2013 приложения №1  -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.14.3" xmlns:liqap="urn:customs.ru:Information:CustomsDocuments:LiquidationApplication:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="liqap:LiquidationApplication">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
					body {
					background: #cccccc;
					}

					div.page {
					width: 210mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					div.page_2 {
					width: 270mm;
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
					word-break: break-all; /*перенос длинных строк не выходя за ширину ячейки*/
					}

					table.border tr td th
					{
					border: 1px solid gray;
					}

					.border_bottom
					{
					border-bottom: 1px solid gray;
					}
					
					.border_right
					{
					border-right: 1px solid gray;
					}

					.border_all
					{
					border-top: 1px solid gray;
					border-left: 1px solid gray;
					border-right: 1px solid gray;
					border-bottom: 1px solid gray;
					}

					.border_ltb
					{
					border-top: 1px solid gray;
					border-left: 1px solid gray;
					border-bottom: 1px solid gray;
					}

					.graph {
					font-family: Verdana;
					font-size: 8pt;
					font-weight: bold;
					}

					.txt {
					font-family: Verdana;
					font-size: 10pt;
					font-weight: normal;
					}

					.txt_b {
					font-family: Verdana;
					font-size: 10pt;
					font-weight: bold;
					}

					.txt_b_bckgr {
					/*background: silver;*/
					background: powderblue;
					}
					
					.col_bckgr {
					/*background: gainsboro;*/
					background: lightcyan;
					
					}

					.graph_under {
					font-family: Verdana;
					font-size: 8pt;
					}

					.sign {
					font-family: Verdana;
					font-size: 10pt;
					font-style: italic;
					font-weight: normal;
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
					th.bordered
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

					.delim {
						height: 7pt;
					}

					.delim_3 {
						height: 3pt;
					}

					.delim_2 {
						height: 2pt;
					}

					.italic
					{
					font-style: italic;
					font-family:Verdana;
					font-size: 10pt;
					}			

					.strike
					{
					text-decoration: line-through;
					}			

					.under
					{
					text-decoration: underline;
					}			
					
				</style>
			</head>
			<body>
				<xsl:choose>
					<xsl:when test="liqap:DocumentSign = '0'"> <!--ОЭЗ-->
						<div class="page">
							<table class="w190">
								<col width="40%" valign="bottom" align="left"/>
								<col width="5%" valign="top" align="left"/>
								<col width="55%" valign="bottom" align="left"/>
								<tbody>
									<tr>
										<td width="40%"><br/></td>
										<td width="5%"> </td>
										<td width="55%"> </td>
									</tr>
									<tr>
										<td></td>
										<td><span class="txt">В</span></td>
										<td class="border_bottom">
											<span class="sign">
												<xsl:choose>
													<xsl:when test="liqap:Customs/cat_ru:OfficeName">
														<xsl:value-of select="liqap:Customs/cat_ru:OfficeName" />
														<text><br/><span>(код ТО: </span></text>
														<xsl:value-of select="liqap:Customs/cat_ru:Code" />
														<text>)</text>
													</xsl:when>
													<xsl:otherwise>
														<text>ТО </text>
														<xsl:value-of select="liqap:Customs/cat_ru:Code" />
													</xsl:otherwise>
												</xsl:choose>
											</span>
										</td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td align="center">
											<span class="graph_under">(наименование таможенного органа<br/>(с указанием кода таможенного органа))</span>
										</td>
									</tr>
									<tr class="delim"><td colspan="3"> </td></tr>
									<tr>
										<td></td>
										<td><span class="txt">От</span></td>
										<td class="border_bottom">
											<span class="sign">
												<xsl:apply-templates select="liqap:OEZ_Resident" />
											</span>
										</td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td align="center">
											<span class="graph_under">(наименование резидента ОЭЗ, подавшего заявление)</span>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<table class="w190">
								<tbody>
									<tr>
										<td align="center" class="graphMain graph">
											<font size="4">
												<span><b>Заявление</b><br/></span>
											</font>
											<font size="3">
												<span>на уничтожение товаров, пришедших в негодность, и (или) упаковки<br/></span>
												<span>на территории ОЭЗ или вывоз таких товаров и (или) упаковки<br/></span>
												<span>за пределы территории ОЭЗ в целях их уничтожения <br/></span>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<table class="w190">
								<col width="20%" valign="bottom" align="right"/>
								<col width="3%" valign="bottom" align="right"/>
								<col width="2%" valign="bottom" align="right"/>
								<col width="75%" valign="bottom" align="center"/>
								<tbody>
									<tr>
										<td width="20%"><span class="txt">Прошу разрешить</span></td>
										<td width="3%"></td>
										<td width="2%" class="border_bottom"></td>
										<td width="75%" class="border_bottom">
											<span class="sign">
												<xsl:choose>
													<xsl:when test="liqap:OperationSign">
														<xsl:choose>
															<xsl:when test="liqap:OperationSign = '0'">
																<span>уничтожение на территории особой экономической зоны</span>
																<span> /<br/></span>
																<span class="strike">вывоз с территории особой экономической зоны в целях уничтожения</span>
															</xsl:when>
															<xsl:otherwise>
																<span class="strike">уничтожение на территории особой экономической зоны</span>
																<span>/<br/></span>
																<span>вывоз с территории особой экономической зоны в целях уничтожения</span>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:when>
													<xsl:otherwise>
														<span>уничтожение на территории особой экономической зоны</span>
														<span>/<br/></span>
														<span>вывоз с территории особой экономической зоны в целях уничтожения</span>
													</xsl:otherwise>
												</xsl:choose>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
		
							<table class="w190">
								<col width="42%" valign="bottom" align="left"/>
								<col width="1%" valign="bottom" align="right"/>
								<col width="7%" valign="bottom" align="right"/>
								<col width="1%" valign="bottom" align="right"/>
								<col width="49%" valign="bottom" align="left"/>
								<tbody>
									<tr>
										<td width="42%">
											<span class="txt">следующих товаров и (или) упаковки на</span>
										</td>
										<td width="1%"></td>
										<td width="7%" class="border_bottom"></td>
										<td width="1%"></td>
										<td width="49%">
											<span class="txt">листе(ах),  согласно ниже приведенным</span>
										</td>
									</tr>
									<tr>
										<td colspan="5">
											<span class="txt">сведениям</span>
										</td>
									</tr>
								</tbody>
							</table>
		
							<table class="w190">
								<col width="100%" valign="bottom" align="left"/>
								<tbody>
									<tr><td width="100%"><br/></td></tr>
									<tr>
										<td>
											<span class="txt">&#160;&#160;&#160;Таблица I. Товары,  помещенные  под таможенную процедуру СТЗ, которые утратили<br/></span>
											<span class="txt">свои потребительские свойства и стали окончательно непригодными в том качестве,<br/></span>
											<span class="txt">для которого они предназначены:</span>
										</td>
									</tr>
								</tbody>
							</table>
		
							<table class="w190 bordered">
								<col width="5%"/>
								<col width="17%"/>
								<col width="10%"/>
								<col width="13%"/>
								<col width="18%"/>
								<col width="6%"/>
								<col width="13%"/>
								<col width="8%"/>
								<col width="10%"/>
								<tbody>
									<tr>
										<td width="5%"><br/></td>
										<td width="17%"></td>
										<td width="10%"></td>
										<td width="13%"></td>
										<td width="18%"></td>
										<td width="6%"></td>
										<td width="13%"></td>
										<td width="8%"></td>
										<td width="10%"></td>
									</tr>
									<tr>
										<th rowspan="2" class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">№<br/>п/п</th>
										<th rowspan="2" class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">Наименование<br/>товара</th>
										<th rowspan="2" class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">Код</th>
										<th colspan="4" class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">Товар, помещенный<br/>под таможенную процедуру</th>
										<th rowspan="2" class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">Коли-<br/>чество</th>
										<th rowspan="2" class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">Способ(ы)<br/>уничто-<br/>жения<br/>товаров</th>
									</tr>
									<tr>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">Регистра-<br/>ционный<br/>номер</th>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">Наимено-<br/>вание<br/>товара</th>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">Но-<br/>мер<br/>то-<br/>вара</th>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">Код<br/>товара по<br/>ТН ВЭД ТС<br/>(10<br/>знаков)</th>
									</tr>
		
									<tr>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">1</th>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">2</th>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">3</th>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">4</th>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">5</th>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">6</th>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">7</th>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">8</th>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">9</th>
									</tr>
		
									<xsl:for-each select="liqap:WasteProducts[liqap:WasteSign=0]">
										<xsl:variable name="cnt_con">
											<xsl:choose>
												<xsl:when test="liqap:Consignment">
													<xsl:value-of select="count(liqap:Consignment)"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="1"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										
										<xsl:variable name="cntrow">
											<xsl:call-template name="get_cntrow">
												<xsl:with-param name="i" select="1"/>
												<xsl:with-param name="cnt_row" select="0"/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:variable name="npp" select="position()"/>
										<xsl:choose>
											<xsl:when test="liqap:Consignment">
												<xsl:for-each select="liqap:Consignment">
													<xsl:variable name="cnt_goods">
														<xsl:choose>
															<xsl:when test="liqap:Goods">
																<xsl:value-of select="count(liqap:Goods)"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:value-of select="1"/>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:variable>
													<xsl:variable name="npp_con" select="position()"/>
													<xsl:choose>
														<xsl:when test="liqap:Goods">
															<xsl:for-each select="liqap:Goods">
																<xsl:variable name="npp_goods" select="position()"/>
																<tr>
																	<xsl:if test="$npp_con = 1 and $npp_goods = 1">
																		<td rowspan="{$cntrow}" class="sign" align="center" style="border: solid 1px windowtext;">
																			<xsl:value-of select="$npp"/>
																		</td>
																		<td rowspan="{$cntrow}" class="sign" align="center" style="border-top: solid 1px windowtext;border-bottom: solid 1px windowtext;border-left: solid 1px windowtext;">
																			<xsl:for-each select="ancestor::liqap:WasteProducts/liqap:WasteDescription">
																				<xsl:value-of select="."/>
																				<xsl:if test="position()!=last()">
																					<br/>
																				</xsl:if>
																			</xsl:for-each>
																		</td>
																		<td rowspan="{$cntrow}" class="sign" align="center" style="border-top: solid 1px windowtext;border-bottom: solid 1px windowtext;border-left: solid 1px windowtext;">
																			<xsl:value-of select="ancestor::liqap:WasteProducts/liqap:WasteCode"/>
																		</td>
																	</xsl:if>																	
																	<xsl:if test="$npp_goods = 1">
																		<td rowspan="{$cnt_goods}" class="sign" align="center" style="border-top: solid 1px windowtext;border-bottom: solid 1px windowtext;border-left: solid 1px windowtext;">
																			<xsl:variable name="gtdn" select="ancestor::liqap:WasteProducts/liqap:Consignment[$npp_con]/liqap:RegNumberDT"/>
																			<xsl:value-of select="$gtdn/cat_ru:CustomsCode"/>
																			<xsl:text>/</xsl:text>
																			<xsl:call-template name="gtd_date">
																				<xsl:with-param name="dateIn" select="$gtdn/cat_ru:RegistrationDate"/>
																			</xsl:call-template>
																			<xsl:text>/</xsl:text>
																			<xsl:value-of select="$gtdn/cat_ru:GTDNumber"/>
																		</td>
																	</xsl:if>																	
																	<td class="sign" align="center" style="border-top: solid 1px windowtext;border-bottom: solid 1px windowtext;border-left: solid 1px windowtext;">
																		<xsl:for-each select="liqap:GoodDescription">
																			<xsl:value-of select="."/>
																			<xsl:if test="position()!=last()">
																				<br/>
																			</xsl:if>
																		</xsl:for-each>
																	</td>
																	<td class="sign" align="center" style="border: solid 1px windowtext;">
																		<xsl:value-of select="liqap:GoodsNumeric"/>
																	</td>
																	<td class="sign" align="center" style="border: solid 1px windowtext;">
																		<xsl:value-of select="liqap:GoodsTNVEDCode"/>
																	</td>
																	<xsl:if test="$npp_con = 1 and $npp_goods = 1">
																		<td rowspan="{$cntrow}" class="sign" align="center" style="border: solid 1px windowtext;">
																			<xsl:apply-templates select="ancestor::liqap:WasteProducts/liqap:WasteQuantity"/>
																		</td>
																		<td rowspan="{$cntrow}" class="sign" align="center" style="border: solid 1px windowtext;">
																			<xsl:for-each select="ancestor::liqap:WasteProducts/liqap:LiquidationMethod">
																				<xsl:value-of select="."/>
																				<xsl:if test="position()!=last()">
																					<br/>
																				</xsl:if>
																			</xsl:for-each>
																		</td>
																	</xsl:if>																	
																</tr>
															</xsl:for-each>
														</xsl:when>
														<xsl:otherwise> <!--нет goods'a-->
															<tr>
																<xsl:if test="$npp_con = 1">
																	<td rowspan="{$cntrow}" class="sign" align="center" style="border: solid 1px windowtext;">
																		<xsl:value-of select="$npp"/>
																	</td>
																	<td rowspan="{$cntrow}" class="sign" align="center" style="border-top: solid 1px windowtext;border-bottom: solid 1px windowtext;border-left: solid 1px windowtext;">
																		<xsl:for-each select="ancestor::liqap:WasteProducts/liqap:WasteDescription">
																			<xsl:value-of select="."/>
																			<xsl:if test="position()!=last()">
																				<br/>
																			</xsl:if>
																		</xsl:for-each>
																	</td>
																	<td rowspan="{$cntrow}" class="sign" align="center" style="border-top: solid 1px windowtext;border-bottom: solid 1px windowtext;border-left: solid 1px windowtext;">
																		<xsl:value-of select="ancestor::liqap:WasteProducts/liqap:WasteCode"/>
																	</td>
																</xsl:if>																	
																<td class="sign" align="center" style="border-top: solid 1px windowtext;border-bottom: solid 1px windowtext;border-left: solid 1px windowtext;">
																	<xsl:variable name="gtdn" select="ancestor::liqap:WasteProducts/liqap:Consignment/liqap:RegNumberDT"/>
																	<xsl:value-of select="$gtdn/cat_ru:CustomsCode"/>
																	<xsl:text>/</xsl:text>
																	<xsl:call-template name="gtd_date">
																		<xsl:with-param name="dateIn" select="$gtdn/cat_ru:RegistrationDate"/>
																	</xsl:call-template>
																	<xsl:text>/</xsl:text>
																	<xsl:value-of select="$gtdn/cat_ru:GTDNumber"/>
																</td>
																<td class="sign" align="center" style="border: solid 1px windowtext;"></td>
																<td class="sign" align="center" style="border: solid 1px windowtext;"></td>
																<td class="sign" align="center" style="border: solid 1px windowtext;"></td>
																<xsl:if test="$npp_con= 1">
																	<td rowspan="{$cntrow}" class="sign" align="center" style="border: solid 1px windowtext;">
																		<xsl:apply-templates select="ancestor::liqap:WasteProducts/liqap:WasteQuantity"/>
																	</td>
																	<td rowspan="{$cntrow}" class="sign" align="center" style="border: solid 1px windowtext;">
																		<xsl:for-each select="ancestor::liqap:WasteProducts/liqap:LiquidationMethod">
																			<xsl:value-of select="."/>
																			<xsl:if test="position()!=last()">
																				<br/>
																			</xsl:if>
																		</xsl:for-each>
																	</td>
																</xsl:if>																	
															</tr>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:for-each>
											</xsl:when>
											<xsl:otherwise> <!--нет консигмента-->
												<tr>
													<td class="sign" align="center" style="border: solid 1px windowtext;">
														<xsl:value-of select="$npp"/>
													</td>
													<td class="sign" align="center" style="border-top: solid 1px windowtext;border-bottom: solid 1px windowtext;border-left: solid 1px windowtext;">
														<xsl:for-each select="liqap:WasteDescription">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()">
																<br/>
															</xsl:if>
														</xsl:for-each>
													</td>
													<td rowspan="{$cntrow}" class="sign" align="center" style="border-top: solid 1px windowtext;border-bottom: solid 1px windowtext;border-left: solid 1px windowtext;">
														<xsl:value-of select="liqap:WasteCode"/>
													</td>
													<td class="sign" align="center" style="border: solid 1px windowtext;"></td>
													<td class="sign" align="center" style="border: solid 1px windowtext;"></td>
													<td class="sign" align="center" style="border: solid 1px windowtext;"></td>
													<td class="sign" align="center" style="border: solid 1px windowtext;"></td>
													<td rowspan="{$cntrow}" class="sign" align="center" style="border: solid 1px windowtext;">
														<xsl:apply-templates select="liqap:WasteQuantity"/>
													</td>
													<td rowspan="{$cntrow}" class="sign" align="center" style="border: solid 1px windowtext;">
														<xsl:for-each select="liqap:LiquidationMethod">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()">
																<br/>
															</xsl:if>
														</xsl:for-each>
													</td>
												</tr>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
								</tbody>
							</table>
		
							<table class="w190">
								<col width="100%" valign="bottom" align="left"/>
								<tbody>
									<tr><td width="100%"><br/></td></tr>
									<tr>
										<td>
											<span class="txt">&#160;&#160;&#160;Таблица II. Упаковка:</span>
										</td>
									</tr>
								</tbody>
							</table>
		
							<table class="w190 bordered">
								<col width="5%"/>
								<col width="25%"/>
								<col width="10%"/>
								<col width="12%"/>
								<col width="25%"/>
								<col width="8%"/>
								<col width="15%"/>
								<tbody>
									<tr>
										<td width="5%"><br/></td>
										<td width="25%"></td>
										<td width="10%"></td>
										<td width="12%"></td>
										<td width="25%"></td>
										<td width="8%"></td>
										<td width="15%"></td>
									</tr>
									<tr>
										<th rowspan="2" class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">№<br/>п/п</th>
										<th rowspan="2" class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">Наименование<br/>товара</th>
										<th rowspan="2" class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">Код</th>
										<th colspan="2" class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">Упаковка и упаковочные<br/>материалы, ввезенные<br/>на территорию ОЭЗ</th>
										<th rowspan="2" class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">Коли-<br/>чество</th>
										<th rowspan="2" class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">Способ(ы)<br/>уничтожения<br/>упаковки</th>
									</tr>
									<tr>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">Код</th>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">Наимено-<br/>вание</th>
									</tr>
		
									<tr>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">1</th>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">2</th>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">3</th>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">4</th>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">5</th>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">6</th>
										<th class="graph" align="center" style="vertical-align:middle;border: solid 1px windowtext;">7</th>
									</tr>
		
									<xsl:for-each select="liqap:WasteProducts[liqap:WasteSign=1]">
		
										<xsl:variable name="cntrow">
											<xsl:choose>
												<xsl:when test="liqap:PackingInformation">
													<xsl:value-of select="count(liqap:PackingInformation)"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="1"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										
										<xsl:variable name="npp" select="position()"/>
		
										<xsl:choose>
											<xsl:when test="liqap:PackingInformation">
												<xsl:for-each select="liqap:PackingInformation">
													<xsl:variable name="npp_con" select="position()"/>
															<tr>
																<xsl:if test="$npp_con = 1">
																	<td rowspan="{$cntrow}" class="sign" align="center" style="border: solid 1px windowtext;">
																		<xsl:value-of select="$npp"/>
																	</td>
																	<td rowspan="{$cntrow}" class="sign" align="center" style="border-top: solid 1px windowtext;border-bottom: solid 1px windowtext;border-left: solid 1px windowtext;">
																		<xsl:for-each select="ancestor::liqap:WasteProducts/liqap:WasteDescription">
																			<xsl:value-of select="."/>
																			<xsl:if test="position()!=last()">
																				<br/>
																			</xsl:if>
																		</xsl:for-each>
																	</td>
																	<td rowspan="{$cntrow}" class="sign" align="center" style="border-top: solid 1px windowtext;border-bottom: solid 1px windowtext;border-left: solid 1px windowtext;">
																		<xsl:value-of select="ancestor::liqap:WasteProducts/liqap:WasteCode"/>
																	</td>
																</xsl:if>																	
																<td class="sign" align="center" style="border-top: solid 1px windowtext;border-bottom: solid 1px windowtext;border-left: solid 1px windowtext;">
																	<xsl:value-of select="liqap:PackingCode"/>
																</td>
																<td class="sign" align="center" style="border-top: solid 1px windowtext;border-bottom: solid 1px windowtext;border-left: solid 1px windowtext;">
																	<xsl:value-of select="liqap:PackingDescription"/>
																</td>
																<xsl:if test="$npp_con= 1">
																	<td rowspan="{$cntrow}" class="sign" align="center" style="border: solid 1px windowtext;">
																		<xsl:apply-templates select="ancestor::liqap:WasteProducts/liqap:WasteQuantity"/>
																	</td>
																	<td rowspan="{$cntrow}" class="sign" align="center" style="border: solid 1px windowtext;">
																		<xsl:for-each select="ancestor::liqap:WasteProducts/liqap:LiquidationMethod">
																			<xsl:value-of select="."/>
																			<xsl:if test="position()!=last()">
																				<br/>
																			</xsl:if>
																		</xsl:for-each>
																	</td>
																</xsl:if>																	
															</tr>
												</xsl:for-each>
											</xsl:when>
											<xsl:otherwise> <!--нет PackingInformation-->
												<tr>
													<td class="sign" align="center" style="border: solid 1px windowtext;">
														<xsl:value-of select="$npp"/>
													</td>
													<td class="sign" align="center" style="border-top: solid 1px windowtext;border-bottom: solid 1px windowtext;border-left: solid 1px windowtext;">
														<xsl:for-each select="liqap:WasteDescription">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()">
																<br/>
															</xsl:if>
														</xsl:for-each>
													</td>
													<td rowspan="{$cntrow}" class="sign" align="center" style="border-top: solid 1px windowtext;border-bottom: solid 1px windowtext;border-left: solid 1px windowtext;">
														<xsl:value-of select="liqap:WasteCode"/>
													</td>
													<td class="sign" align="center" style="border: solid 1px windowtext;"></td>
													<td class="sign" align="center" style="border: solid 1px windowtext;"></td>
													<td rowspan="{$cntrow}" class="sign" align="center" style="border: solid 1px windowtext;">
														<xsl:apply-templates select="liqap:WasteQuantity"/>
													</td>
													<td rowspan="{$cntrow}" class="sign" align="center" style="border: solid 1px windowtext;">
														<xsl:for-each select="liqap:LiquidationMethod">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()">
																<br/>
															</xsl:if>
														</xsl:for-each>
													</td>
												</tr>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
								</tbody>
							</table>
							
							<table class="w190">
								<col width="25%" valign="bottom" align="left"/>
								<col width="3%" valign="bottom" align="right"/>
								<col width="1%" valign="bottom" align="right"/>
								<col width="71%" valign="bottom" align="left"/>
								<tbody>
									<tr>
										<td width="25%"></td>
										<td width="3%"></td>
										<td width="1%"></td>
										<td width="71%"></td>
									</tr>
									<tr><td colspan="4"><br/></td></tr>
									<tr class="delim"><td colspan="4"> </td></tr>
									<tr>
										<td>
											<span class="txt">Причины уничтожения: </span>
										</td>
										<td></td>
										<td class="border_bottom"></td>
										<td class="border_bottom">
											<xsl:for-each select="liqap:LiquidationReasons">
												<span class="sign">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">
														<br/>
													</xsl:if>
												</span>
											</xsl:for-each>
										</td>
									</tr>
								</tbody>
							</table>
							
							<table class="w190">
								<col width="37%" valign="bottom" align="left"/>
								<col width="3%" valign="bottom" align="right"/>
								<col width="1%" valign="bottom" align="right"/>
								<col width="59%" valign="bottom" align="left"/>
								<tbody>
									<tr>
										<td width="37%"></td>
										<td width="3%"></td>
										<td width="1%"></td>
										<td width="51%"></td>
									</tr>
									<tr><td colspan="4"><br/></td></tr>
									<tr class="delim"><td colspan="4"> </td></tr>
									<tr>
										<td>
											<span class="txt">Уничтожение будет осуществлено: </span>
										</td>
									<td></td>
									<td class="border_bottom"></td>
										<td class="border_bottom">
											<span class="sign">
												<xsl:apply-templates select="liqap:Liquidator" />
											</span>
										</td>
									</tr>
									<tr>
										<td colspan="3"></td>
										<td align="center">
											<span class="graph_under">(лицо, осуществляющее уничтожение)</span>
										</td>
									</tr>
								</tbody>
							</table>
		
							<table class="w190">
								<col width="23%" valign="bottom" align="left"/>
								<col width="3%" valign="bottom" align="right"/>
								<col width="1%" valign="bottom" align="right"/>
								<col width="73%" valign="bottom" align="left"/>
								<tbody>
									<tr>
										<td width="23%"></td>
										<td width="3%"></td>
										<td width="1%"></td>
										<td width="73%"></td>
									</tr>
									<tr><td colspan="4"><br/></td></tr>
									<tr class="delim"><td colspan="4"> </td></tr>
									<tr>
										<td>
											<span class="txt">Место уничтожения: </span>
										</td>
										<td></td>
										<td class="border_bottom"></td>
										<td class="border_bottom">
											<span class="sign">
												<xsl:apply-templates mode="address" select="liqap:LiquidationPlace"/>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
		
							<table class="w190">
								<col width="14%" valign="bottom" align="left"/>
								<col width="3%" valign="bottom" align="right"/>
								<col width="1%" valign="bottom" align="right"/>
								<col width="7%" valign="bottom" align="center"/>
								<col width="1%" valign="bottom" align="right"/>
								<col width="3%" valign="bottom" align="right"/>
								<col width="71%" valign="bottom" align="left"/>
								<tbody>
									<tr>
										<td width="14%"></td>
										<td width="3%"></td>
										<td width="1%"></td>
										<td width="7%"></td>
										<td width="1%"></td>
										<td width="3%"></td>
										<td width="71%"></td>
									</tr>
									<tr><td colspan="7"><br/></td></tr>
									<tr class="delim"><td colspan="7"> </td></tr>
									<tr>
										<td>
											<span class="txt">Приложение: </span>
										</td>
										<td></td>
										<td class="border_bottom"></td>
										<td class="border_bottom"><span class="sign"></span></td>
										<td class="border_bottom"></td>
										<td></td>
										<td><span class="txt"> л.</span></td>
									</tr>
								</tbody>
							</table>
		
							<table class="w190">
								<col width="30%" valign="bottom" align="center"/>
								<col width="3%" valign="bottom" align="center"/>
								<col width="20%" valign="bottom" align="center"/>
								<col width="3%" valign="bottom" align="center"/>
								<col width="30%" valign="bottom" align="center"/>
								<col width="3%" valign="bottom" align="center"/>
								<col width="11%" valign="bottom" align="center"/>
								<tbody>
									<tr>
										<td width="30%"></td>
										<td width="3%"></td>
										<td width="20%"></td>
										<td width="3%"></td>
										<td width="30%"></td>
										<td width="3%"></td>
										<td width="11%"></td>
									</tr>
									<tr><td colspan="7"><br/></td></tr>
									<tr class="delim"><td colspan="7"> </td></tr>
									<tr>
										<td class="border_bottom"><span class="sign"></span><br/></td>
										<td></td>
										<td class="border_bottom"><span class="sign"></span></td>
										<td></td>
										<td class="border_bottom"><span class="sign"></span></td>
										<td></td>
										<td>
											<span class="txt">М. П. </span>
										</td>
									</tr>
									<tr>
										<td valign="top">
											<span class="graph_under">(Резидент ОЭЗ (представитель<br/>резидента ОЭЗ))</span>
										</td>
										<td></td>
										<td valign="top">
											<span class="graph_under">(подпись)</span>
										</td>
										<td></td>
										<td valign="top">
											<span class="graph_under">(Ф.И.О.)</span>
										</td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
		
							<table class="w190">
								<col width="100%"/>
								<tbody>
									<tr><td><br/></td></tr>
									<tr><td class="border_bottom"><br/></td></tr>
								</tbody>
							</table>
		
							<table class="w190">
								<col width="16%" valign="bottom" align="left"/>
								<col width="3%" valign="bottom" align="center"/>
								<col width="4%" valign="bottom" align="center"/>
								<col width="3%" valign="bottom" align="center"/>
								<col width="18%" valign="bottom" align="center"/>
								<col width="3%" valign="bottom" align="center"/>
								<col width="4%" valign="bottom" align="center"/>
								<col width="3%" valign="bottom" align="center"/>
								<col width="46%" valign="bottom" align="left"/>
								<tbody>
									<tr>
										<td width="16%"></td>
										<td width="3%"></td>
										<td width="4%"></td>
										<td width="3%"></td>
										<td width="18%"></td>
										<td width="3%"></td>
										<td width="4%"></td>
										<td width="3%"></td>
										<td width="46%"></td>
									</tr>
									<tr><td colspan="9"><br/></td></tr>
									<tr class="delim">
										<td colspan="2"> </td>
										<td style="border-top: solid 1px gray;border-right: solid 1px gray;border-left: solid 1px gray;"></td>
										<td colspan="3"></td>
										<td style="border-top: solid 1px gray;border-right: solid 1px gray;border-left: solid 1px gray;"></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>с применением</td>
										<td></td>
										<td style="border-right: solid 1px gray;border-left: solid 1px gray;"><span class="sign"></span></td>
										<td></td>
										<td>/ без применения</td>
										<td></td>
										<td style="border-right: solid 1px gray;border-left: solid 1px gray;"><span class="sign"></span></td>
										<td></td>
										<td>таможенного наблюдения.</td>
									</tr>
									<tr class="delim">
										<td colspan="2"> </td>
										<td style="border-bottom: solid 1px gray;border-right: solid 1px gray;border-left: solid 1px gray;"></td>
										<td colspan="3"></td>
										<td style="border-bottom: solid 1px gray;border-right: solid 1px gray;border-left: solid 1px gray;"></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
		
							<table class="w190">
								<col width="60%" valign="bottom" align="left"/>
								<col width="3%" valign="bottom" align="right"/>
								<col width="1%" valign="bottom" align="right"/>
								<col width="36%" valign="bottom" align="left"/>
								<tbody>
									<tr>
										<td width="60%"></td>
										<td width="3%"></td>
										<td width="1%"></td>
										<td width="36%"></td>
									</tr>
									<tr><td colspan="4"><br/></td></tr>
									<tr class="delim"><td colspan="4"> </td></tr>
									<tr>
										<td>
											<span class="txt">Акт об уничтожении должен быть представлен в срок до</span>
										</td>
										<td></td>
										<td class="border_bottom"></td>
										<td class="border_bottom">
											<span class="sign">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="liqap:LiquidationDate"/>
												</xsl:call-template>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
		
							<table class="w190">
								<col width="32%" valign="bottom" align="left"/>
								<col width="3%" valign="bottom" align="center"/>
								<col width="15%" valign="bottom" align="center"/>
								<col width="3%" valign="bottom" align="center"/>
								<col width="14%" valign="bottom" align="left"/>
								<col width="3%" valign="bottom" align="center"/>
								<col width="1%" valign="bottom" align="center"/>
								<col width="29%" valign="bottom" align="left"/>
								<tbody>
									<tr>
										<td width="32%"></td>
										<td width="3%"></td>
										<td width="15%"></td>
										<td width="3%"></td>
										<td width="14%"></td>
										<td width="3%"></td>
										<td width="1%"></td>
										<td width="29%"></td>
									</tr>
									<tr><td colspan="8"><br/></td></tr>
									<tr class="delim"><td colspan="8"> </td></tr>
									<tr>
										<td>
											<span class="txt">Срок уничтожения продлен до</span>
										</td>
										<td></td>
										<td class="border_bottom"><span class="sign"></span><br/></td>
										<td></td>
										<td>
											<span class="txt">на основании</span>
										</td>
										<td></td>
										<td class="border_bottom"></td>
										<td class="border_bottom"><span class="sign"></span></td>
									</tr>
									<tr><td colspan="8"><br/></td></tr>
									<tr class="delim"><td colspan="8"> </td></tr>
									<tr>
										<td colspan="8">
											<span class="txt">Причины невозможности выдачи разрешения на уничтожение:</span>
										</td>
									</tr>
									<tr><td colspan="8"><br/></td></tr>
									<tr class="delim"><td colspan="8"> </td></tr>
									<tr>
										<td colspan="8"  style="border: solid 1px gray">
											<span class="sign"><br/><br/></span>
										</td>
									</tr>
									<tr>
										<td colspan="8" valign="top" align="center">
											<span class="graph_under">(указываются причины, по которым принято решение о невозможности<br/>выдачи разрешения на уничтожение)</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</xsl:when>
					<xsl:otherwise>

						<div class="page_2"><!-- НЕ ОЭЗ-->
							<table class="w250">
								<col width="40%" valign="bottom" align="left"/>
								<col width="5%" valign="top" align="left"/>
								<col width="55%" valign="bottom" align="left"/>
								<tbody>
									<tr>
										<td width="40%"><br/></td>
										<td width="5%"></td>
										<td width="55%"></td>
									</tr>
									<tr>
										<td></td>
										<td><span class="txt_b">В</span></td>
										<td class="border_bottom">
											<span class="sign">
												<xsl:choose>
													<xsl:when test="liqap:Customs/cat_ru:OfficeName">
														<xsl:value-of select="liqap:Customs/cat_ru:OfficeName" />
														<text><br/><span>(код ТО: </span></text>
														<xsl:value-of select="liqap:Customs/cat_ru:Code" />
														<text>)</text>
													</xsl:when>
													<xsl:otherwise>
														<text>ТО </text>
														<xsl:value-of select="liqap:Customs/cat_ru:Code" />
													</xsl:otherwise>
												</xsl:choose>
											</span>
										</td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td align="center">
											<span class="graph_under">(наименование таможенного органа<br/>(с указанием кода таможенного органа))</span>
										</td>
									</tr>
									<tr class="delim"><td colspan="3"> </td></tr>
									<tr>
										<td></td>
										<td><span class="txt_b">От</span></td>
										<td class="border_bottom">
											<span class="sign">
												<xsl:apply-templates select="liqap:OEZ_Resident" />
											</span>
										</td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td align="center">
											<span class="graph_under">(наименование лица, подавшего заявление)</span>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<table class="w250">
								<tbody>
									<tr>
										<td align="center" class="graphMain graph">
											<font size="4">
												<span><b>Заявление</b><br/></span>
											</font>
											<font size="3">
												<xsl:choose>
													<xsl:when test="liqap:DocumentSign = '1'">
														<span>на помещение товаров под таможенную процедуру уничтожения</span>
													</xsl:when>
													<xsl:when test="liqap:DocumentSign = '2'">
														<span>на помещение поврежденных/уничтоженных товаров под таможенную процедуру уничтожения</span>
													</xsl:when>
												</xsl:choose>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table class="w250">
								<col width="100%" valign="bottom" align="left"/>
								<tbody>
									<tr><td><br/></td></tr>
									<tr class="delim"><td> </td></tr>
									<tr>
										<td class="txt_b_bckgr">
											<span class="txt_b">Причины вывода товаров и (или) упаковки из оборота: </span>
										</td>
									</tr>
									<xsl:for-each select="liqap:LiquidationReasons">
										<tr class="delim"><td> </td></tr>
										<tr>
											<td class="border_bottom">
												<span class="sign">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">
														<br/>
													</xsl:if>
												</span>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<table class="w250">
								<col width="80%" valign="bottom" align="left"/>
								<col width="2%" valign="bottom" align="left"/>
								<col width="1%" valign="bottom" align="left"/>
								<col width="17%" valign="bottom" align="left"/>
								<tbody>
									<tr>
										<td width="80%"></td>
										<td width="2%"></td>
										<td width="1%"></td>
										<td width="17%"></td>
									</tr>
									<xsl:if test="liqap:LiquidationDate">
										<tr class="delim"><td> </td></tr>
										<tr>
											<td class="txt_b_bckgr">
												<span class="txt_b">Заявленная дата уничтожения отходов: </span>
											</td>
											<td></td>
											<td class="border_bottom"></td>
											<td class="border_bottom">
												<span class="sign">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="liqap:LiquidationDate"/>
													</xsl:call-template>
												</span>
											</td>
										</tr>
									</xsl:if>	
									<xsl:if test="liqap:TransportationDate">
										<tr class="delim"><td> </td></tr>
										<tr>
											<td>
												<span class="txt">Срок, необходимый для транспортировки товаров из их местонахождения в место уничтожения: </span>
											</td>
											<td></td>
											<td class="border_bottom"></td>
											<td class="border_bottom">
												<span class="sign">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="liqap:TransportationDate"/>
													</xsl:call-template>
												</span>
											</td>
										</tr>
									</xsl:if>	
									<xsl:if test="liqap:LiquidationDuration">
										<tr class="delim"><td> </td></tr>
										<tr>
											<td>
												<span class="txt">Срок, необходимый для уничтожения товаров с указанием времени окончания проведения операций<br/>по уничтожению всех декларируемых товаров заявленными способами: </span>
											</td>
											<td></td>
											<td class="border_bottom"></td>
											<td class="border_bottom">
												<span class="sign">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="liqap:LiquidationDuration"/>
													</xsl:call-template>
												</span>
											</td>
										</tr>
									</xsl:if>	
								</tbody>
							</table>
							<table class="w250">
								<col width="100%" valign="bottom" align="left"/>
								<tbody>
									<xsl:if test="liqap:Liquidator">
										<tr class="delim"><td> </td></tr>
										<tr>
											<td class="txt_b_bckgr">
												<span class="txt_b">Лицо, осуществляющее уничтожение: </span>
											</td>
										</tr>
										<tr class="delim"><td> </td></tr>
										<tr>
											<td class="border_all">
												<span class="sign">
													<xsl:apply-templates select="liqap:Liquidator" />
												</span>
											</td>
										</tr>
									</xsl:if>	
									<xsl:if test="liqap:StorageOrganization">
										<tr class="delim"><td> </td></tr>
										<tr>
											<td class="txt_b_bckgr">
												<span class="txt_b">Лицо, осуществляющее хранение: </span>
											</td>
										</tr>
										<tr class="delim"><td> </td></tr>
										<tr>
											<td class="border_all">
												<span class="sign">
													<xsl:apply-templates select="liqap:StorageOrganization" />
												</span>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="liqap:LiquidationPlace">
										<tr class="delim"><td> </td></tr>
										<tr>
											<td class="txt_b_bckgr">
												<span class="txt_b">Место уничтожения: </span>
											</td>
										</tr>
										<tr class="delim"><td> </td></tr>
										<tr>
											<td class="border_all">
												<span class="sign">
													<xsl:apply-templates mode="address" select="liqap:LiquidationPlace"/>
												</span>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="liqap:GoodsPlace">
										<tr class="delim"><td> </td></tr>
										<tr>
											<td class="txt_b_bckgr">
												<span class="txt_b">Местонахождение товаров, подлежащих уничтожению: </span>
											</td>
										</tr>
										<tr class="delim"><td> </td></tr>
										<tr>
											<td class="border_all">
												<span class="sign">
													<xsl:apply-templates mode="address" select="liqap:GoodsPlace"/>
												</span>
											</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>

							<xsl:if test="liqap:WasteProducts">
								<table class="w250">
									<col width="100%" valign="bottom" align="left"/>
									<tbody>
											<tr class="delim"><td> </td></tr>
											<tr>
												<td class="txt_b_bckgr">
													<span class="txt_b">Отходы, полученные из товаров и (или) упаковки: </span>
												</td>
											</tr>
											<tr class="delim"><td> </td></tr>
									</tbody>
								</table>
								<xsl:for-each select="liqap:WasteProducts">
									<xsl:if test="position() &gt; 1">
										<table class="w250"><tr class="delim_3"><td></td></tr></table>
										<!--table class="w250"><tr class="delim_2"><td class="border_all"></td></tr></table>
										<table class="w250"><tr class="delim_3"><td></td></tr></table-->
									</xsl:if>
									<table class="w250">
										<col width="7%" valign="bottom" align="left"/>
										<col width="7%" valign="bottom" align="left"/>
										<col width="5%" valign="bottom" align="center"/>
										<col width="17%" valign="bottom" align="left"/>
										<col width="15%" valign="bottom" align="left"/>
										<col width="15%" valign="bottom" align="center"/>
										<col width="15%" valign="bottom" align="center"/>
										<col width="19%" valign="bottom" align="center"/>
										<tbody>
											<tr>
												<td width="7%"></td>
												<td width="7%"></td>
												<td width="5%"></td>
												<td width="17%"></td>
												<td width="15%"></td>
												<td width="15%"></td>
												<td width="15%"></td>
												<td width="19%"></td>
											</tr>
											<tr>
												<td class="border_all" valign="top" align="left">
													<table>
														<tbody>
															<tr><td class="col_bckgr"><span class="graph">№ п/п:</span></td></tr>
															<tr>
																<td class="col_bckgr" align="center" valign="middle">
																	<span class="sign">
																		<xsl:value-of select="position()"/>
																	</span>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td colspan="6" class="border_ltb" valign="top" align="left">
													<span class="graph">Наименование отхода в соответствии с Федеральным классификационным каталогом отходов:</span>
													<br/>	
													<span class="sign">
														<xsl:for-each select="liqap:WasteDescription">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()">
																<br/>
															</xsl:if>
														</xsl:for-each>
													</span>
												</td>
												<td class="border_all" valign="top" align="left">
													<span class="graph">Код отхода:</span>
													<br/>	
													<span class="sign">
														<xsl:value-of select="liqap:WasteCode"/>
													</span>
												</td>
											</tr>
												
											<tr>
												<td colspan="2" class="border_ltb" valign="top" align="left">
													<span class="graph">Происхождение<br/>отхода:</span>
													<br/>	
													<span class="sign">
														<xsl:choose>
															<xsl:when test="liqap:WasteSign = 0">
																<xsl:value-of select="'товары'"/>
															</xsl:when>
															<xsl:when test="liqap:WasteSign = 1">
																<xsl:value-of select="'упаковка'"/>
															</xsl:when>
														</xsl:choose>
													</span>
												</td>
												<td colspan="6" class="border_all" valign="top" align="left">
													<span class="graph">Способ уничтожения:</span>
													<br/>	
													<span class="sign">
														<xsl:for-each select="liqap:LiquidationMethod">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()">
																<br/>
															</xsl:if>
														</xsl:for-each>
													</span>
												</td>
											</tr>

											<xsl:if test="liqap:CustomsProcedure or liqap:WastePlace or liqap:OutputDate or liqap:Document">
												<tr>
													<td colspan="3" class="border_ltb" valign="top" align="left">
														<span class="graph">Таможенная процедура,<br/>под которую<br/>планируется<br/>помещать отходы:</span>
														<br/>	
														<span class="sign">
															<xsl:value-of select="liqap:CustomsProcedure"/>
														</span>
													</td>
													<td colspan="3" class="border_ltb" valign="top" align="left">
														<span class="graph">Место нахождения (хранения) предполагаемых отходов:</span>
														<br/>	
														<span class="sign">
															<xsl:apply-templates mode="address" select="liqap:WastePlace"/>
														</span>
													</td>
													<td class="border_ltb" valign="top" align="left">
														<span class="graph">Срок вывоза<br/>отходов, либо<br/>дата помещения<br/>отходов под<br/>иную таможенную<br/>процедуру:</span>
														<br/>	
														<span class="sign">
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="liqap:OutputDate"/>
															</xsl:call-template>
														</span>
													</td>
													<td class="border_all" valign="top" align="left" style="padding-right:2pt;">
														<span class="graph">Документ,<br/>подтверждающий<br/>факт уничтожения:</span>
														<br/>	
														<span class="sign">
															<xsl:apply-templates select="liqap:Document" />
														</span>
													</td>
												</tr>
											</xsl:if>

											<tr>
												<td colspan="3" class="border_ltb" valign="top" align="left">
													<span class="graph">Количество отходов:</span>
													<br/>	
													<span class="sign">
														<xsl:apply-templates select="liqap:WasteQuantity"/>
													</span>
												</td>
												<td class="border_ltb" valign="top" align="left">
													<span class="graph">Стоимость:</span>
													<br/>	
													<span class="sign">
														<xsl:value-of select="translate(liqap:WasteCost,'.', ',')"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="liqap:WasteCostCurrency"/>
													</span>
												</td>
												<td colspan="4" class="border_right" valign="top" align="left">
													<table width="99%">
														<col width="3%"/>
														<col width="3%"/>
														<col width="10%"/>
														<col width="3%"/>
														<col width="81%"/>
														<tr>
															<td width="3%"></td>
															<td width="3%"></td>
															<td width="10%"></td>
															<td width="3%"></td>
															<td width="81%"></td>
														</tr>
														<tr>
															<td colspan="5">
																<span class="graph">Есть возможность коммерческого использования отходов:</span>
															</td>
														</tr>
														<tr class="delim_2"><td colspan="5"></td></tr>
														<tr>
															<td></td>
															<td class="border_all" align="center">
																<xsl:choose>
																	<xsl:when test="liqap:CommercialUsePossibility = 1 or liqap:CommercialUsePossibility = 'true'">
																		<span class="sign">X</span>
																	</xsl:when>
																	<xsl:otherwise>
																			<span class="sign"> </span>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
															<td><span class="sign"> - да</span></td>
															<td class="border_all" align="center">
																<xsl:choose>
																	<xsl:when test="liqap:CommercialUsePossibility = 1 or liqap:CommercialUsePossibility = 'true'">
																		<span class="sign"> </span>
																	</xsl:when>
																	<xsl:otherwise>
																			<span class="sign">X</span>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
															<td><span class="sign"> - нет</span></td>
														</tr>
														<tr class="delim_2"><td></td></tr>
													</table>
												</td>
											</tr>

											
											<xsl:if test="liqap:Consignment">
												<tr>
													<td colspan="8" class="border_all">
														<table width="100%">
															<tbody>
																<tr><td class="col_bckgr"><span class="graph">Сведения о партии товаров:</span></td></tr>
																<tr class="delim_7"><td> </td></tr>
															</tbody>
														</table>
													</td>
												</tr>
												<tr>
													<td colspan="2" rowspan="2" class="border_all" align="center"><span class="graph">Регистрационный<br/>номер ДТ</span></td>
													<td colspan="6" class="border_all" align="center"><span class="graph">Товар, помещенный под таможенную процедуру СТЗ</span></td>
												</tr>
												<tr>
													<td class="border_all" align="center"><span class="graph">Но-<br/>мер<br/>то-<br/>вара</span></td>
													<td class="border_all" align="center"><span class="graph">Код товара по<br/>ТН ВЭД ЕАЭС</span></td>
													<td class="border_all" align="center"><span class="graph">Наименование<br/>товара</span></td>
													<td class="border_all" align="center"><span class="graph">Стоимость</span></td>
													<td class="border_all" align="center"><span class="graph">Количество<br/>товара</span></td>
													<td class="border_all" align="center"><span class="graph">Предполагаемый<br/>способ<br/>уничтожения</span></td>
												</tr>
												<xsl:for-each select="liqap:Consignment">
													<xsl:variable name="cnt_row">
														<xsl:choose>
															<xsl:when test="liqap:Goods">
																<xsl:value-of select="count(liqap:Goods)"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:value-of select="1"/>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:variable>
													<xsl:variable name="npp_con" select="position()"/>
													<xsl:choose>
														<xsl:when test="liqap:Goods">
															<xsl:for-each select="liqap:Goods">
																<tr>
																	<xsl:if test="position() = 1">
																		<td colspan="2" rowspan="{$cnt_row}" class="border_ltb">
																			<span class="sign">
																				<xsl:variable name="gtdn" select="ancestor::liqap:WasteProducts/liqap:Consignment[$npp_con]/liqap:RegNumberDT"/>
																				<xsl:value-of select="$gtdn/cat_ru:CustomsCode"/>
																				<xsl:text>/</xsl:text>
																				<xsl:call-template name="gtd_date">
																					<xsl:with-param name="dateIn" select="$gtdn/cat_ru:RegistrationDate"/>
																				</xsl:call-template>
																				<xsl:text>/</xsl:text>
																				<xsl:value-of select="$gtdn/cat_ru:GTDNumber"/>
																			</span>
																		</td>
																	</xsl:if>
																	<td class="border_ltb">
																		<span class="sign">
																			<xsl:value-of select="liqap:GoodsNumeric"/>
																		</span>
																	</td>
																	<td class="border_ltb">
																		<span class="sign">
																			<xsl:value-of select="liqap:GoodsTNVEDCode"/>
																		</span>
																	</td>
																	<td class="border_ltb">
																		<span class="sign">
																			<xsl:for-each select="liqap:GoodDescription">
																				<xsl:value-of select="."/>
																				<xsl:if test="position()!=last()">
																					<br/>
																				</xsl:if>
																			</xsl:for-each>
																		</span>
																	</td>
																	<td class="border_ltb"><span class="sign"><xsl:value-of select="translate(liqap:Cost,'.', ',')"/></span></td>
																	<td class="border_all">
																		<span class="sign">
																			<xsl:for-each select="liqap:GoodsQuantity">
																				<xsl:apply-templates select="."/>
																				<xsl:if test="position()!=last()">
																					<br/>
																				</xsl:if>
																			</xsl:for-each>
																		</span>
																	</td>
																	<td class="border_all">
																		<span class="sign">
																			<xsl:for-each select="liqap:ProspectiveLiquidationMethod">
																				<xsl:value-of select="."/>
																				<xsl:if test="position()!=last()">
																					<br/>
																				</xsl:if>
																			</xsl:for-each>
																		</span>
																	</td>
																</tr>	
															</xsl:for-each>
														</xsl:when>
														<xsl:otherwise>
															<tr>
																<td colspan="2" rowspan="$cnt_row" class="border_ltb">
																	<span class="sign">
																		<xsl:value-of select="liqap:RegNumberDT/cat_ru:CustomsCode"/>
																		<xsl:text>/</xsl:text>
																		<xsl:call-template name="gtd_date">
																			<xsl:with-param name="dateIn" select="liqap:RegNumberDT/cat_ru:RegistrationDate"/>
																		</xsl:call-template>
																		<xsl:text>/</xsl:text>
																		<xsl:value-of select="liqap:RegNumberDT/cat_ru:GTDNumber"/>
																	</span>
																</td>
																<td class="border_all"><span class="sign"></span></td>
																<td class="border_all"><span class="sign"></span></td>
																<td class="border_all"><span class="sign"></span></td>
																<td class="border_all"><span class="sign"></span></td>
																<td class="border_all"><span class="sign"></span></td>
																<td class="border_all"><span class="sign"></span></td>
															</tr>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:for-each>
											</xsl:if>

											<xsl:if test="liqap:PackingInformation">
												<tr>
													<td colspan="8" class="border_all">
														<table width="100%">
															<tbody>
																<tr><td class="col_bckgr"><span class="graph">Сведения об упаковке:</span></td></tr>
																<tr class="delim_7"><td> </td></tr>
															</tbody>
														</table>
													</td>
												</tr>
												<tr>
													<td colspan="4" class="border_all" align="center"><span class="graph">Код вида упаковки товаров</span></td>
													<td colspan="6" class="border_all" align="center"><span class="graph">Наименование упаковки товаров</span></td>
												</tr>
												<xsl:for-each select="liqap:PackingInformation">
													<tr>
														<td colspan="4" class="border_ltb">
															<span class="sign">
																<xsl:value-of select="liqap:PackingCode"/>
															</span>
														</td>
														<td colspan="4" class="border_all">
															<span class="sign">
																<xsl:value-of select="liqap:PackingDescription"/>
															</span>
														</td>
													</tr>
												</xsl:for-each>
											</xsl:if>		
										</tbody>
									</table>
								</xsl:for-each>
							</xsl:if>	

							<xsl:if test="liqap:LiquidationGoods">
								<table class="w250">
									<col width="100%" valign="bottom" align="left"/>
									<tbody>
											<tr class="delim"><td> </td></tr>
											<tr>
												<td class="txt_b_bckgr">
													<span class="txt_b">Сведения о товарах, подлежащих уничтожению: </span>
												</td>
											</tr>
											<tr class="delim"><td> </td></tr>
									</tbody>
								</table>
								
								<xsl:if test="position() &gt; 1">
									<table class="w250"><tr class="delim_3"><td></td></tr></table>
									<!--table class="w250"><tr class="delim_2"><td class="border_all"></td></tr></table>
									<table class="w250"><tr class="delim_3"><td></td></tr></table-->
								</xsl:if>
								<table class="w250">
									<col width="5%" valign="middle" align="center"/>
									<col width="20%" valign="middle" align="left"/>
									<col width="25%" valign="middle" align="left"/>
									<col width="15%" valign="middle" align="center"/>
									<col width="15%" valign="middle" align="center"/>
									<col width="20%" valign="middle" align="center"/>
									<tbody>
										<tr>
											<td width="5%"></td>
											<td width="20%"></td>
											<td width="25%"></td>
											<td width="15%"></td>
											<td width="15%"></td>
											<td width="20%"></td>
										</tr>
										<tr>
											<td class="border_all" align="center"><span class="graph">Но-<br/>мер<br/>то-<br/>вара</span></td>
											<td class="border_all" align="center"><span class="graph">Код товара по<br/>ТН ВЭД ЕАЭС</span></td>
											<td class="border_all" align="center"><span class="graph">Наименование<br/>товара</span></td>
											<td class="border_all" align="center"><span class="graph">Стоимость</span></td>
											<td class="border_all" align="center"><span class="graph">Количество<br/>товара</span></td>
											<td class="border_all" align="center"><span class="graph">Предполагаемый<br/>способ<br/>уничтожения</span></td>
										</tr>
										<xsl:for-each select="liqap:LiquidationGoods">
											<tr>
												<td class="border_ltb">
													<span class="sign">
														<xsl:value-of select="liqap:GoodsNumeric"/>
													</span>
												</td>
												<td class="border_ltb">
													<span class="sign">
														<xsl:value-of select="liqap:GoodsTNVEDCode"/>
													</span>
												</td>
												<td class="border_ltb">
													<span class="sign">
														<xsl:for-each select="liqap:GoodDescription">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()">
																<br/>
															</xsl:if>
														</xsl:for-each>
													</span>
												</td>
												<td class="border_ltb"><span class="sign"><xsl:value-of select="translate(liqap:Cost,'.', ',')"/></span></td>
												<td class="border_all">
													<span class="sign">
														<xsl:for-each select="liqap:GoodsQuantity">
															<xsl:apply-templates select="."/>
															<xsl:if test="position()!=last()">
																<br/>
															</xsl:if>
														</xsl:for-each>
													</span>
												</td>
												<td class="border_all">
													<span class="sign">
														<xsl:for-each select="liqap:ProspectiveLiquidationMethod">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()">
																<br/>
															</xsl:if>
														</xsl:for-each>
													</span>
												</td>
											</tr>	
										</xsl:for-each>
									</tbody>
								</table>
							</xsl:if>
						</div>
					</xsl:otherwise>
				</xsl:choose>
			</body>
		</html>

	</xsl:template>

	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="liqap:WasteQuantity|liqap:GoodsQuantity">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
		<xsl:text> </xsl:text>
		<xsl:choose>
			<xsl:when test="cat_ru:MeasureUnitQualifierName">
				<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>кг</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text> / </xsl:text>
		<xsl:choose>
			<xsl:when test="cat_ru:MeasureUnitQualifierCode">
				<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="cat_ru:MeasureUnitQualifierName">
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>166</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<!-- Шаблон для типа liqap:LiquidationParticipantType -->
	<xsl:template match="liqap:OEZ_Resident|liqap:Liquidator">
		<xsl:choose>
			<xsl:when test="cat_ru:OrganizationName">
				<xsl:value-of select="cat_ru:OrganizationName"/>,&#160;
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="cat_ru:ShortName">
					<xsl:value-of select="cat_ru:ShortName"/>,&#160;
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="cat_ru:RFOrganizationFeatures">
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="liqap:PersonPost">
			<span><br/>должность: </span>
			<xsl:value-of select="liqap:PersonPost"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<span><br/>Адрес: </span>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="liqap:FactAddress">
			<span><br/>Фактический адрес: </span>
			<xsl:apply-templates mode="address" select="liqap:FactAddress"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<br/>
			<xsl:for-each select="RUScat_ru:CommunicationDetails">
				<xsl:apply-templates select="." />
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<br/>
			<xsl:for-each select="RUScat_ru:IdentityCard">
				<xsl:apply-templates select="." />
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="liqap:OEZ_ResidentCertif">
			<br/>
			<xsl:for-each select="liqap:OEZ_ResidentCertif">
				<xsl:apply-templates select="." />
			</xsl:for-each>
		</xsl:if>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:SubjectDetailsType -->
	<xsl:template match="liqap:StorageOrganization">
		<xsl:choose>
			<xsl:when test="cat_ru:OrganizationName">
				<xsl:value-of select="cat_ru:OrganizationName"/>,&#160;
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="cat_ru:ShortName">
					<xsl:value-of select="cat_ru:ShortName"/>,&#160;
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="cat_ru:RFOrganizationFeatures">
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="liqap:PersonPost">
			<span><br/>должность: </span>
			<xsl:value-of select="liqap:PersonPost"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<span><br/>Адрес: </span>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<br/>
			<xsl:for-each select="RUScat_ru:CommunicationDetails">
				<xsl:apply-templates select="." />
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<br/>
			<xsl:for-each select="RUScat_ru:IdentityCard">
				<xsl:apply-templates select="." />
			</xsl:for-each>
		</xsl:if>
	</xsl:template>


	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="liqap:OEZ_ResidentCertif|liqap:Document">
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


	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:if test="RUScat_ru:IdentityCardCode">
			<xsl:apply-templates select="RUScat_ru:IdentityCardCode"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardName">
			<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries">
			<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardNumber">
			<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<span>Контакты: </span>
		<xsl:if test="cat_ru:Phone">
			<span>тел.: </span>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>	
		<xsl:if test="cat_ru:Fax">
			<xsl:if test="cat_ru:Phone">
				<xsl:text>; </xsl:text>
			</xsl:if>
			<span>факс: </span>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>	
		<xsl:if test="cat_ru:Telex">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax">
				<xsl:text>; </xsl:text>
			</xsl:if>
			<span>телекс: </span>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>	
		<xsl:if test="cat_ru:E_mail">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax or cat_ru:E_mail">
				<xsl:text>; </xsl:text>
			</xsl:if>
			<span>e-mail: </span>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>	
		<xsl:if test="position()!=last()">
			<xsl:text>, </xsl:text>
		</xsl:if>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<span>ОГРН/ОГРНИП:</span>
			<xsl:value-of select="cat_ru:OGRN"/>
			<xsl:if test="cat_ru:INN or cat_ru:KPP">
				<text>, </text>
			</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<span>ИНН:</span>
			<xsl:value-of select="cat_ru:INN"/>
			<xsl:if test="cat_ru:KPP">
				<text>, </text>
			</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<span>КПП:</span>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template mode="address" match="*">
		<xsl:if test="cat_ru:PostalCode">
			<xsl:value-of select="cat_ru:PostalCode"/>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">
			<xsl:if test="cat_ru:PostalCode">, </xsl:if>
			<xsl:if test="cat_ru:CounryName">(</xsl:if>
			<xsl:value-of select="cat_ru:CountryCode"/>
			<xsl:if test="cat_ru:CounryName">) </xsl:if>
			<xsl:value-of select="cat_ru:CounryName"/>
		</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="cat_ru:Region"/>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
			<xsl:value-of select="cat_ru:City"/>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="cat_ru:TerritoryCode">
			<xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City or cat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="cat_ru:TerritoryCode"/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="reverse">
		<xsl:param name="pStr"/>
		<xsl:variable name="vLength" select="string-length($pStr)"/>
		<xsl:choose>
			<xsl:when test="$vLength = 1">
				<xsl:value-of select="$pStr"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="vHalfLength" select="floor($vLength div 2)"/>
				<xsl:variable name="vrevHalf1">
					<xsl:call-template name="reverse">
						<xsl:with-param name="pStr"
								 select="substring($pStr, 1, $vHalfLength)"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="vrevHalf2">
					<xsl:call-template name="reverse">
						<xsl:with-param name="pStr"
								 select="substring($pStr, $vHalfLength+1)"/>
					</xsl:call-template>
				</xsl:variable>

				<xsl:value-of select="concat($vrevHalf2, $vrevHalf1)"/>
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
	
	<xsl:template name="gtd_date">
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
	

	<xsl:template name="get_cntrow">
		<xsl:param name="i"/>
		<xsl:param name="cnt_row"/>

		<xsl:choose>
			<xsl:when test="liqap:Consignment[$i]">
				<xsl:variable name="tmp_goods">
					<xsl:choose>
						<xsl:when test="liqap:Consignment[$i]/liqap:Goods">
							<xsl:value-of select="count(liqap:Consignment[$i]/liqap:Goods)"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="1"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:call-template name="get_cntrow">
					<xsl:with-param name="i" select="$i+1"/>
					<xsl:with-param name="cnt_row" select="$cnt_row + $tmp_goods"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$cnt_row"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
