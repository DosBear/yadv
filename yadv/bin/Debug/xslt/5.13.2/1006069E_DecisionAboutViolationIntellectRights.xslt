<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:davir="urn:customs.ru:Information:DecisionAboutViolationIntellectRights:5.13.1">
	<!-- Шаблон для типа DecisionAboutViolationIntellectRightsType -->
	<xsl:template match="davir:DecisionAboutViolationIntellectRights">
			<html>
				<head>
					<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
					<style>
										body {
										background: #cccccc;
										}
	
										div
										{
										/*white-space: nowrap;*/
										}
	
										div.page {
										width: 190mm;
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
									</style>
				</head>
				<body>
					<div class="page">
						<table class="w190">
							<tbody>
								<tr>
									<td align="center" class="graphMain">
										<font size="4">
											<b>Информация о товарах с признаками возможного нарушении прав интеллектуальной собственности и принятом решении относительно приостановлении их выпуска</b>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<xsl:apply-templates select="davir:Decision"/>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td class="annot graphMain" width="50%">Регистрационный номер ДТ</td>
									<td class="value graphMain" width="50%">
										<xsl:apply-templates select="davir:NumberDT"/>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<xsl:apply-templates select="davir:Declarant"/>
						<br/>
						<xsl:apply-templates select="davir:IPOOwner"/>
						<br/>
						<table>
							<tbody>
								<tr>
									<td colspan="7"><b>Товары с признаками нарушения прав интеллектуальной собственности</b></td>
								</tr>
								<tr align="center" valign="top">
									<td class="graphMain bordered">Ответ правообладателя</td>
									<td class="graphMain bordered">Номер товара</td>
									<td class="graphMain bordered">Код под ТН ВЭД ЕАЭС</td>
									<td class="graphMain bordered">Признак</td>
									<td class="graphMain bordered">Наименование</td>
									<td class="graphMain bordered">Признаки нарушения прав ИС</td>
									<td class="graphMain bordered">Срок продления приостановления выпуска товаров (раб.дн.)</td>
								</tr>
								<xsl:for-each select="davir:GoodsWithSignOfViolation">
									<tr valign="top">
										<td class="graphMain bordered">
											<xsl:if test="davir:DecisionCode='1'">Решение о приостановлении выпуска товаров, содержащих ОИС</xsl:if>
											<xsl:if test="davir:DecisionCode='2'">Отмена Решения о приостановлении выпуска товаров, содержащих ОИС</xsl:if>
										</td>
										<td class="graphMain bordered"><xsl:value-of select="davir:GoodsNumeric"/></td>
										<td class="graphMain bordered"><xsl:value-of select="davir:GoodsTNVEDCode"/></td>
										<td class="graphMain bordered"><xsl:value-of select="davir:IntellectPropertySign"/></td>
										<td class="graphMain bordered">
											<xsl:for-each select="davir:GoodsDescription">
												<xsl:value-of select="."/>
											</xsl:for-each>
										</td>
										<td class="graphMain bordered">
												<xsl:apply-templates select="davir:SignOfViolation"/>
										</td>
										<td class="graphMain bordered" align="center">
											<xsl:value-of select="davir:Period"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<!--xsl:if test="davir:DocumentsList">
							<br/>
							<table>
								<tbody>
									<tr>
										<td><b>Перечень приложеных документов</b></td>
									</tr>
									<xsl:for-each select="davir:DocumentsList">
										<tr>
											<td>
												<xsl:apply-templates mode="document" select="."/>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if-->
					</div>
				</body>
			</html>
		</xsl:template>
	<!-- Признаки нарушения ИС -->
	<xsl:template match="davir:SignOfViolation">
		<xsl:text>Объект ИС: </xsl:text>
		<xsl:for-each select="davir:IPOinfo//*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
		<xsl:if test="davir:LegalProductDescription">
			<br/>
			<xsl:text>Внешний вид: </xsl:text>
			<xsl:value-of select="davir:LegalProductDescription"/>
		</xsl:if>
		<xsl:if test="davir:LegalProductDescription">
			<br/>
			<xsl:text>Внешний вид (контрафакт): </xsl:text>
			<xsl:value-of select="davir:BogusProductDescription"/>
		</xsl:if>
		<xsl:if test="davir:Place">
			<br/>
			<xsl:for-each select="davir:Place">
				<xsl:choose>
					<xsl:when test="davir:CodePlace='01'">Место ввоза легальной продукции</xsl:when>
					<xsl:when test="davir:CodePlace='02'">Место таможенного оформления легальной продукции</xsl:when>
					<xsl:when test="davir:CodePlace='03'">Место ввоза товаров, обладающих признаками контрафактных</xsl:when>
					<xsl:when test="davir:CodePlace='04'">Место место ввоза товаров, обладающих признаками контрафактных</xsl:when>
				</xsl:choose>
				<xsl:text>: </xsl:text>
				<xsl:value-of select="davir:Name"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="davir:Description"/>
				<xsl:if test="position()!=last()"><br/></xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="davir:CountryInfo">
			<br/>
			<xsl:for-each select="davir:CountryInfo">
				<xsl:choose>
					<xsl:when test="davir:Priznac='01'">Страна отправления легальной продукции</xsl:when>
					<xsl:when test="davir:Priznac='02'">Cтрана происхождения легальной продукции</xsl:when>
					<xsl:when test="davir:Priznac='03'">Cтрана отправления предположительно контрафактной продукции</xsl:when>
					<xsl:when test="davir:Priznac='04'">Cтрана происхождения предположительно контрафактной продукции</xsl:when>
				</xsl:choose>
				<xsl:text>: </xsl:text>
				<xsl:value-of select="davir:CountryName"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="davir:CountryCode"/>
				<xsl:if test="position()!=last()"><br/></xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="davir:OtherNote">
			<br/>
			Замечания: <xsl:apply-templates select="davir:OtherNote"/>
		</xsl:if>
		<xsl:if test="position()!=last()"><br/><br/></xsl:if>
	</xsl:template>
	<!-- Информация о декларанте/правообладателе -->
	<xsl:template match="davir:Declarant|davir:IPOOwner">
		<table>
			<tbody>
				<tr>
					<td colspan="2" class="graphMain">
						<b>Информация о 
						<xsl:if test="local-name(.)='Declarant'">декларанте</xsl:if>
						<xsl:if test="local-name(.)='IPOOwner'">правообладателе</xsl:if>
						</b>
					</td>
				</tr>
				<tr>
					<td class="annot graphMain" width="50%">Наименование</td>
					<td class="value graphMain" width="50%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
						<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
							<xsl:value-of select="cat_ru:ShortName"/>
						</xsl:if>
					</td>
				</tr>
				<xsl:for-each select="cat_ru:RFOrganizationFeatures">
					<xsl:if test="cat_ru:OGRN">
						<tr>
							<td class="annot graphMain">ОГРН</td>
							<td class="value graphMain"><xsl:value-of select="cat_ru:OGRN"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="cat_ru:INN">
						<tr>
							<td class="annot graphMain">ИНН</td>
							<td class="value graphMain"><xsl:value-of select="cat_ru:INN"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="cat_ru:KPP">
						<tr>
							<td class="annot graphMain">КПП</td>
							<td class="value graphMain"><xsl:value-of select="cat_ru:KPP"/></td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="cat_ru:Address">
					<tr>
						<td class="annot graphMain">Адрес</td>
						<td class="value graphMain"><xsl:apply-templates select="cat_ru:Address"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="cat_ru:IdentityCard">
					<tr>
						<td class="annot graphMain">Документ, удостоверящий личность</td>
						<td class="value graphMain"><xsl:apply-templates select="cat_ru:IdentityCard"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="cat_ru:Contact">
					<tr>
						<td class="annot graphMain">Контакты</td>
						<td class="value graphMain"><xsl:apply-templates select="cat_ru:Contact"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="davir:PersonID">
					<tr>
						<td class="annot graphMain">Идентификатор заявителя/правообладателя</td>
						<td class="value graphMain">
							<xsl:value-of select="davir:PersonID"/>
						</td>
					</tr>
				</xsl:if>
				<!--xsl:if test="davir:BirthDate">
					<tr>
						<td class="annot graphMain">Дата рождения</td>
						<td class="value graphMain">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="davir:BirthDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="davir:BirthPlace">
					<tr>
						<td class="annot graphMain">Место рождения</td>
						<td class="value graphMain"><xsl:value-of select="davir:BirthPlace"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="davir:PersonPostalAddress">
					<tr>
						<td class="annot graphMain">Почтовый адрес</td>
						<td class="value graphMain"><xsl:apply-templates select="davir:PersonPostalAddress"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="davir:Phone">
					<tr>
						<td class="annot graphMain">Телефон</td>
						<td class="value graphMain"><xsl:value-of select="davir:Phone"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="davir:Email">
					<tr>
						<td class="annot graphMain">Электронная почта</td>
						<td class="value graphMain"><xsl:value-of select="davir:Email"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="davir:Fax">
					<tr>
						<td class="annot graphMain">Факс</td>
						<td class="value graphMain"><xsl:value-of select="davir:Fax"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="davir:RightHolderLegal">
					<tr>
						<td class="annot graphMain" colspan="2"><i>Сведения о юридическом лице</i></td>
					</tr>
					<tr>
						<td class="annot graphMain">Дата постановки на учет</td>
						<td class="value graphMain">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="davir:INNCertificateDate"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr>
						<td class="annot graphMain">Номер государственной регистрации</td>
						<td class="value graphMain"><xsl:value-of select="davir:RegistrationNumber"/></td>
					</tr>
					<tr>
						<td class="annot graphMain">Дата государственной регистрации</td>
						<td class="value graphMain">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="davir:RegistrationDate"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr>
						<td class="annot graphMain">Юридический адрес</td>
						<td class="value graphMain"><xsl:apply-templates select="davir:LegalLocation"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="davir:RightHolderForeignLegal">
					<tr>
						<td class="annot graphMain" colspan="2"><i>Сведения об иностранном юридическом лице</i></td>
					</tr>
					<tr>
						<td class="annot graphMain">Полное наименование на иностранном языке</td>
						<td class="value graphMain"><xsl:value-of select="davir:FullNameForeign"/></td>
					</tr>
					<tr>
						<td class="annot graphMain">Сокращенное наименование на иностранном языке</td>
						<td class="value graphMain"><xsl:value-of select="davir:ShortNameForeign"/></td>
					</tr>
					<tr>
						<td class="annot graphMain">Организационно-правовая форма</td>
						<td class="value graphMain"><xsl:value-of select="davir:OPFRus"/></td>
					</tr>
					<tr>
						<td class="annot graphMain">Организационно-правовая форма (в латинской транскрипции)</td>
						<td class="value graphMain"><xsl:value-of select="davir:OPFForeign"/></td>
					</tr>
					<tr>
						<td class="annot graphMain">Наименование органа, зарегистрировавшего организацию</td>
						<td class="value graphMain"><xsl:value-of select="davir:RegistrationOrganName"/></td>
					</tr>
					<tr>
						<td class="annot graphMain">Номер документа регистрации</td>
						<td class="value graphMain"><xsl:value-of select="davir:RegistrationDocumentNumber"/></td>
					</tr>
					<tr>
						<td class="annot graphMain">Дата регистрации</td>
						<td class="value graphMain">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="davir:RegistrationDate"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr>
						<td class="annot graphMain">Место регистрации</td>
						<td class="value graphMain"><xsl:value-of select="davir:RegistrationPlace"/></td>
					</tr>
					<tr>
						<td class="annot graphMain">Полный адрес организации (на иностранном языке)</td>
						<td class="value graphMain"><xsl:value-of select="davir:FullAddressForeign"/></td>
					</tr>
				</xsl:if-->
			</tbody>
		</table>
	</xsl:template>
	<!-- Контакты -->
	<xsl:template match="cat_ru:Contact">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><br/></xsl:if>
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
	<!-- Адрес -->
	<xsl:template match="cat_ru:Address|davir:PersonPostalAddress|davir:LegalLocation">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Ответ -->
	<xsl:template match="davir:Decision">
		<tr>
			<td class="annot graphMain" width="50%">Ответ</td>
			<td class="value grapnMain" width="50%">
				<xsl:choose>
					<xsl:when test="davir:DecisionCode='1'">Решение о приостановлении выпуска товаров, содержащих ОИС</xsl:when>
					<xsl:when test="davir:DecisionCode='2'">Отмена Решения о приостановлении выпуска товаров, содержащих ОИС</xsl:when>
					<xsl:when test="davir:DecisionCode='3'">Решение о продлении срока приостановления выпуска товаров, содержащих ОИС</xsl:when>
					<xsl:when test="davir:DecisionCode='*'">Разные по товарам</xsl:when>
				</xsl:choose>
			</td>
		</tr>
		<xsl:if test="davir:DecisionNumber">
			<tr>
				<td class="annot graphMain">Номер и дата решения таможенного органа, на которое отвечает правообладатель</td>
				<td class="value grapnMain">
					<xsl:apply-templates mode="document" select="davir:DecisionNumber"/>
				</td>
			</tr>
		</xsl:if>
		<tr>
			<td class="annot graphMain">Таможенный орган, принявший решение</td>
			<td class="value grapnMain">
				<xsl:apply-templates select="davir:Customs"/>
			</td>
		</tr>
		<tr>
			<td class="annot graphMain">Должностное лицо таможенного органа, принявшего решение</td>
			<td class="value grapnMain">
				<xsl:apply-templates select="davir:CustomsPerson"/>
			</td>
		</tr>
		<xsl:if test="davir:Foundation">
			<tr>
				<td class="annot graphMain">Обоснование принятого решения</td>
				<td class="value grapnMain">
					<xsl:apply-templates select="davir:Foundation"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="davir:OwnerDocument">
			<tr>
				<td class="annot graphMain">Сведения о документе правообладателя, если решение принято в ответ на обращение правообладателя</td>
				<td class="value grapnMain">
					<xsl:apply-templates select="davir:OwnerDocument" mode="document"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="davir:PreviousDecision">
			<tr>
				<td class="annot graphMain">Информация о предшествующем решении</td>
				<td class="value grapnMain">
					<xsl:apply-templates select="davir:PreviousDecision" mode="document"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	<!--Таможенный орган, принявыший решение -->
	<xsl:template match="davir:Customs|davir:CustomsPerson">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- номер ДТ -->
	<xsl:template match="davir:NumberDT">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="DTdate"><xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/></xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- документ (название, номер, дата) -->
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
		<xsl:if test="davir:ObjectRegNumber">
			<br/>
			регистрационный номер объекта: <xsl:value-of select="davir:ObjectRegNumber"/>
		</xsl:if>
		<xsl:if test="davir:EmissionStoppingNotificationNumber">
			<br/>
			номер уведомления о принятии мер: <xsl:value-of select="davir:EmissionStoppingNotificationNumber"/>
		</xsl:if>
		<xsl:if test="davir:EmissionStoppingNotificationDate">
			<br/>
			дата уведомления о принятии мер: <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="davir:EmissionStoppingNotificationDate"/></xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="DTdate">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,1,4)"/>
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
