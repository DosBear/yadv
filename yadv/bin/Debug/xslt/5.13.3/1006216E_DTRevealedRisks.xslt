<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rtdt="urn:customs.ru:Information:CustomsDocuments:DTRevealedRisks:5.13.3">
	<!-- Шаблон для типа DTRevealedRisksType -->
	<xsl:template match="rtdt:DTRevealedRisks">
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
					width: 290mm;
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
					font-size: 9pt;
					}

					.value
					{
					border-bottom: solid 1px black;
					}

					div.title, tr.title td { font-weight:bold;  vertical-align:middle;}
					.bordered 
					{ 
					border-collapse: collapse; 
					}
					td.bordered
					{
					border: solid 1px windowtext;
					font-family: Arial;
					font-size: 8pt;
					}

					td.graphMain
					{
					vertical-align:middle;
					}
					td.value.graphMain
					{
					vertical-align:top;
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
										<b>Результат выявления рисков по ДТ</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Полная версия ПЗ "Сервис выявление рисков СТО" уровня РТУ</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="rtdt:SoftVersion"/>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">
								<xsl:if test="rtdt:DTNumber">Регистрационный номер ДТ/реестра экспресс-грузов / Заявления о выпуске до подачи</xsl:if>
								<xsl:if test="rtdt:MPONumber">Регистрационный номер МПО</xsl:if>
								<xsl:if test="rtdt:Reestr_ID">Уникальный номер реестра МПО</xsl:if>
								<xsl:if test="rtdt:WHDocInventoryNumber">Регистрационный номер документов, представленных для помещения товаров на ВХ</xsl:if>
							</td>
							<td class="value graphMain" style="width:50%">
								<xsl:if test="rtdt:DTNumber"><xsl:apply-templates select="rtdt:DTNumber"/></xsl:if>
								<xsl:if test="rtdt:MPONumber"><xsl:apply-templates select="rtdt:MPONumber"/></xsl:if>
								<xsl:if test="rtdt:Reestr_ID"><xsl:value-of select="rtdt:Reestr_ID"/></xsl:if>
								<xsl:if test="rtdt:WHDocInventoryNumber"><xsl:apply-templates select="rtdt:WHDocInventoryNumber"/></xsl:if>
							</td>
						</tr>
						<xsl:if test="rtdt:GreenChannel">
							<tr>
								<td class="annot graphMain" style="width:50%">Признак отнесения участника ВЭД
к зеленому сектору </td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="rtdt:GreenChannel='true' or rtdt:GreenChannel=1">
											<xsl:text>есть</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>нет</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="rtdt:CategoryObject">
							<tr>
								<td class="annot graphMain" style="width:50%">Код категории уровня риска объекта контроля</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<!--xsl:when test="rtdt:CategoryObject=0">
											<xsl:text>отсутствует информация об уровне риска объекта контроля (эквивалентно высокому уровню риска)</xsl:text>
										</xsl:when-->
										<xsl:when test="rtdt:CategoryObject=1">
											<xsl:text>по итогам автоматического категорирования объект контроля имеет низкий уровень риска</xsl:text>
										</xsl:when>
										<xsl:when test="rtdt:CategoryObject=2">
											<xsl:text>по итогам автоматического категорирования объект контроля имеет средний уровень риска</xsl:text>
										</xsl:when>
										<xsl:when test="rtdt:CategoryObject=3">
											<xsl:text>по итогам автоматического категорирования объект контроля имеет высокий уровень риска</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="translate(rtdt:CategoryObject, '.', ',')"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="rtdt:KodKateg">
							<tr>
								<td class="annot graphMain" style="width:50%">Код отраслевой категории уровня риска</td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="rtdt:KodKateg">
										<xsl:choose>
											<xsl:when test=".='04'">
												<xsl:text>Производственник</xsl:text>
											</xsl:when>
											<xsl:when test=".='05'">
												<xsl:text>Автопроизводитель</xsl:text>
											</xsl:when>
											<xsl:when test=".='06'">
												<xsl:text>Импортер рыбной продукции</xsl:text>
											</xsl:when>
											<xsl:when test=".='07'">
												<xsl:text>Импортер мясной продукции</xsl:text>
											</xsl:when>
											<xsl:when test=".='08'">
												<xsl:text>Экспортер</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="."/>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</xsl:if>
					</table>
					<xsl:if test="rtdt:ProfileInfo">
						<div class="title marg-top">Информация профиля риска</div>
						<table class="bordered w190">
							<tbody>
								<xsl:for-each select="rtdt:ProfileInfo">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="rtdt:HashInfo">
						<div class="title marg-top">Информация по неформ. индикатору</div>
						<table class="bordered w190" style="width:50%">
							<tbody>
								<tr class="title" bgcolor="silver">
									<td class="graphMain bordered">Хэш-сумма для неформ. индикатора</td>
									<td class="graphMain bordered">Значение неформ. индикатора, соответствующее хэш-сумме</td>
								</tr>
								<xsl:for-each select="rtdt:HashInfo">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="rtdt:Consigments">
						<div class="title marg-top">Сведения о выявленных рисках на партиях (-и) товара в документе</div>
						<xsl:apply-templates select="rtdt:Consigments"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа rtdt:DocumentType -->
	<xsl:template match="rtdt:Consigments">
		<xsl:if test="rtdt:ProfileRef">
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered" style="width:25%" bgcolor="silver" colspan="3" rowspan="2"></td>
						<td class="graphMain bordered" style="width:75%" align="center" bgcolor="silver" colspan="2">Неформальные индикаторы</td>
					</tr>
					<tr class="title" bgcolor="silver">
						<td class="graphMain bordered" style="width:60%">Код информации для неформ. индикатора</td>
						<td class="graphMain bordered" style="width:15%" colspan="4">Хэш-сумма</td>
					</tr>
					<tr class="title" bgcolor="#e3e3e3">
						<td class="graphMain bordered" colspan="5">Ссылки на ПР/ЦПР, которые сработали на документ в целом</td>
					</tr>
					<tr>
						<td class="graphMain bordered" style="width:25%" bgcolor="#e3e3e3" colspan="3">На документ в целом (т.е. на все партии товаров)</td>
						<td class="graphMain bordered" colspan="2">
							<table class="bordered w190">
								<tbody>
									<xsl:for-each select="rtdt:ProfileRef">
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</tbody>
							</table>
						</td>
					</tr>				
					<xsl:if test="rtdt:Consigment">
						<xsl:for-each select="rtdt:Consigment">
							<tr class="title">
								<td class="graphMain bordered" style="width:5%" rowspan="2"></td>
								<td class="graphMain bordered" bgcolor="#e3e3e3" colspan="4">Ссылки на ПР/ЦПР, которые сработали на конкретную товарную партию</td>
							</tr>
							<tr>
								<td class="graphMain bordered" style="width:20%" bgcolor="#e3e3e3" colspan="2">
									<xsl:text>На товарную партию № </xsl:text>
									<xsl:value-of select="rtdt:ConsigmentNumber"/>
								</td>
								<td class="graphMain bordered" colspan="2">
									<xsl:if test="rtdt:ProfileRef">
										<table class="bordered w190">
											<tbody>
												<xsl:for-each select="rtdt:ProfileRef">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</xsl:if>
								</td>
							</tr>	
							<xsl:if test="rtdt:Goods">
								<xsl:variable name="row">
									<xsl:choose>
										<xsl:when test="count(rtdt:Goods) &gt; 0"><xsl:value-of select="count(rtdt:Goods) + 1"/></xsl:when>
										<xsl:otherwise><xsl:value-of select="number('1')"/></xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<tr class="title">
									<td class="graphMain bordered" colspan="2" rowspan="{$row}"></td>
									<td class="graphMain bordered" bgcolor="#e3e3e3" colspan="3">Ссылки на ПР/ЦПР, которые сработали на конкретный товар</td>
								</tr>
								<xsl:for-each select="rtdt:Goods">
									<tr>
										<td class="graphMain bordered" style="width:15%" bgcolor="#e3e3e3">
											<xsl:text>На товар № </xsl:text>
											<xsl:value-of select="rtdt:GoodsNumber"/>
										</td>
										<td class="graphMain bordered" colspan="2">
											<xsl:if test="rtdt:ProfileRef">
												<table class="bordered w190">
													<tbody>
														<xsl:for-each select="rtdt:ProfileRef">
															<xsl:apply-templates select="."/>
														</xsl:for-each>
													</tbody>
												</table>
											</xsl:if>
										</td>
									</tr>	
								</xsl:for-each>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rtdt:DocNumberType -->
	<xsl:template match="rtdt:DTNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="dtnum_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="rtdt:AddNumber"/>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа rtdt:HashInfoType -->
	<xsl:template match="rtdt:HashInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="rtdt:Hash"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtdt:HashMean"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа rtdt:MeasureInfoType -->
	<xsl:template match="rtdt:MeasureAttribute">
			<td class="graphMain bordered">
				<xsl:value-of select="rtdt:MeasureAttributeCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtdt:MeasureAttributeValue"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="rtdt:MeasureAttributeNecessary=0">
						<xsl:text>возможно выбирать значения характеристик таможенного досмотра</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:MeasureAttributeNecessary=1">
						<xsl:text>возможность выбора отсутствует (досмотр применяется в соответствии со значениями характеристик, установленных профилем риска)</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="rtdt:MeasureAttributeNecessary"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
	</xsl:template>
	<!-- Шаблон для типа rtdt:MinimizeInfoType -->
	<xsl:template match="rtdt:MinimizeMeasuresInfo">
		<xsl:variable name="rowspan">
			<xsl:choose>
				<xsl:when test="count(rtdt:MeasureAttribute) &gt; 0"><xsl:value-of select="count(rtdt:MeasureAttribute)"/></xsl:when>
				<xsl:otherwise><xsl:value-of select="number('1')"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<tr>
			<td class="graphMain bordered" rowspan="{$rowspan}">
				<xsl:value-of select="rtdt:MinimizeMeasureCode"/>
			</td>
			<td class="graphMain bordered" rowspan="{$rowspan}">
				<xsl:value-of select="rtdt:MinimizeMeasureMainCode"/>
			</td>
			<td class="graphMain bordered" rowspan="{$rowspan}">
				<xsl:choose>
					<xsl:when test="rtdt:MinimizeMeasureNecessity=0">
						<xsl:text>применять меру не обязательно</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:MinimizeMeasureNecessity=1">
						<xsl:text>мера должна быть применена обязательно</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="rtdt:MinimizeMeasureNecessity"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered" rowspan="{$rowspan}">
				<xsl:choose>
					<xsl:when test="rtdt:MinimizeMeasureUse=' '">
						<xsl:text>поле не заполняется</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:MinimizeMeasureUse='0'">
						<xsl:text>мера не применяется согласно результатам случайной выборки</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:MinimizeMeasureUse='1'">
						<xsl:text>мера должна быть применена согласно профилю риска</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:MinimizeMeasureUse='2'">
						<xsl:text>мера не применялась из-за несоответствия этапа, на котором была проведена проверка на наличие рисков, и этапа, на котором мера по минимизации рисков должна применяться согласно условиям профиля риска</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:MinimizeMeasureUse='3'">
						<xsl:text>резерв</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:MinimizeMeasureUse='4'">
						<xsl:text>мера не применяется в связи с включением субъекта ВЭД в Перечень лиц, в отношении которых принято решение об определении степени выборочности применения мер по минимизации рисков, либо в связи с его отнесением в установленном порядке к категории низкого уровня риска</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:MinimizeMeasureUse='5'">
						<xsl:text>мера не применяется в связи с неприменением главной меры (проставляется АИС «АИСТ-М» в автоматическом режиме)</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:MinimizeMeasureUse='6'">
						<xsl:text>мера не применялась по причине упрощенного контроля таможенной стоимости идентичных товаров</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="rtdt:MinimizeMeasureUse"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered" rowspan="{$rowspan}">
				<xsl:value-of select="rtdt:MeasureDescription"/>
			</td>
			<xsl:choose>
				<xsl:when test="count(rtdt:MeasureAttribute) &gt; 0">
					<xsl:apply-templates select="rtdt:MeasureAttribute[position() = 1]"/>
				</xsl:when>
				<xsl:otherwise>
					<td></td>
					<td></td>
					<td></td>
				</xsl:otherwise>
			</xsl:choose>			
		</tr>
		<xsl:for-each select="rtdt:MeasureAttribute[position() &gt; 1]">
			<tr>
				<xsl:apply-templates select="."/>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа rtdt:MPORegNumberType -->
	<xsl:template match="rtdt:MPONumber">
		<xsl:if test="rtdt:CustomsCode">
			<xsl:value-of select="rtdt:CustomsCode"/>
			<xsl:text>/</xsl:text>
		</xsl:if>
		<xsl:if test="rtdt:RegistrationDate">
			<xsl:call-template name="dtnum_date">
				<xsl:with-param name="dateIn" select="rtdt:RegistrationDate"/>
			</xsl:call-template>
			<xsl:text>/</xsl:text>
		</xsl:if>
		<xsl:value-of select="rtdt:MPO_Number"/>
	</xsl:template>
	<!-- Шаблон для типа rtdt:NFIInfoType -->
	<xsl:template match="rtdt:NFIInfo">
		<tr>
			<td class="graphMain bordered" style="width:60%">
				<xsl:choose>
					<xsl:when test="rtdt:NFICode='0100'">
						<xsl:text>неформ. индикаторы из группы «Субъект ВЭД»</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:NFICode='0200'">
						<xsl:text>неформ. индикаторы из группы «Партия товаров»</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:NFICode='0300'">
						<xsl:text>неформ. индикаторы из группы «Товары»</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:NFICode='0400'">
						<xsl:text>неформ. индикаторы из группы «Товары»-«Платежи»</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:NFICode='0500'">
						<xsl:text>неформ. индикаторы из группы «Товары»-«Документы»</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:NFICode='0600'">
						<xsl:text>неформ. индикаторы из группы «Транспортные средства»</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:NFICode='0700'">
						<xsl:text>неформ. индикаторы в целом к профилю риска</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="rtdt:NFICode"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered" style="width:15%">
				<xsl:value-of select="rtdt:NFIHash"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа rtdt:ProfileInfoType -->
	<xsl:template match="rtdt:ProfileInfo">
		<tr class="title" bgcolor="silver">
			<td class="graphMain bordered">Код признака документа</td>
			<td class="graphMain bordered">Код таможенного органа, разработавшего ПР/ЦПР</td>
			<td class="graphMain bordered">Дата регистрации</td>
			<td class="graphMain bordered">Порядковый номер</td>
			<td class="graphMain bordered">Порядковый номер версии</td>
			<td class="graphMain bordered">Код типового критерия</td>
			<td class="graphMain bordered">Код направления деятельности подразделения, по направлению которого выявлен риск</td>
			<td class="graphMain bordered">Признак формализации</td>
			<td class="graphMain bordered">Дата начала действия версии ПР</td>
			<td class="graphMain bordered">Дата окончания действия версии ПР</td>
			<td class="graphMain bordered">Примечание к области риска</td>
			<!--td class="graphMain bordered">Не используется. Не заполняется в СВР. Описание профиля риска (ранее использовалось для ориентировок).</td-->
			<td class="graphMain bordered">Примечание к мерам (произвольный текст)</td>
			<!--td class="graphMain bordered">Набор информации о каждой мере по минимизации рисков</td-->
		</tr>
		<tr>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="rtdt:DocumentSignCode='11'">
						<xsl:text>общероссийский профиль риска</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:DocumentSignCode='12'">
						<xsl:text>региональный профиль риска</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:DocumentSignCode='13'">
						<xsl:text>зональный профиль риска</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:DocumentSignCode='20'">
						<xsl:text>целевой профиль риска</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:DocumentSignCode='21'">
						<xsl:text>целевой правоохранительный профиль риска</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:DocumentSignCode='32'">
						<xsl:text>профиль риска на основе моделей</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:DocumentSignCode='55'">
						<xsl:text>профиль риска, обязательный к применению</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:DocumentSignCode='77'">
						<xsl:text>профиль риска для идентификации категории уровня риска</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:DocumentSignCode='88'">
						<xsl:text>зависимый профиль риска</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="rtdt:DocumentSignCode"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtdt:DivisionCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="rtdt:RegistryDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtdt:SequenceNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtdt:VersionNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtdt:CriterionCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rtdt:ActivityCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="rtdt:FormalizedType='0'">
						<xsl:text>неформализован</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:FormalizedType='1'">
						<xsl:text>формализован</xsl:text>
					</xsl:when>
					<xsl:when test="rtdt:FormalizedType='2'">
						<xsl:text>формализован частично</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="rtdt:FormalizedType"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="rtdt:BeginDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="rtdt:EndVerDate"/>
				</xsl:call-template>
			</td>			
			<td class="graphMain bordered">
				<xsl:value-of select="rtdt:PRNote"/>
			</td>
			<!--td class="graphMain bordered">
				<xsl:value-of select="rtdt:MinimizeMeasuresNote"/>
			</td-->
			<td class="graphMain bordered">
				<xsl:value-of select="rtdt:DescriptionMeasure"/>
			</td>
		</tr>
		<xsl:if test="rtdt:MinimizeMeasuresInfo">
			<tr>
				<td class="graphMain bordered"></td>
				<td class="graphMain bordered" colspan="11">
					<table>
						<tbody>
							<tr class="title" bgcolor="#e3e3e3">
								<td class="graphMain bordered" colspan="5">Набор информации о каждой мере по минимизации рисков (rsk_mera.dbf)</td>
								<td class="graphMain bordered" colspan="3">Характеристики досмотра/осмотра (rskxdosm.dbf)</td>
							</tr>
							<tr class="title" bgcolor="#e3e3e3">
								<td class="graphMain bordered" style="border-bottom: solid 0px black;width:7%" >Код меры</td>
								<td class="graphMain bordered" style="width:7%">Код главной меры</td>
								<td class="graphMain bordered" style="width:10%">Признак обязательности применения меры</td>
								<td class="graphMain bordered" style="width:20%">Признак применения мер (уровень системы)</td>
								<td class="graphMain bordered" style="width:20%">Примечание к мере</td>
								<td class="graphMain bordered" style="width:7%">Код харак-ти</td>
								<td class="graphMain bordered" style="width:7%">Значение харак-ти</td>
								<td class="graphMain bordered" style="width:23%">Признак, определяющий возможность выбора</td>
							</tr>
							<xsl:for-each select="rtdt:MinimizeMeasuresInfo">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rtdt:ProfileRefType -->
	<xsl:template match="rtdt:ProfileRef">
		<xsl:if test="rtdt:NFIInfo">
			<xsl:for-each select="rtdt:NFIInfo">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="rtdt:WHDocInventoryNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="dtnum_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
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
	<xsl:template name="dtnum_date">
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
</xsl:stylesheet>
