<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:lqact="urn:customs.ru:Information:CustomsDocuments:LiquidationAct:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="lqact:LiquidationAct">
		<html>
			<head>
				<title>Акт об уничтожении</title>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style type="text/css">
					body {
					background: #ffffff;
					}

					div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 0pt #000000;
					}

					div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 0pt #000000;
					}

					h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
					}

					.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
					}

					.header {
					font-weight: bold;
					margin-top:20px;
					}

					table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}

					td {
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
					}

					.low {
					font: 12;
					font-fase: Courier;
					}
					.graph {
					font-family: Arial;
					font-size: 8pt;
					}
					jh {
					font: 16;
					font-face: Arial;
					}
					dog1 {
					position:relative;
					left: 50px;
					bottom: 50px;
					}
					.gra {
					font-family: Arial;
					font-size: pt;
					}
					.g{
					border-right:0pt solid;
					}
				</style>
			</head>
			<body>
				<div class="album_page">
					<table>
						<tr>
							<td align="right" class="graph" style="border:solid 0pt" width="50%">В   </td>
							<td class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #000000;">
								<xsl:if test="lqact:CUCustoms/cat_ru:OfficeName">
									<xsl:value-of select="lqact:CUCustoms/cat_ru:OfficeName"/>,
								</xsl:if>
								<xsl:value-of select="lqact:CUCustoms/cat_ru:Code"/>
							</td>
						</tr>
						<tr>
							<td class="graph" style="border:solid 0pt"/>
							<td class="graph" style="border:solid 0pt">(наименование таможенного органа (с указанием кода таможенного органа))</td>
						</tr>
						<tr>
							<td align="right" class="graph" style="border:solid 0pt" width="50%">От</td>
							<td class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #000000;">
								<xsl:if test="lqact:ResidentOEZ/cat_ru:OrganizationName">
									<xsl:value-of select="lqact:ResidentOEZ/cat_ru:OrganizationName"/>
								</xsl:if>
								<xsl:if test="lqact:ResidentOEZ/cat_ru:ShortName">
									(<xsl:value-of select="lqact:ResidentOEZ/cat_ru:ShortName"/>)
								</xsl:if> 
								<xsl:choose>
									<xsl:when test="lqact:ResidentOEZ/cat_ru:RFOrganizationFeatures">
										<xsl:apply-templates select="lqact:ResidentOEZ/cat_ru:RFOrganizationFeatures"/>
									</xsl:when>
									<xsl:when test="lqact:ResidentOEZ/cat_ru:RKOrganizationFeatures">
										<xsl:apply-templates select="lqact:ResidentOEZ/cat_ru:RKOrganizationFeatures"/>
									</xsl:when>
									<xsl:when test="lqact:ResidentOEZ/cat_ru:RBOrganizationFeatures">
										<xsl:apply-templates select="lqact:ResidentOEZ/cat_ru:RBOrganizationFeatures"/>
									</xsl:when>
								</xsl:choose> 
								<xsl:if test="lqact:ResidentOEZ/cat_ru:Address">
									<xsl:apply-templates select="lqact:ResidentOEZ/cat_ru:Address"/>
								</xsl:if>
								<xsl:if test="lqact:ResidentOEZ/cat_ru:IdentityCard">
									<xsl:apply-templates select="lqact:ResidentOEZ/cat_ru:IdentityCard"/>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td style="border:solid 0pt"/>
							<td class="graph" style="border:solid 0pt">(наименование/ адрес резидента ОЭЗ (нерезидента ОЭЗ ОГРН, ИНН, КПП) или фамилия, имя, отчество (для физических лиц, ИНН, ОГРНИП)</td>
						</tr>
					</table>
					<xsl:variable name="num" select="count(lqact:ApplicationRegNumber)" />
					<table>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td align="center" class="graph" colspan="4" style="border:solid 0pt">
								Акт № <u>         </u>/ <u>

								</u>/ <u>         </u>АУ<br/>
								<xsl:text>об уничтожении товаров</xsl:text>
								<xsl:choose>
									<xsl:when test="lqact:DocumentSign=0">
										<xsl:text>, помещенных под таможенную процедуру СТЗ и пришедших в негодность
										</xsl:text>
									</xsl:when>
									<xsl:when test="lqact:DocumentSign=1">
										<xsl:text> под таможенным контролем</xsl:text>
									</xsl:when>
									<xsl:when test="lqact:DocumentSign=2">
										<xsl:text>, подтверждающий факт уничтожения/утилизации товаров (ст. 297 ТК ТС)</xsl:text>
									</xsl:when>
								</xsl:choose>

								об уничтожении товаров, помещенных под таможенную процедуру СТЗ<br/> и пришедших в негодность, и (или) упаковки
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt"> </td>
						</tr>
						<xsl:if test="$num != 0">
							<tr>
								<td class="graph" colspan="4" style="border:solid 0pt">
									1. Разрешение на уничтожение товаров, пришедших в негодность, и (или) упаковки на территории ОЭЗ или вывоз таких товаров и (или) упаковки в целях их уничтожения за пределы территории ОЭЗ, выданное уполномоченным таможенным органом на уничтожение таких товаров в соответствии с Заявлением на уничтожение №
									<xsl:if test="lqact:ApplicationRegNumber/lqact:CustomsCode">
										<xsl:value-of select="lqact:ApplicationRegNumber/lqact:CustomsCode"/>
										<xsl:text>/</xsl:text>
									</xsl:if>
									<xsl:call-template name="russian_date_gtd">
										<xsl:with-param name="dateIn" select="lqact:ApplicationRegNumber/lqact:RegistrationDate"/>
									</xsl:call-template>/<xsl:value-of select="lqact:ApplicationRegNumber/lqact:SerialNumber"/> /ЗУН
								</td>
							</tr>
							<tr>
								<td style="border:solid 0pt" width="57%"> </td>
								<td align="center" class="graph" colspan="2" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:0px solid #ffffff; border-bottom:0px solid #ffffff;" width="34%">
									(регистрационный номер)
								</td>
								<td style="border:solid 0pt" width="21%"> </td>
							</tr>
						</xsl:if>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt">
								<xsl:value-of select="$num + 1" />
								<xsl:text>.</xsl:text>
								Настоящий акт составлен на <u>         </u>листе (ах).
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt">
								<xsl:value-of select="$num + 2" />
								<xsl:text>.</xsl:text>
								Уничтожение осуществлено
								<u>
									<xsl:if test="lqact:Liquidator/cat_ru:OrganizationName">
										<xsl:value-of select="lqact:Liquidator/cat_ru:OrganizationName"/>
									</xsl:if>
									<xsl:if test="lqact:Liquidator/cat_ru:ShortName">
										(<xsl:value-of select="lqact:Liquidator/cat_ru:ShortName"/>)
									</xsl:if> 
									<xsl:choose>
										<xsl:when test="lqact:Liquidator/cat_ru:RFOrganizationFeatures">
											<xsl:apply-templates select="lqact:Liquidator/cat_ru:RFOrganizationFeatures"/>
										</xsl:when>
										<xsl:when test="lqact:Liquidator/cat_ru:RKOrganizationFeatures">
											<xsl:apply-templates select="lqact:Liquidator/cat_ru:RKOrganizationFeatures"/>
										</xsl:when>
										<xsl:when test="lqact:Liquidator/cat_ru:RBOrganizationFeatures">
											<xsl:apply-templates select="lqact:Liquidator/cat_ru:RBOrganizationFeatures"/>
										</xsl:when>
									</xsl:choose> 
									<xsl:if test="lqact:Liquidator/cat_ru:Address">
										<xsl:apply-templates select="lqact:Liquidator/cat_ru:Address"/>
									</xsl:if>
									<xsl:if test="lqact:ResidentOEZ/cat_ru:IdentityCard">
										<xsl:apply-templates select="lqact:ResidentOEZ/cat_ru:IdentityCard"/>
									</xsl:if>
									<xsl:if test="lqact:Liquidator/lqact:OEZ_ResidentCertif/cat_ru:PrDocumentNumber">
										Номер свидетельства:<xsl:value-of select="lqact:Liquidator/lqact:OEZ_ResidentCertif/cat_ru:PrDocumentNumber"/>
									</xsl:if>
								</u>
							</td>
						</tr>
						<tr>
							<td style="border:solid 0pt"> </td>
							<td align="center" class="graph" colspan="3" style="border:solid 0pt">(лицо, осуществившее операции по уничтожению)</td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt">
								<xsl:value-of select="$num + 3" />
								<xsl:text>.</xsl:text>
								Место уничтожения
								<u>
									<xsl:apply-templates select="lqact:LiquidationPlace"/>
								</u>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt">
								<xsl:value-of select="$num + 4" />
								<xsl:text>.</xsl:text>
								Сведения об уничтоженных товарах:
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt">
								Таблица I. Товары, помещенные под таможенную процедуру СТЗ, которые утратили свои потребительские свойства и стали окончательно непригодны в том
								качестве, для которого они предназначены:<br/>
								<table style="border: solid 1pt #000000;">
									<tr>
										<td align="center" class="graph" rowspan="2" style="border: solid 1pt #000000; width:9mm;">
											№<br/>п/п
										</td>
										<td align="center" class="graph" rowspan="2" style="border: solid 1pt #000000; width:46mm;">Наименование товара</td>
										<td align="center" class="graph" rowspan="2" style="border: solid 1pt #000000; width:22mm;">Код</td>
										<td align="center" class="graph" colspan="5" style="border: solid 1pt #000000; width:129mm;">Товар, помещенный под таможенную процедуру СТЗ</td>
										<td align="center" class="graph" rowspan="2" style="border: solid 1pt #000000; width:9mm;">
											Ко-<br/>ли-<br/>чест-<br/>во
										</td>
										<td align="center" class="graph" rowspan="2" style="border: solid 1pt #000000; width:42mm;">Способ уничтожения товаров</td>
										<td align="center" class="graph" rowspan="2" style="border: solid 1pt #000000; width:30mm;">Документ об уничтожении</td>
										<td align="center" class="graph" rowspan="2" style="border: solid 1pt #000000; width:10mm;">
											Отхо-<br/>ды
										</td>
										<td rowspan="2" align="center" class="graph" style="border: solid 1pt #000000">
											Код <br/>отхода<br/> в соот-<br/>ветст-<br/> вии<br/> с ТН<br/>ВЭД<br/>ЕАЭС
										</td>
									</tr>
									<tr>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:30mm;">Регистрационный номер</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:43mm;">Наименование товара</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:8mm;">
											Но-<br/>мер<br/>то-<br/>ва-<br/>ра
										</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:18mm;">Код товара по ТНВЭДЕАЭС(10 знаков)</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:30mm;">Количество товара</td>
									</tr>
									<tr>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:9mm;">1</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:46mm;">2</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:22mm;">3</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:30mm;">4</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:43mm;">5</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:8mm;">6</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:18mm;">7</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:30mm;">8</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:9mm;">9</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:42mm;">10</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:30mm;">11</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:10mm;">12</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:20mm;">13</td>
									</tr>
									<xsl:for-each select="lqact:WasteProducts[lqact:WasteSign='0']">
										<tr>
											<td align="center" class="graph" style="border: solid 1pt #000000; width:9mm;">
												<xsl:value-of select="position()"/>.
											</td>
											<td align="center" class="graph" style="border: solid 1pt #000000; width:46mm;">
												<xsl:for-each select="lqact:WasteDescription">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()"> </xsl:if>
												</xsl:for-each>
											</td>
											<td align="center" class="graph" style="border: solid 1pt #000000; width:22mm;">
												<xsl:value-of select="lqact:WasteCode"/>
											</td>
											<td align="center" class="graph" colspan="5" style="border-left:0px solid #000000; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:0px solid #ffffff; width:129mm;">
												<table>
													<xsl:for-each select="lqact:Consignment">
														<tr>
															<td class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:4px solid #ffffff; width:30mm;">
																<xsl:value-of select="lqact:RegNumberDT/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
																	<xsl:with-param name="dateIn" select="lqact:RegNumberDT/cat_ru:RegistrationDate"/>
																</xsl:call-template>/<xsl:value-of select="lqact:RegNumberDT/cat_ru:GTDNumber"/>
																<xsl:if test="position()!=last()">
																	<br/>
																</xsl:if>
															</td>
															<td colspan="4" style="border-left:0px solid #000000; border-top:0px solid #ffffff; border-right:0px solid #000000; border-bottom:4px solid #ffffff; width:109mm;">
																<table frame="rhs" border="1">
																	<xsl:for-each select="lqact:Goods">
																		<tr>
																			<td align="left" class="graph" style="border:0px solid #ffffff; width:43mm;">
																				<xsl:value-of select="position()"/>. 
																				<xsl:for-each select="lqact:GoodDescription">
																					<xsl:value-of select="."/>
																					<xsl:if test="position()!=last()"> </xsl:if>
																				</xsl:for-each>
																				<br/>
																			</td>
																			<td class="graph" style="border-left:0px solid #000000; border-top:0px solid #ffffff; border-right:0px solid #000000; border-bottom:0px solid #ffffff; width:8mm;">
																				<xsl:value-of select="lqact:GoodsNumeric"/>
																			</td>
																			<td class="graph" style="border-left:0px solid #000000; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:0px solid #ffffff; width:18mm; word-wrap: break-word;">
																				<xsl:value-of select="lqact:GoodsTNVEDCode"/>
																			</td>
																			<td class="graph" style="border-left:0px solid #000000; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:0px solid #ffffff; width:30mm; word-wrap: break-word;">
																				<xsl:for-each select="lqact:GoodsQuantity">
																					<xsl:value-of select="cat_ru:GoodsQuantity"/>
																					<xsl:if test="cat_ru:MeasureUnitQualifierName">
																						<xsl:text> (</xsl:text>
																						<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
																						<xsl:text>)</xsl:text>
																					</xsl:if>
																					<br/>
																				</xsl:for-each>
																			</td>
																		</tr>
																	</xsl:for-each>
																</table>
															</td>
														</tr>
													</xsl:for-each>
												</table>
											</td>
											<td align="center" class="graph" style="border-left:1px solid #000000; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:1px solid #000000; width:9mm;">
												<xsl:value-of select="lqact:WasteQuantity/cat_ru:GoodsQuantity"/>
												<br/>
												<xsl:if test="lqact:WasteQuantity/cat_ru:MeasureUnitQualifierName">
													<xsl:value-of select="lqact:WasteQuantity/cat_ru:MeasureUnitQualifierName"/>/<br/>
												</xsl:if>
												<xsl:if test="lqact:WasteQuantity/cat_ru:MeasureUnitQualifierCode">
													<xsl:value-of select="lqact:WasteQuantity/cat_ru:MeasureUnitQualifierCode"/>
												</xsl:if>
											</td>
											<td align="center" class="graph" style="border: solid 1pt #000000; width:42mm;">
												<xsl:for-each select="lqact:LiquidationMethod">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()"> </xsl:if>
												</xsl:for-each>
											</td>
											<td align="center" class="graph" style="border: solid 1pt #000000; width:30mm;">
												<xsl:if test="lqact:Document/cat_ru:PrDocumentNumber">
													№ <xsl:value-of select="lqact:Document/cat_ru:PrDocumentNumber"/>
												</xsl:if>
												<xsl:if test="lqact:Document/cat_ru:PrDocumentDate">
													от 
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="lqact:Document/cat_ru:PrDocumentDate"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td align="center" class="graph" style="border: solid 1pt #000000; width:10mm;">
												<xsl:choose>
													<xsl:when test="lqact:NewWasteSign='1' or lqact:NewWasteSign='t' or lqact:NewWasteSign='true'">есть</xsl:when>
													<xsl:when test="lqact:NewWasteSign='0' or lqact:NewWasteSign='f' or lqact:NewWasteSign='false'">нет</xsl:when>
												</xsl:choose>
											</td>
											<td align="center" class="graph" style="border: solid 1pt #000000; width:20mm;">
												<xsl:value-of select="lqact:WasteTNVEDCode"/>
											</td>
										</tr>
									</xsl:for-each>
								</table>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt">
								<br/>Таблица II. Упаковка:<br/>
								<table>
									<tr>
										<td align="center" class="graph" rowspan="2" style="border: solid 1pt #000000; width:9mm;">
											№<br/>п/п
										</td>
										<td align="center" class="graph" rowspan="2" style="border: solid 1pt #000000; width:56mm;">Наименование товара</td>
										<td align="center" class="graph" rowspan="2" style="border: solid 1pt #000000; width:22mm;">Код</td>
										<td align="center" class="graph" colspan="2" style="border: solid 1pt #000000; width:85mm;">Упаковка и упаковочные материалы, ввезенные на территорию ОЭЗ</td>
										<td align="center" class="graph" rowspan="2" style="border: solid 1pt #000000; width:15mm;">
											Коли-<br/>чество
										</td>
										<td align="center" class="graph" rowspan="2" style="border: solid 1pt #000000; width:60mm;">Способ уничтожения упаковки</td>
										<td align="center" class="graph" rowspan="2" style="border: solid 1pt #000000; width:40mm;">Документ об уничтожении</td>
										<td align="center" class="graph" rowspan="2" style="border: solid 1pt #000000; width:10mm;">Отходы</td>
									</tr>
									<tr>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:10mm;">Код</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:10mm;">Наименование</td>
									</tr>
									<tr>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:9mm;">1</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:56mm;">2</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:22mm;">3</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:10mm;">4</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:75mm;">5</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:15mm;">6</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:60mm;">7</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:40mm;">8</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:10mm;">9</td>
									</tr>
									<xsl:for-each select="lqact:WasteProducts[lqact:WasteSign='1']">
										<tr>
											<td align="center" class="graph" style="border: solid 1pt #000000; width:9mm;">
												<xsl:value-of select="position()"/>.
											</td>
											<td align="center" class="graph" style="border: solid 1pt #000000; width:56mm;">
												<xsl:for-each select="lqact:WasteDescription">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">
														<br/>
													</xsl:if>
												</xsl:for-each>
											</td>
											<td align="center" class="graph" style="border: solid 1pt #000000; width:22mm;">
												<xsl:value-of select="lqact:WasteCode"/>
											</td>
											<td colspan="2" style="border: solid 1pt #000000; width:85mm;">
												<table>
													<tr>
														<td align="center" class="graph" style="border: solid 0pt #000000; width:10mm;">
															<xsl:for-each select="lqact:PackingInformation">
																<xsl:value-of select="lqact:PackingCode"/>
																<xsl:if test="position()!=last()">
																	<br/>
																</xsl:if>
															</xsl:for-each>
														</td>
														<td class="graph" style="border: solid 0pt #000000; width:75mm;">
															<xsl:for-each select="lqact:PackingInformation">
																<xsl:value-of select="position()"/>. 
																<xsl:value-of select="lqact:PackingDescription"/>
																<xsl:if test="position()!=last()">
																	<br/>
																</xsl:if>
															</xsl:for-each>
														</td>
													</tr>
												</table>
											</td>
											<td align="center" class="graph" style="border: solid 1pt #000000; width:15mm;">
												<xsl:value-of select="lqact:WasteQuantity/cat_ru:GoodsQuantity"/> 
												<xsl:if test="lqact:WasteQuantity/cat_ru:MeasureUnitQualifierName">
													<xsl:value-of select="lqact:WasteQuantity/cat_ru:MeasureUnitQualifierName"/>/
												</xsl:if>
												<xsl:if test="lqact:WasteQuantity/cat_ru:MeasureUnitQualifierCode">
													<br/>
													<xsl:value-of select="lqact:WasteQuantity/cat_ru:MeasureUnitQualifierCode"/>
												</xsl:if>
											</td>
											<td align="center" class="graph" style="border: solid 1pt #000000; width:60mm;">
												<xsl:for-each select="lqact:LiquidationMethod">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
											</td>
											<td align="center" class="graph" style="border: solid 1pt #000000; width:40mm;">
												<xsl:if test="lqact:Document/cat_ru:PrDocumentNumber">
													№ <xsl:value-of select="lqact:Document/cat_ru:PrDocumentNumber"/>
												</xsl:if>
												<xsl:if test="lqact:Document/cat_ru:PrDocumentDate">
													, 
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="lqact:Document/cat_ru:PrDocumentDate"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td align="center" class="graph" style="border: solid 1pt #000000; width:10mm;">
												<xsl:choose>
													<xsl:when test="lqact:NewWasteSign='1' or lqact:NewWasteSign='t' or lqact:NewWasteSign='true'">есть</xsl:when>
													<xsl:when test="lqact:NewWasteSign='0' or lqact:NewWasteSign='f' or lqact:NewWasteSign='false'">нет</xsl:when>
												</xsl:choose>
											</td>
										</tr>
									</xsl:for-each>
								</table>
							</td>
						</tr>

						<xsl:if test="lqact:DeclRegNumber">
							<tr>
								<td class="graph" colspan="4" style="border:solid 0pt"> </td>
							</tr>
							<tr>
								<td class="graph" colspan="4" style="border:solid 0pt">
									<xsl:value-of select="$num + 5" />
									<xsl:text>.</xsl:text>
									Сведения о таможенных декларациях:
								</td>
							</tr>
							<td class="graph" colspan="4" style="border:solid 0pt">
								<table style="border: solid 1pt #000000;width:150mm">
									<tr>
										<td align="center" class="graph" style="border: solid 1pt #000000;">
											Код таможенного органа,<br/> зарегистрировавшего документ
										</td>
										<td align="center" class="graph" style="border: solid 1pt #000000; width:25mm">
											Дата регистрации<br/> документа
										</td>
										<td align="center" class="graph" style="border: solid 1pt #000000;">
											Порядковый номер<br/> документа по <br/>журналу регистрации
										</td>
									</tr>
									<xsl:for-each select="lqact:DeclRegNumber">
										<tr>
											<td align="center" class="graph" style="border: solid 1pt #000000;">
												<xsl:value-of select="cat_ru:CustomsCode"/>
											</td>
											<td align="center" class="graph" style="border: solid 1pt #000000;">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate" />
												</xsl:call-template>
											</td>
											<td align="center" class="graph" style="border: solid 1pt #000000;">
												<xsl:value-of select="cat_ru:GTDNumber"/>
											</td>
										</tr>
									</xsl:for-each>
								</table>
							</td>
						</xsl:if>

						<xsl:if test="lqact:LiquidationGoods">
							<tr>
								<td class="graph" colspan="4" style="border:solid 0pt"> </td>
							</tr>
							<tr>
								<td class="graph" colspan="4" style="border:solid 0pt">
									<xsl:value-of select="$num + 6" />
									<xsl:text>.</xsl:text>
									Сведения о товарах, помещенных под таможенную процедуру уничтожения:
								</td>
							</tr>
							<td class="graph" colspan="4" style="border:solid 0pt">
								<table style="border: solid 1pt #000000; width:220mm">
									<tr>
										<td rowspan="2" align="center" class="graph" style="border: solid 1pt #000000;">
											Наименование товара
										</td>
										<td rowspan="2" align="center" class="graph" style="border: solid 1pt #000000;">
											Номер товара
										</td>
										<td rowspan="2" align="center" class="graph" style="border: solid 1pt #000000;">
											Код товара<br/>по ТН ВЭД ЕАЭС
										</td>
										<td colspan="3" align="center" class="graph" style="border: solid 1pt #000000;">
											Количество товара
										</td>
									</tr>
									<tr>
										<td align="center" class="graph" style="border: solid 1pt #000000;">
											Количество<br/>товара в<br/>единице<br/>измерения
										</td>
										<td align="center" class="graph" style="border: solid 1pt #000000;">
											Условное<br/>обозначение<br/>единицы<br/>измерения
										</td>
										<td align="center" class="graph" style="border: solid 1pt #000000;">
											Код единицы измерения<br/> в соответствии <br/>с единицами измерения,<br/> применяемыми в ТН ВЭД ЕАЭС
										</td>
									</tr>
									<xsl:for-each select="lqact:LiquidationGoods">
										<xsl:choose>
											<xsl:when test="lqact:GoodsQuantity">
												<xsl:variable name="numGoods" select="count(lqact:GoodsQuantity)"/>
												<xsl:for-each select="lqact:GoodsQuantity">
													<tr>
														<xsl:if test="position()=1">
															<td rowspan="{$numGoods}" align="center" class="graph" style="border: solid 1pt #000000;">
																<xsl:for-each select="../lqact:GoodDescription">
																	<xsl:value-of select="."/>
																	<br/>
																</xsl:for-each>
															</td>
															<td rowspan="{$numGoods}" align="center" class="graph" style="border: solid 1pt #000000;">
																<xsl:value-of select="../lqact:GoodsNumeric"/>
															</td>
															<td rowspan="{$numGoods}" align="center" class="graph" style="border: solid 1pt #000000;">
																<xsl:value-of select="../lqact:GoodsTNVEDCode"/>
															</td>
														</xsl:if>
														<td align="center" class="graph" style="border: solid 1pt #000000;">
															<xsl:value-of select="cat_ru:GoodsQuantity"/>
														</td>
														<td align="center" class="graph" style="border: solid 1pt #000000;">
															<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
														</td>
														<td align="center" class="graph" style="border: solid 1pt #000000;">
															<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
														</td>
													</tr>
												</xsl:for-each>

											</xsl:when>
											<xsl:otherwise>
												<tr>
													<td align="center" class="graph" style="border: solid 1pt #000000;">
														<xsl:for-each select="lqact:GoodDescription">
															<xsl:value-of select="."/>
															<br/>
														</xsl:for-each>
													</td>
													<td align="center" class="graph" style="border: solid 1pt #000000;">
														<xsl:value-of select="lqact:GoodsNumeric"/>
													</td>
													<td align="center" class="graph" style="border: solid 1pt #000000;">
														<xsl:value-of select="lqact:GoodsTNVEDCode"/>
													</td>
													<td colspan="3" align="center" class="graph" style="border: solid 1pt #000000;">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</td>
												</tr>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
								</table>
							</td>
						</xsl:if>
					</table>


					<table>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td class="graph" style="border:solid 0pt" width="25%">
								<xsl:value-of select="$num + 7" />
								<xsl:text>.</xsl:text>
								Приложение к акту:</td>
							<td class="graph" colspan="3" style="border:solid 0pt"/>
						</tr>
						<tr>
							<td class="graph" style="border:solid 0pt" width="25%"> </td>
							<td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:0px solid #ffffff; border-bottom:0px solid #ffffff;" width="30%">
								(количество листов + опись)
							</td>
							<td class="graph" colspan="2" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td align="center" class="graph" colspan="2" style="border:solid 0pt">
								<xsl:if test="lqact:ResidentOEZ/cat_ru:OrganizationName">
									<xsl:value-of select="lqact:ResidentOEZ/cat_ru:OrganizationName"/> 
								</xsl:if>
								<xsl:if test="lqact:ResidentOEZ/lqact:PersonPost">
									(<xsl:value-of select="lqact:ResidentOEZ/lqact:PersonPost"/>)
								</xsl:if>
							</td>
							<td class="graph" style="border:solid 0pt"/>
							<td class="graph" style="border:solid 0pt"/>
						</tr>
						<tr>
							<td align="center" class="graph" colspan="2" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:0px solid #ffffff; border-bottom:0px solid #ffffff;" width="40%">
								(должность, инициалы, фамилия представителя резидента ОЭЗ/нерезидента ОЭЗ/декларанта, составившего акт)
							</td>
							<td class="graph" style="border:solid 0pt"/>
							<td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:0px solid #ffffff; border-bottom:0px solid #ffffff;" width="12%">
								(подпись)
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:0px solid #ffffff; border-bottom:0px solid #ffffff;"> </td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt">При уничтожении присутствовали:</td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt">1) От уполномоченного таможенного органа:</td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td class="graph" colspan="2" style="border:solid 0pt">
								<xsl:for-each select="lqact:ParticipatedPerson[lqact:PersonSign='0']">
									<xsl:if test="cat_ru:PersonPost">
										<xsl:value-of select="cat_ru:PersonPost"/>: 
									</xsl:if>
									<xsl:value-of select="cat_ru:PersonSurname"/> 
									<xsl:value-of select="cat_ru:PersonName"/>
									<xsl:if test="cat_ru:PersonMiddleName">
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
									</xsl:if>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</td>
							<td class="graph" style="border:solid 0pt"/>
							<td class="graph" style="border:solid 0pt"/>
						</tr>
						<tr>
							<td align="center" class="graph" colspan="2" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:0px solid #ffffff; border-bottom:0px solid #ffffff;">
								(должность (и), инициалы, фамилия (ии) должностного (ых) лица (ц) уполномоченного таможенного органа, присутствовавшего
								(их) при уничтожении)
							</td>
							<td class="graph" style="border:solid 0pt"/>
							<td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:0px solid #ffffff; border-bottom:0px solid #ffffff;" width="12%">
								(подпись (и))
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt">2) От заявителя (резидента ОЭЗ/декларанта/таможенного представителя):</td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td class="graph" colspan="2" style="border:solid 0pt">
								<xsl:for-each select="lqact:ParticipatedPerson[lqact:PersonSign='1']">
									<xsl:if test="cat_ru:PersonPost">
										<xsl:value-of select="cat_ru:PersonPost"/>: 
									</xsl:if>
									<xsl:value-of select="cat_ru:PersonSurname"/> 
									<xsl:value-of select="cat_ru:PersonName"/>
									<xsl:if test="cat_ru:PersonMiddleName">
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
									</xsl:if>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</td>
							<td class="graph" style="border:solid 0pt"/>
							<td class="graph" style="border:solid 0pt"/>
						</tr>
						<tr>
							<td align="center" class="graph" colspan="2" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:0px solid #ffffff; border-bottom:0px solid #ffffff;">
								(должности, инициалы, фамилии представителя (ей) резидента ОЭЗ, присутствовавшего (их) при уничтожении)
							</td>
							<td class="graph" style="border:solid 0pt"/>
							<td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:0px solid #ffffff; border-bottom:0px solid #ffffff;" width="12%">
								(подпись (и))
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt">3) От организации, осуществляющей уничтожение:</td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td class="graph" colspan="2" style="border:solid 0pt">
								<xsl:for-each select="lqact:ParticipatedPerson[lqact:PersonSign='2']">
									<xsl:if test="cat_ru:PersonPost">
										<xsl:value-of select="cat_ru:PersonPost"/>: 
									</xsl:if>
									<xsl:value-of select="cat_ru:PersonSurname"/> 
									<xsl:value-of select="cat_ru:PersonName"/>
									<xsl:if test="cat_ru:PersonMiddleName">
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
									</xsl:if>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</td>
							<td class="graph" style="border:solid 0pt"/>
							<td class="graph" style="border:solid 0pt"/>
						</tr>
						<tr>
							<td align="center" class="graph" colspan="2" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:0px solid #ffffff; border-bottom:0px solid #ffffff;">
								(должности, инициалы, фамилии представителя (ей) резидента ОЭЗ, присутствовавшего (их) при уничтожении)
							</td>
							<td class="graph" style="border:solid 0pt"/>
							<td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:0px solid #ffffff; border-bottom:0px solid #ffffff;" width="12%">
								(подпись (и))
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="4" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td class="graph" colspan="2" style="border:solid 0pt"/>
							<td class="graph" colspan="2" style="border:solid 0pt">
								<table>
									<tr>
										<td style="border:solid 0pt" width="63%"/>
										<td align="center" class="graph" style="border: solid 1pt #000000;">
											Отметки таможенного органа<br/> 
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<span>
				ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
			</span>,
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<span>
				ИНН: <xsl:value-of select="cat_ru:INN"/>
			</span>,
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<span>
				КПП: <xsl:value-of select="cat_ru:KPP"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span>
				УНП: <xsl:value-of select="cat_ru:UNP"/>
			</span>,
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span>
				Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
			</span>,
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span>
				БИН: <xsl:value-of select="cat_ru:BIN"/>
			</span>,
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<span>
				ИИН: <xsl:value-of select="cat_ru:IIN"/>
			</span>,
		</xsl:if>
		<xsl:for-each select="cat_ru:ITN">
			<span>
				ИТН:
				<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
				<xsl:if test="cat_ru:ITNReserv">
					/<xsl:value-of select="cat_ru:ITNReserv"/>
				</xsl:if>
			</span>
			<br/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="cat_ru:Address">
		Адрес:
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode">
			(<xsl:value-of select="cat_ru:CountryCode"/>)
		</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="cat_ru:Region"/>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
			<xsl:value-of select="cat_ru:City"/>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="cat_ru:PostalCode">
			Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
		</xsl:if> 
	</xsl:template>
	<xsl:template match="lqact:LiquidationPlace">
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode">
			(<xsl:value-of select="cat_ru:CountryCode"/>)
		</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="cat_ru:Region"/>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
			<xsl:value-of select="cat_ru:City"/>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="cat_ru:PostalCode">
			Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
		</xsl:if> 
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
	<xsl:template match="cat_ru:IdentityCard">
		Документ удостоверяющий личность: 
		<xsl:if test="cat_ru:IdentityCardName">
			<xsl:value-of select="cat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardCode">
			(код вида документа <xsl:value-of select="cat_ru:IdentityCardCode"/>)
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode"> </xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
			<span>
				Серия номер:
				<xsl:value-of select="cat_ru:IdentityCardSeries"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="cat_ru:IdentityCardNumber"/>
			</span>
			 
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
			Выдан
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
			</xsl:call-template>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:value-of select="cat_ru:OrganizationName"/>
			 
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
