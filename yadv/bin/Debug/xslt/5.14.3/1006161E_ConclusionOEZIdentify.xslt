<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:conid="urn:customs.ru:Information:CustomsDocuments:ConclusionOEZIdentify:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ConclusionOEZIdentifyType -->
	<xsl:template match="conid:ConclusionOEZIdentify">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									}

									div.page {
									width: 277mm;
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
				<div class="page" style="font-family:Arial;">
					<table>
						<tbody>
							<tr align="center">
								<td width="30%">
									<xsl:value-of select="conid:Customs/cat_ru:OfficeName"/>
								</td>
								<td width="40%"></td>
								<td width="30%">
									<xsl:value-of select="conid:OEZ_Resident/cat_ru:OrganizationName"/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/><br/>
					<table width="100%">
						<tbody>
							<tr>
								<td align="center">
									<b>
										ЗАКЛЮЧЕНИЕ
									<xsl:if test="conid:DocSign='2'">
										<br/>о 
											<xsl:if test="conid:Conclusion='false' or conid:Conclusion='f' or conid:Conclusion='0'">не</xsl:if>
											возможности идентификации иностранных товаров, помещаемых (помещенных) под таможенную процедуру СТЗ, в готовой продукции
									</xsl:if>
									</b>
									<br/>
									<br/>
									от <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="conid:RegistrationNumber/conid:RegistrationDate"/></xsl:call-template><xsl:text> № </xsl:text><xsl:value-of select="conid:RegistrationNumber/conid:Number"/>
									<xsl:if test="conid:DocSign='2'">
										<xsl:text> </xsl:text>
										<xsl:value-of select="conid:RegistrationNumber/conid:AbbrDoc"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<br/>
									Рассмотрев Заявление об идентификации иностранных товаров, помещаемых (помещенных) под таможенную процедуру свободной таможенной зоны, в готовой продукции 
									№ <xsl:value-of select="conid:RegistrationNumberImp/conid:Number"/>
									<xsl:if test="conid:RegistrationNumberImp/conid:RegistrationDate">
									<xsl:text> от </xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="conid:RegistrationNumberImp/conid:RegistrationDate"/>
									</xsl:call-template>
									</xsl:if>
									<xsl:text> сообщаем</xsl:text>
									<xsl:if test="conid:Conclusion='true' or conid:Conclusion='t' or conid:Conclusion='1'">
										<xsl:text> о возможности идентификации иностранных товаров (таблица № 1)  в готовой продукции (таблица № 2) с применением следующего(их) способа(ов) идентификации:</xsl:text>
										<br/>
										<xsl:for-each select="conid:MethodIdentify">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
										<br/>
										<br/>
										Таблица №1
										<table style="width:100%;border:1px solid;">
											<tbody>
												<tr>
													<td colspan="5" align="center" style="border:1px solid;">Сведения о товарах</td>
												</tr>
												<tr align="center" valign="top">
													<td style="border:1px solid;">наименование товара</td>
													<td style="border:1px solid;">код товара</td>
													<td style="border:1px solid;">идентификационные признаки товара</td>
													<td style="border:1px solid;">регистрационный номер ДТ/порядковый номер(а) товара</td>
													<td style="border:1px solid;">количество товара / единицы измерения (основная и дополнительная)</td>
												</tr>
												<tr>
													<td style="border:1px solid;">1</td>
													<td style="border:1px solid;">2</td>
													<td style="border:1px solid;">3</td>
													<td style="border:1px solid;">4</td>
													<td style="border:1px solid;">5</td>
												</tr>
												<xsl:for-each select="conid:GoodsInfo">
													<tr valign="top">
														<td style="border:1px solid;">
															<xsl:apply-templates select="conid:GoodsDescription"/>
														</td>
														<td style="border:1px solid;">
															<xsl:choose>
																<xsl:when test="conid:DocSign='1'"><xsl:value-of select="substring(conid:GoodsTNVEDCode,1,6)"/></xsl:when>
																<xsl:otherwise><xsl:value-of select="conid:GoodsTNVEDCode"/></xsl:otherwise>
															</xsl:choose>
														</td>
														<td style="border:1px solid;">
															<xsl:for-each select="conid:GoodsGroupInformation">
																<xsl:for-each select="*">
																	<xsl:choose>
																		<xsl:when test="contains(local-name(.),'Date')">
																			<xsl:call-template name="russian_date">
																				<xsl:with-param name="dateIn" select="."/>
																			</xsl:call-template>
																		</xsl:when>
																		<xsl:when test="local-name(.)='WoodDescriptionDetails'">
																			<xsl:apply-templates mode="WoodDescriptionDetails" select="."/>
																		</xsl:when>
																		<xsl:when test="local-name()='Dimensions'">
																			<xsl:apply-templates mode="Dimensions" select="."/>
																		</xsl:when>
																		<xsl:when test="local-name()='GoodsGroupQuantity'">
																			<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
																		</xsl:when>
																		<xsl:when test="local-name()='LicenseGroup'">
																			<xsl:if test="not(preceding-sibling::*[local-name()='LicenseGroup'])">
																				<!--для unbounted элемента LicenseGroup выведем сразу все, как только всетретили первый-->
																				<xsl:for-each select="../*[local-name()='LicenseGroup']">
																					<xsl:if test="position()=1"><xsl:text>Сведения о разрешительном документе к товарной группе: </xsl:text></xsl:if>
																					<xsl:if test="position()!=1"><xsl:text>; </xsl:text></xsl:if>
																					<xsl:apply-templates select="."/>
																				</xsl:for-each>
																			</xsl:if>
																		</xsl:when>
																		<xsl:otherwise>
																			<xsl:apply-templates select="."/>
																		</xsl:otherwise>
																	</xsl:choose>
																	<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
																</xsl:for-each>
																<xsl:if test="position()!=last()"><br/></xsl:if>
															</xsl:for-each>
														</td>
														<td style="border:1px solid;">
															<xsl:for-each select="conid:NumberDT">
																<xsl:value-of select="cat_ru:CustomsCode"/>
																<xsl:text>/</xsl:text>
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
																</xsl:call-template>
																<xsl:text>/</xsl:text>
																<xsl:value-of select="cat_ru:GTDNumber"/>
															</xsl:for-each>
															<xsl:if test="conid:GoodsNumeric">
																<xsl:text> / </xsl:text>
																<xsl:value-of select="conid:GoodsNumeric"/>
															</xsl:if>
														</td>
														<td style="border:1px solid;">
															<xsl:for-each select="conid:GoodsQuantity">
																<xsl:for-each select="*">
																	<xsl:if test="local-name(.)='MeasureUnitQualifierCode'">(</xsl:if>
																	<xsl:value-of select="."/>
																	<xsl:if test="local-name(.)='MeasureUnitQualifierCode'">)</xsl:if>
																	<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
																</xsl:for-each>
																<xsl:if test="position()!=last()"><br/></xsl:if>
															</xsl:for-each>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
										<br/>
										Таблица № 2
										<table style="width:100%;border:1px solid;">
											<tbody>
												<tr>
													<td colspan="4" align="center" style="border:1px solid;">Сведения о готовой продукции</td>
												</tr>
												<tr align="center" valign="top">
													<td style="border:1px solid;">наименование товара</td>
													<td style="border:1px solid;">код товара по ТН ВЭД ЕАЭС</td>
													<td style="border:1px solid;">идентификационные признаки товара</td>
													<td style="border:1px solid;">количество товара / единицы измерения (основная и дополнительная)</td>
												</tr>
												<tr>
													<td style="border:1px solid;">1</td>
													<td style="border:1px solid;">2</td>
													<td style="border:1px solid;">3</td>
													<td style="border:1px solid;">4</td>
												</tr>
												<xsl:for-each select="conid:GoodsOut">
													<tr valign="top">
														<td style="border:1px solid;">
															<xsl:apply-templates select="conid:GoodsDescription"/>
														</td>
														<td style="border:1px solid;">
															<xsl:choose>
																<xsl:when test="conid:DocSign='1'"><xsl:value-of select="substring(conid:GoodsTNVEDCode,1,6)"/></xsl:when>
																<xsl:otherwise><xsl:value-of select="conid:GoodsTNVEDCode"/></xsl:otherwise>
															</xsl:choose>
														</td>
														<td style="border:1px solid;">
															<xsl:for-each select="conid:GoodsGroupInformation">
																<xsl:for-each select="*">
																	<xsl:choose>
																		<xsl:when test="contains(local-name(.),'Date')">
																			<xsl:call-template name="russian_date">
																				<xsl:with-param name="dateIn" select="."/>
																			</xsl:call-template>
																		</xsl:when>
																		<xsl:when test="local-name(.)='WoodDescriptionDetails'">
																			<xsl:apply-templates mode="WoodDescriptionDetails" select="."/>
																		</xsl:when>
																		<xsl:when test="local-name()='Dimensions'">
																			<xsl:apply-templates mode="Dimensions" select="."/>
																		</xsl:when>
																		<xsl:when test="local-name()='GoodsGroupQuantity'">
																			<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
																		</xsl:when>
																		<xsl:when test="local-name()='LicenseGroup'">
																			<xsl:if test="not(preceding-sibling::*[local-name()='LicenseGroup'])">
																				<xsl:if test="position()!=1"><xsl:text>; </xsl:text></xsl:if>
																				<xsl:if test="position()=1"><xsl:text>Сведения о разрешительном документе к товарной группе: </xsl:text></xsl:if>
																				<!--для unbounted элемента LicenseGroup выведем сразу все, как только всетретили первый-->
																				<xsl:for-each select="../*[local-name()='LicenseGroup']">
																					<xsl:apply-templates select="."/>
																				</xsl:for-each>
																			</xsl:if>
																		</xsl:when>
																		<xsl:otherwise>
																			<xsl:apply-templates select="."/>
																		</xsl:otherwise>
																	</xsl:choose>
																	<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
																</xsl:for-each>
																<xsl:if test="position()!=last()"><br/></xsl:if>
															</xsl:for-each>
														</td>
														<td style="border:1px solid;">
															<xsl:for-each select="conid:GoodsQuantity">
																<xsl:for-each select="*">
																	<xsl:if test="local-name(.)='MeasureUnitQualifierCode'">(</xsl:if>
																	<xsl:value-of select="."/>
																	<xsl:if test="local-name(.)='MeasureUnitQualifierCode'">)</xsl:if>
																	<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
																</xsl:for-each>
																<xsl:if test="position()!=last()"><br/></xsl:if>
															</xsl:for-each>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</xsl:if>
									<xsl:if test="conid:Conclusion='false' or conid:Conclusion='f' or conid:Conclusion='0'">
										<xsl:text>, что идентификация иностранных товаров в готовой продукции, согласно Заявлению, не возможна в связи со следующим:</xsl:text>
										<br/>
										<xsl:apply-templates select="conid:Reason"/>
										<br/>
										<br/>
									</xsl:if>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="conid:Conclusion='true' or conid:Conclusion='t' or conid:Conclusion='1'">
						
					</xsl:if>
					<br/>
					<br/>
					<table style="font-family:Arial;width:190mm;">
						<tbody>
							<tr>
								<td align="center" style="border-bottom:1px solid;" width="30%">
									<xsl:value-of select="conid:CustomsPerson/cat_ru:PersonName"/>
								</td>
								<td width="15%"></td>
								<td style="border-bottom:1px solid;" width="15%"></td>
								<td width="15%"></td>
								<td width="15%" align="center"><xsl:value-of select="conid:CustomsPerson/cat_ru:LNP"/></td>
							</tr>
							<tr>
								<td style="font-size:8pt" align="center">(инициалы и фамилия уполномоченного должностного лица таможенного органа)</td>
								<td></td>
								<td style="font-size:8pt" align="center">(подпись)</td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:WoodDescriptionDetailsType -->
	<xsl:template  mode="WoodDescriptionDetails" match="*">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
				<xsl:if test="local-name()='WoodSortiment'">
					<xsl:text>Наим.сортимента: </xsl:text>
					<xsl:value-of select="."/>
				</xsl:if>
				<xsl:if test="local-name()='WoodKind'">
					<xsl:text>Порода древесины: </xsl:text>
					<xsl:value-of select="."/>
				</xsl:if>
				<xsl:if test="local-name()='ProductSortName'">
					<xsl:text>Наименование сорта:</xsl:text>
					<xsl:value-of select="."/>
				</xsl:if>
				<xsl:if test="local-name()='AllowanceDetails'">
					<xsl:text>Припуск по длине, ширине, высоте: </xsl:text>
					<xsl:apply-templates mode="Dimensions" select="."/>
				</xsl:if>
				<xsl:if test="local-name()='DeviationDetails'">
					<xsl:text>Отклонения по длине, ширине, высоте: </xsl:text>
					<xsl:apply-templates mode="Dimensions" select="."/>
				</xsl:if>
				<xsl:if test="local-name()='catESAD_cu:DiameterRangeDetails'">
					<xsl:text>Диапазон диаметров: </xsl:text>
					<xsl:apply-templates mode="Dimensions" select=".">
						<xsl:with-param name="separator" select="'-'"/>
					</xsl:apply-templates>
				</xsl:if>
				<xsl:if test="local-name()='ContractVolumeMeasure'">
					<xsl:text> Объем товара в соответствии с контрактом: </xsl:text>
					<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
				</xsl:if>
				<xsl:if test="local-name()='FactVolumeMeasure'">
					<xsl:text> Фактический объем товара: </xsl:text>
					<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
				</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:DimensionType и catESAD_cu:RangeMeasureType-->
	<xsl:template mode="Dimensions" match="*">
		<xsl:param name="separator" select="'x'"/>
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="$separator"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_cu:SupplementaryQuantityType и catESAD_cu:UnifiedPhysicalMeasureType-->
	<xsl:template mode="SupplementaryQuantity" match="*">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
			<xsl:choose>
				<xsl:when test="local-name()='MeasureUnitQualifierCode'">
					<xsl:text>(</xsl:text><xsl:value-of select="."/><xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:LicenseGroupType-->	
	<xsl:template match="catESAD_cu:LicenseGroup">
		<xsl:if test="catESAD_cu:LicDocument">
			<xsl:apply-templates select="catESAD_cu:LicDocument"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsNumericLic">
			<xsl:if test="catESAD_cu:LicDocument">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:text>№ п/п товара: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsNumericLic"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="catESAD_cu:LicDocument">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
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
