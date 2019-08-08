<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:aoir="urn:customs.ru:Information:AnswerOwnerIntellectRights:5.11.0">
	<!-- Шаблон для типа AnswerOwnerIntellectRightsType -->
	<xsl:template match="aoir:AnswerOwnerIntellectRights">
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
										<b>
											<xsl:choose>
												<xsl:when test="aoir:Answer/aoir:AnswerCode='0'">Ответ правообладателя о том, что правообладатель не имеет отношения к декларируемым товарам</xsl:when>
												<xsl:when test="aoir:Answer/aoir:AnswerCode='1'">Разовое разрешение от правообладателя (его представителя) на ввоз/вывоз товаров</xsl:when>
												<xsl:when test="aoir:Answer/aoir:AnswerCode='2'">Уведомление о необходимости принятия мер по защите прав на ОИС</xsl:when>
												<xsl:when test="aoir:Answer/aoir:AnswerCode='3'">Запрос о продлении срока приостановления выпуска товаров, содержащих ОИС</xsl:when>
												<xsl:otherwise>Ответ правообладателя о действиях в отношении товаров с признаками возможного нарушении прав интеллектуальной собственности</xsl:otherwise>
											</xsl:choose>
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<xsl:apply-templates select="aoir:Answer"/>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td class="annot graphMain" width="50%">Регистрационный номер ДТ</td>
								<td class="value graphMain" width="50%">
									<xsl:apply-templates select="aoir:NumberDT"/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:apply-templates select="aoir:IPOOwner"/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td colspan="7"><b>Товары с признаками нарушения прав интеллектуальной собственности</b></td>
							</tr>
							<tr>
								<td class="graphMain bordered">Ответ правообладателя</td>
								<td class="graphMain bordered">Номер товара</td>
								<td class="graphMain bordered">Код под ТН ВЭД ЕАЭС</td>
								<td class="graphMain bordered">Признак</td>
								<td class="graphMain bordered">Наименование</td>
								<td class="graphMain bordered">Информация</td>
								<td class="graphMain bordered">Запра- шиваемый срок продления, в днях</td>
								<td class="graphMain bordered">Замечания</td>
							</tr>
							<xsl:for-each select="aoir:GoodsWithSignOfViolation">
								<tr>
									<td class="graphMain bordered">
										<xsl:for-each select="aoir:AnswerCode">
											<xsl:choose>
												<xsl:when test="aoir:AnswerCode='0'">Правообладатель не имеет отношения к декларируемым товарам</xsl:when>
												<xsl:when test="aoir:AnswerCode='1'">Разовое разрешение от правообладателя (его представителя) на ввоз/вывоз товаров</xsl:when>
												<xsl:when test="aoir:AnswerCode='2'">Уведомление о необходимости принятия мер по защите прав на ОИС</xsl:when>
												<xsl:when test="aoir:AnswerCode='3'">Запрос о продлении срока приостановления выпуска товаров, содержащих ОИС</xsl:when>
												<xsl:when test="aoir:AnswerCode='*'">Разные по товарам</xsl:when>
											</xsl:choose>
											<xsl:if test="aoir:AnswerNumber">
												<br/>
												<xsl:apply-templates mode="document" select="aoir:AnswerNumber"/>
											</xsl:if>
											<xsl:if test="aoir:DecisionNumber">
												<br/>
												<xsl:apply-templates mode="document" select="aoir:DecisionNumber"/>
											</xsl:if>
										</xsl:for-each>
									</td>
									<td class="graphMain bordered"><xsl:value-of select="aoir:GoodsNumeric"/></td>
									<td class="graphMain bordered"><xsl:value-of select="aoir:GoodsTNVEDCode"/></td>
									<td class="graphMain bordered"><xsl:value-of select="aoir:IntellectPropertySign"/></td>
									<td class="graphMain bordered">
										<xsl:for-each select="aoir:GoodsDescription">
											<xsl:value-of select="."/>
										</xsl:for-each>
									</td>
									<td class="graphMain bordered">
										<xsl:for-each select="aoir:IPOinfo/*">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
									</td>
									<td class="graphMain bordered"><xsl:value-of select="aoir:Period"/></td>
									<td class="graphMain bordered"><xsl:value-of select="aoir:Notes"/></td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:if test="aoir:DocumentsList">
						<br/>
						<table>
							<tbody>
								<tr>
									<td><b>Перечень приложеных документов</b></td>
								</tr>
								<xsl:for-each select="aoir:DocumentsList">
									<tr>
										<td>
											<xsl:apply-templates mode="document" select="."/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Информация о правообладателе -->
	<xsl:template match="aoir:IPOOwner">
		<table>
			<tbody>
				<tr>
					<td colspan="2" class="graphMain"><b>Информация о правообладателе</b></td>
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
				<tr>
					<td class="annot graphMain">Тип заявителя/правообладателя</td>
					<td class="value graphMain">
						<xsl:choose>
							<xsl:when test="aoir:PersonType='01'">ФЛ</xsl:when>
							<xsl:when test="aoir:PersonType='02'">ЮЛ</xsl:when>
							<xsl:when test="aoir:PersonType='03'">ТП</xsl:when>
							<xsl:when test="aoir:PersonType='04'">ИГ</xsl:when>
							<xsl:when test="aoir:PersonType='05'">ИЮЛ</xsl:when>
						</xsl:choose>
					</td>
				</tr>
				<tr>
					<td class="annot graphMain">Идентификатор заявителя/правообладателя</td>
					<td class="value graphMain">
						<xsl:value-of select="aoir:PersonID"/>
					</td>
				</tr>
				<xsl:if test="aoir:BirthDate">
					<tr>
						<td class="annot graphMain">Дата рождения</td>
						<td class="value graphMain">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="aoir:BirthDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="aoir:BirthPlace">
					<tr>
						<td class="annot graphMain">Место рождения</td>
						<td class="value graphMain"><xsl:value-of select="aoir:BirthPlace"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="aoir:PersonPostalAddress">
					<tr>
						<td class="annot graphMain">Почтовый адрес</td>
						<td class="value graphMain"><xsl:apply-templates select="aoir:PersonPostalAddress"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="aoir:Phone">
					<tr>
						<td class="annot graphMain">Телефон</td>
						<td class="value graphMain"><xsl:value-of select="aoir:Phone"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="aoir:Email">
					<tr>
						<td class="annot graphMain">Электронная почта</td>
						<td class="value graphMain"><xsl:value-of select="aoir:Email"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="aoir:Fax">
					<tr>
						<td class="annot graphMain">Факс</td>
						<td class="value graphMain"><xsl:value-of select="aoir:Fax"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="aoir:RightHolderLegal">
					<tr>
						<td class="annot graphMain" colspan="2"><i>Сведения о юридическом лице</i></td>
					</tr>
					<tr>
						<td class="annot graphMain">Дата постановки на учет</td>
						<td class="value graphMain">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="aoir:INNCertificateDate"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr>
						<td class="annot graphMain">Номер государственной регистрации</td>
						<td class="value graphMain"><xsl:value-of select="aoir:RegistrationNumber"/></td>
					</tr>
					<tr>
						<td class="annot graphMain">Дата государственной регистрации</td>
						<td class="value graphMain">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="aoir:RegistrationDate"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr>
						<td class="annot graphMain">Юридический адрес</td>
						<td class="value graphMain"><xsl:apply-templates select="aoir:LegalLocation"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="aoir:RightHolderForeignLegal">
					<tr>
						<td class="annot graphMain" colspan="2"><i>Сведения об иностранном юридическом лице</i></td>
					</tr>
					<tr>
						<td class="annot graphMain">Полное наименование на иностранном языке</td>
						<td class="value graphMain"><xsl:value-of select="aoir:FullNameForeign"/></td>
					</tr>
					<tr>
						<td class="annot graphMain">Сокращенное наименование на иностранном языке</td>
						<td class="value graphMain"><xsl:value-of select="aoir:ShortNameForeign"/></td>
					</tr>
					<tr>
						<td class="annot graphMain">Организационно-правовая форма</td>
						<td class="value graphMain"><xsl:value-of select="aoir:OPFRus"/></td>
					</tr>
					<tr>
						<td class="annot graphMain">Организационно-правовая форма (в латинской транскрипции)</td>
						<td class="value graphMain"><xsl:value-of select="aoir:OPFForeign"/></td>
					</tr>
					<tr>
						<td class="annot graphMain">Наименование органа, зарегистрировавшего организацию</td>
						<td class="value graphMain"><xsl:value-of select="aoir:RegistrationOrganName"/></td>
					</tr>
					<tr>
						<td class="annot graphMain">Номер документа регистрации</td>
						<td class="value graphMain"><xsl:value-of select="aoir:RegistrationDocumentNumber"/></td>
					</tr>
					<tr>
						<td class="annot graphMain">Дата регистрации</td>
						<td class="value graphMain">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="aoir:RegistrationDate"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr>
						<td class="annot graphMain">Место регистрации</td>
						<td class="value graphMain"><xsl:value-of select="aoir:RegistrationPlace"/></td>
					</tr>
					<tr>
						<td class="annot graphMain">Полный адрес организации (на иностранном языке)</td>
						<td class="value graphMain"><xsl:value-of select="aoir:FullAddressForeign"/></td>
					</tr>
				</xsl:if>
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
	<xsl:template match="cat_ru:Address|aoir:PersonPostalAddress|aoir:LegalLocation">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Ответ -->
	<xsl:template match="aoir:Answer">
		<!--tr>
			<td class="annot graphMain" width="50%">Ответ</td>
			<td class="value grapnMain" width="50%">
				<xsl:choose>
					<xsl:when test="aoir:AnswerCode='0'">Правообладатель не имеет отношения к декларируемым товарам</xsl:when>
					<xsl:when test="aoir:AnswerCode='1'">Разовое разрешение от правообладателя (его представителя) на ввоз/вывоз товаров</xsl:when>
					<xsl:when test="aoir:AnswerCode='2'">Уведомление о необходимости принятия мер по защите прав на ОИС</xsl:when>
					<xsl:when test="aoir:AnswerCode='3'">Запрос о продлении срока приостановления выпуска товаров, содержащих ОИС</xsl:when>
					<xsl:when test="aoir:AnswerCode='*'">Разные по товарам</xsl:when>
				</xsl:choose>
			</td>
		</tr-->
		<xsl:if test="aoir:AnswerNumber">
			<tr>
				<td class="annot graphMain" width="50%">Номер и дата ответа правообладателя</td>
				<td class="value grapnMain" width="50%">
					<xsl:apply-templates mode="document" select="aoir:AnswerNumber"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="aoir:DecisionNumber">
			<tr>
				<td class="annot graphMain" width="50%">Номер и дата решения таможенного органа, на которое отвечает правообладатель</td>
				<td class="value grapnMain" width="50%">
					<xsl:apply-templates mode="document" select="aoir:DecisionNumber"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	<!-- номер ДТ -->
	<xsl:template match="aoir:NumberDT">
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
		<xsl:text>, код документа: </xsl:text><xsl:value-of select="aoir:DocCode"/>
		<xsl:if test="aoir:Reason">
			<xsl:text>, причина непредоставления: </xsl:text>
			<xsl:value-of select="aoir:Reason"/>
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
