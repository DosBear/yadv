<?xml version="1.0" encoding="utf-8"?>
<!--
DocKind=0
Проект Приказа ФТС "Об утверждении формы заявления о продлении срока действия таможенной процедуры временного вывоза и формы решения таможенного органа по результатам рассмотрения указанного заявления"
Приложение № 2 - Решение таможенного органа о продлении (отказе в продлении) срока действия таможенной процедуры временного вывоза
Внесены изменения согласно Письму ГУОТОиТК от 15.08.2018 г. № 04-64/51001 (Добавлен номер 289-ФЗ «О таможенном регулировании...»)
DocKind=1
Проект Приказа ФТС "Об утверждении формы заявления о продлении срока действия таможенной процедуры временного ввоза (допуска) и формы решения таможенного органа о продлении (отказе в продлении) срока действия таможенной процедуры временного ввоза (допуска)"
Приложение № 2 - Решение таможенного органа о продлении (отказе в продлении) срока действия таможенной процедуры временного ввоза (допуска)
Внесены изменения согласно Письму ГУОТОиТК от 15.08.2018 г. № 04-64/50990 (Добавлен номер 289-ФЗ «О таможенном регулировании...»)
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rpte="urn:customs.ru:Information:TransportDocuments:ResProlongTempImpExp:5.14.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:template match="rpte:ResProlongTempImpExp">
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
			width: 180mm;
			max-width: 180mm;
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
			table-layout: fixed;
			width: 100%;
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
			border: 1px solid windowtext;
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
			font-size: 12pt;
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
					<table width="100%" class="graphMain">
						<tbody>
							<tr align="center">
								<br/>
								<br/>
								<td class="normal">
									<b>Федеральная таможенная служба</b>
								</td>
							</tr>
							<tr>
								<td class="delim"><br/></td>
							</tr>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="rpte:Customs"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle">(наименование таможенного органа)</td>
							</tr>
							<tr>
								<td class="delim"><br/></td>
							</tr>
							<tr align="center">
								<td class="normal">
									<b>Решение <xsl:if test="rpte:DocKind=0">
											<br>таможенного органа о продлении (отказе в продлении) срока действия таможенной процедуры временного вывоза</br>
										</xsl:if>
										<xsl:if test="rpte:DocKind=1">
											<br>таможенного органа о продлении (отказе в продлении) срока действия таможенной процедуры временного ввоза (допуска)</br>
										</xsl:if>
									</b>
								</td>
							</tr>
							<tr align="left" class="normal">
								<td><br/><p style="text-indent: 7%">На основании заявления</p></td>
							</tr>
							<tr>
								<td class="value" style="text-align: justify;">
									<xsl:apply-templates select="rpte:Applicant"/>
									<br>Дата заявления:&#160;</br>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="rpte:AppDate"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle">(наименование, ИНН, КПП организации или инициалы, фамилия, ИНН (при наличии) физического лица; дата заявления)</td>
							</tr>
							<tr>
								<td class="delim"><br/></td>
							</tr>
							<tr>
								<xsl:if test="rpte:DocKind=0">
									<td style="text-align: justify;">
										<xsl:text>в соответствии со статьей 171 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации» принято решение в отношении товаров, помещенных по </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="rpte:GTDID"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(№ таможенной декларации)'"/>
											<xsl:with-param name="width" select="'35%'"/>
										</xsl:call-template>
										<xsl:text>&#160;под таможенную процедуру временного вывоза:</xsl:text>
									</td>
								</xsl:if>
								<xsl:if test="rpte:DocKind=1">
									<td style="text-align: justify;">
										<xsl:text>в соответствии со статьей 167 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации» принято решение в отношении товаров, помещенных по</xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="rpte:GTDID"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(№ таможенной декларации)'"/>
											<xsl:with-param name="width" select="'35%'"/>
										</xsl:call-template>
										<xsl:text>под таможенную процедуру временного ввоза (допуска):</xsl:text>
									</td>
								</xsl:if>
							</tr>
							<tr>
								<td class="delim"><br/></td>
							</tr>
							<tr>
								<td class="normal">
									<xsl:if test="rpte:DocKind=0">1. О продлении срока действия таможенной процедуры временного вывоза:</xsl:if>
									<xsl:if test="rpte:DocKind=1">1. О продлении срока действия таможенной процедуры временного ввоза (допуска):</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="delim"><br/></td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody width="100%" align="center" class="graphMain">
							<tr>
								<td class="bordered" width="5%">№ п/п</td>
								<td class="bordered" width="25%">Наименование товара</td>
								<td class="bordered" width="15%">№ товара в таможенной декларации</td>
								<td class="bordered" width="16%">Количество<sup>1</sup></td>
								<td class="bordered" width="15%">Код товара по ТН ВЭД ЕАЭС<sup>2</sup></td>
								<td class="bordered" width="24%">Индивидуальные признаки товара<sup>3</sup></td>
							</tr>
							<xsl:if test="rpte:ProlongInfo">
								<xsl:for-each select="rpte:ProlongInfo/rpte:GoodsInfo">
									<tr align="center">
										<td class="bordered">
											<xsl:value-of select="cat_ru:GoodsNumeric"/>
										</td>
										<td class="bordered">
											<xsl:for-each select="cat_ru:GoodsDescription">
												<!--xsl:apply-templates/-->
												<xsl:value-of select="."/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</xsl:for-each>
										</td>
										<td class="bordered">
											<xsl:if test="rpte:GoodsNumberInGTD">
												<xsl:value-of select="rpte:GoodsNumberInGTD"/>
											</xsl:if>
										</td>
										<td class="bordered">
											<xsl:if test="cat_ru:GrossWeightQuantity">
												<xsl:value-of select="rpte:SupplementaryQuantity/cat_ru:GoodsQuantity"/>&#160;<xsl:if test="rpte:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName">
													<xsl:value-of select="rpte:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
												</xsl:if>
												<xsl:if test="rpte:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode">
													(<xsl:value-of select="rpte:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)
												</xsl:if>
											</xsl:if>
										</td>
										<td class="bordered">
											<xsl:if test="cat_ru:GoodsTNVEDCode">
												<xsl:value-of select="cat_ru:GoodsTNVEDCode"/>
											</xsl:if>
										</td>
										<td class="bordered">
											<xsl:for-each select="rpte:IndividualCharacteristics">
												<!--xsl:apply-templates/-->
												<xsl:value-of select="."/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
								<tr class="delim"><td colspan="6">
									<br/>
									</td>
								</tr>
							</xsl:if>	
						</tbody>
					</table>
					<table width="100%" class="graphMain">
						<tbody>
							<tr align="center">
								<td width="3% " class="normal" align="left">до&#160;</td>
								<td width="30% " class="value" align="center">
									<xsl:call-template name="russian_date">
										<xsl:with-param select="rpte:ProlongInfo/rpte:DateEndTempExp" name="dateIn"/>
									</xsl:call-template>
								</td>
								<td width="67%"/>
							</tr>
							<tr class="graphLittle" align="center">
								<td/>
								<td>(дата) <sup>4</sup></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="3" class="delim"><br/></td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="rpte:DocKind=1">	
						<xsl:for-each select="rpte:ProlongInfo">
							<table width="100%" class="graphMain">
								<tbody>
									<tr>
										<td align="center" class="bordered" width="4%">
											<xsl:if test="(rpte:EnsuringSign=1) or (rpte:EnsuringSign='true')">V</xsl:if>
											<xsl:if test="(rpte:EnsuringSign=0) or (rpte:EnsuringSign='false')">&#8722;</xsl:if>
										</td>
										<td class="normal" width="2%"/>
										<td class="normal" width="94%">с предоставлением обеспечения исполнения обязанности по уплате таможенных пошлин, налогов <sup>5</sup> по</td>
									</tr>
									<tr>
										<td/>
										<td/>
										<td>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:apply-templates select="rpte:EnsuringDoc"/>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'left'"/>
												<xsl:with-param name="description">
													(номер и дата документа, подтверждающего принятие таможенным органом обеспечения исполнения обязанности по уплате таможенных пошлин, налогов)
												</xsl:with-param>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td class="delim" colspan="3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="bordered">
											<xsl:if test="(rpte:EnsuringSign=0) or (rpte:EnsuringSign='false')">V</xsl:if>
											<xsl:if test="(rpte:EnsuringSign=1) or (rpte:EnsuringSign='true')">&#8722;</xsl:if>
										</td>
										<td class="normal"/>
										<td class="normal">без предоставления обеспечения исполнения обязанности по уплате таможенных пошлин, налогов <sup>5</sup></td>
									</tr>
									<tr>
										<td class="delim">
											<br/>
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:for-each>
					</xsl:if>
					<table width="100%" class="graphMain">
						<tbody>
							<tr class="normal">
								<td>
									<xsl:if test="rpte:DocKind=0">2. Об отказе в продлении срока действия таможенной процедуры временного вывоза:</xsl:if>
									<xsl:if test="rpte:DocKind=1">2. Об отказе в продлении срока действия таможенной процедуры временного ввоза (допуска):</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="delim"><br/></td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody width="100%" align="center" class="graphMain">
							<tr>
								<td class="bordered" width="5%">№ п/п</td>
								<td class="bordered" width="25%">Наименование товара</td>
								<td class="bordered" width="15%">№ товара в таможенной декларации</td>
								<td class="bordered" width="16%">Количество<sup>1</sup></td>
								<td class="bordered" width="15%">Код товара по ТН ВЭД ЕАЭС<sup>2</sup></td>
								<td class="bordered" width="24%">Индивидуальные признаки товара<sup>3</sup></td>
							</tr>
							<xsl:if test="rpte:NotProlongInfo">
								<xsl:for-each select="rpte:NotProlongInfo/rpte:GoodsInfo">
									<tr align="center">
										<td class="bordered">
											<xsl:value-of select="cat_ru:GoodsNumeric"/>
										</td>
										<td class="bordered">
											<xsl:for-each select="cat_ru:GoodsDescription">
												<!--xsl:apply-templates/-->
												<xsl:value-of select="."/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</xsl:for-each>
										</td>
										<td class="bordered">
											<xsl:if test="rpte:GoodsNumberInGTD">
												<xsl:value-of select="rpte:GoodsNumberInGTD"/>
											</xsl:if>
										</td>
										<td class="bordered">
											<xsl:if test="cat_ru:GrossWeightQuantity">
												<xsl:value-of select="rpte:SupplementaryQuantity/cat_ru:GoodsQuantity"/>&#160;<xsl:if test="rpte:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName">
													<xsl:value-of select="rpte:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
												</xsl:if>
												<xsl:if test="rpte:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode">
									(<xsl:value-of select="rpte:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)
									</xsl:if>
											</xsl:if>
										</td>
										<td class="bordered">
											<xsl:if test="cat_ru:GoodsTNVEDCode">
												<xsl:value-of select="cat_ru:GoodsTNVEDCode"/>
											</xsl:if>
										</td>
										<td class="bordered">
											<xsl:for-each select="rpte:IndividualCharacteristics">
												<!--xsl:apply-templates/-->
												<xsl:value-of select="."/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:if>
							<tr>
								<td class="delim"><br/></td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="rpte:NotProlongInfo/rpte:GoodsInfo">
						<table width="100%" class="graphMain">
							<tbody>
								<tr>
									<td align="left" class="normal">на основании</td>
								</tr>
								<tr>
									<td style="text-align: justify;" class="value">
										<xsl:if test="rpte:DocKind=1">
											<xsl:for-each select="rpte:NotProlongInfo/rpte:Reason/rpte:ImpReferenceNormFederalLaw">
												<xsl:choose>
													<xsl:when test=".=1">несоблюдения условий использования товаров в соответствии с таможенной процедурой временного ввоза (допуска), установленных пунктом 2 статьи 220 Кодекса Союза</xsl:when>
													<xsl:when test=".=2">несоблюдения условий, установленных частями 4 и 5 статьи 167 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные
законодательные акты Российской Федерации»</xsl:when>
													<xsl:when test=".=3">неисполнения требований таможенного органа, предусмотренных частью 6 статьи 167 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные
законодательные акты Российской Федерации»</xsl:when>
													<xsl:otherwise>Код основания: <xsl:value-of select="."/></xsl:otherwise>
												</xsl:choose>
												<xsl:if test="position()!=last()">;<br/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="rpte:DocKind=0">
											<xsl:for-each select="rpte:NotProlongInfo/rpte:Reason/rpte:ExpReferenceNormFederalLaw">
												<xsl:choose>
													<xsl:when test=".=1">несоблюдения условий использования товаров в соответствии с таможенной процедурой временного вывоза, установленных пунктом 2 статьи 228 Кодекса Союза</xsl:when>
													<xsl:when test=".=2">подачи заявления о продлении срока действия таможенной процедуры временного вывоза в таможенный орган, в котором не производилось помещение товаров под заявленную таможенную процедуру</xsl:when>
													<xsl:when test=".=3">подачи заявления о продлении срока действия таможенной процедуры временного вывоза после истечения сроков, установленных абзацем третьим части 2  статьи 171 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные
законодательные акты Российской Федерации»</xsl:when>
													<xsl:when test=".=4">передачи иностранному лицу права собственности на временно вывезенные товары, в отношении которых законодательством Российской Федерации установлена обязательность их возврата на территорию Российской Федерации</xsl:when>
													<xsl:otherwise>Код основания: <xsl:value-of select="."/></xsl:otherwise>
												</xsl:choose>
												<xsl:if test="position()!=last()">;<br/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="rpte:NotProlongInfo/rpte:Reason/rpte:Reason">
											<br/>
										</xsl:if>
										<xsl:for-each select="rpte:NotProlongInfo/rpte:Reason/rpte:Reason">
											<!--xsl:apply-templates/-->
											<xsl:value-of select="."/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle">
										<xsl:if test="rpte:DocKind=0">(указывается основание для отказа в продлении срока действия таможенной процедуры временного вывоза со ссылкой на норму Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные
законодательные акты Российской Федерации», в соответствии с которой принято решение) </xsl:if>
										<xsl:if test="rpte:DocKind=1">(указывается основание для отказа в продлении срока действия таможенной процедуры временного ввоза (допуска)  со ссылкой на норму Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные
законодательные акты Российской Федерации», в соответствии с которой принято решение) </xsl:if>
									</td>
								</tr>
								<tr>
									<td class="delim"><br/><br/><br/><br/></td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<table width="100%" class="graphMain">
						<tbody>
							<tr>
								<td align="left" width="17%" class="normal">Начальник (заместитель начальника)</td>
								<td width="3%"/>
								<td align="center" width="33%" class="value">
									<xsl:apply-templates select="rpte:Customs"/>
								</td>
								<td width="3%"/>
								<td align="center" width="12%" class="value"/>
								<td width="3%"/>
								<td valign="bottom" align="center" width="29%" class="value">
									<xsl:value-of select="rpte:CustomsChief/cat_ru:PersonName"/>
								</td>
							</tr>
							<tr>
								<td align="center"/>
								<td/>
								<td align="center" class="graphLittle">(наименование таможенного органа)</td>
								<td/>
								<td align="center" class="graphLittle">(подпись)</td>
								<td/>
								<td align="center" class="graphLittle">(инициалы, фамилия)</td>
							</tr>
						</tbody>
					</table>
					<table width="100%">
						<tbody>
							<tr>
								<td class="delim"><br/><br/></td>
							</tr>
							<tr>
								<td class="normal">
									<xsl:call-template name="russian_date_month">
										<xsl:with-param name="dateIn" select="rpte:ResDate"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim"><br/></td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody width="100%" class="graphLittle">
							<tr>
								<td>_____________________________________</td>
							</tr>
							<tr>
								<td class="delim"/>
							</tr>
							<tr>
								<td>
									<sup>1</sup>Указывается количество товара в основной и дополнительной единице измерения.</td>
							</tr>
							<tr>
								<td>
									<sup>2</sup>Указывается десятизначный код товара по единой Товарной номенклатуре внешнеэкономической деятельности Евразийского экономического союза.</td>
							</tr>
							<tr>
								<td>
									<sup>3</sup>Указываются индивидуальные признаки, позволяющие идентифицировать товар.</td>
							</tr>
							<tr>
								<td>
									<sup>4</sup>
									<xsl:if test="rpte:DocKind=0">Указывается дата окончания срока действия таможенной процедуры временного вывоза.</xsl:if>
									<xsl:if test="rpte:DocKind=1">Указывается дата окончания срока действия таможенной процедуры временного ввоза (допуска).</xsl:if>
								</td>
							</tr>
							<xsl:if test="rpte:DocKind=1">
								<tr>
									<td>
										<sup>5</sup>
										Выбрать один из вариантов путем указания в соответствующем поле знака «V», при этом в другом поле проставляется знак прочерка «-».
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
				</div>
			</body>
		</html>
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
	<xsl:template name="month">
		<xsl:param name="number"/>
		<xsl:if test="$number='01'">января</xsl:if>
		<xsl:if test="$number='02'">февраля</xsl:if>
		<xsl:if test="$number='03'">марта</xsl:if>
		<xsl:if test="$number='04'">апреля</xsl:if>
		<xsl:if test="$number='05'">мая</xsl:if>
		<xsl:if test="$number='06'">июня</xsl:if>
		<xsl:if test="$number='07'">июля</xsl:if>
		<xsl:if test="$number='08'">августа</xsl:if>
		<xsl:if test="$number='09'">сентября</xsl:if>
		<xsl:if test="$number='10'">октября</xsl:if>
		<xsl:if test="$number='11'">ноября</xsl:if>
		<xsl:if test="$number='12'">декабря</xsl:if>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="supIndexDescr"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="normal value">
						<xsl:value-of select="$data" disable-output-escaping="yes"/>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="graphLittle" style="text-align: center;">
						<xsl:value-of select="$description" disable-output-escaping="yes"/><sup><xsl:value-of select="$supIndexDescr"/></sup>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="rpte:GTDID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>"</xsl:text>&#160;
				<u>&#160;<xsl:value-of select="substring($dateIn,9,2)"/>&#160;</u>
				&#160;<xsl:text>"</xsl:text>&#160;
				<u>&#160;
					<xsl:call-template name="month">
						<xsl:with-param name="number" select="substring($dateIn,6,2)"/>
					</xsl:call-template>
				&#160;</u>&#160;
				<xsl:text>20</xsl:text>
				<u>
					<xsl:value-of select="substring($dateIn,3,2)"/>
				</u>
				&#160;<xsl:text>г.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="Organization" match="*">
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
		<!--<xsl:if test="RUScat_ru:CountryA2Code">
			<span class="normal">, </span>
			<span class="italic">Код страны</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>-->
		<!--<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<span class="normal">, </span>
			<span class="italic">ОПФ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>-->
		<!--<xsl:if test="RUScat_ru:UITN">
			<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>-->
		<!--<xsl:if test="RUScat_ru:PersonId">
			<span class="normal">, </span>
			<span class="italic">УИ ФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:PersonId"/>
		</xsl:if>-->
		<!--<xsl:if test="RUScat_ru:IdentityCard">
			<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		</xsl:if>-->
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
		<!--<xsl:if test="RUScat_ru:CommunicationDetails">
			<span class="normal">
				<xsl:for-each select="RUScat_ru:CommunicationDetails">
					<xsl:call-template name="CommunicationDetails"/>
				</xsl:for-each>
			</span>
		</xsl:if>-->
	</xsl:template>
	<xsl:template name="RUScat_ru:SubjectAddressDetails" match="RUScat_ru:SubjectAddressDetails ">
		<xsl:if test="RUScat_ru:PostalCode">
			<span class="normal"> </span>
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
			<xsl:if test="RUScat_ru:Room or RUScat_ru:AddressText ">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:Room"/>
			</span>
			<xsl:if test="RUScat_ru:AddressText">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AddressText"/>
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
		<span class="normal">Код ОПФ: </span>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<span class="normal"> (</span>
			<span class="italic">по справ. </span>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
			<span class="normal">)</span>
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
	<xsl:template match="rpte:Customs">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:text> (</xsl:text>
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:text>) </xsl:text>
	</xsl:template>
	<xsl:template match="rpte:EnsuringDoc">
		<xsl:if test="cat_ru:PrDocumentName">
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
</xsl:stylesheet>
