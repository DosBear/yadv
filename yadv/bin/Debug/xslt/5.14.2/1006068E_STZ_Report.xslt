<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0" xmlns:stz="urn:customs.ru:Information:CustomsDocuments:STZ_Report:5.12.0">
	<!-- Шаблон для типа STZ_ReportType -->
	<xsl:template match="stz:STZ_Report">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
					body {
					background: #cccccc;
					}

					div.page {
					/*width: 277mm;*/
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 10mm;
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
					
					table.tbl td, table.tbl th{
						border: 1px solid black;
						vertical-align: top;
						//text-align: center;
					}
					
					.rotate {
						display:inline-block;
						filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);
						-webkit-transform: rotate(270deg);
						-ms-transform: rotate(270deg);
						transform: rotate(270deg);
					}
					
				</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									ФОРМЫ ОТЧЕТНОСТИ<br/>о товарах, помещенных под таможенную процедуру<br/>свободной таможенной зоны, применяемую на участках территорий опережающего социально-экономического развития, и о товарах,<br/>изготовленных (полученных) с использованием иностранных товаров, помещенных под таможенную процедуру свободной таможенной зоны,<br/>применяемую на участках территорий опережающего социально-экономического развития
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<tr>
												<td width="20%"/>
												<td width="60%" class="value" align="center">
													<xsl:value-of select="stz:NameTerritoryAdvancedDevelopment"/>
												</td>
												<td width="20%"/>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td align="center">
									(наименование территории опережающего социально-экономического развития)
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center">
									<xsl:text>от </xsl:text>
									<xsl:call-template name="russian_date_month">
										<xsl:with-param name="dateIn" select="stz:ReportDate"/>
									</xsl:call-template>
									<xsl:text> за период с </xsl:text>
									<xsl:call-template name="russian_date_month">
										<xsl:with-param name="dateIn" select="stz:ReportingPeriod/stz:StartDate"/>
									</xsl:call-template>
									<xsl:text> по </xsl:text>
									<xsl:call-template name="russian_date_month">
										<xsl:with-param name="dateIn" select="stz:ReportingPeriod/stz:EndDate"/>
									</xsl:call-template>
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center">
									<xsl:if test="stz:ReportingPeriod/stz:StateDate">
										<xsl:text>по состоянию на </xsl:text>
										<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="stz:ReportingPeriod/stz:StateDate"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:text disable-output-escaping="yes">	на&amp;nbsp;&amp;nbsp;</xsl:text><xsl:value-of select="stz:SheetNumber"/><xsl:text> л.</xsl:text>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td width="20%" align="right" valign="top">от</td>
												<td width="60%" class="value" align="center">
													<xsl:for-each select="stz:Declarant">
														<xsl:for-each select="stz:Organisation">
															<xsl:value-of select="cat_ru:OrganizationName"/>
															<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
																<xsl:value-of select="cat_ru:ShortName"/>
															</xsl:if>
														</xsl:for-each>
														<xsl:text>, </xsl:text>
														<xsl:if test="stz:ResidentLicenseNumber">
															<xsl:value-of select="stz:ResidentLicenseNumber"/>
															<xsl:text>, </xsl:text>
														</xsl:if>
														<xsl:for-each select="cat_ru:RFOrganizationFeatures">
															<xsl:if test="cat_ru:OGRN">
																<xsl:text>ОРГН/ОГРНИП </xsl:text>
																<xsl:value-of select="cat_ru:OGRN"/>
																<xsl:text>, </xsl:text>
															</xsl:if>
															<xsl:if test="cat_ru:INN">
																<xsl:text>ИНН </xsl:text>
																<xsl:value-of select="cat_ru:INN"/>
																<xsl:text>, </xsl:text>
															</xsl:if>
															<xsl:if test="cat_ru:KPP">
																<xsl:text>КПП </xsl:text>
																<xsl:value-of select="cat_ru:KPP"/>
																<xsl:text>, </xsl:text>
															</xsl:if>
														</xsl:for-each>
														<xsl:if test="stz:IdentityCard">
															<xsl:apply-templates select="stz:IdentityCard"/>
															<xsl:text>, </xsl:text>
														</xsl:if>
														<xsl:text>адрес: </xsl:text>
														<xsl:call-template name="address">
															<xsl:with-param name="address" select="stz:Address"/>
														</xsl:call-template>
														<xsl:text>, </xsl:text>
														<xsl:text>местонахождение: </xsl:text>
														<xsl:call-template name="address">
															<xsl:with-param name="address" select="stz:FactAddress"/>
														</xsl:call-template>
														<xsl:if test="stz:Phone">
															<xsl:text>, телефон: </xsl:text>
															<xsl:value-of select="stz:Phone"/>
														</xsl:if>
													</xsl:for-each>
												</td>
												<td width="20%"/>
											</tr>
											<tr>
												<td/>
												<td align="center">
													(наименование резидента, Ф.И.О. индивидуального предпринимателя, регистрационный номер в реестре резидентов территории опережающего социально-экономического развития, ИНН, КПП, ОГРН юридического лица, являющегося коммерческой организацией; сведения о документе, удостоверяющем личность, ОГРНИП, ИНН индивидуального предпринимателя; адрес, местонахождение, телефон)
												</td>
												<td/>
											</tr>
										</tbody>
									</table>
									<br/>
									<br/>
									<table>
										<tbody>
											<tr>
												<td width="20%" align="right">М.П.</td>
												<td width="30%" class="value" align="left">
													<xsl:for-each select="stz:ResidentPersonSignature">
														<xsl:value-of select="cat_ru:PersonSurname"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="cat_ru:PersonName"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="cat_ru:PersonMiddleName"/>
													</xsl:for-each>
												</td>
												<td width="30%" class="value" align="right">
													<xsl:call-template name="russian_date_month">
														<xsl:with-param name="dateIn" select="stz:ResidentPersonSignature/cat_ru:IssueDate"/>
													</xsl:call-template>
												</td>
												<td width="20%"/>
											</tr>
											<tr>
												<td/>
												<td colspan="2" align="center">
													(Ф.И.О., подпись уполномоченного лица, составившего отчетность, дата составления) 
												</td>
												<td/>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="page">
					<table width="100%">
						<tbody>
							<tr>
								<td align="center">
									<b>Форма № 1. Товары, помещенные под таможенную процедуру свободной таможенной зоны</b>
									<br/>
									<br/>
								</td>
							</tr>
							<xsl:if test="stz:TerritoryFlag='0'">
								<tr>
									<td>
										<table class="tbl">
											<tbody>
												<tr style="text-align:center; font-weight: bold;">
													<td rowspan="3">№ п/п</td>
													<td rowspan="3">Наименование товара</td>
													<td rowspan="3">Код товара по ТН ВЭД ЕАЭС</td>
													<td rowspan="3">Единица измерения</td>
													<td colspan="3">Товары, помещенные под таможенную процедуру свободной таможенной зоны (количество)</td>
													<td colspan="10">Распоряжение за отчетный период товарами, помещенными под таможенную процедуру свободной таможенной зоны</td>
												</tr>
												<tr style="text-align:center; font-weight: bold;">
													<td rowspan="2">на начало отчетного периода</td>
													<td rowspan="2">за отчетный период</td>
													<td rowspan="2">на конец отчетного периода</td>
													<td rowspan="2">товары, в отношении которых совершены операции по переработке (количество)</td>
													<td rowspan="2">создание объектов недвижимости</td>
													<td colspan="3">товары, помещенные под таможенные процедуры</td>
													<td rowspan="2">потребление (количество)</td>
													<td rowspan="2">изменение статуса товаров (количество)</td>
													<td colspan="3">товары, которые выбыли (списаны)</td>
												</tr>
												<tr style="text-align:center; font-weight: bold;">
													<td>код таможенной процедуры</td>
													<td>номер таможенной декларации</td>
													<td>количество, единица измерения</td>
													<td>количество</td>
													<td>стоимость, тыс.руб.</td>
													<td>основание</td>
												</tr>
												<tr style="text-align:center; font-weight: bold;">
													<td>1</td>
													<td>2</td>
													<td>3</td>
													<td>4</td>
													<td>5</td>
													<td>6</td>
													<td>7</td>
													<td>8</td>
													<td>9</td>
													<td>10</td>
													<td>11</td>
													<td>12</td>
													<td>13</td>
													<td>14</td>
													<td>15</td>
													<td>16</td>
													<td>17</td>
												</tr>
												<xsl:for-each select="stz:Form1Table1">
													<tr>
														<td colspan="17">
															<b>Иностранные товары</b>
														</td>
													</tr>
													<xsl:apply-templates select="stz:Form1Table1Goods[stz:Status='1']" mode="TOSER"/>
													<tr>
														<td colspan="17">
															<b>Товары Таможенного союза</b>
														</td>
													</tr>
													<xsl:apply-templates select="stz:Form1Table1Goods[stz:Status='0']" mode="TOSER"/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="stz:TerritoryFlag='1'">
								<tr>
									<td>
										<table class="tbl">
											<tbody>
												<tr style="text-align:center; font-weight: bold;">
													<td rowspan="3">№ п/п</td>
													<td rowspan="3">Наименование товара</td>
													<td rowspan="3">Код товара по ТН ВЭД ЕАЭС (10 знаков)</td>
													<td rowspan="3">Единица измерения</td>
													<td colspan="3">Товары, помещенные под таможенную процедуру свободной таможенной зоны (количество)</td>
													<td colspan="11">Распоряжение за отчетный период товарами, помещенными под таможенную процедуру свободной таможенной зоны</td>
												</tr>
												<tr style="text-align:center; font-weight: bold;">
													<td rowspan="2">на начало отчетного периода</td>
													<td rowspan="2">за отчетный период</td>
													<td rowspan="2">на конец отчетного периода</td>
													<td rowspan="2">создание объектов недвижимости</td>
													<td rowspan="2">товары, в отношении которых совершены операции по переработке (количество)</td>
													<td rowspan="2">строительство или реконструкция объектов инфраструктуры свободного порта Владивосток, расположенных на портовых или логистических участках (количество)</td>
													<td rowspan="2">потреблено (количество)</td>
													<td rowspan="2">уничтожено (количество)</td>
													<td rowspan="2">складирование<br/>(хранение)<br/>(количество)</td>
													<td rowspan="2">изменение статуса товаров (количество)</td>
													<td rowspan="2">иное использование<br/>(вид использования / количество)</td>
													<td colspan="3">завершение таможенной процедуры свободной таможенной зоны</td>
												</tr>
												<tr style="text-align:center; font-weight: bold;">
													<td>код таможенной процедуры</td>
													<td>номер таможенной декларации</td>
													<td>количество, единица измерения</td>
												</tr>
												<tr style="text-align:center; font-weight: bold;">
													<td>1</td>
													<td>2</td>
													<td>3</td>
													<td>4</td>
													<td>5</td>
													<td>6</td>
													<td>7</td>
													<td>8</td>
													<td>9</td>
													<td>10</td>
													<td>11</td>
													<td>12</td>
													<td>13</td>
													<td>14</td>
													<td>15</td>
													<td>16</td>
													<td>17</td>
													<td>18</td>
												</tr>
												<xsl:for-each select="stz:Form1Table1">
													<tr>
														<td colspan="18">
															<b>Иностранные товары</b>
														</td>
													</tr>
													<xsl:apply-templates select="stz:Form1Table1Goods[stz:Status='1']" mode="VLAD"/>
													<tr>
														<td colspan="18">
															<b>Товары Евразийского экономического созюза</b>
														</td>
													</tr>
													<xsl:apply-templates select="stz:Form1Table1Goods[stz:Status='0']" mode="VLAD"/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
				</div>
				<xsl:if test="stz:TerritoryFlag='1'">
					<div class="page">
						<table width="100%">
							<tbody>
								<tr>
									<td align="center">
										<b>Форма № 2. Товары, помещенные под таможенную процедуру свободной таможенной зоны в целях их размещения на портовых и логистических участках лицом, не являющимся резидентом свободного порта Владивосток, и принятые в целях складирования (хранения) и/или совершения иных операций резидентом свободного порта Владивосток</b>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										<table class="tbl">
											<tbody>
												<tr>
													<th rowspan="2">№ п/п</th>
													<th rowspan="2">Наименование товара</th>
													<th rowspan="2">Наименование лица, заключившего с резидентом договор об оказании услуг/ИНН</th>
													<th rowspan="2">Реквизиты договора об оказании услуг по складированию (хранению) и совершению новых операций</th>
													<th rowspan="2">Номер таможенной декларации (разрешения на ввоз товароу) / номер товара</th>
													<th rowspan="2">Код товара по ТН ВЭД ЕАЭС (первые 6 знаков)</th>
													<th rowspan="2">Единица измерения</th>
													<th colspan="2">Количество товаров, помещенных под таможенную процедуру свободной таможенной зоны</th>
													<th colspan="5">Совершение операций с товарами</th>
													<th colspan="3">Завершение таможенной процедуры свободной таможенной зоны</th>
												</tr>
												<tr>
													<th>всего ввезено товаров по таможенной декларации (разрешению на ввоз товаров)</th>
													<th>остаток на конец отчетного периода</th>
													<th>складирование (хранение)</th>
													<th>формирование (дробление) грузового места</th>
													<th>нанесение маркировки</th>
													<th>упаковка/ переупаковка</th>
													<th>иные операции</th>
													<th>код таможенной процедуры</th>
													<th>номер таможенной декларации/ номер товара</th>
													<th>количество/ единица измерения</th>
												</tr>
												<tr>
													<th>1</th>
													<th>2</th>
													<th>3</th>
													<th>4</th>
													<th>5</th>
													<th>6</th>
													<th>7</th>
													<th>8</th>
													<th>9</th>
													<th>10</th>
													<th>11</th>
													<th>12</th>
													<th>13</th>
													<th>14</th>
													<th>15</th>
													<th>16</th>
													<th>17</th>
												</tr>
												<xsl:for-each select="stz:NonRezidentTable">
													<tr>
														<td colspan="17">
															<b>Иностранные товары</b>
														</td>
													</tr>
													<xsl:apply-templates select="stz:NonRezidentGoods[stz:Status='1']"/>
													<tr>
														<td colspan="17">
															<b>Товары Евразийского экономического созюза</b>
														</td>
													</tr>
													<xsl:apply-templates select="stz:NonRezidentGoods[stz:Status='3']"/>
												</xsl:for-each>
											</tbody>
										</table>
										<br/>
										<br/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<div class="page">
					<table width="100%">
						<tbody>
							<tr>
								<td align="center">
									<xsl:variable name="formnum">
										<xsl:if test="stz:TerritoryFlag='0'">2</xsl:if>
										<xsl:if test="stz:TerritoryFlag='1'">3</xsl:if>
									</xsl:variable>
									<b>Форма № <xsl:value-of select="$formnum"/>. Товары, изготовленные (полученные) с использованием иностранных товаров, помещенных под таможенную процедуру свободной таможенной зоны</b>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td align="right">
									Таблица № 1
								</td>
							</tr>
							<tr>
								<td>
									Товары, изготовленные (полученные) на территории опережающего социально-экономического развития
								</td>
							</tr>
							<tr>
								<td>
									<table class="tbl">
										<tbody>
											<tr>
												<th>№ п/п</th>
												<th>Наименование товара</th>
												<th>Код товара по ТН ВЭД ЕАЭС</th>
												<th>Единица измерения</th>
												<th>Количество</th>
												<th>Статус товара</th>
												<th>Номера таможенных деклараций</th>
											</tr>
											<tr>
												<th>1</th>
												<th>2</th>
												<th>3</th>
												<th>4</th>
												<th>5</th>
												<th>6</th>
												<th>7</th>
											</tr>
											<xsl:for-each select="stz:Form2Table1">
												<xsl:variable name="num" select="position()"/>
												<tr>
													<td colspan="7">
														<!--xsl:value-of select="$num"/-->
														<xsl:text> Товары, изготовленные (полученные) на территории опережающего социально-экономического развития</xsl:text>
													</td>
												</tr>
												<xsl:apply-templates select="stz:Form2Table1Section1"/>
												<tr>
													<td colspan="7">
														Товары, помещенные под таможенную процедуру свободной таможенной зоны, использованные при изготовлении (получении) товаров на территории опережающего социально-экономического развития
													</td>
												</tr>
												<xsl:apply-templates select="stz:Form2Table1Section2"/>
											</xsl:for-each>
										</tbody>
									</table>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td align="right">
									Таблица № 2
								</td>
							</tr>
							<tr>
								<td>
									Распоряжение товарами, изготовленными (полученными) на территории опережающего социально-экономического развития
								</td>
							</tr>
							<tr>
								<td>
									<table class="tbl">
										<tbody>
											<tr align="center">
												<td rowspan="3">№ п/п</td>
												<td rowspan="3">Наименование товара</td>
												<td rowspan="3">Код товара по ТН ВЭД ЕАЭС</td>
												<td rowspan="3">Единица измерения</td>
												<td colspan="3">Количество</td>
												<td colspan="7">Распоряжение товарами</td>
											</tr>
											<tr align="center">
												<td rowspan="2">начало отчетного периода</td>
												<td rowspan="2">за отчетный период</td>
												<td rowspan="2">на конец отчетного периода</td>
												<td colspan="5">помещение под таможенную процедуру</td>
												<td colspan="2">иное</td>
											</tr>
											<tr align="center">
												<td>код таможенной процедуры</td>
												<td>статус товара</td>
												<td>номер и дата заключения</td>
												<td>номер таможенной декларации</td>
												<td>количество / единица измерения</td>
												<td>количество</td>
												<td>примечание</td>
											</tr>
											<tr align="center">
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
												<td>5</td>
												<td>6</td>
												<td>7</td>
												<td>8</td>
												<td>9</td>
												<td>10</td>
												<td>11</td>
												<td>12</td>
												<td>13</td>
												<td>14</td>
											</tr>
											<xsl:apply-templates select="stz:Form2Table2/stz:Form2Table2Goods"/>
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
	<!-- Форма 2 для Владивостока -->
	<xsl:template match="stz:NonRezidentGoods">
		<tr>
			<td>
				<xsl:value-of select="position()"/>
			</td>
			<td>
				<xsl:apply-templates select="stz:Name"/>
			</td>
			<td>
				<xsl:value-of select="stz:Organisation/cat_ru:OrganizationName"/>
				<xsl:text> / </xsl:text>
				<xsl:value-of select="stz:Organisation/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
			</td>
			<td>
				<xsl:for-each select="stz:Contract/*">
					<xsl:choose>
						<xsl:when test="local-name(.)='PrDocumentDate'"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template></xsl:when>
						<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
					</xsl:choose>
					<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
				</xsl:for-each>
			</td>
			<td>
				<xsl:apply-templates select="stz:NumberImportDocument/stz:DeclarationNumber"/>
				<xsl:text> / </xsl:text>
				<xsl:value-of select="stz:NumberImportDocument/stz:GoodsNumeric"/>
			</td>
			<td>
				<xsl:value-of select="substring(stz:TNVED,1,6)"/>
			</td>
			<td>
				<xsl:value-of select="stz:MeasureUnitQualifier"/>
			</td>
			<td>
				<xsl:value-of select="stz:Put/stz:QuantityTotal"/>
			</td>
			<td>
				<xsl:value-of select="stz:Put/stz:QuantityInTheEnd"/>
			</td>
			<td>
				<xsl:value-of select="stz:Operation/stz:PlacedInStorage"/>
			</td>
			<td>
				<xsl:value-of select="stz:Operation/stz:FormationPackage"/>
			</td>
			<td>
				<xsl:value-of select="stz:Operation/stz:Marking"/>
			</td>
			<td>
				<xsl:value-of select="stz:Operation/stz:Packing"/>
			</td>
			<td>
				<xsl:value-of select="stz:Operation/stz:OtherUsage/stz:Quantity"/>
				<br/>
				<xsl:value-of select="stz:Operation/stz:OtherUsage/stz:Note"/>
			</td>
			<td>
				<xsl:for-each select="stz:CustomsTreatmentModeChanged">
					<xsl:value-of select="stz:CustomsModeCode"/>
					<xsl:for-each select="stz:DeclarationNumber">
						<br/>
					</xsl:for-each>
				</xsl:for-each>
			</td>
			<td>
				<xsl:for-each select="stz:CustomsTreatmentModeChanged">
					<xsl:for-each select="stz:DeclarationNumber">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()">
							<br/>
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="position()!=last()">
						<br/>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td>
				<xsl:for-each select="stz:CustomsTreatmentModeChanged">
					<xsl:value-of select="stz:Quantity"/>
					<xsl:if test="stz:QuantityUnitQualifierName">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="stz:QuantityUnitQualifierName"/>
					</xsl:if>
					<xsl:for-each select="stz:DeclarationNumber">
						<br/>
					</xsl:for-each>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<!-- Форма 2 Таблица 2 -->
	<xsl:template match="stz:Form2Table2Goods">
		<tr>
			<td>
				<xsl:value-of select="position()"/>
			</td>
			<td>
				<xsl:apply-templates select="stz:Name"/>
			</td>
			<td>
				<xsl:value-of select="stz:TNVED"/>
			</td>
			<td>
				<xsl:value-of select="stz:MeasureUnitQualifier"/>
			</td>
			<td>
				<xsl:value-of select="stz:QuantityGoods/stz:QuantityAtTheBeginning"/>
			</td>
			<td>
				<xsl:value-of select="stz:QuantityGoods/stz:QuantityTotal"/>
			</td>
			<td>
				<xsl:value-of select="stz:QuantityGoods/stz:QuantityInTheEnd"/>
			</td>
			<td>
				<xsl:for-each select="stz:Usage/stz:CustomsProcedurePlaced">
					<xsl:value-of select="stz:CustomsModeCode"/>
					<xsl:for-each select="stz:DeclarationNumber">
						<br/>
					</xsl:for-each>
				</xsl:for-each>
			</td>
			<td>
				<xsl:for-each select="stz:Usage/stz:CustomsProcedurePlaced">
					<xsl:choose>
						<xsl:when test="stz:Status='0'">ТТС</xsl:when>
						<xsl:when test="stz:Status='1'">ИТ</xsl:when>
						<xsl:when test="stz:Status='3'">ТЕАЭС</xsl:when>
					</xsl:choose>
					<xsl:for-each select="stz:DeclarationNumber">
						<br/>
					</xsl:for-each>
				</xsl:for-each>
			</td>
			<td>
				<xsl:for-each select="stz:Usage/stz:CustomsProcedurePlaced">
					<xsl:value-of select="stz:Conclusion/cat_ru:PrDocumentName"/>
						<xsl:if test="stz:Conclusion/cat_ru:PrDocumentNumber">
						<xsl:text> № </xsl:text>
						<xsl:value-of select="stz:Conclusion/cat_ru:PrDocumentNumber"/>
					</xsl:if>
					<xsl:if test="stz:Conclusion/cat_ru:PrDocumentDate">
					<xsl:text> от </xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="stz:Conclusion/cat_ru:PrDocumentDate"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:for-each select="stz:DeclarationNumber">
						<br/>
					</xsl:for-each>
				</xsl:for-each>
			</td>
			<td>
				<xsl:for-each select="stz:Usage/stz:CustomsProcedurePlaced">
					<xsl:for-each select="stz:DeclarationNumber">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()">
							<br/>
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="position()!=last()">
						<br/>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td>
				<xsl:for-each select="stz:Usage/stz:CustomsProcedurePlaced">
					<xsl:value-of select="stz:Quantity"/>
					<xsl:if test="stz:QuantityUnitQualifierName">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="stz:QuantityUnitQualifierName"/>
					</xsl:if>
					<xsl:for-each select="stz:DeclarationNumber">
						<br/>
					</xsl:for-each>
				</xsl:for-each>
			</td>
			<td>
				<xsl:value-of select="stz:Usage/stz:OtherUsage/stz:Quantity"/>
			</td>
			<td>
				<xsl:value-of select="stz:Usage/stz:OtherUsage/stz:Note"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Форма 2 Таблица 1 Секции 1-2-->
	<xsl:template match="stz:Form2Table1Section1|stz:Form2Table1Section2">
		<tr>
			<td align="center">
				<xsl:value-of select="position()"/>
			</td>
			<td>
				<xsl:for-each select="stz:Name">
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
			<td>
				<xsl:value-of select="stz:TNVED"/>
			</td>
			<td>
				<xsl:value-of select="stz:MeasureUnitQualifier"/>
			</td>
			<td>
				<xsl:value-of select="stz:Quantity"/>
			</td>
			<td align="center">
				<xsl:choose>
					<xsl:when test="stz:Status='0'">ТТС</xsl:when>
					<xsl:when test="stz:Status='1'">ИТ</xsl:when>
					<xsl:when test="stz:Status='3'">ТЕАЭС</xsl:when>
				</xsl:choose>
			</td>
			<td>
				<xsl:if test="local-name(.)='Form2Table1Section2'">
					<xsl:for-each select="stz:GTDNumber">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()">, </xsl:if>
					</xsl:for-each>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Форма 1 Таблица 1 -->
	<xsl:template match="stz:Form1Table1Goods" mode="TOSER">
		<tr>
			<td align="center">
				<!-- 1 -->
				<xsl:value-of select="position()"/>
			</td>
			<td>
				<!-- 2 -->
				<xsl:for-each select="stz:Name">
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
			<td>
				<!-- 3 -->
				<xsl:value-of select="stz:TNVED"/>
			</td>
			<td>
				<!-- 4 -->
				<xsl:value-of select="stz:MeasureUnitQualifier"/>
			</td>
			<td>
				<!-- 5 -->
				<xsl:value-of select="stz:Put/stz:QuantityAtTheBeginning"/>
			</td>
			<td>
				<!-- 6 -->
				<xsl:value-of select="stz:Put/stz:QuantityTotal"/>
			</td>
			<td>
				<!-- 7 -->
				<xsl:value-of select="stz:Put/stz:QuantityInTheEnd"/>
			</td>
			<td>
				<!-- 8 -->
				<xsl:value-of select="stz:Used/stz:RecyclingGoodsQuantity"/>
			</td>
			<td>
				<!-- 9 -->
				<xsl:value-of select="stz:Used/stz:CreationRealEstateGoods"/>
			</td>
			<td>
				<!-- 10 -->
				<xsl:for-each select="stz:Used/stz:CustomsTreatmentModeChanged">
					<xsl:value-of select="stz:CustomsModeCode"/>
					<xsl:for-each select="stz:DeclarationNumber">
						<br/>
					</xsl:for-each>
				</xsl:for-each>
			</td>
			<td>
				<!-- 11 -->
				<xsl:for-each select="stz:Used/stz:CustomsTreatmentModeChanged">
					<xsl:for-each select="stz:DeclarationNumber">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()">
							<br/>
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="position()!=last()">
						<br/>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td>
				<!-- 12 -->
				<xsl:for-each select="stz:Used/stz:CustomsTreatmentModeChanged">
					<xsl:value-of select="stz:Quantity"/>
					<xsl:if test="stz:QuantityUnitQualifierName">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="stz:QuantityUnitQualifierName"/>
					</xsl:if>
					<xsl:for-each select="stz:DeclarationNumber">
						<br/>
					</xsl:for-each>
				</xsl:for-each>
			</td>
			<td>
				<!-- 13 -->
				<xsl:value-of select="stz:Used/stz:QuantityConsumed"/>
			</td>
			<td>
				<!-- 14 -->
				<xsl:if test="stz:Status='1'">
					<xsl:for-each select="stz:Used/stz:StatusDisguiseGoods">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<br/>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
			</td>
			<td>
				<!-- 15 -->
				<xsl:for-each select="stz:Used/stz:DestructedGoods">
					<xsl:value-of select="stz:Quantity"/>
					<xsl:if test="position()!=last()">
						<br/>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td>
				<!-- 16 -->
				<xsl:for-each select="stz:Used/stz:DestructedGoods">
					<xsl:value-of select="stz:Amount"/>
					<xsl:if test="position()!=last()">
						<br/>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td>
				<!-- 17 -->
				<xsl:for-each select="stz:Used/stz:DestructedGoods">
					<xsl:for-each select="stz:ConfirmUsageDoc">
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
						<xsl:if test="position()!=last()"><br/></xsl:if>
					</xsl:for-each>		
					<xsl:if test="position()!=last()"><br/></xsl:if>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<!-- Форма 1 Таблица 1 -->
	<xsl:template match="stz:Form1Table1Goods" mode="VLAD">
		<tr>
			<td align="center">
				<!-- 1 -->
				<xsl:value-of select="position()"/>
			</td>
			<td>
				<!-- 2 -->
				<xsl:for-each select="stz:Name">
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
			<td>
				<!-- 3 -->
				<xsl:value-of select="stz:TNVED"/>
			</td>
			<td>
				<!-- 4 -->
				<xsl:value-of select="stz:MeasureUnitQualifier"/>
			</td>
			<td>
				<!-- 5 -->
				<xsl:value-of select="stz:Put/stz:QuantityAtTheBeginning"/>
			</td>
			<td>
				<!-- 6 -->
				<xsl:value-of select="stz:Put/stz:QuantityTotal"/>
			</td>
			<td>
				<!-- 7 -->
				<xsl:value-of select="stz:Put/stz:QuantityInTheEnd"/>
			</td>
			<td>
				<!-- 8 -->
				<xsl:value-of select="stz:Used/stz:CreationRealEstateGoods"/>
			</td>
			<td>
				<!-- 9 -->
				<xsl:value-of select="stz:Used/stz:RecyclingGoodsQuantity"/>
			</td>
			<td>
				<!-- 10 -->
				<xsl:value-of select="stz:Used/stz:ConstructionInfrastructure"/>
			</td>
			<td>
				<!-- 11 -->
				<xsl:value-of select="stz:Used/stz:QuantityConsumed"/>
			</td>
			<td>
				<!-- 12 -->
				<xsl:for-each select="stz:Used/stz:DestructedGoods">
					<xsl:value-of select="stz:Quantity"/>
					<xsl:if test="position()!=last()">
						<br/>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td>
				<!-- 13 -->
				<xsl:value-of select="stz:Used/stz:PlacedInStorage"/>
			</td>
			<td>
				<!-- 14 -->
				<xsl:if test="stz:Status='1'">
					<xsl:for-each select="stz:Used/stz:StatusDisguiseGoods">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<br/>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
			</td>
			<td>
				<!-- 15 -->
				<xsl:value-of select="stz:Used/stz:OtherUsage/stz:Quantity"/>
				<xsl:if test="stz:Used/stz:OtherUsage/stz:Note">/</xsl:if>
				<xsl:value-of select="stz:Used/stz:OtherUsage/stz:Note"/>
			</td>
			<td>
				<!-- 16 -->
				<xsl:for-each select="stz:Used/stz:CustomsTreatmentModeChanged">
					<xsl:value-of select="stz:CustomsModeCode"/>
					<xsl:for-each select="stz:DeclarationNumber">
						<br/>
					</xsl:for-each>
				</xsl:for-each>
			</td>
			<td>
				<!-- 17 -->
				<xsl:for-each select="stz:Used/stz:CustomsTreatmentModeChanged">
					<xsl:for-each select="stz:DeclarationNumber">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()">
							<br/>
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="position()!=last()">
						<br/>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td>
				<!-- 18 -->
				<xsl:for-each select="stz:Used/stz:CustomsTreatmentModeChanged">
					<xsl:value-of select="stz:Quantity"/>
					<xsl:if test="stz:QuantityUnitQualifierName">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="stz:QuantityUnitQualifierName"/>
					</xsl:if>
					<xsl:for-each select="stz:DeclarationNumber">
						<br/>
					</xsl:for-each>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<!-- Номер ТД -->
	<xsl:template match="stz:DeclarationNumber|stz:GTDNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date_gtd">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Документ, удостоверяющий личность -->
	<xsl:template match="stz:IdentityCard">
		<xsl:for-each select="*">
			<xsl:if test="local-name(.)!='IdentityCardCode'">
				<xsl:choose>
					<xsl:when test="local-name(.)='IdentityCardDate'">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="."/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="."/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Адрес -->
	<xsl:template name="address">
		<xsl:param name="address"/>
		<xsl:for-each select="$address/*">
			<xsl:if test="local-name()!='CountryCode'">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:if>
		</xsl:for-each>
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
	<xsl:template name="month_name">
		<xsl:param name="monthIn"/>
		<xsl:choose>
			<xsl:when test="$monthIn='01'">января</xsl:when>
			<xsl:when test="$monthIn='02'">февраля</xsl:when>
			<xsl:when test="$monthIn='03'">марта</xsl:when>
			<xsl:when test="$monthIn='04'">апреля</xsl:when>
			<xsl:when test="$monthIn='05'">мая</xsl:when>
			<xsl:when test="$monthIn='06'">июня</xsl:when>
			<xsl:when test="$monthIn='07'">июля</xsl:when>
			<xsl:when test="$monthIn='08'">августа</xsl:when>
			<xsl:when test="$monthIn='09'">сентября</xsl:when>
			<xsl:when test="$monthIn='10'">октября</xsl:when>
			<xsl:when test="$monthIn='11'">ноября</xsl:when>
			<xsl:when test="$monthIn='12'">декабря</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>"</xsl:text>
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>" </xsl:text>
				<xsl:call-template name="month_name">
					<xsl:with-param name="monthIn" select="substring($dateIn,6,2)"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> г.</xsl:text>
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
