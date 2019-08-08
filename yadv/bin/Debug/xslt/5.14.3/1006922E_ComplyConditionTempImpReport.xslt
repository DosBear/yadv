<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cctir="urn:customs.ru:Information:CustomsAuditDocuments:ComplyConditionTempImpReport:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
	<!-- Шаблон для типа ComplyConditionTempImpReportType -->
	<xsl:template match="cctir:ComplyConditionTempImpReport">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					font-family: Arial;
					}

					div.page {
					/*width: 297mm;
					max-width: 297mm;*/
					width: 100%;
					max-width: 100%;
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
					.bordered { 
						border-collapse: collapse;
						font-size: 9pt;
					}
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
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										Отчет о соблюдении условий использования товаров в соответствии с таможенной процедуруой временного ввоза (допуска),<br/>
										установленных пунктом 2 статьи 220 Таможенного кодекса Евразийского экономического союза, лицами, пользующимися и (или) владеющими<br/>
										товарами, помещенными под таможенную процедуру временного допуска
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:call-template name="inlinetable">
						<xsl:with-param name="data">
							<xsl:apply-templates mode="organization" select="cctir:Organization"/>
						</xsl:with-param>
						<xsl:with-param name="data_align" select="'center'"/>
						<xsl:with-param name="description" select="'(наименование лица, представившего отчетность, ИНН, КПП, фактический адрес местонахождения лица)'"/>
						<xsl:with-param name="width" select="'100%'"/>
					</xsl:call-template>
					<br/><br/>
					<table>
						<tbody>
							<tr align="center">
								<td>представляется за <span class="underlined">&#160;&#160;<xsl:value-of select="cctir:Quarter"/>&#160;&#160;</span> отчетный квартал</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered" rowspan="2">№ п/п</td>
								<td class="bordered" rowspan="2">Регистрационный номер декларации на товары / перечня товаров</td>
								<td class="bordered" rowspan="2">Код товара в соответствии с ТН ВЭД ЕАЭС</td>
								<td class="bordered" rowspan="2">Наименование товара / номер товара в ДТ</td>
								<td class="bordered" rowspan="2">Кол-во товара (ед. изм.)</td>
								<td class="bordered" rowspan="2">Сведения об операциях, совершенных с временно ввезенными товарами</td>
								<td class="bordered" rowspan="2">Сведения о передаче временно ввезенных товаров во владение и пользование иным лицам</td>
								<td class="bordered" rowspan="2">Сведения об использовании временно ввезенных товаров</td>
								<td class="bordered" colspan="5">Сведения о завершении таможенной процедуры временного ввоза (допуска)</td>
								<td class="bordered" rowspan="2">Сведения о приостановлении/ возобновлении действия таможенной процедуры временного ввоза (допуска)</td>
								<td class="bordered" rowspan="2">Примечания</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered">код таможенной процедуры</td>
								<td class="bordered">количество товара (единицы измерения)</td>
								<td class="bordered">код товара в соответствии с ТН ВЭД ЕАЭС</td>
								<td class="bordered">регистрационный номер декларации на товары, на основании которой таможенная процедура завершена</td>
								<td class="bordered">иные способы</td>
							</tr>
							<tr align="center">
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<td class="bordered">3</td>
								<td class="bordered">4</td>
								<td class="bordered">5</td>
								<td class="bordered">6</td>
								<td class="bordered">7</td>
								<td class="bordered">8</td>
								<td class="bordered">9</td>
								<td class="bordered">10</td>
								<td class="bordered">11</td>
								<td class="bordered">12</td>
								<td class="bordered">13</td>
								<td class="bordered">14</td>
								<td class="bordered">15</td>
							</tr>
							<xsl:for-each select="cctir:GoodsList">
								<tr align="center" valign="top">
									<td class="bordered">
										<xsl:value-of select="cctir:StringNumber"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="cctir:DTNumber"/>
									</td>
									<td class="bordered">
										<xsl:value-of select="cctir:TNVEDCode"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="cctir:GoodsDescription"/>
										<xsl:if test="cctir:Number">
											<xsl:text> / </xsl:text>
											<xsl:value-of select="cctir:Number"/>
										</xsl:if>
									</td>
									<td class="bordered">
										<xsl:apply-templates mode="quantity" select="cctir:GoodsQuantity"/>
										<xsl:if test="cctir:SupplementaryQuantity">
											<br/>
											<xsl:text>ДЕИ:</xsl:text><br/>
											<xsl:for-each select="cctir:SupplementaryQuantity">
												<xsl:apply-templates mode="quantity" select="."/>
												<xsl:if test="position()!=last()"><br/></xsl:if>
											</xsl:for-each>
										</xsl:if>
									</td>
									<td class="bordered" align="left">
										<xsl:for-each select="cctir:GoodsTransactions">
											<xsl:choose>
												<xsl:when test="cctir:TransactionKind=1">Сведения об операцииях, совершенных для обеспечения сохранности временно ввезенных товаров, включая ремонт (за исключением капитального ремонта, модернизации), техническое обслуживание и другие операции, необходимые для поддержания товаров в нормальном состоянии; </xsl:when>
												<xsl:when test="cctir:TransactionKind=2">Сведения о проведенных испытаниях, исследованиях, тестированиях, проверках, опытах или экспериментах с временно ввезенными товарами либо об использовании временно ввезенных товаров в ходе испытаний, исследований, тестирования, проверки, проведения опытов или экспериментов; </xsl:when>
												<xsl:when test="cctir:TransactionKind=3">Сведения об операциях, предусмотренные пунктами 1,2 и 4 статьи 277 ТК ЕАЭС (если таковые совершались); </xsl:when>
											</xsl:choose>
											<xsl:if test="not(cctir:Transactions/cctir:EndDate)">
												<xsl:text>осуществляются ремонтные операции с </xsl:text>
											</xsl:if>
											<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cctir:Transactions/cctir:BeginDate"/></xsl:call-template>
											<xsl:if test="cctir:Transactions/cctir:EndDate">
												<xsl:text>/</xsl:text>
											</xsl:if>
											<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cctir:Transactions/cctir:EndDate"/></xsl:call-template>
											<xsl:text> Описание: </xsl:text>
											<xsl:apply-templates select="cctir:Description"/>
											<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:choose>
											<xsl:when test="cctir:Transfers/cctir:TransferKind=1">Передача товаров без разрешения таможенного органа
												<br/>
												<xsl:apply-templates mode="organization" select="cctir:Transfers/cctir:GoodsUser/cctir:User"/>
												<br/>
												<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cctir:Transfers/cctir:GoodsUser/cctir:Date"/></xsl:call-template>
											</xsl:when>
											<xsl:when test="cctir:Transfers/cctir:TransferKind=2">Передача товаров с разрешения таможенного органа
												<br/>
												<xsl:apply-templates select="cctir:CustomsDocument" mode="document"/>
											</xsl:when>
										</xsl:choose>
										
									</td>
									<td class="bordered">
										<xsl:choose>
											<xsl:when test="cctir:GoodsCondition/cctir:ConditionKind=1">
												Товары находятся в неизменном состоянии
											</xsl:when>
											<xsl:when test="cctir:GoodsCondition/cctir:ConditionKind=2">
												<xsl:apply-templates mode="document" select="cctir:GoodsCondition/cctir:Notification"/>
											</xsl:when>
											<xsl:when test="cctir:GoodsCondition/cctir:ConditionKind=3">
												<xsl:apply-templates mode="address" select="cctir:GoodsCondition/cctir:LocationGoods/cctir:Location"/>
												<xsl:if test="cctir:GoodsCondition/cctir:LocationGoods/cctir:InfoAboutUsing">
													<xsl:text> Сведения: </xsl:text>
													<xsl:apply-templates select="cctir:GoodsCondition/cctir:LocationGoods/cctir:InfoAboutUsing"/>
												</xsl:if>
											</xsl:when>
											<xsl:when test="cctir:GoodsCondition/cctir:ConditionKind=4">
												<xsl:value-of select="cctir:GoodsCondition/cctir:GoodsUser/cctir:User/cat_ru:OrganizationName"/>
												<br/>
												<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cctir:GoodsCondition/cctir:GoodsUser/cctir:Date"/></xsl:call-template>
											</xsl:when>
										</xsl:choose>
									</td>
									<td class="bordered">
										<xsl:value-of select="cctir:CompletionProcedure/cctir:CustomsModeCode"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates mode="quantity" select="cctir:CompletionProcedure/cctir:Quantity"/>
										<xsl:for-each select="cctir:CompletionProcedure/cctir:SupplemenaryQuantity">
											<br/>
											<xsl:apply-templates mode="quantity" select="."/>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:value-of select="cctir:CompletionProcedure/cctir:TNVEDCode"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="cctir:CompletionProcedure/cctir:DTNumber"/>
									</td>
									<td class="bordered">
										<xsl:choose>
											<xsl:when test="cctir:CompletionProcedure/cctir:CompletionWay/cctir:ComplitionKind=1">
												<xsl:text>Товары помещены под таможенную процедуру реэкспорта</xsl:text>
											</xsl:when>
											<xsl:when test="cctir:CompletionProcedure/cctir:CompletionWay/cctir:ComplitionKind=2">
												<xsl:apply-templates select="cctir:CompletionProcedure/cctir:CompletionWay/cctir:Information"/>
											</xsl:when>
											<xsl:when test="cctir:CompletionProcedure/cctir:CompletionWay/cctir:ComplitionKind=3">
												<xsl:apply-templates select="cctir:CompletionProcedure/cctir:CompletionWay/cctir:Information"/>
											</xsl:when>
											<xsl:when test="cctir:CompletionProcedure/cctir:CompletionWay/cctir:ComplitionKind=4">
												<xsl:value-of select="cctir:CompletionProcedure/cctir:CompletionWay/cctir:CustomsModeCode"/>
											</xsl:when>
										</xsl:choose>
									</td>
									<td class="bordered">
										<xsl:choose>
											<xsl:when test="cctir:ProcedureCondition/cctir:ConditionKind=1">
												<xsl:text>Таможенная процедура приостановлена/</xsl:text>
												<xsl:call-template name="condition_date"><xsl:with-param name="dateIn" select="cctir:ProcedureCondition/cctir:Suspension/cctir:Date"/></xsl:call-template>
												<xsl:text>/</xsl:text>
												<xsl:apply-templates select="cctir:ProcedureCondition/cctir:Suspension/cctir:SuspensionDoc/cctir:DTNumber"/>
												<xsl:apply-templates mode="document" select="cctir:ProcedureCondition/cctir:Suspension/cctir:SuspensionDoc/cctir:DocumentNumber"/>
											</xsl:when>
											<xsl:when test="cctir:ProcedureCondition/cctir:ConditionKind=2">
												<xsl:text>Таможенная процедура возобновлена/</xsl:text>
												<xsl:call-template name="condition_date"><xsl:with-param name="dateIn" select="cctir:ProcedureCondition/cctir:Date"/></xsl:call-template>
											</xsl:when>
										</xsl:choose>
									</td>
									<td class="bordered">
										<xsl:if test="cctir:Note/cctir:MarkKind">
											<xsl:text>Таможенная процедура временного ввоза (допуска) завершена/приостановлена </xsl:text>
											<xsl:choose>
												<xsl:when test="cctir:Note/cctir:MarkKind=1">по всем товарам полностью</xsl:when>
												<xsl:when test="cctir:Note/cctir:MarkKind=2">по части товаров</xsl:when>
											</xsl:choose>
											<br/>
										</xsl:if>
										<xsl:apply-templates select="cctir:Note/cctir:Comment"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template mode="document" match="*">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/></xsl:call-template>
		</xsl:if>
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
	
	<xsl:template match="cctir:DTNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>

	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description"/>
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
					<xsl:text>; </xsl:text>
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
		<!--xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if-->
	</xsl:template>
	
	<xsl:template match="*" mode="address">
		<xsl:for-each select="RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
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
	
	<xsl:template name="condition_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
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
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>" </xsl:text>
				<xsl:call-template name="month"><xsl:with-param name="number" select="substring($dateIn,6,2)"/></xsl:call-template> 
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
