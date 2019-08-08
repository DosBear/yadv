<?xml version="1.0" encoding="utf-8"?>
<!-- 
Проект Приказа ФТС "Об утверждении формы заявления о передаче товаров, помещенных под таможенную процедуру временного ввоза (допуска), во владение и пользование иным лицам, и форм решений таможенного органа по результатам рассмотрения указанного заявления"
DocKind = 0:
Приложение № 1 - Заявление о передаче товаров, помещенных под таможенную процедуру временного ввоза (допуска), во владение и пользование иным лицам
Внесены изменения согласно Письму ГУОТОиТК от 15.08.2018 г. № 04-64/51039 (Добавлен номер 289-ФЗ «О таможенном регулировании...»)
DocKind = 1:
Приложение № 4 - Обязательство о соблюдении условий использования товаров в соответствии с таможенной процедурой временного ввоза (допуска), требований и условий временного ввоза
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:atti="urn:customs.ru:Information:TransportDocuments:AppTransferTempImport:5.13.4" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа AppTransferTempImportType -->
	<xsl:template match="atti:AppTransferTempImport">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					font-family: Arial;
					}

					div.page {
					width: 180mm;
					max-width: 180mm;
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
					max-width: 100%;
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
					.descr{
						font-size: 8pt;
						text-align: center;
					}
					.indent{
						text-indent: 1.5em;
					}
					.underlined{
						border-bottom: 1px solid windowtext;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tbody>
							<tr>
								<td width="50%"></td>
								<td width="50%">
									Начальнику
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="atti:Customs/cat_ru:OfficeName"/>
											<xsl:text> </xsl:text>
											<xsl:if test="atti:Customs/cat_ru:OfficeName">
												<xsl:text>(</xsl:text>
											</xsl:if>
											<xsl:value-of select="atti:Customs/cat_ru:Code"/>
											<xsl:if test="atti:Customs/cat_ru:OfficeName">
												<xsl:text>)</xsl:text>
											</xsl:if>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(наименование таможенного органа)'"/>
										<xsl:with-param name="supIndexDescr">
											<xsl:choose>
												<xsl:when test="atti:DocKind=0">1</xsl:when>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr align="center" valign="top">
								<td>
									<br/>
									<br/>
									<xsl:if test="atti:DocKind=0">
										<b>ЗАЯВЛЕНИЕ
										<br/>о передаче товаров, помещенных под таможенную процедуру временного ввоза (допуска), во владение и пользование иным лицам</b>
									</xsl:if>	
									<xsl:if test="atti:DocKind=1">
										<b>Обязательство
										<br/>о соблюдении условий использования товаров в соответствии с таможенной процедурой временного ввоза (допуска), требований и условий временного ввоза</b>
									</xsl:if>	
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					Настоящим <br/>
					<xsl:call-template name="inlinetable">
						<xsl:with-param name="data">
							<xsl:choose>
								<xsl:when test="atti:DocKind=0"><xsl:apply-templates mode="organization" select="atti:Applicant"/></xsl:when>
								<xsl:when test="atti:DocKind=1"><xsl:apply-templates mode="organization" select="atti:WhomTransfer"/></xsl:when>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="data_align" select="'left'"/>
						<xsl:with-param name="description" select="'(наименование, ИНН, КПП, адрес организации или инициалы, фамилия, ИНН (при наличии), адрес физического лица)'"/>
						<xsl:with-param name="width" select="'100%'"/>
					</xsl:call-template>
					<xsl:if test="atti:DocKind=0">
						<table>
							<tbody>
								<tr>
									<td style="text-align: justify;">
										<xsl:text>в соответствии со статьей 168 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные
	законодательные акты Российской Федерации» просит выдать разрешение на передачу </xsl:text>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates mode="organization" select="atti:WhomTransfer"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'(наименование, ИНН, КПП, адрес организации или инициалы, фамилия, ИНН (при наличии), адрес физического лица)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:text>товаров, помещенных под таможенную процедуру временного ввоза (допуска) по декларации на товары № </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="atti:GTDID"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(указывается номер декларации на товары)'"/>
											<xsl:with-param name="width" select="'70mm'"/>
										</xsl:call-template>
										<xsl:text>:</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="atti:DocKind=1">
						<table>
							<tbody>
								<tr>
									<td style="text-align: justify;">
										<xsl:text>в соответствии со статьей 168 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные
	законодательные акты Российской Федерации» обязуется соблюдать условия использования в соответствии с таможенной процедурой временного ввоза (допуска), требования и условия временного 
	ввоза, установленные пунктом 2 статьи 220 Таможенного кодека Евразийского экономического союза в отношении  товаров,  помещенных  под  таможенную  процедуру  временного  ввоза (допуска)  по
 декларации на товары № </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="atti:GTDID"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(указывается номер таможенной декларации на товары)'"/>
											<xsl:with-param name="width" select="'85mm'"/>
										</xsl:call-template>
										<xsl:text>:</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<table>
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered">№ п/п</td>
								<td class="bordered">Наименование товара</td>
								<td class="bordered">№ товара в таможенной декларации</td>
								<td class="bordered">Количество<xsl:choose><xsl:when test="atti:DocKind=0"><sup>2</sup></xsl:when><xsl:when test="atti:DocKind=1"><sup>1</sup></xsl:when></xsl:choose>
								</td>
								<td class="bordered">Код товара по ТН ВЭД ЕАЭС<xsl:choose><xsl:when test="atti:DocKind=0"><sup>3</sup></xsl:when><xsl:when test="atti:DocKind=1"><sup>2</sup></xsl:when></xsl:choose>
								</td>
								<td class="bordered">Индивидуальные признаки товара<xsl:choose><xsl:when test="atti:DocKind=0"><sup>4</sup></xsl:when><xsl:when test="atti:DocKind=1"><sup>3</sup></xsl:when></xsl:choose>
								</td>
							</tr>
							<xsl:for-each select="atti:GoodsInfo">
								<tr valign="top">
									<td class="bordered">
										<xsl:value-of select="cat_ru:GoodsNumeric"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="cat_ru:GoodsDescription"/>
									</td>
									<td class="bordered">
										<xsl:value-of select="atti:GoodsNumberInGTD"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates mode="quantity" select="atti:SupplementaryQuantity"/>
									</td>
									<td class="bordered">
										<xsl:value-of select="cat_ru:GoodsTNVEDCode"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="atti:IndividualCharacteristics"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<xsl:if test="atti:DocKind=1">
						<table>
							<tbody>
								<tr>
									<td>
										<xsl:text>принимаемых от  </xsl:text>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates mode="organization" select="atti:Applicant"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'(наименование, ИНН, КПП, адрес организации или инициалы, фамилия, ИНН (при наличии), адрес физического лица, передающего товары)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="atti:DocKind=0">
						<table>
							<tbody>
								<tr>
									<td>
										<xsl:text>с </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="atti:DateTransfer"/></xsl:call-template>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(предполагаемая дата передачи временно ввезенных товаров)'"/>
											<xsl:with-param name="width" select="'100mm'"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td>
										<xsl:text>по причине </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="atti:Reason"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(обоснование необходимости передачи товаров, помещенных под таможенную процедуру временного ввоза (допуска), во владение и пользование иным лицам)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table width="100%" class="graphMain">
							<tbody>
								<tr>
									<td align="center" class="bordered" width="4%">
										<xsl:if test="(atti:EnsuringSign=1) or (atti:EnsuringSign='true')">V</xsl:if>
										<xsl:if test="(atti:EnsuringSign=0) or (atti:EnsuringSign='false')">&#8722;</xsl:if>
									</td>
									<td class="normal" width="2%"/>
									<td class="normal" width="94%">с предоставлением лицом, принимающим товары, обеспечения исполнения обязанности по уплате таможенных пошлин, налогов <sup>5</sup> по</td>
								</tr>
								<tr>
									<td/>
									<td/>
									<td>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="atti:EnsuringDoc"/>
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
										<xsl:if test="(atti:EnsuringSign=0) or (atti:EnsuringSign='false')">V</xsl:if>
										<xsl:if test="(atti:EnsuringSign=1) or (atti:EnsuringSign='true')">&#8722;</xsl:if>
									</td>
									<td class="normal"/>
									<td class="normal">без предоставления лицом, принимающим товары, обеспечения исполнения обязанности по уплате таможенных пошлин, налогов <sup>5</sup></td>
								</tr>
								<tr>
									<td class="delim">
										<br/>
										<br/>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr valign="top">
									<td width="35%">Перечень прилагаемых документов:</td>
									<td>
										<xsl:for-each select="atti:AttachedDocuments">
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:value-of select="position()"/>
													<xsl:text>) </xsl:text>
													<xsl:value-of select="cat_ru:PrDocumentName"/>
													<xsl:if test="cat_ru:PrDocumentNumber">
														<xsl:text> № </xsl:text>
														<xsl:value-of select="cat_ru:PrDocumentNumber"/>
													</xsl:if>
													<xsl:if test="cat_ru:PrDocumentDate">
														<xsl:text> от </xsl:text>
														<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/></xsl:call-template>
													</xsl:if>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'left'"/>
												<xsl:with-param name="description">
													<xsl:if test="position()=1">
														(указываются документы, прилагаемые к заявлению)
													</xsl:if>
												</xsl:with-param>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
										</xsl:for-each>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table width="100%">
							<tbody>
								<tr>
									<td width="40%" class="underlined"></td>
									<td width="20%"></td>
									<td width="40%" class="underlined" align="center">
										<xsl:value-of select="atti:ApproverPersonApplicant/cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="atti:ApproverPersonApplicant/cat_ru:PersonMiddleName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="atti:ApproverPersonApplicant/cat_ru:PersonSurname"/>
									</td>
								</tr>
								<tr valign="top" align="center">
									<td class="descr">(подпись руководителя организации либо физического лица, передающего товары)</td>
									<td></td>
									<td class="descr">(инициалы, фамилия)</td>
								</tr>
								<tr>
									<td>
										<xsl:call-template name="russian_date_month"><xsl:with-param name="dateIn" select="atti:ApproverPersonApplicant/cat_ru:IssueDate"/></xsl:call-template>								
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td align="center">
										М.П.<sup>6</sup>		
									</td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</xsl:if>	
					<br/>
					<table width="100%">
						<tbody>
							<tr>
								<td width="40%" class="underlined"></td>
								<td width="20%"></td>
								<td width="40%" class="underlined" align="center">
									<xsl:value-of select="atti:ApproverPersonWhomTransfer/cat_ru:PersonName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="atti:ApproverPersonWhomTransfer/cat_ru:PersonMiddleName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="atti:ApproverPersonWhomTransfer/cat_ru:PersonSurname"/>
								</td>
							</tr>
							<tr valign="top" align="center">
								<td class="descr">(подпись руководителя организации либо физического лица, принимающего товары)</td>
								<td></td>
								<td class="descr">(инициалы, фамилия)</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="russian_date_month"><xsl:with-param name="dateIn" select="atti:ApproverPersonWhomTransfer/cat_ru:IssueDate"/></xsl:call-template>								
								</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td align="center">
									<xsl:choose>
										<xsl:when test="atti:DocKind=0">М.П.<sup>6</sup></xsl:when>
										<xsl:when test="atti:DocKind=1">М.П.<sup>4</sup></xsl:when>
									</xsl:choose>
								</td>
								<td></td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div>_____________________________________</div>
					<div class="descr" style="text-align:left;">
						<xsl:if test="atti:DocKind=0">
							<sup>1</sup>Указывается наименование таможенного органа, в регионе деятельности котого функционирует<br/>
							<sup>2</sup>Указывается количество товара в основной и дополнительной единицах измерения.<br/>
							<sup>3</sup>Указывается десятизначный код товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза.<br/>
							<sup>4</sup>Указываются индивидуальные признаки, позволяющие идентифицировать товар.<br/>
							<sup>5</sup>Выбрать один из вариантов путем указания в соответствующем поле знака «V», при этом в другом поле проставляется знак прочерка «-».<br/>
							<sup>6</sup>При наличии печати.
						</xsl:if>	
						<xsl:if test="atti:DocKind=1">
							<sup>1</sup>Указывается количество товара в основной и дополнительной единицах измерения.<br/>
							<sup>2</sup>Указывается десятизначный код товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза.<br/>
							<sup>3</sup>Указываются индивидуальные признаки, позволяющие идентифицировать товар.<br/>
							<sup>4</sup>При наличии печати.
						</xsl:if>	
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
		
	<xsl:template mode="quantity" match="*">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="atti:GTDID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	
	<xsl:template mode="person_nopost" match="*">
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="person" match="*">
		<xsl:value-of select="cat_ru:PersonPost"/>
		<xsl:text> </xsl:text>
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
		</xsl:for-each>
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
					<td class="value">
						<xsl:value-of select="$data" disable-output-escaping="yes"/>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description" disable-output-escaping="yes"/><sup><xsl:value-of select="$supIndexDescr"/></sup>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template match="*" mode="organization">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<!--xsl:text> </xsl:text>
		<xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="RUScat_ru:PersonId"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="details" select="RUScat_ru:CommunicationDetails"/>
		<xsl:text> </xsl:text-->
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text> адрес(а): </xsl:text>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="." mode="address"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text><br/>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<!--xsl:if test="adt_cat:FactAddress">
			<xsl:text> факт. адрес: </xsl:text>
			<xsl:apply-templates select="adt_cat:FactAddress" mode="address"/>
		</xsl:if-->
	</xsl:template>
	<xsl:template mode="details" match="*">
		<xsl:if test="cat_ru:Phone">
			<xsl:text> т.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:text> факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:text> телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:text> e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="identity" match="*">
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
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<!--xsl:if test="cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if-->
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:for-each select="RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="atti:EnsuringDoc">
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
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
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
				<xsl:text>"</xsl:text>
				<u>&#160;
				<xsl:value-of select="substring($dateIn,9,2)"/>
				&#160;</u>
				<xsl:text>"&#160;</xsl:text>
				<u>&#160;
				<xsl:call-template name="month"><xsl:with-param name="number" select="substring($dateIn,6,2)"/></xsl:call-template> 
				&#160;</u>
				<xsl:text>&#160;</xsl:text>
				<xsl:value-of select="substring($dateIn,1,2)"/>
				<u>
					<xsl:value-of select="substring($dateIn, 3, 2)"/>
				</u>
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
