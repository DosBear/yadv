<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru catESAD_cu aacd" version="1.0" xmlns:aacd="urn:customs.ru:Information:CustomsDocuments:ApplicationAcceptClassDecision:5.14.3" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
	<xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
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
	<xsl:template name="Date">
		<xsl:value-of select="substring (., 9, 2)"/> 
					<xsl:variable name="month" select="substring(., 6, 2)"/>
		<xsl:choose>
			<xsl:when test="$month=1">января</xsl:when>
			<xsl:when test="$month=2">февраля</xsl:when>
			<xsl:when test="$month=3">марта</xsl:when>
			<xsl:when test="$month=4">апреля</xsl:when>
			<xsl:when test="$month=5">мая</xsl:when>
			<xsl:when test="$month=6">июня</xsl:when>
			<xsl:when test="$month=7">июля</xsl:when>
			<xsl:when test="$month=8">августа</xsl:when>
			<xsl:when test="$month=9">сентября</xsl:when>
			<xsl:when test="$month=10">октября</xsl:when>
			<xsl:when test="$month=11">ноября</xsl:when>
			<xsl:when test="$month=12">декабря</xsl:when>
		</xsl:choose> 					
					<xsl:value-of select="substring(., 1, 4)"/> г.
	</xsl:template>
	<!--Шаблон для типа RUScat_ru:RUIdentityCardType-->
	<xsl:template match="aacd:IdentityCard">
	Документ удостоверяющий личность:
		<xsl:if test="RUScat_ru:IdentityCardCode">
			Код вида документа <span class="graphMain">
				<xsl:apply-templates select="RUScat_ru:IdentityCardCode"/> </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardName">
			Вид документа <span class="graphMain">
				<xsl:apply-templates select="RUScat_ru:IdentityCardName"/> </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardName">
			Серия <span class="graphMain">
				<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/> </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardNumber">
			Номер <span class="graphMain">
				<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/> </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate">
			Дата выдачи <span class="graphMain">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
				</xsl:call-template> </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:OrganizationName">
			Кем выдан <span class="graphMain">
				<xsl:apply-templates select="RUScat_ru:OrganizationName"/> </span>
		</xsl:if>
	</xsl:template>
	<xsl:template name="GoodsInfo">
		<table>
			<tbody>
				<tr>
					<td>
						<b>Наименование товара:</b>
						<xsl:for-each select="aacd:GoodsDescription">
							<span class="graphMain">
								 <xsl:value-of select="."/> 
							</span>
						</xsl:for-each>
					</td>
				</tr>
				<xsl:if test="aacd:TechnicalDescription">
					<tr>
						<td>
							<b>Общее техническое описание товара:</b>
							<xsl:for-each select="aacd:TechnicalDescription">
								<span class="graphMain">
									 <xsl:value-of select="."/> 
								</span>
							</xsl:for-each>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="aacd:MethodInstal">
					<tr>
						<td>
							<b>Способ монтажа:</b>
							<span class="graphMain">
								 <xsl:value-of select="aacd:MethodInstal"/>
							</span>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="aacd:AddressFactInstal">
					<tr>
						<td>
							<b>Адрес места фактической сборки, монтажа, установки: </b>
							<span class="graphMain">
								<xsl:apply-templates select="aacd:AddressFactInstal"/>
							</span>
						</td>
					</tr>
				</xsl:if>
				<tr>
					<td>
						<b>Период поставки:</b>  c <span class="graphMain">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="aacd:BeginDate"/>
							</xsl:call-template>
						</span>
						<!--xsl:if test="aacd:EndDate"-->
						 по <span class="graphMain">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="aacd:EndDate"/>
							</xsl:call-template>
						</span>
						<!--/xsl:if-->
					</td>
				</tr>
				<tr>
					<td>
						<b>Код таможенной процедуры:</b>
						<span class="graphMain">
							 <xsl:value-of select="aacd:CustomsModeCode"/>
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<b>Контролирующая таможня:</b>
					Код таможенного органа
						<span class="graphMain">
							<xsl:value-of select="aacd:CustomsControls/cat_ru:Code"/>
						</span>
						<xsl:if test="aacd:CustomsControls/cat_ru:OfficeName">
					Наименование таможенного органа
						<span class="graphMain">
								<xsl:value-of select="aacd:CustomsControls/cat_ru:OfficeName"/>
							</span>
						</xsl:if>
					</td>
				</tr>
				<xsl:if test="aacd:Reason">
					<tr>
						<td>
							<b>Причины по которым невозможна подача заявлений на выпуск в одном таможенном органе:</b>
							<span class="graphMain">
								<xsl:for-each select="aacd:Reason">
									 <xsl:value-of select="."/> 
								</xsl:for-each>
							</span>
						</td>
					</tr>
				</xsl:if>
				<tr>
					<td>
						<b>Компоненты:</b>
						<table border="1" cellpadding="0" cellspacing="0" width="100%">
							<tbody>
								<tr>
									<td align="center" rowspan="2" style="width:10mm">
										<b>№</b>
									</td>
									<td align="center" rowspan="2" style="width:35mm">
										<b>Наименование</b>
									</td>
									<td align="center" rowspan="2" style="width:15mm">
										<b>Код ТН ВЭД ЕАЭС</b>
									</td>
									<td align="center" rowspan="2" style="width:20mm">
										<b>Вес</b>
									</td>
									<td align="center" colspan="2" style="width:40mm">
										<b>Количество</b>
									</td>
									<td align="center" rowspan="2" style="width:60mm">
										<b>Характеристики</b>
									</td>
									<td align="center" rowspan="2" style="width:30mm">
										<b>Таможенный орган вывоза</b>
									</td>
								</tr>
								<tr>
									<td align="center" style="width:30mm">
										<b>Кол-во тов. в ед. изм.</b>
									</td>
									<td align="center" style="width:10mm">
										<b>Ед. изм.</b>
									</td>
								</tr>
								<xsl:for-each select="aacd:Component">
									<tr>
										<td align="center">
											<xsl:value-of select="aacd:NumberComponent"/>
										</td>
										<td align="center">
											<xsl:value-of select="aacd:NameComponent"/>
										</td>
										<td align="center">
											<xsl:value-of select="aacd:TNVEDCode"/>
										</td>
										<td align="center">
											<xsl:value-of select="aacd:NetWeightQuantity"/>
										</td>
										<td align="center">
											<xsl:value-of select="aacd:GoodsInformation/catESAD_cu:GoodsGroupQuantity/cat_ru:GoodsQuantity"/>
										</td>
										<td align="center">
											<xsl:value-of select="aacd:GoodsInformation/catESAD_cu:GoodsGroupQuantity/cat_ru:MeasureUnitQualifierName"/>
											<xsl:if test="aacd:GoodsInformation/catESAD_cu:GoodsGroupQuantity/cat_ru:MeasureUnitQualifierName and aacd:GoodsInformation/catESAD_cu:GoodsGroupQuantity/cat_ru:MeasureUnitQualifierCode">
												<xsl:text> (</xsl:text>
											</xsl:if>
											<xsl:value-of select="aacd:GoodsInformation/catESAD_cu:GoodsGroupQuantity/cat_ru:MeasureUnitQualifierCode"/>
											<xsl:if test="aacd:GoodsInformation/catESAD_cu:GoodsGroupQuantity/cat_ru:MeasureUnitQualifierName and aacd:GoodsInformation/catESAD_cu:GoodsGroupQuantity/cat_ru:MeasureUnitQualifierCode">
												<xsl:text>)</xsl:text>
											</xsl:if>
										</td>
										<td align="center">
											<xsl:for-each select="aacd:GoodsInformation">
												<xsl:for-each select="*[local-name()='Manufacturer' or local-name()='TradeMark' or local-name()='GoodsMark' or local-name()='GoodsModel' or local-name()='GoodsMarking' or local-name()='GoodsStandard' or local-name()='GoodsSort' or local-name()='WoodDescriptionDetails' or local-name()='Dimensions' or local-name()='DateIssue' or local-name()='SerialNumber']">
													<xsl:if test="position()!=1 and local-name()!='SerialNumber'"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
													<xsl:choose>
														<xsl:when test="local-name()='WoodDescriptionDetails'">
															<xsl:apply-templates select="."/>
														</xsl:when>
														<xsl:when test="local-name()='DateIssue'">
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="."/>
															</xsl:call-template> 
														</xsl:when>
														<xsl:when test="local-name()='Dimensions'">
															<xsl:apply-templates mode="Dimensions" select="."/>
														</xsl:when>
														<xsl:when test="local-name()='SerialNumber' and not(preceding-sibling::*[local-name()='SerialNumber'])">
															<!--для unbounted элемента SerialNumber выведем сразу все, как только всетретили первый (это надо, чтобы не делать лишних пробелов между ними)-->
															<xsl:apply-templates select="../*[local-name()='SerialNumber']"/>
															<!--xsl:for-each select="../*[local-name()='SerialNumber']">
																<xsl:value-of select="."/>
															</xsl:for-each-->
														</xsl:when>
														<xsl:otherwise>
															<xsl:if test="local-name()!='SerialNumber'">
																<xsl:apply-templates select="."/>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:for-each>
											</xsl:for-each>
										</td>
										<td align="center">
											<xsl:value-of select="aacd:CustomsExport/cat_ru:Code"/> 
											<xsl:value-of select="aacd:CustomsExport/cat_ru:OfficeName"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="aacd:ApplicationAcceptClassDecision">
		<html>
			<head>
				<title>Заявление о принятии классификационного решения</title>
			</head>
			<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
			<style type="text/css">
                    body {
						text-align: center;
                        background: #cccccc;
                    }
                        
                    div.page {
                        width: 180mm;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }
						table {
                        border: 0;
                        cellpadding: 1;
                        cellspacing: 0;
                        width:100%;
                        border-collapse: collapse;
                    }
                    
                    }
                    @media print {
                        div.page {
                            border: none;
                            padding: 0;
                        }
                    }
                       
                     .underlined {
						 font-family: Arial,  bold;
                        font-size: 11pt;
                        border-bottom: solid 1pt #000000;
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

					.delim {
						height: 7pt;
					}
		
					.delim_3 {
						height: 3pt;
					}
					.value
					{
					border-bottom: solid 1px black;
					}
}
			</style>
			<body>
				<div class="page">
					<!--Сведения о заявителе-->
					<table border="0" style="width:180mm">
						<tbody>
							<tr>
								<td align="center" class="graphMain" style="width:180mm">
