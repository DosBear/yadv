<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.10.0" xmlns:cltTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonLeafTypesCust:5.12.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.12.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.0" xmlns:atb="urn:customs.ru:Information:TransportDocuments:AutoBill:5.14.0">
	<!-- Шаблон для типа AutoBillType -->
	<xsl:template match="atb:AutoBill">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
					body {
					background: #cccccc;
					}

					div.page {
					width: 190mm;
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
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>ТРАНСПОРТНАЯ НАКЛАДНАЯ</b><br/>
										<xsl:text>№ </xsl:text><xsl:value-of select="atb:NumberTN"/>
										<xsl:text> от </xsl:text><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="atb:DateTN"/></xsl:call-template>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190 bordered">
						<tbody>
							<tr>
								<td width="50%" align="center" class="bordered">Транспортная накладная</td>
								<td width="50%" align="center" class="bordered">Заказ (заявка)</td>
							</tr>
							<tr>
								<td class="bordered">Экземпляр № <xsl:value-of select="atb:NumberCopies"/></td>
								<td class="bordered">
									<table width="100%">
										<tbody>
											<tr>
												<td width="60%" style="border-right:1px solid">
													<xsl:text>Дата </xsl:text>
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="atb:Order/atb:DateOrder"/>
													</xsl:call-template>
												</td>
												<td>№ <xsl:value-of select="atb:Order/atb:NumberOrder"/></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="bordered" align="center"><b>1. Грузоотправитель (грузовладелец)</b></td>
								<td class="bordered" align="center"><b>2. Грузополучатель</b></td>
							</tr>
							<tr>
								<td class="bordered"><xsl:apply-templates select="atb:Consignor"/></td>
								<td class="bordered"><xsl:apply-templates select="atb:Consignee"/></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>3. Наименование груза</b></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<xsl:apply-templates select="atb:Cargo"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>4. Сопроводительные документы на груз</b></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<xsl:if test="not(atb:DocumentTN) and not(atb:DocumentCargo)"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
									<xsl:if test="atb:DocumentTN">
										Документы приложенные к накладной:<br/>
										<table width="100%">
											<tbody>
												<xsl:call-template name="DocsHead"/>
												<xsl:apply-templates select="atb:DocumentTN"/>
											</tbody>
										</table>
									</xsl:if>
									<xsl:if test="atb:DocumentCargo">
										Документы приложенные к грузу:<br/>
										<table width="100%">
											<tbody>
												<xsl:call-template name="DocsHead"/>
												<xsl:apply-templates select="atb:DocumentCargo"/>
											</tbody>
										</table>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>5. Указания грузоотправителя</b></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<xsl:apply-templates select="atb:ConsignorInstruction"/>
								</td>
							</tr>
							<tr>
								<td class="bordered" align="center"><b>6. Прием груза</b></td>
								<td class="bordered" align="center"><b>7. Сдача груза</b></td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:apply-templates select="atb:LoadCargo"/>
								</td>
								<td class="bordered">
									<xsl:apply-templates select="atb:UnloadCargo"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>8. Условия перевозки</b></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<xsl:apply-templates select="atb:Conditions"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>9. Информация о принятии заказа (заявки) к исполнению</b></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<xsl:apply-templates select="atb:Order"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>10. Перевозчик</b></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<xsl:apply-templates select="atb:Carrier"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>11. Транспортное средство</b></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<table>
										<tbody>
											<tr>
												<td align="center" valign="top" style="border-right:1px dashed">Тип</td>
												<td align="center" valign="top" style="border-right:1px dashed">Марка</td>
												<td align="center" valign="top" style="border-right:1px dashed">Грузоподъемность, т.</td>
												<td align="center" valign="top" style="border-right:1px dashed">Вместимость, куб.м.</td>
												<td align="center" valign="top">Регистрационный номер</td>
											</tr>
											<xsl:apply-templates select="atb:Transport"/>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>12. Оговорки и замечания перевозчика</b></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<xsl:apply-templates select="atb:CarrierComments"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>13. Прочие условия</b></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<xsl:apply-templates select="atb:OtherConditions"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>14. Переадресовка</b></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<xsl:apply-templates select="atb:Readdressing"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>15. Стоимость услуг перевозчика и порядок расчета провозной платы</b></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<xsl:apply-templates select="atb:Calculation"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>16. Дата составления, подписи сторон</b></td>
							</tr>
							<tr>
								<td class="bordered">
									Грузоотправитель:
									<xsl:apply-templates select="atb:ConsignorSign"/>
								</td>
								<td class="bordered">
									Грузополучатель:
									<xsl:apply-templates select="atb:ConsigneeSign"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>17. Отметки грузоотправителей, грузополучателей, перевозчиков</b></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<table>
										<tbody>
											<tr>
												<td align="center" valign="top" style="border-right:1px solid">Краткое описание обстоятельств,<br/>послуживших основанием для отметки</td>
												<td align="center" valign="top" style="border-right:1px solid">Расчет и размер штрафа</td>
												<td align="center" valign="top">Подпись, дата</td>
											</tr>
											<xsl:for-each select="atb:Notes">
												<tr>
													<td valign="top" style="border-right:1px solid;border-top:1px solid">
														<xsl:value-of select="atb:DescriptionNote"/>
													</td>
													<td valign="top" style="border-right:1px solid;border-top:1px solid">
														<xsl:value-of select="atb:Calculation"/>
													</td>
													<td valign="top" style="border-top:1px solid">
														<xsl:value-of select="atb:PersonSign/cat_ru:PersonSurname"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="concat(substring(atb:PersonSign/cat_ru:PersonName, 1, 1), '.')"/>
														<xsl:value-of select="concat(substring(atb:PersonSign/cat_ru:PersonMiddleName, 1, 1), '.')"/>
														<br/>
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="atb:PersonSign/cat_ru:IssueDate"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:for-each>
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
	<!-- 1 Грузоотправитель, 2 Грузополучатель, atb:PersonReaddressing (гр.14) -->
	<xsl:template match="atb:Consignor|atb:Consignee|atb:PersonReaddressing">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<br/>
		<xsl:apply-templates select="cat_ru:Address"/>
		<br/>
		<xsl:for-each select="cat_ru:Contact/cat_ru:Phone">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- 3 Наименование груза -->
	<xsl:template match="atb:Cargo">
		<b><xsl:value-of select="position()"/></b>
		<xsl:text>. </xsl:text>
		<xsl:for-each select="atb:CargoDescription">
			<xsl:value-of select="."/>
		</xsl:for-each>
		<br/>
		<xsl:if test="atb:Package">
			Упаковка и маркировка:
			<table width="100%">
				<tbody>
					<tr>
						<td width="25%" valign="top" style="border-right:1px dashed">Код вида упаковки товара, количество упаковок</td>
						<td width="25%" valign="top" style="border-right:1px dashed">Фактическое состояние груза</td>
						<td width="25%" valign="top" style="border-right:1px dashed">Маркировка грузовых мест</td>
						<td width="25%" valign="top">Упаковка</td>
					</tr>
					<xsl:for-each select="atb:Package">
						<tr>
							<td width="25%" valign="top" style="border-right:1px dashed; border-top:1px dashed">
								<xsl:for-each select="atb:PackingInfo">
									<xsl:for-each select="./*">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()"> - </xsl:if>
									</xsl:for-each>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</td>
							<td width="25%" valign="top" style="border-right:1px dashed; border-top:1px dashed"><xsl:value-of select="atb:CargoState"/></td>
							<td width="25%" valign="top" style="border-right:1px dashed; border-top:1px dashed"><xsl:value-of select="atb:PackingMark"/></td>
							<td width="25%" valign="top" style="border-top:1px dashed">
								<xsl:choose>
									<xsl:when test="atb:PackageTypeCode='0'">без упаковки</xsl:when>
									<xsl:when test="atb:PackageTypeCode='1'">с упаковкой</xsl:when>
									<xsl:when test="atb:PackageTypeCode='2'">без упаковки в оборудованных емкостях транспортного средства</xsl:when>
								</xsl:choose>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="atb:NetWeightQuantity">
			Вес нетто (кг): <xsl:value-of select="atb:NetWeightQuantity"/>
			<br/>
		</xsl:if>
		<xsl:if test="atb:GrossWeightQuantity">
			Вес брутто (кг): <xsl:value-of select="atb:GrossWeightQuantity"/>
			<br/>
		</xsl:if>
		<xsl:if test="atb:Capacity">
			Объем грузового места (куб.м): <xsl:value-of select="atb:Capacity"/>
			<br/>
		</xsl:if>
		<xsl:if test="atb:Sizes">
			Размеры (высота, ширина, длина м): 
			<xsl:for-each select="atb:Sizes/*">
				<xsl:value-of select="."/><xsl:if test="position()!=last()"> x </xsl:if>
			</xsl:for-each>
			<br/>
		</xsl:if>
		<xsl:if test="atb:DangerCargo">
			Опасные грузы:
			<table width="100%">
				<tbody>
					<tr>
						<td width="50%" valign="top" style="border-right:1px dashed">Информация</td>
						<td width="50%" valign="top">Код класса опасности</td>
					</tr>
					<xsl:for-each select="atb:DangerCargo">
						<tr>
							<td valign="top" style="border-right:1px dashed; border-top:1px dashed">
								<xsl:for-each select="atb:DangerCargoDescription"><xsl:value-of select="."/></xsl:for-each>
							</td>
							<td valign="top" style="border-top:1px dashed">
								<xsl:for-each select="atb:HazardousCargoCode">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()">
										<xsl:text>, </xsl:text>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="position()!=last()">
			<br/>
		</xsl:if>
	</xsl:template>
	<!-- 4 Документы к накладной и к грузу -->
	<xsl:template name="DocsHead">
		<tr>
			<td width="25%" valign="top" style="border-right:1px dashed">Вид</td>
			<td width="25%" valign="top" style="border-right:1px dashed">Документ</td>
			<td width="25%" valign="top" style="border-right:1px dashed">Дата окончания действия</td>
			<td width="25%" valign="top">Организация</td>
		</tr>
	</xsl:template>
	<xsl:template match="atb:DocumentTN|atb:DocumentCargo|atb:SpecialPermission|atb:Acts">
		<tr>
			<td width="15%" valign="top" style="border-right:1px dashed;border-top:1px dashed">
				<xsl:value-of select="atb:DocumentModeCode"/>
			</td>
			<td width="25%" valign="top" style="border-right:1px dashed;border-top:1px dashed">
				<xsl:apply-templates mode="document" select="."/>
			</td>
			<td width="25%" valign="top" style="border-right:1px dashed;border-top:1px dashed">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="atb:ExpirationDate"/>
				</xsl:call-template>
			</td>
			<td width="35%" valign="top" style="border-top:1px dashed">
				<xsl:value-of select="atb:ReleaseOrganization"/>
			</td>
		</tr>
	</xsl:template>
	<!-- 5. Указания грузоотправителя -->
	<xsl:template match="atb:ConsignorInstruction">
		Параметы транспортного средства:
		<table width="100%">
			<tbody>
				<tr>
					<td align="center" valign="top" style="border-right:1px dashed">Тип</td>
					<td align="center" valign="top" style="border-right:1px dashed">Марка</td>
					<td align="center" valign="top" style="border-right:1px dashed">Грузоподъемность, т.</td>
					<td align="center" valign="top" style="border-right:1px dashed">Вместимость, куб.м.</td>
					<td align="center" valign="top">Регистрационный номер</td>
				</tr>
				<xsl:apply-templates select="atb:TransportInfo"/>
			</tbody>
		</table>
		<br/>
		<xsl:if test="atb:PerformRequirements">
			Указания, необходимые для фитосанитарных, санитарных, карантинных, таможенных и прочих требований: <br/>
			<xsl:for-each select="atb:PerformRequirements">
				<xsl:value-of select="."/>
			</xsl:for-each>
			<br/>
		</xsl:if>
		<xsl:if test="atb:Seal">
			Сведения о ЗПУ:
			<table>
				<tbody>
					<tr>
						<td align="center" valign="top" style="border-right:1px dashed">Номер</td>
						<td align="center" valign="top" style="border-right:1px dashed">Вид</td>
						<td align="center" valign="top" style="border-right:1px dashed">Количество</td>
						<td align="center" valign="top">Примечание</td>
					</tr>
					<xsl:for-each select="atb:Seal">
						<tr>
							<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
								<xsl:value-of select="atb:IdentNumber"/>
							</td>
							<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
								<xsl:choose>
									<xsl:when test="atb:IdentKind='1'">пломба</xsl:when>
									<xsl:when test="atb:IdentKind='2'">печать</xsl:when>
									<xsl:when test="atb:IdentKind='3'">иное</xsl:when>
								</xsl:choose>
							</td>
							<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
								<xsl:value-of select="atb:Quantity"/>
							</td>
							<td valign="top" style="border-top:1px dashed">
								<xsl:value-of select="atb:IdentDesc"/>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="atb:DeadlineTransport">
			Рекомендуемый предельный срок перевозки: <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="atb:DeadlineTransport"/></xsl:call-template><br/>
		</xsl:if>
		<xsl:if test="atb:Temperature">
			Рекомендуемый температурный режим: <xsl:value-of select="atb:Temperature"/><br/>
		</xsl:if>
		<xsl:if test="atb:Cost">
			Объявленная стоимость (ценность) груза: 
			<xsl:value-of select="atb:Cost/atb:TotalAmount"/>
			<xsl:if test="atb:Cost/atb:CurrencyCode">
				(<xsl:value-of select="atb:Cost/atb:CurrencyCode"/>)
			</xsl:if>
			<br/>
		</xsl:if>
		<xsl:if test="atb:OverloadProhibition">
			<xsl:text>Перегрузка: </xsl:text>
			<xsl:choose>
				<xsl:when test="atb:OverloadProhibition='1' or atb:OverloadProhibition='true'">запрещена</xsl:when>
				<xsl:when test="atb:OverloadProhibition='0' or atb:OverloadProhibition='false'">разрешена</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<!-- 6. Прием груза, 7. Сдача груза-->
	<xsl:template match="atb:LoadCargo|atb:UnloadCargo">
		<xsl:if test="atb:Address">
			Адрес:<br/><xsl:apply-templates select="atb:Address"/>
		</xsl:if>
		<xsl:if test="atb:DateTime">
			<br/>
			<xsl:text>Дата и время подачи транспортного средства: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="atb:DateTime"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
			<xsl:value-of select="substring(atb:DateTime, 12, 5)"/>
		</xsl:if>
		<xsl:if test="atb:ActualDateTime">
			<br/>
			<xsl:text>Фактические дата и время прибытия транспортного средства: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="atb:ActualDateTime"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
			<xsl:value-of select="substring(atb:ActualDateTime, 12, 5)"/>
		</xsl:if>
		<xsl:if test="atb:ActualStateOfPackages">
			<br/>
			Фактическое состояние груза, тары, упаковки, маркировки и опломбирования:
			<br/>
			<xsl:for-each select="atb:ActualStateOfPackages">
				<!--xsl:value-of select="position()"/>
				<xsl:text>. </xsl:text-->
				<xsl:for-each select="*">
					<xsl:choose>
						<xsl:when test="local-name()='PackingInfo'">
							<xsl:for-each select="./*">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()"> - </xsl:if>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
					</xsl:choose>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
				<xsl:if test="position()!=last()"><br/></xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="atb:Seal">
			<br/>
			Сведения о ЗПУ:
			<table>
				<tbody>
					<tr>
						<td align="center" valign="top" style="border-right:1px dashed">Номер</td>
						<td align="center" valign="top" style="border-right:1px dashed">Вид</td>
						<td align="center" valign="top" style="border-right:1px dashed">Количество</td>
						<td align="center" valign="top">Примечание</td>
					</tr>
					<xsl:for-each select="atb:Seal">
						<tr>
							<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
								<xsl:value-of select="atb:IdentNumber"/>
							</td>
							<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
								<xsl:choose>
									<xsl:when test="atb:IdentKind='1'">пломба</xsl:when>
									<xsl:when test="atb:IdentKind='2'">печать</xsl:when>
									<xsl:when test="atb:IdentKind='3'">иное</xsl:when>
								</xsl:choose>
							</td>
							<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
								<xsl:value-of select="atb:Quantity"/>
							</td>
							<td valign="top" style="border-top:1px dashed">
								<xsl:value-of select="atb:IdentDesc"/>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="atb:CargoWeight">
			<br/>
			<xsl:text>Масса груза: </xsl:text>
			<xsl:value-of select="atb:CargoWeight"/>
		</xsl:if>
		<xsl:if test="atb:PlacesQuantity">
			<br/>
			<xsl:text>Количество грузовых мест: </xsl:text>
			<xsl:value-of select="atb:PlacesQuantity"/>
		</xsl:if>
		<xsl:if test="atb:PersonSign">
			<table>
				<tbody>
					<xsl:for-each select="atb:PersonSign">
						<tr>
							<td width="30%" style="border-bottom: 1px solid;">
								<xsl:value-of select="cat_ru:PersonPost"/>
							</td>
							<td width="20%" style="border-bottom: 1px solid;">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td width="50%" style="border-bottom: 1px solid;">
								<xsl:value-of select="concat(substring(cat_ru:PersonName, 1, 1), '.')"/>
								<xsl:if test="cat_ru:PersonMiddleName">
									<xsl:value-of select="concat(substring(cat_ru:PersonMiddleName, 1, 1), '.')"/>
								</xsl:if>
								<xsl:text> </xsl:text>
								<xsl:value-of select="cat_ru:PersonSurname"/>
							</td>
						</tr>
						<tr>
							<td width="30%"></td>
							<td width="30%"></td>
							<td width="40%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
								</xsl:call-template>
							</td>
						</tr>
						<xsl:if test="position()!=last()">
							<tr>
								<td colspan="3"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
							</tr>
						</xsl:if>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- 8. Условия перевозки -->
	<xsl:template match="atb:Conditions">
		<!--b><xsl:value-of select="position()"/></b-->
		<xsl:if test="atb:DeadlineDelivery">
			<!--br/-->
			<xsl:text>Сроки, по истечении которых грузоотправитель и грузополучатель вправе считать груз утраченным: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="atb:DeadlineDelivery"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="atb:FormNotification">
			<br/>
			<xsl:text>Форма уведомления о проведении экспертизы для определения размера фактической недостачи, повреждения (порчи): </xsl:text>
			<xsl:value-of select="atb:FormNotification"/>
		</xsl:if>
		<xsl:if test="atb:FeeOfCarrierStorage">
			<br/>
			<xsl:text>Плата за хранение груза в терминале перевозчика: </xsl:text>
			<xsl:for-each select="atb:FeeOfCarrierStorage/*">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="atb:DeadlineCarrierStorage">
			<br/>
			<xsl:text>Предельный срок хранения груза в терминале перевозчика: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="atb:DeadlineCarrierStorage"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="atb:DateLoad">
			<br/>
			<xsl:text>Срок погрузки: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="atb:DateLoad"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="atb:DateUnload">
			<br/>
			<xsl:text>Срок выгрузки: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="atb:DateUnload"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="atb:ProcedureUseDevices">
			<br/>
			<xsl:text>Порядок предоставления установки приспособлений: </xsl:text>
			<xsl:value-of select="atb:ProcedureUseDevices"/>
		</xsl:if>
		<xsl:if test="atb:WeightQuantity">
			<br/>
			<xsl:text>Масса груза, кг: </xsl:text>
			<xsl:value-of select="atb:WeightQuantity"/>
		</xsl:if>
		<xsl:if test="atb:WeightDefinitionMode">
			<br/>
			<xsl:text>Способ определения массы груза: </xsl:text>
			<xsl:value-of select="atb:WeightDefinitionMode"/>
		</xsl:if>
		<xsl:if test="atb:SealedIndoorVehicle">
			<br/><br/>
			<xsl:text>Сведения об опломбированных транспортных средствах: </xsl:text>
			<xsl:value-of select="atb:SealedIndoorVehicle"/>
			</xsl:if>
		<xsl:if test="atb:Containers">
			<br/>
			<xsl:text>Сведения о контейнерах</xsl:text><br/>
			<xsl:for-each select="atb:Containers">
				<!--xsl:value-of select="position()"/-->
				<xsl:text>Количество: </xsl:text>
				<xsl:value-of select="atb:ContainerQuantity"/>
				<xsl:text>, Номера (идентификаторы): </xsl:text>
				<xsl:for-each select="atb:ContainerIdentificator">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
				<xsl:if test="position()!=last()"><br/></xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="atb:Loading">
			<br/>
			<xsl:text>Погрузка: </xsl:text>
			<xsl:apply-templates select="atb:Loading"/>
		</xsl:if>
		<xsl:if test="atb:Unloading">
			<br/>
			<xsl:text>Разгрузка: </xsl:text>
			<xsl:apply-templates select="atb:Unloading"/>
		</xsl:if>
		<xsl:if test="atb:Desinfection">
			<br/>
			<xsl:text>Дезинфекция: </xsl:text>
			<xsl:apply-templates select="atb:Desinfection"/>
		</xsl:if>
		<xsl:if test="atb:PenaltyInfo">
			<br/>
			<xsl:text>Штрафы:</xsl:text><br/>
			<xsl:value-of select="atb:PenaltyInfo"/>
		</xsl:if>
		<xsl:if test="position()!=last()"><br/><br/></xsl:if>
	</xsl:template>
	<!-- Погрузка, разгрузка, дезинфекция -->
	<xsl:template match="atb:Loading|atb:Unloading|atb:Desinfection">
			<br/>
			<xsl:value-of select="."/>
	</xsl:template>
	<!-- 9. Информация о принятии заказа (заявки) к исполнению -->
	<xsl:template match="atb:Order">
		<table>
			<tbody>
				<tr>
					<td width="1%"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
					<td width="20%" style="border-bottom:1px solid;" align="center">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="atb:DateOrder"/>
						</xsl:call-template>
					</td>
					<td width="1%"></td>
					<td width="60%" style="border-bottom:1px solid;">
						<xsl:for-each select="atb:PersonAcceptingOrder/*">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
						</xsl:for-each>
					</td>
					<td width="1%"></td>
					<td width="16%" style="border-bottom:1px solid;"></td>
					<td width="1%"></td>
				</tr>
				<tr>
					<td></td>
					<td align="center">(дата принятия заказа (заявки) к исполнению)</td>
					<td></td>
					<td align="center">(фамилия, имя, отчество, должность лица, принявшего заказ (заявку) к исполнению)</td>
					<td></td>
					<td align="center">(подпись)</td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!-- 10. Перевозчик -->
	<xsl:template match="atb:Carrier">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:if test="cat_ru:Address">
			<br/>
			<xsl:apply-templates select="cat_ru:Address"/>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCard">
			<br/>
			<xsl:apply-templates select="cat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="cat_ru:Contact">
			<br/>
			<xsl:apply-templates select="cat_ru:Contact"/>
		</xsl:if>
		<xsl:if test="atb:ResponsiblePerson">
			<br/><br/>
			Данные уполномоченного лица:<br/>
			<xsl:apply-templates select="atb:ResponsiblePerson"/>
		</xsl:if>
		<xsl:if test="atb:Drivers">
			<br/><br/>
			Водители:<br/>
			<xsl:for-each select="atb:Drivers">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()"><br/></xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- 11. Транспортное средство -->
	<xsl:template match="atb:Transport|atb:TransportInfo">
		<tr>
			<td valign="top" style="border-right:1px dashed;border-top:1px dashed" width="20%">
				<xsl:value-of select="atb:Kind"/>
			</td>
			<td valign="top" style="border-right:1px dashed;border-top:1px dashed" width="20%">
				<xsl:value-of select="atb:Mark"/>
			</td>
			<td valign="top" style="border-right:1px dashed;border-top:1px dashed" width="20%">
				<xsl:value-of select="atb:Tonnage"/>
			</td>
			<td valign="top" style="border-right:1px dashed;border-top:1px dashed" width="20%">
				<xsl:value-of select="atb:Capacity"/>
			</td>
			<td valign="top" style="border-top:1px dashed">
				<xsl:value-of select="atb:RegistrationNumber"/>
			</td>
		</tr>
	</xsl:template>
	<!-- 12. Оговорки и замечания перевозчика -->
	<xsl:template match="atb:CarrierComments">
		<!--b><xsl:value-of select="position()"/></b-->
		<table>
			<tbody>
				<tr>
					<td width="50%">
						<xsl:apply-templates select="atb:ActualStateLoad"/>
						<xsl:value-of select="atb:ChangeConditionsInMove"/>
					</td>
					<td width="50%">
						<xsl:apply-templates select="atb:ActualStateUnload"/>
						<xsl:value-of select="atb:ChangeConditionsInUnload"/>					
					</td>
				</tr>
			</tbody>
		</table>
		<xsl:if test="position()!=last()"><br/></xsl:if>
	</xsl:template>
	<!-- Сосотояние груза при приеме, при сдаче -->
	<xsl:template match="atb:ActualStateLoad|atb:ActualStateUnload">
		Информация об упаковке: 
		<xsl:for-each select="atb:PackingInfo">
			<xsl:for-each select="./*">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()"> - </xsl:if>
			</xsl:for-each>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
		<xsl:if test="catESAD_cu:PakingQuantity">
			<br/>
			Количество упаковок: <xsl:value-of select="catESAD_cu:PakingQuantity"/>
		</xsl:if>
		<xsl:if test="atb:PackingMark">
			<br/>
			Маркировка грузовых мест: <xsl:value-of select="atb:PackingMark"/>
		</xsl:if>
		<xsl:if test="atb:PackageTypeCode">
			<br/>
			Упаковка товаров:
			<xsl:choose>
				<xsl:when test="atb:PackageTypeCode='0'">без упаковки</xsl:when>
				<xsl:when test="atb:PackageTypeCode='1'">с упаковкой</xsl:when>
				<xsl:when test="atb:PackageTypeCode='2'">без упаковки в оборудованных емкостях транспортного средства</xsl:when>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="atb:CargoState">
			<br/>
			Фактическое состояние: <xsl:value-of select="atb:CargoState"/>
		</xsl:if>
		<xsl:if test="position()!=last()"><br/><br/></xsl:if>
	</xsl:template>
	<!-- 13. Прочие условия -->
	<xsl:template match="atb:OtherConditions">
		<xsl:if test="atb:SpecialPermission">
			Специальное разрешение для перевозки опасного, тяжеловесного, крупногабаритного груза:<br/>
			<table width="100%">
				<tbody>
					<xsl:call-template name="DocsHead"/>
					<xsl:apply-templates select="atb:SpecialPermission"/>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="atb:WorkingDay">
			<br/>
			Режим труда и отдыха водителя в пути следования:<br/>
			<xsl:for-each select="atb:WorkingDay">
				<xsl:value-of select="position()"/>
				<xsl:text>. c </xsl:text>
				<xsl:value-of select="substring(atb:From, 1, 8)"/>
				<xsl:text> до </xsl:text>
				<xsl:value-of select="substring(atb:To, 1, 8)"/>
				<xsl:if test="position()!=last()"><br/></xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="atb:Acts">
			<br/>
			Сведения о коммерческих или иных актах:<br/>
			<table width="100%">
				<tbody>
					<xsl:call-template name="DocsHead"/>
					<xsl:apply-templates select="atb:Acts"/>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="atb:Route">
			<br/>
			Установленный маршрут перевозки:<br/>
			<table>
				<tbody>
					<tr>
						<td align="center" valign="top" style="border-right:1px dashed">Откуда</td>
						<td align="center" valign="top" style="border-right:1px dashed">Куда</td>
						<td align="center" valign="top" style="border-right:1px dashed">Точка маршрута</td>
						<td align="center" valign="top">Комментарий</td>
					</tr>
					<xsl:for-each select="atb:Route">
						<tr>
							<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
								<xsl:value-of select="atb:From"/>
							</td>
							<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
								<xsl:value-of select="atb:To"/>
							</td>
							<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
								<xsl:value-of select="atb:PointNumber"/>
							</td>
							<td valign="top" style="border-top:1px dashed">
								<xsl:value-of select="atb:Comment"/>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- 14. Переадресовка -->
	<xsl:template match="atb:Readdressing">
		<!--b><xsl:value-of select="position()"/>. </b-->
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="atb:DateReaddressing"/>
		</xsl:call-template>
		<xsl:if test="atb:FormReaddressing">
			<xsl:text> </xsl:text>
			<xsl:choose>
				<xsl:when test="atb:FormReaddressing='0'">устно</xsl:when>
				<xsl:when test="atb:FormReaddressing='1'">письменно</xsl:when>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="atb:PersonReaddressing">
			<br/>
			Сведения о лице, от которого получено указание о переадресации:
			<xsl:apply-templates select="atb:PersonReaddressing"/>
		</xsl:if>
		<xsl:if test="atb:Consignee">
			<br/>
			Сведения о новом получателе:
			<xsl:apply-templates select="atb:Consignee"/>
		</xsl:if>
		<xsl:if test="atb:Address">
			<br/>
			Адрес нового места выгрузки:
			<xsl:apply-templates select="atb:Address"/>
		</xsl:if>
		<xsl:if test="atb:DateTime">
			<br/>
			Дата и время подачи ТС под выгрузку:
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="atb:DateTime"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
			<xsl:value-of select="substring(atb:DateTime, 12, 8 )"/>
		</xsl:if>
		<xsl:if test="position()!=last()"><br/><br/></xsl:if>
	</xsl:template>
	<!-- 15. Стоимость услуг перевозчика и порядок расчета провозной платы -->
	<xsl:template match="atb:Calculation">
		<xsl:if test="atb:CostOfTheCarrierService">
			Стоимость услуги перевозчика, руб:
			<xsl:value-of select="atb:CostOfTheCarrierService"/>
		</xsl:if>
		<xsl:if test="atb:ProcedureCalculation">
			<br/>
			Порядок расчета провозной платы:
			<xsl:value-of select="atb:ProcedureCalculation"/>
		</xsl:if>
		<xsl:if test="atb:FeeOfTransporting">
			<br/>
			Размер провозной платы, руб:
			<xsl:value-of select="atb:FeeOfTransporting"/>
		</xsl:if>
		<xsl:if test="atb:FeeOnTollRoads">
			<br/>
			Платежи за проезд по платным дорогам:<br/>
			<xsl:apply-templates select="atb:FeeOnTollRoads"/>
		</xsl:if>
		<xsl:if test="atb:FeeOnDangerousHeavy">
			<br/>
			Платежи за перевозку опасных, тяжеловесных, крупногабаритных грузов:<br/>
			<xsl:apply-templates select="atb:FeeOnDangerousHeavy"/>
		</xsl:if>
		<xsl:if test="atb:CustomsFee">
			<br/>
			Таможенные платежи:<br/>
			<xsl:apply-templates select="atb:CustomsFee"/>
		</xsl:if>
		<xsl:if test="atb:FeeOfDesinfection">
			<br/>
			Платежи за погрузочно-разгрузочные работы при промывке и дезинфекции:<br/>
			<xsl:apply-templates select="atb:FeeOfDesinfection"/>
		</xsl:if>
		<xsl:if test="atb:Payer">
			<br/>
			<i>Данные организации плательщика:</i>
			<br/>
			<xsl:value-of select="atb:Payer/catComFin_ru:Name"/>
			<xsl:if test="atb:Payer/catComFin_ru:CompanyID">
				<br/>
				ИНН: <xsl:value-of select="atb:Payer/catComFin_ru:CompanyID"/>
			</xsl:if>
			<xsl:if test="atb:Payer/catComFin_ru:KPPCode">
				<br/>
				КПП: <xsl:value-of select="atb:Payer/catComFin_ru:KPPCode"/>
			</xsl:if>
			<xsl:if test="atb:Payer/atb:PostalAddress">
				<br/>
				Адрес: <xsl:apply-templates select="atb:Payer/atb:PostalAddress"/>
            </xsl:if>
            <xsl:if test="atb:Payer/catComFin_ru:Phone">
				<br/>
				Телефон: <xsl:value-of select="atb:Payer/catComFin_ru:Phone"/>
            </xsl:if>
			<br/>
			Банковские реквизиты:
			<br/>
			<xsl:for-each select="atb:Payer/atb:PaymentRequisitions">
				Банк: <xsl:value-of select="catComFin_ru:BankName"/> 
				<xsl:if test="catComFin_ru:OKPOID">ОКПО: <xsl:value-of select="catComFin_ru:OKPOID"/>; </xsl:if>
				<xsl:if test="catComFin_ru:BICID">БИК: <xsl:value-of select="catComFin_ru:BICID"/>; </xsl:if>
				<xsl:if test="catComFin_ru:SWIFTID">SWIFT: <xsl:value-of select="catComFin_ru:SWIFTID"/>; </xsl:if>
				<xsl:if test="catComFin_ru:AccountNumeric">Корр.счет: <xsl:value-of select="catComFin_ru:AccountNumeric"/>; </xsl:if>
				<xsl:if test="catComFin_ru:CurrentCurrencyAccount or catComFin_ru:TransitCurrencyAccount or catComFin_ru:SpecialTransitCurrencyAccount">Валютные счета организации:</xsl:if>
				<xsl:if test="catComFin_ru:CurrentCurrencyAccount">Текущий: <xsl:value-of select="catComFin_ru:CurrentCurrencyAccount"/>; </xsl:if>
				<xsl:if test="catComFin_ru:TransitCurrencyAccount">Транзитный: <xsl:value-of select="catComFin_ru:TransitCurrencyAccount"/>; </xsl:if>
				<xsl:if test="catComFin_ru:SpecialTransitCurrencyAccount">Транзитный(спец): <xsl:value-of select="catComFin_ru:SpecialTransitCurrencyAccount"/>; </xsl:if>
				<xsl:if test="catComFin_ru:RoubleCurrencyAccount">Рублевый счет: <xsl:value-of select="catComFin_ru:RoubleCurrencyAccount"/>; </xsl:if>
				<xsl:if test="position()!=last()"><br/></xsl:if>
            </xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- платежи -->
	<xsl:template match="atb:FeeOnTollRoads|atb:FeeOnDangerousHeavy|atb:CustomsFee|atb:FeeOfDesinfection">
		<xsl:value-of select="position()"/>
		<xsl:text>. </xsl:text>
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
		<xsl:if test="position()!=last()"><br/></xsl:if>
	</xsl:template>
	<!-- 16. Дата составления, подписи сторон -->
	<xsl:template match="atb:ConsignorSign|atb:ConsigneeSign">
		<table>
			<tbody>
				<tr>
					<td width="1%"></td>
					<td width="50%">
						<xsl:value-of select="cat_ru:PersonPost"/><br/>
						<xsl:value-of select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
					<td width="1%"></td>
					<td width="20%" valign="bottom">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
						</xsl:call-template>
					</td>
					<td width="1%"></td>
					<td width="16%" style="border-bottom:1px solid;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
					<td width="1%"></td>
				</tr>
				<tr>
					<td width="1%"></td>
					<td width="50%"></td>
					<td width="1%"></td>
					<td width="20%"></td>
					<td width="1%"></td>
					<td width="16%" align="center">
						(подпись)
					</td>
					<td width="1%"></td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!-- Документ -->
	<xsl:template match="*" mode="document">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
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
		<!--xsl:if test="atb:DocumentModeCode">
			<xsl:text> </xsl:text>
			<xsl:value-of select="atb:DocumentModeCode"/>
		</xsl:if>
		<xsl:if test="atb:ExpirationDate">
			<xsl:text> дата начала: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="atb:ExpirationDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="atb:ReleaseOrganization">
			<xsl:text> выдано: </xsl:text>
			<xsl:value-of select="atb:ReleaseOrganization"/>
		</xsl:if-->
	</xsl:template>
	<!-- Адрес -->
	<xsl:template match="cat_ru:Address|atb:Address|atb:PostalAddress">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Документ, удостоверяющий личность -->
	<xsl:template match="cat_ru:IdentityCard">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.), 'Date')">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Контакт -->
	<xsl:template match="cat_ru:Contact|atb:Contact">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Лицо, ответственно за перевозку, и водители -->
	<xsl:template match="atb:ResponsiblePerson|atb:Drivers">
	<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<br/>
		<xsl:value-of select="cat_ru:PersonPost"/>
		<br/>
		<xsl:apply-templates select="atb:Contact"/>
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
