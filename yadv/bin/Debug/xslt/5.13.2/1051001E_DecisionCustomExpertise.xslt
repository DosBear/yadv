<?xml version="1.0" encoding="utf-8"?>
<!-- Приказ ФТС № 1147 от 11.06.2015 Приложение 21 (Решение Объединенной коллегии таможенных служб государств - членов Таможенного союза № 15/21 от 4 июня 2015 года)-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dce="urn:customs.ru:Information:CustomsDocuments:DecisionCustomExpertise:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа DecisionCustomExpertiseType -->
	<xsl:template match="dce:DecisionCustomExpertise">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									font-family: Courier New;
									}

									div
									{
									white-space: normal;
									}

									div.pagebook {
									width: 190mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm 10mm 10mm 20mm;
									background: #ffffff;
									border: solid 1pt #000000;
									}

									div.pagelandscape {
									width: 260mm;
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

									.marg-top3
									{
									margin-top:2mm;
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
									
									td.bordered3
									{
									border: solid 1px gray;
									font-size: 9pt;
									}

									.underlined {
									border-bottom: 1px solid;
									}
									
									td.graphMain
									{
									vertical-align:top;
									}
									td.value.graphMain
									{
									vertical-align:bottom;
									}
									
									div.page {
										border: solid 1pt #ffffff;
									}
								</style>
			</head>
			<body>
				<div class="pagebook">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>
											<xsl:choose>
												<xsl:when test="dce:DocKind='1'">Поручение<br/>на проведение таможенной экспертизы</xsl:when>
												<xsl:when test="dce:DocKind='2'">Поручение<br/>на проведение таможенной экспертизы с отбором проб и образцов</xsl:when>
												<xsl:otherwise>Решение<br/>о назначении таможенной экспертизы</xsl:otherwise>
											</xsl:choose>
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w190">
						<tbody>
							<tr>
								<td align="left">№ <xsl:apply-templates select="dce:DecisionNumber"/>
								</td>
								<td align="right">
									<xsl:text>от </xsl:text>
									<xsl:call-template name="monthword_date">
										<xsl:with-param name="dateIn" select="dce:DecisionDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>
									<br/>
									<xsl:text>1. Наименование и адрес таможенного органа, назначившего таможенную экспертизу: </xsl:text>
									<xsl:apply-templates select="dce:InitiatorDecision"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>
									<br/>
									<xsl:text>2. № ДТ (иные документы в соответствии с пунктом 6 статьи 105 ТК ЕАЭС): </xsl:text>
									<xsl:for-each select="dce:PresentedDocuments">
										<xsl:apply-templates select="dce:GTDNumber"/>
									</xsl:for-each>
									<xsl:text> </xsl:text>
									<xsl:choose>
										<xsl:when test="dce:CustomsProcedure='ИМ'">импорт</xsl:when>
										<xsl:when test="dce:CustomsProcedure='ЭК'">экспорт</xsl:when>
									</xsl:choose>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>
									<br/>
									<xsl:text>3. Основания для проведения таможенной экспертизы: </xsl:text>
									<xsl:value-of select="dce:BasisOfExpertise"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>
									<br/>
									<xsl:text>4. Цель проведения таможенной экспертизы: </xsl:text>
									<xsl:value-of select="dce:PurposeExpertise"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td colspan="2">
									<br/>
									<xsl:text>5. В соответствии с пунктом 5 статьи 389 ТК ЕАЭС  </xsl:text>
									<span style="display:inline;">
										<table>
											<tbody>
												<tr>
													<td class="underlined" align="center">
														<xsl:value-of select="dce:InspectorInfo/cat_ru:PersonPost"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="concat(dce:InspectorInfo/cat_ru:PersonSurname,' ',dce:InspectorInfo/cat_ru:PersonName,' ',dce:InspectorInfo/cat_ru:PersonMiddleName)"/>
													</td>
												</tr>
												<tr>
													<td align="center" style="font-size:8pt">
													(должность, ФИО должностного лица)
												</td>
												</tr>
											</tbody>
										</table>
									</span>
									<xsl:text> РЕШИЛ:</xsl:text>
								</td>
							</tr>
							<tr>
								<td width="2%"/>
								<td class="underlined">- назначить <xsl:choose>
										<xsl:when test="dce:CustomExpertiseKind='1'">первичную</xsl:when>
										<xsl:when test="dce:CustomExpertiseKind='2'">дополнительную</xsl:when>
										<xsl:when test="dce:CustomExpertiseKind='3'">повторную (несогласие декларанта с заключением таможенного эксперта)</xsl:when>
										<xsl:when test="dce:CustomExpertiseKind='4'">повторную (несогласие таможенного органа, назначившего таможенную экспертизу)</xsl:when>
										<xsl:when test="dce:CustomExpertiseKind='5'">повторную (несогласие декларанта и таможенного органа, назначившего таможенную экспертизу, с заключением таможенного эксперта)</xsl:when>
									</xsl:choose> таможенную экспертизу</td>
							</tr>
							<tr>
								<td width="2%"/>
								<td style="font-size:8pt" align="center">(указать - первичная, дополнительная или повторная)</td>
							</tr>
							<tr>
								<td width="2%"/>
								<td class="underlined">- назначить ее проведение Центральному экспертно-криминалистическому таможенному управлению, код: <xsl:value-of select="dce:CEKTUDivision"/></td>
							</tr>
							<tr>
								<td width="2%"/>
								<td style="font-size:8pt" align="center">(наименование организации, проводящей таможенную экспертизу)</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>
									<br/>6. Предупредить таможенного эксперта (ов) об ответственности за дачу заведомого ложного заключения таможенного эксперта в соответствии с таможенным законодательством ЕАЭС.
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>
									<br/>
									<xsl:text>7. Поставить перед таможенным экспертом (ми) вопрос(ы):</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<xsl:apply-templates select="dce:Question"/>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td colspan="2">
									<br/>8. Наименование товара(ов):</td>
							</tr>
							<tr>
								<td width="2%"/>
								<td class="underlined">
									<table>
										<tbody>
											<xsl:for-each select="//dce:Goods">
												<tr>
													<td width="15%" valign="top">
														<xsl:text>Товар </xsl:text>
														<xsl:if test="dce:GoodsNumeric">
															№<xsl:value-of select="dce:GoodsNumeric"/>
														</xsl:if>
													</td>
													<td>
														<xsl:apply-templates select="dce:GoodsDescription"/>
														<xsl:if test="dce:TNVEDGroup">
															<xsl:text> (ТН ВЭД </xsl:text>
															<xsl:value-of select="dce:TNVEDGroup"/>
															<xsl:text>)</xsl:text>
														</xsl:if>
														<br/>
														<br/>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td/>
								<td align="center" style="font-size:8pt">(по ДТ либо иным документам в соответствии с пунктом 6 статьи 105 ТК ЕАЭС)</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td colspan="2">
									<br/>9. В распоряжение таможенного эксперта (ов) предоставить:</td>
							</tr>
							<tr>
								<td width="2%"/>
								<td>1) Материалы, документы, пробы и образцы товаров согласно акту отбора.</td>
							</tr>
							<tr>
								<td/>
								<td>2) Акт отбора проб и образцов: 
									<xsl:value-of select="dce:ActThievingSamplingNumber"/>
									<xsl:text> от </xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="dce:ActThievingSamplingDate"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td/>
								<td>&#160;&#160;&#160;<xsl:text>Копия ДТ № </xsl:text>
									<xsl:for-each select="dce:PresentedDocuments">
										<xsl:apply-templates select="dce:GTDNumber"/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td/>
								<td class="underlined">
									<xsl:text>3) </xsl:text>
									<xsl:for-each select="//dce:PresentedDocuments/dce:Document">
										<xsl:for-each select="./*">
											<xsl:choose>
												<xsl:when test="local-name(.)='ContainerDocumentID'"/>
												<xsl:when test="local-name(.)='PrDocumentDate'">
													<xsl:text> от </xsl:text>
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="."/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="."/>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:if test="position()!=last()">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td/>
								<td align="center" style="font-size:8pt">(В соответствии с перечнем документов, направляемых на таможенную экспертизу товаров должностным лицом таможенного органа, утвержденным решением Объединенной коллегии таможенных служб государств - членов Таможенного союза от 07.12.2012 № 6/14)</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>
									<br/>10. Срок проведения таможенной экспертизы - в соответствии с пунктом 1 статьи 390 ТК ЕАЭС.</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>
									<br/>
									<xsl:text>11. Видоизменение, частичное или полное уничтожение, разрушение материалов, документов, проб и образцов исследования </xsl:text>
								</td>
							</tr>
							<tr align="center">
								<td class="underlined">
									<xsl:choose>
										<xsl:when test="dce:DestructionResolution='true' or dce:DestructionResolution='t' or dce:DestructionResolution='1'">
											<xsl:text>разрешить</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>не разрешить</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td align="center" style="font-size:8pt">
									(разрешить/не разрешить - нужное заполнить письменно)
								</td>
							</tr>
						</tbody>
					</table>
					<table width="100%">
						<tbody>
							<tr>
								<td>
									<br/>
									<xsl:text>12. Описание упаковки или отметка об отсутствии упаковки: </xsl:text>
									<xsl:for-each select="dce:PackageDescription">
										<xsl:value-of select="normalize-space(.)"/>
										<xsl:if test="position()!=last()">
											<xsl:text> </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>
									<br/>13. Должностное лицо таможенного органа, назначившего таможенную экспертизу</td>
							</tr>
							<tr>
								<td class="underlined" align="center">
									<xsl:value-of select="dce:InspectorInfo/cat_ru:PersonPost"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="concat(dce:InspectorInfo/cat_ru:PersonSurname,' ',substring(dce:InspectorInfo/cat_ru:PersonName,1,1),'.',substring(dce:InspectorInfo/cat_ru:PersonMiddleName,1,1),'.')"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="concat('ЛНП ',dce:InspectorInfo/dce:LNP)"/>
								</td>
							</tr>
							<tr>
								<td align="center" style="font-size:8pt">(должность, фамилия, инициалы, подпись, заверенная ЛНП либо печатью таможенного органа, назначившего таможенную экспертизу)</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>
									<br/>14. Служебный телефон должностного лица, назначившего экспертизу: <xsl:value-of select="dce:InspectorInfo/dce:Phone"/>
								</td>
							</tr>
						</tbody>
					</table>
					<!--Подвал для 1 и 2 -->
					<xsl:if test="dce:DocKind='1' or dce:DocKind='2'">
						<br/><br/>
						<table class="w190">
							<tbody>
								<tr>
									<td>
										15. Сведения о проведении таможенной экспертизы и отбора проб и образцов
									</td>
								</tr>
							</tbody>
						</table>
						<table class="w190">
							<tbody>
								<xsl:if test="dce:CustomsFact">
									<tr>
										<td>
											<i>Сведения о внешнем ТО:</i> <br/>
											<xsl:for-each select="dce:CustomsFact/*">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
											</xsl:for-each>
											<br/><br/>
										</td>
									</tr>
								</xsl:if>
								<xsl:for-each select="dce:InspectionPlace">
									<tr>
										<td>
											<i>Описание места проведения отбора образцов:</i> <br/>
											код таможенного органа: <xsl:value-of select="cat_ru:Code"/><br/>
											<xsl:if test="cat_ru:OfficeName">наименование таможенного органа: <xsl:value-of select="cat_ru:OfficeName"/><br/></xsl:if>
											тип информации: <xsl:choose>
												<xsl:when test="dce:InformationTypeCode='11'">СВХ</xsl:when>
												<xsl:when test="dce:InformationTypeCode='21'">ТС</xsl:when>
												<xsl:when test="dce:InformationTypeCode='25'">свободный склад</xsl:when>
												<xsl:when test="dce:InformationTypeCode='31'">склад получателя</xsl:when>
												<xsl:when test="dce:InformationTypeCode='41'">склад хранения собственных товаров</xsl:when>
												<xsl:when test="dce:InformationTypeCode='52'">транспортное средство</xsl:when>
												<xsl:when test="dce:InformationTypeCode='60'">помещение (площадки)</xsl:when>
												<xsl:when test="dce:InformationTypeCode='72'">ЗТК</xsl:when>
												<xsl:when test="dce:InformationTypeCode='91'">адрес места хранения</xsl:when>
												<xsl:when test="dce:InformationTypeCode='99'">иное место ВХ</xsl:when>
												<xsl:when test="dce:InformationTypeCode='80'">ОЭЗ</xsl:when>
											</xsl:choose><br/>
											место досмотра: <xsl:value-of select="dce:InspPlaceName"/><xsl:text> </xsl:text><xsl:apply-templates select="dce:InspPlaceDesc"/><br/>
											<xsl:if test="dce:WarehousePlace">
											свидетельство склада: <xsl:for-each select="dce:WarehousePlace/*">
												<xsl:choose>
													<xsl:when test="local-name(.)='PrDocumentDate'"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template></xsl:when>
													<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
												</xsl:choose>
												<xsl:if test="position()!=last()"><xsl:text> </xsl:text>
											</xsl:if>
											</xsl:for-each><br/></xsl:if>
											<xsl:if test="dce:InspAddress">
											адрес места досмотра: <xsl:for-each select="dce:InspAddress/*">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()">, </xsl:if>
											</xsl:for-each><br/>
											</xsl:if>
											<br/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="dce:ActThievingDate">
									<tr>
										<td>
											<i>Предполагаемая дата и время отбора проб и образцов:</i> <br/>
											<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="dce:ActThievingDate"/></xsl:call-template>
											<xsl:text> </xsl:text>
											<xsl:value-of select="substring(dce:ActThievingDate,12,8)"/>
											<br/><br/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="dce:InspDetails">
									<tr>
										<td>
											<i>Характеристика таможенного досмотра в ходе отбора проб и образцов:</i> <br/>
												<xsl:value-of select="dce:InspDetails"/>
											<br/><br/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="dce:Original">
									<tr>
										<td>
											<i>Признак необходимости направления оригинала ЭИР во внутренний таможенный орган:</i> <br/>
												<xsl:if test="dce:Original='true' or dce:Original='t' or dce:Original='1'">присутствует</xsl:if>
												<xsl:if test="dce:Original='false' or dce:Original='f' or dce:Original='0'">отсутствует</xsl:if>
											<br/><br/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="dce:ActThievingSamplingNumber">
									<tr>
										<td>
											<i>Номер акта отбора проб и образцов:</i> <br/>
												<xsl:value-of select="dce:ActThievingSamplingNumber"/>
											<br/><br/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="dce:ActThievingSamplingDate">
									<tr>
										<td>
											<i>Дата акта отбора проб и образцов:</i> <br/>
												<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="dce:ActThievingSamplingDate"/></xsl:call-template>
											<br/><br/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="dce:DestructionResolution">
									<tr>
										<td>
											<i>Разрешение на видоизменение, уничтожение проб и образцов:</i> <br/>
												<xsl:if test="dce:DestructionResolution='true' or dce:DestructionResolution='t' or dce:DestructionResolution='1'">есть</xsl:if>
												<xsl:if test="dce:DestructionResolution='false' or dce:DestructionResolution='f' or dce:DestructionResolution='0'">нет</xsl:if>
											<br/><br/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</xsl:if>
				</div>
				<xsl:if test="//dce:RiskProfile or //dce:StudyObject">
					<div class="pagelandscape">
						<table class="w190">
							<tr>
								<td align="center" class="graphMain">
									<font size="4"><b>Детальное описание товаров</b></font>
								</td>
							</tr>
						</table>
						<br/>
						<table class=" w190">
							<xsl:for-each select="dce:Goods"><xsl:apply-templates select="."/></xsl:for-each>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа dce:DecisionNumberType -->
	<xsl:template match="dce:DecisionNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="number_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<!--xsl:choose>
			<xsl:when test="dce:ExpertisePoint='ДВ'">
				<xsl:text>до выпуска ДТ</xsl:text>
			</xsl:when>
			<xsl:when test="dce:ExpertisePoint='ПВ'">
				<xsl:text>после выпуска ДТ</xsl:text>
			</xsl:when>
			<xsl:otherwise-->
		<xsl:value-of select="dce:ExpertisePoint"/>
		<!--/xsl:otherwise>
		</xsl:choose-->
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:SerialNumber"/>
	</xsl:template>
	<!-- Шаблон для типа dce:GoodsType -->
	<xsl:template match="dce:Goods">
		<tr bgcolor="#e3e3e3">
			<td class="graphMain bordered" style="width:11%; vertical-align: middle">
				<b>Товар № <xsl:value-of select="dce:ListNumeric"/></b>
			</td>
			<td class="graphMain bordered" style="width:13%">
				<b>Номер товара<br/>в исх. док-те</b><br/>
				<xsl:value-of select="dce:GoodsNumeric"/>
			</td>
			<td class="graphMain bordered" style="width:10%">
				<b>Группа<br/>ТН ВЭД</b><br/>
				<xsl:if test="dce:TNVEDGroup"><xsl:value-of select="dce:TNVEDGroup"/></xsl:if>
			</td>
			<td class="graphMain bordered" style="width:66%; vertical-align: middle">
				<xsl:for-each select="dce:GoodsDescription"><xsl:value-of select="."/></xsl:for-each>
			</td>
		</tr>
		<xsl:if test="dce:RiskProfile">
			<tr>	
				<td colspan="4">
					<div class="title marg-top3">Выявленные профили риска</div>
					<table class="bordered w190">
						<tr class="title">
							<td class="graphMain bordered3" style="width: 38%; vertical-align: middle">Тип выявленного профиля риска</td>
							<td class="graphMain bordered3" style="width: 20%; vertical-align: middle">Код вида профиля риска</td>
							<td class="graphMain bordered3" style="width: 17%; vertical-align: middle">Код таможенного органа, разработавшего ПР/ЦПР</td>
							<td class="graphMain bordered3" style="width: 15%; vertical-align: middle">Дата регистрации профиля риска</td>
							<td class="graphMain bordered3" style="width: 10%; vertical-align: middle">Номер профиля риска</td>
						</tr>
						<xsl:for-each select="dce:RiskProfile">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</table>
				</td>
			</tr>	
		</xsl:if>	
		<xsl:if test="dce:StudyObject">
			<tr>
				<td colspan="4">
					<div class="title marg-top3">Заявленные объекты исследования</div>
					<table class="bordered w190">
						<tr class="title">
							<td class="graphMain bordered3" style="width: 35%; vertical-align: middle">Объект исследования</td>
							<td class="graphMain bordered3" style="width: 10%; vertical-align: middle">Количество</td>
							<td class="graphMain bordered3" style="width: 35%; vertical-align: middle">Примечание</td>
							<td class="graphMain bordered3" style="width: 10%; vertical-align: middle">Номер пломбы</td>
							<td class="graphMain bordered3" style="width: 10%; vertical-align: middle">Тип образца</td>
						</tr>
						<xsl:for-each select="dce:StudyObject">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</table>
				</td>
			</tr>
		</xsl:if>
		<tr><td><br/></td></tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="dce:GTDNumber">
		<xsl:variable name="CustCode" select="cat_ru:CustomsCode"/>
		<xsl:variable name="date">
			<xsl:call-template name="number_date">
				<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="gdtNum" select="cat_ru:GTDNumber"/>
		<xsl:value-of select="concat($CustCode,'/',$date,'/',$gdtNum)"/>
	</xsl:template>
	<!-- Шаблон для типа dce:InitiatorDecisionType -->
	<xsl:template match="dce:InitiatorDecision">
		<xsl:value-of select="dce:Name"/>
		<xsl:text>, </xsl:text>
		<xsl:value-of select="dce:Address"/>
	</xsl:template>
	<!-- Шаблон для типа dce:PersonType -->
	<xsl:template match="dce:InspectorInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Фамилия</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="dce:PersonSurname"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Имя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="dce:PersonName"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Отчество</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="dce:PersonMiddleName"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Должность</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="dce:PersonPost"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">ЛНП инспектора</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="dce:LNP"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер служебного телефона</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="dce:Phone"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа dce:PresentedDocumentsType -->
	<xsl:template match="dce:PresentedDocuments">
		<xsl:if test="dce:GTDNumber">
			<div class="title marg-top">Регистрационный номер ДТ.</div>
		</xsl:if>
		<xsl:apply-templates select="dce:GTDNumber"/>
		<xsl:if test="dce:DocumentName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование документа</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="dce:DocumentName">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа dce:QuestionType -->
	<xsl:template match="dce:Question">
		<tr>
			<td width="2%"/>
			<td>
				<xsl:text>    </xsl:text>
				<xsl:value-of select="dce:QuestionNumber"/>
				<xsl:text>. </xsl:text>
				<xsl:value-of select="dce:QuestionText"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа dce:RiskProfileType -->
	<xsl:template match="dce:RiskProfile">
		<tr>
			<td class="graphMain bordered3">
				<xsl:choose>
					<xsl:when test="dce:RiskProfileType='0'">
						<xsl:text>автоматически выявленный риск, проставляется программным средством в автоматическом режиме</xsl:text>
					</xsl:when>
					<xsl:when test="dce:RiskProfileType='1'">
						<xsl:text>самостоятельно выявленный риск, проставляется программным средством в автоматическом режиме при внесении должностным лицом таможенного поста новой записи (в том числе, при применении "рамочных" ПР  и ПР по информации правоохранительных подразделений)</xsl:text>
					</xsl:when>
					<xsl:when test="dce:RiskProfileType='2'">
						<xsl:text>риск, выявленный в автоматизированном режиме, требует принятия окончательного решения должностным лицом таможенного поста (значение является промежуточным, наличие значения "2" в отчете блокирует переход к следующему этапу проверки на риски либо выпуск ДТ)</xsl:text>
					</xsl:when>
					<xsl:when test="dce:RiskProfileType='3'">
						<xsl:text>риск, выявленный в автоматизированном режиме, по которому должностным лицом таможенного поста на основании проверки неформализованных индикаторов риска принято решение - "Риск выявлен"</xsl:text>
					</xsl:when>
					<xsl:when test="dce:RiskProfileType='4'">
						<xsl:text>риск, выявленный в автоматизированном режиме, по которому должностным лицом таможенного поста на основании проверки неформализованных индикаторов риска принято решение - "Риск не выявлен"</xsl:text>
					</xsl:when>
					<xsl:when test="dce:RiskProfileType='5'">
						<xsl:text>резерв</xsl:text>
					</xsl:when>
					<xsl:when test="dce:RiskProfileType='6'">
						<xsl:text>профиль риска не применяется по причине упрощенного контроля таможенной стоимости идентичных товаров</xsl:text>
					</xsl:when>
					<xsl:otherwise><xsl:value-of select="dce:RiskProfileType"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered3">
				<xsl:choose>
					<xsl:when test="dce:TerrActionCode='11'"><xsl:text>общероссийский профиль риска</xsl:text></xsl:when>
					<xsl:when test="dce:TerrActionCode='12'"><xsl:text>региональный профиль риска</xsl:text></xsl:when>
					<xsl:when test="dce:TerrActionCode='13'"><xsl:text>зональный профиль риска</xsl:text></xsl:when>
					<xsl:when test="dce:TerrActionCode='20'"><xsl:text>целевой профиль риска</xsl:text></xsl:when>
					<xsl:when test="dce:TerrActionCode='21'"><xsl:text>целевой правоохранительный профиль риска</xsl:text></xsl:when>
					<xsl:when test="dce:TerrActionCode='32'"><xsl:text>профиль риска на основе моделей</xsl:text></xsl:when>
					<xsl:when test="dce:TerrActionCode='55'"><xsl:text>профиль риска, обязательный к применению</xsl:text></xsl:when>
					<xsl:when test="dce:TerrActionCode='77'"><xsl:text>профиль риска для идентификации категории уровня риска</xsl:text></xsl:when>
					<xsl:when test="dce:TerrActionCode='88'"><xsl:text>зависимый профиль риска</xsl:text></xsl:when>
					<xsl:otherwise><xsl:value-of select="dce:TerrActionCode"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered3">
				<xsl:value-of select="dce:DivisionCode"/>
			</td>
			<td class="graphMain bordered3">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="dce:RiskProfileRegDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered3">
				<xsl:value-of select="dce:RiskProfileNumber"/>
				<xsl:if test="dce:RiskProfileNumberVersion"> версия: <xsl:value-of select="dce:RiskProfileNumberVersion"/></xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа dce:SampleType -->
	<xsl:template match="dce:StatedSample">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="dce:Sample"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="dce:Quantity"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="dce:SealNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="dce:Note"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="dce:TypeSample=0">
						<xsl:text>товарные образцы</xsl:text>
					</xsl:when>
					<xsl:when test="dce:TypeSample=1">
						<xsl:text>СВХ</xsl:text>
					</xsl:when>
					<xsl:when test="dce:TypeSample=2">
						<xsl:text>Документы</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="dce:TypeSample"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="dce:Goods">
					<div class="title marg-top">Описание товара</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<tr>
									<td class="graphMain bordered">Номер товара в исходном документе</td>
									<td class="graphMain bordered">Номер товара по порядку</td>
									<td class="graphMain bordered">Описание товара</td>
									<td class="graphMain bordered">Группа ТНВЭД</td>
									<td class="graphMain bordered">Профиль риска</td>
									<td class="graphMain bordered">Заявленные объекты исследования</td>
								</tr>
							</tr>
							<xsl:for-each select="dce:Goods">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа dce:StudyObjectType -->
	<xsl:template match="dce:StudyObject">
		<tr>
			<td class="graphMain bordered3">
				<xsl:for-each select="dce:Template"><xsl:value-of select="."/></xsl:for-each>
			</td>
			<td class="graphMain bordered3">
				<xsl:value-of select="dce:Quantity"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="dce:MeasureUnitQualifierName"/>
				<xsl:text> (код:</xsl:text>
				<xsl:value-of select="dce:MeasureUnitQualifierCode"/>
				<xsl:text>)</xsl:text>
			</td>
			<td class="graphMain bordered3">
				<xsl:for-each select="dce:Note"><xsl:value-of select="."/></xsl:for-each>
			</td>
			<td class="graphMain bordered3">
				<xsl:value-of select="dce:SealNumber"/>
			</td>
			<td class="graphMain bordered3">
				<xsl:choose>
					<xsl:when test="dce:TemplateType='0'">товарные образцы</xsl:when>
					<xsl:when test="dce:TemplateType='1'">СВХ</xsl:when>
					<xsl:when test="dce:TemplateType='2'">документы</xsl:when>
					<xsl:otherwise><xsl:value-of select="dce:TemplateType"/></xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="dce:GoodsDescription">
		<xsl:value-of select="normalize-space(.)"/>
		<xsl:if test="not(position()=last())">
			<xsl:text> </xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template name="monthword_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>"</xsl:text>
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>" </xsl:text>
				<xsl:variable name="month" select="substring($dateIn,6,2)"/>
				<xsl:choose>
					<xsl:when test="substring($dateIn,6,2)='01'">января</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='02'">февраля</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='03'">марта</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='04'">апреля</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='05'">мая</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='06'">июня</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='07'">июля</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='08'">августа</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='09'">сентября</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='10'">октября</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='11'">ноября</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='12'">декабря</xsl:when>
				</xsl:choose>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> г.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="number_date">
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