Начальнику (заместителю начальника) Управления товарной номенклатуры
                           <br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphMain" style="width:180mm">
									<b>ЗАЯВЛЕНИЕ<br/>о принятии <xsl:if test="aacd:DecisionSign='0'">предварительного</xsl:if> решения о классификации товара, перемещаемого через таможенную границу Союза в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, ввоз или вывоз которого предполагается различными товарными партиями в течение установленного периода времени</b>
									<br/>
									<br/>
								</td>
							</tr>
							<!--tr>
                        <td align="center" class="graph12">
                           <b>№ <xsl:value-of select="aacd:NumberApplication"/>
                           </b>
                        </td>
                     </tr>
                     <tr>
                        <td align="right" class="graph12">
                           <b>
                              <xsl:for-each select="aacd:DateApplication">
                                 <xsl:call-template name="Date"/>
                              </xsl:for-each>
                           </b>
                        </td>
                     </tr-->
						</tbody>
					</table>
					<table border="0" style="width:180mm">
						<tbody>
							<tr>
								<td align="left" class="graphMain value">
									<xsl:apply-templates select="aacd:Declarant"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle">
									<xsl:text>сведения о заявителе (наименование, идентификационный номер налогоплательщика, основной государственный регистрационный номер, почтовый адрес, контактный телефон)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					
					<xsl:if test="aacd:CUESADCustomsRepresentative">
						<table border="0" style="width:180mm">
							<tbody>
								<tr>
									<td align="left" class="graphMain value">
										<xsl:apply-templates select="aacd:CUESADCustomsRepresentative"/>
										<br/>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle">
										<xsl:text>(сведения о таможенном представителе)</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<table border="0" style="width:180mm">
						<tbody>
							<tr style="text-align: justify">
								<td align="left" class="graphMain">
									<xsl:text>&#160;&#160;&#160;&#160;&#160;Прошу  выдать  решение  о  классификации  товара,  перемещаемого  через таможенную  границу Союза в несобранном или разобранном виде, в том числе в некомплектном   или   незавершенном   виде,   ввоз   или   вывоз   которого предполагается  различными  товарными  партиями  в  течение  установленного периода времени.
									</xsl:text>
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<!--Сведения о товаре и его компонентах-->
					<table border="0">
						<tbody>
							<tr>
								<td>
									<span align="left" class="graphMain">
										<b>Подробное описание товара(ов):</b>
										<br/>
									</span>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:for-each select="aacd:GoodInfo">
										<b>Товар №<xsl:number value="position()"/>.</b>
										<br/>
										<xsl:call-template name="GoodsInfo"/>
									</xsl:for-each>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>
									<span align="left" class="graphMain">
										<b>Опись прилагаемых документов:</b>
									</span>
								</td>
							</tr>
							<xsl:for-each select="aacd:AttachedDocuments">
								<tr>
									<td>
										<xsl:number value="position()"/>.
									<xsl:value-of select="cat_ru:PrDocumentName"/> 
									<xsl:value-of select="cat_ru:PrDocumentNumber"/> 
									<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="30%" class="graphMain value" align="center"><xsl:value-of select="aacd:PersonSignature/cat_ru:PersonPost"/></td>
								<td width="3%"/>
								<td width="20%" class="graphMain value"/>
								<td width="3%"/>
								<td width="44%" class="graphMain value" align="center">
									<xsl:value-of select="aacd:PersonSignature/cat_ru:PersonSurname"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="aacd:PersonSignature/cat_ru:PersonName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="aacd:PersonSignature/cat_ru:PersonMiddleName"/>
								</td>
							</tr>
							<tr>
								<td class="graphLittle" align="center">(должность)</td>
								<td width="3%"/>
								<td class="graphLittle" align="center">(подпись заявителя)</td>
								<td width="3%"/>
								<td class="graphLittle" align="center">(Ф. И. О.)</td>
							</tr>
							<tr>
								<td class="graphLittle"></td>
								<td width="3%"/>
								<td class="graphLittle" align="center">(печать, при наличии)</td>
								<td width="3%"/>
								<td class="graphLittle"></td>
							</tr>
						</tbody>
					</table>

					<br/>
					<table>
						<tbody>
							<tr>
								<td class="graphMain">Дата:
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="aacd:PersonSignature/cat_ru:IssueDate"/>
										</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>

	<!--Шаблон для типа catESAD_cu:CUESADCustomsRepresentativeType-->
	<xsl:template match="aacd:CUESADCustomsRepresentative">
		<xsl:choose>
			<xsl:when test="catESAD_cu:RFOrganizationFeatures">
				<xsl:apply-templates select="catESAD_cu:RFOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="catESAD_cu:RKOrganizationFeatures">
				<xsl:apply-templates select="catESAD_cu:RKOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="catESAD_cu:RBOrganizationFeatures">
				<xsl:apply-templates select="catESAD_cu:RBOrganizationFeatures"/>
			</xsl:when>
		</xsl:choose>
		<br/>
		<xsl:text>Договор таможенного представителя с декларантом: </xsl:text>
		<xsl:apply-templates select="catESAD_cu:ContractRepresDecl"/>
		<br/>
		<xsl:text>Документ, свидетельствующий о включении лица в Реестр таможенных представителей: </xsl:text>
		<xsl:apply-templates select="catESAD_cu:CustomsRepresCertificate"/>
		<br/>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:WoodDescriptionDetailsType -->
	<xsl:template match="catESAD_cu:WoodDescriptionDetails">
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
	<xsl:template match="catESAD_cu:Dimensions|catESAD_cu:AllowanceDetails|catESAD_cu:DeviationDetails">
		<xsl:value-of select="catESAD_cu:LengthMeasure/catESAD_cu:MeasuredAmount"/>&#160;<xsl:value-of select="catESAD_cu:LengthMeasure/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:value-of select="catESAD_cu:LengthMeasure/catESAD_cu:MeasureUnitQualifierCode"/>)<xsl:if test="catESAD_cu:WidthMeasure">
			<xsl:if test="catESAD_cu:LengthMeasure">
				<xsl:text> x </xsl:text>
			</xsl:if>
			<xsl:value-of select="catESAD_cu:WidthMeasure/catESAD_cu:MeasuredAmount"/>&#160;<xsl:value-of select="catESAD_cu:WidthMeasure/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:value-of select="catESAD_cu:WidthMeasure/catESAD_cu:MeasureUnitQualifierCode"/>)</xsl:if>
		<xsl:if test="catESAD_cu:HeightMeasure">
			<xsl:if test="catESAD_cu:LengthMeasure or catESAD_cu:WidthMeasure">
				<xsl:text> x </xsl:text>
			</xsl:if>
			<xsl:value-of select="catESAD_cu:HeightMeasure/catESAD_cu:MeasuredAmount"/>&#160;<xsl:value-of select="catESAD_cu:HeightMeasure/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:value-of select="catESAD_cu:HeightMeasure/catESAD_cu:MeasureUnitQualifierCode"/>)</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="catESAD_cu:ContractRepresDecl|catESAD_cu:CustomsRepresCertificate">
			<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>						
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!--Шаблон для типа aacd:DeclarantType-->
	<xsl:template match="aacd:Declarant">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
			<br/>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="cat_ru:RFOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="cat_ru:RKOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="cat_ru:RBOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="aacd:Declarant/cat_ru:Contact/cat_ru:Phone">
			<br/>
			<xsl:text>Контактный телефон: </xsl:text>
			<xsl:for-each select="cat_ru:Contact/cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="aacd:LegalAddress">
			<br/>
			<span>Юридический адрес:</span>
			<br/>
			<xsl:apply-templates select="cat_ru:Address"/>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:Address">
			<br/>
			<span>Адрес:</span>
			<br/>
			<xsl:apply-templates select="cat_ru:Address"/>
			<br/>
		</xsl:if>
		<xsl:if test="aacd:IdentityCard">
			<br/>
			<xsl:apply-templates select="aacd:IdentityCard"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures|catESAD_cu:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<span>ИНН: <xsl:value-of select="cat_ru:INN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
			</span>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures|catESAD_cu:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span>УНП: <xsl:value-of select="cat_ru:UNP"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
			</span>
			<br/>
		</xsl:if>
		<br/>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures|catESAD_cu:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span>БИН: <xsl:value-of select="cat_ru:BIN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:for-each select="cat_ru:ITN">
			<span>				ИТН: 			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
				<xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
				</xsl:if>
			</span>
			<br/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="cat_ru:Address|aacd:AddressFactInstal|aacd:LegalAddress">
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
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
		<xsl:if test="cat_ru:PostalCode">, Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/></xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:IdentityCard">
		<span class="graphMain">Документ, удостоверяющий личность:</span>
		<br/>
		<xsl:if test="RUScat_ru:IdentityCardName">
			<xsl:value-of select="RUScat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardCode">(код вида документа - <xsl:value-of select="RUScat_ru:IdentityCardCode"/>)</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardName or RUScat_ru:IdentityCardCode">
			<br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
			<span>
				<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName">		Выдан		<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
			</xsl:call-template>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:value-of select="RUScat_ru:OrganizationName"/>
			<br/>
		</xsl:if>
		<br/>
	</xsl:template>
</xsl:stylesheet>
