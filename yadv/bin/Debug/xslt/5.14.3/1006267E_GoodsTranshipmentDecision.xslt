<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:gtshd="urn:customs.ru:Information:CustomsDocuments:GoodsTranshipmentDecision:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа GoodsTranshipmentDecisionType -->
	<xsl:template match="gtshd:GoodsTranshipmentDecision">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
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
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



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
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<!--b>Решение о выдаче разрешения на совершение грузовых операций и (или) замены транспортных средств / Решение об отказе в выдаче разрешения на совершение грузовых операций и (или) замены транспортных средств / Регистрация уведомления об обстоятельствах, препятствующих исполнению обязанностей перевозчика / Таможенные отметки по обстоятельствам, препятствующим исполнению обязанностей перевозчика</b-->
										<xsl:choose>
											<xsl:when test="gtshd:DocType=0">
												<xsl:text>Решение о выдаче разрешения на совершение грузовых операций и (или) замены транспортных средств</xsl:text>
											</xsl:when>
											<xsl:when test="gtshd:DocType=1">
												<xsl:text>Решение об отказе в выдаче разрешения на совершение грузовых операций и (или) замены транспортных средств</xsl:text>
											</xsl:when>
											<xsl:when test="gtshd:DocType=2">
												<xsl:text>Регистрация уведомления об обстоятельствах</xsl:text>
											</xsl:when>
											<xsl:when test="gtshd:DocType=3">
												<xsl:text>Таможенные отметки по обстоятельствам</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="gtshd:DocType"/>
											</xsl:otherwise>
										</xsl:choose>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Тип документа: 0 - Решение о выдаче разрешения на совершение грузовых операций и (или) замены транспортных средств; 1 - Решение об отказе в выдаче разрешения на совершение грузовых операций и (или) замены транспортных средств; 2 - Регистрация уведомления об обстоятельствах, препятствующих исполнению обязанностей перевозчика; 3 - Таможенные отметки по обстоятельствам, препятствующим исполнению обязанностей перевозчика</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="gtshd:DocType=0">
										<xsl:text>Решение о выдаче разрешения на совершение грузовых операций и (или) замены транспортных средств</xsl:text>
									</xsl:when>
									<xsl:when test="gtshd:DocType=1">
										<xsl:text>Решение об отказе в выдаче разрешения на совершение грузовых операций и (или) замены транспортных средств</xsl:text>
									</xsl:when>
									<xsl:when test="gtshd:DocType=2">
										<xsl:text>Регистрация уведомления об обстоятельствах</xsl:text>
									</xsl:when>
									<xsl:when test="gtshd:DocType=3">
										<xsl:text>Таможенные отметки по обстоятельствам</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="gtshd:DocType"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table-->
					<xsl:if test="gtshd:RegistrationNumber">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Регистрационный номер</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates mode="GTD_num" select="gtshd:RegistrationNumber"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="gtshd:TransportDoc">
						<div class="title marg-top">Регистрационный номер ТД / номер книжкии МДП или карнета АТА</div>
						<div>
							<xsl:apply-templates select="gtshd:TransportDoc">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="gtshd:RegDetails">
						<div class="title marg-top">Сведения о ТО, зарегистрировавшем Заявление / Уведомление</div>
						<div>
							<xsl:apply-templates select="gtshd:RegDetails">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="gtshd:DecisionDetails">
						<div class="title marg-top">Сведения о ТО, принявшем Решение / осуществившем таможенный котроль</div>
						<div>
							<xsl:apply-templates select="gtshd:DecisionDetails">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<br/>
					<xsl:if test="gtshd:DocumentDate">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Дата и время документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="gtshd:DocumentDate"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="gtshd:PeriodArrive">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Срок, до которого на место возникновения обстоятельств, препятствующих исполнению обязанностей перевозчика, прибудет должностное лицо таможенного органа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="gtshd:PeriodArrive"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="gtshd:FailureCause">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Причины отказа</td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="gtshd:FailureCause">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="gtshd:ResultsCustomsControl">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Результаты проведения таможенного контроля</td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="gtshd:ResultsCustomsControl">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="gtshd:Applicant">
						<div class="title marg-top">Сведения о лице, направившем Заявление / Уведомление</div>
						<div>
							<xsl:apply-templates select="gtshd:Applicant">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="gtshd:CarrierEqualFlag">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Признак совпадения сведений о лице, направившем Заявление / Уведомление, со сведениями о лице, осуществляющем перевозку (транспортировку) товаров</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="gtshd:CarrierEqualFlag='true'">
											<xsl:text>есть</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>нет</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="gtshd:Carrier">
						<div class="title marg-top">Сведения о лице, осуществляющем перевозку (транспортировку) товаров</div>
						<div>
							<xsl:apply-templates select="gtshd:Carrier">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="gtshd:NextCarrier">
						<div class="title marg-top">Сведения о лице, которое будет перевозить (транспортировать) товары после осуществления перегрузки (перевалки) товаров</div>
						<div>
							<xsl:apply-templates select="gtshd:NextCarrier">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="gtshd:IncidentInfo">
						<div class="title marg-top">Информация о происшествии (об аварии или действии непреодолимой силы во время перевозки)</div>
						<div>
							<xsl:apply-templates select="gtshd:IncidentInfo">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="gtshd:DetailsCargoOperation">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Cведения о планируемых грузовых операциях и (или) замене транспортных средств с удалением наложенных таможенных пломб и печатей</td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="gtshd:DetailsCargoOperation">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="gtshd:DetailsCargoOperationIfIncident">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Сведения о необходимости (об отсутствии необходимости) разгрузки, перегрузки (перевалки) или совершения иных грузовых операций с товарами, перевозимыми (транспортируемыми) в соответствии с таможенной процедурой таможенного транзита, в случае аварии</td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="gtshd:DetailsCargoOperationIfIncident">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="gtshd:ConditionsCargoOperation">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Условия совершения грузовых операций и (или) замены транспортных средств (при необходимости)</td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="gtshd:ConditionsCargoOperation">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="gtshd:ReloadPlace">
						<div class="title marg-top">Место проведения грузовых и иных операций / Зона таможенного контроля или иного места, в которое необходимо перевезти (транспортировать) товары или обеспечить их перевозку (транспортировку) (в случае, если транспортное средство повреждено)</div>
						<div>
							<xsl:apply-templates select="gtshd:ReloadPlace">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="gtshd:Transport">
						<div class="title marg-top">Сведения о новом составе транспортных средств после проведения грузовых операций</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Номер шасси (VIN)</td>
									<td class="graphMain bordered">Код типа транспортного средства</td>
									<td class="graphMain bordered">Код марки транспортного средства</td>
									<td class="graphMain bordered">Идентификатор. Номер транспортного средства, наименование судна, номер авиарейса, номер поезда, номер железнодорожного вагона (платформ, цистерн и т.п.)</td>
									<td class="graphMain bordered">Буквенный код страны принадлежности транспортного средства по классификатору стран мира</td>
									<td class="graphMain bordered">Идентификатор активного транспортного средства для прицепов, полуприцепов и др. (Резерв)</td>
									<td class="graphMain bordered">Номер свидетельства о регистрации транспортного средства для РБ</td>
									<td class="graphMain bordered">Код вида транспортного средства</td>
								</tr>
								<xsl:for-each select="gtshd:Transport">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="gtshd:Seal">
						<div class="title marg-top">Информация о вновь наложенных пломбах, печатях и иных средствах идентификации</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Номер наложенного средства идентификации</td>
									<td class="graphMain bordered">Вид средств идентификации</td>
									<td class="graphMain bordered">Признак снятия ранее наложенных средств идентификации</td>
									<td class="graphMain bordered">Примечание по средству идентификации</td>
									<td class="graphMain bordered">Количество</td>
								</tr>
								<xsl:for-each select="gtshd:Seal">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="gtshd:CustomsPerson">
						<div class="title marg-top">Сведения о должностном лице таможенного органа, оформившем изменения</div>
						<div>
							<xsl:apply-templates select="gtshd:CustomsPerson">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="gtshd:UIN">
						<div class="title marg-top">УИН описи</div>
						<div>
							<xsl:apply-templates select="gtshd:UIN">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="gtshd:ProvidedDocuments">
						<div class="title marg-top">Перечень документов, предоставленных вместе с обращением</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Наименование документа</td>
									<td class="graphMain bordered">Номер документа</td>
									<td class="graphMain bordered">Дата документа</td>
								</tr>
								<xsl:for-each select="gtshd:ProvidedDocuments">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="gtshd:InformingWay">
						<div class="title marg-top">Предпочтительный способ информирования о результатах рассмотрения Заявления / Уведомления</div>
						<div>
							<xsl:apply-templates select="gtshd:InformingWay">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код объекта в соответсвии со справочником (классификатором) </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:UnifiedCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="RUScat_ru:CodeListId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Обозначение справочника (классификатора), в соответствии с которым указан код</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:CodeListId"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:Phone">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер телефона</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="cat_ru:Phone">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:Fax">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер факса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:Fax"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:Telex">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер телекса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:Telex"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:E_mail">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="cat_ru:E_mail">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="RUScat_ru:IdentityCardCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код вида</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:IdentityCardCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименование</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:IdentityCardName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardSeries">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Серия</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата выдачи</td>
						<td class="value graphMain" style="width:50%">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:OrganizationName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IssuerCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код подразделения органа, выдавшего документ, удостоверяющий личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:IssuerCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:FullIdentityCardName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование вида документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AuthorityId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Строка, идентифицирующая орган государственной власти государства-члена либо уполномоченную им организацию, выдавшую документ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:AuthorityId"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:CountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес</td>
					<td class="value graphMain" style="width:50%">
						<xsl:for-each select="*">
							<xsl:if test="position()!=1">, </xsl:if>
							<xsl:value-of select="."/>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:UITNCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="RUScat_ru:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:CountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CategoryCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KATOCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:RNN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:RNN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:ITNReserv"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:KGINN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="cat_ru:KGINN=ИНН">
									<xsl:text>идентификационный налоговый номер налогоплательщика</xsl:text>
								</xsl:when>
								<xsl:when test="cat_ru:KGINN=ПИН">
									<xsl:text>персональный идентификационный номер</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="cat_ru:KGINN"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:KGOKPO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:KGOKPO"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:UNN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:UNN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:SocialServiceNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceCertificate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:UNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:UNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:RBIdentificationNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:OGRN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OGRN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:INN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:INN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:KPP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">КПП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:KPP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:BIN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:BIN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:IIN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:IIN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ITN">
				<div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
				<div>
					<xsl:apply-templates select="cat_ru:ITN">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="gtshd:AccidentPlace">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес</td>
					<td class="value graphMain" style="width:50%">
						<xsl:for-each select="*">
							<xsl:if test="position()!=1">, </xsl:if>
							<xsl:value-of select="."/>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="gtshd:Address">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес</td>
					<td class="value graphMain" style="width:50%">
						<xsl:for-each select="*">
							<xsl:if test="position()!=1">, </xsl:if>
							<xsl:value-of select="."/>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:SubjectDetailsType -->
	<xsl:template match="gtshd:Applicant">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OrganizationName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ShortName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:ShortName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<!--xsl:if test="cat_ru:OrganizationLanguage">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OrganizationLanguage"/>
						</td>
					</tr>
				</table>
			</xsl:if-->
			<xsl:if test="cat_ru:RFOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
				<div>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RKOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
				<div>
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RBOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
				<div>
					<xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RAOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
				<div>
					<xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:KGOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
				<div>
					<xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryA2Code">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:CountryA2Code"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
				<div class="title marg-top">Кодовое обозначение организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:BusinessEntityTypeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:UITN">
				<div class="title marg-top">Уникальный идентификационный таможенный номер, присвоенный юридическому или физическому лицу</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:UITN">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:PersonId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Уникальный идентификатор физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:PersonId"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCard">
				<div class="title marg-top">Сведения о документе, удостоверяющем личность физического лица</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:IdentityCard">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:SubjectAddressDetails">
				<div class="title marg-top">Адрес(а)</div>
				<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
					<xsl:apply-templates select=".">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="RUScat_ru:CommunicationDetails">
				<div class="title marg-top">Контактный реквизит субъекта</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:CommunicationDetails">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:SubjectDetailsType -->
	<xsl:template match="gtshd:Carrier">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OrganizationName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ShortName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:ShortName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<!--xsl:if test="cat_ru:OrganizationLanguage">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OrganizationLanguage"/>
						</td>
					</tr>
				</table>
			</xsl:if-->
			<xsl:if test="cat_ru:RFOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
				<div>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RKOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
				<div>
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RBOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
				<div>
					<xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RAOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
				<div>
					<xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:KGOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
				<div>
					<xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryA2Code">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:CountryA2Code"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
				<div class="title marg-top">Кодовое обозначение организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:BusinessEntityTypeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:UITN">
				<div class="title marg-top">Уникальный идентификационный таможенный номер, присвоенный юридическому или физическому лицу</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:UITN">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:PersonId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Уникальный идентификатор физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:PersonId"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCard">
				<div class="title marg-top">Сведения о документе, удостоверяющем личность физического лица</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:IdentityCard">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:SubjectAddressDetails">
				<div class="title marg-top">Адрес(а)</div>
				<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
					<xsl:apply-templates select=".">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="RUScat_ru:CommunicationDetails">
				<div class="title marg-top">Контактный реквизит субъекта</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:CommunicationDetails">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="gtshd:ChiefReg">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:LNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:LNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="gtshd:Customs">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:Code"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:OfficeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OfficeName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="gtshd:CustomsPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:LNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:LNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="gtshd:CustomsPersonReg">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:LNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:LNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="gtshd:CustomsReg">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:Code"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:OfficeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OfficeName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа gtshd:DamageIndicatorsType -->
	<xsl:template match="gtshd:DamageIndicators">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Признак повреждения грузового отделения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="gtshd:IsCargoApartmentDamaged='true'">
								<xsl:text>есть</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>нет</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Признак повреждения пломб</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="gtshd:IsSealsDamaged='true'">
								<xsl:text>есть</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>нет</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа gtshd:DecisionDetailsType -->
	<xsl:template match="gtshd:DecisionDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="gtshd:DateDecision">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата принятия решения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="gtshd:DateDecision"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="gtshd:Customs">
				<div class="title marg-top">Код и наименование</div>
				<div>
					<xsl:apply-templates select="gtshd:Customs">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="gtshd:CustomsPerson">
				<div class="title marg-top">Должностно лицо</div>
				<div>
					<xsl:apply-templates select="gtshd:CustomsPerson">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа gtshd:IncidentInfoType -->
	<xsl:template match="gtshd:IncidentInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="gtshd:IncidentDescription">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Описание обстоятельства, препятствующего перевозке товаров</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="gtshd:IncidentDescription"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата происшествия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="gtshd:Date"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
			<xsl:if test="gtshd:Measures">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Меры, принятые для продолжения перевозки товаров под таможенным контролем.</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="gtshd:Measures"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="gtshd:AccidentPlace">
				<div class="title marg-top">Место происшествия</div>
				<div>
					<xsl:apply-templates select="gtshd:AccidentPlace">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="gtshd:CustomsPerson">
				<div class="title marg-top">Сведения о должностном лице таможенного органа, составившем акт об аварии.</div>
				<div>
					<xsl:apply-templates select="gtshd:CustomsPerson">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="gtshd:DamageIndicators">
				<div class="title marg-top">Признаки наличия повреждений</div>
				<div>
					<xsl:apply-templates select="gtshd:DamageIndicators">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="gtshd:LostGoodsInfo">
				<div class="title marg-top">Информация об утрате (отсутствии/уничтожении) части товара</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Порядковый номер</td>
							<td class="graphMain bordered">Наименование</td>
							<td class="graphMain bordered">Порядковый номер вида</td>
							<td class="graphMain bordered">Вид</td>
							<td class="graphMain bordered">Вес брутто</td>
							<td class="graphMain bordered">Сведения</td>
							<td class="graphMain bordered">Количество</td>
						</tr>
						<xsl:for-each select="gtshd:LostGoodsInfo">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="gtshd:InformingWay">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:Phone">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер телефона</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="cat_ru:Phone">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:Fax">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер факса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:Fax"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:Telex">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер телекса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:Telex"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:E_mail">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="cat_ru:E_mail">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа gtshd:LostGoodsInfoType -->
	<xsl:template match="gtshd:LostGoodsInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:value-of select="gtshd:GoodsNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="gtshd:GoodsDescription">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="gtshd:PackageKindSequence"/>
				</td>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="gtshd:AbsenceKind=1">
							<xsl:text>Утерян</xsl:text>
						</xsl:when>
						<xsl:when test="gtshd:AbsenceKind=2">
							<xsl:text>Уничтожен</xsl:text>
						</xsl:when>
						<xsl:when test="gtshd:AbsenceKind=3">
							<xsl:text>Частично утерян</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="gtshd:AbsenceKind"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="translate(gtshd:GrossMass, '.', ',')"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="gtshd:LostPackages">
						<xsl:apply-templates select="gtshd:LostPackages">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="gtshd:LostGoodsQuantity">
						<xsl:apply-templates select="gtshd:LostGoodsQuantity">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="gtshd:LostGoodsQuantity">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:MeasureUnitQualifierName">
			<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:PackagePalleteInformationType -->
	<xsl:template match="gtshd:LostPackages">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
			<xsl:if test="catESAD_cu:InfoKindCode">
				<xsl:value-of select="catESAD_cu:InfoKindCode"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:PalleteCode">
				<br/>
				<xsl:text> Код вида груза: </xsl:text>
				<xsl:value-of select="catESAD_cu:PalleteCode"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:PalleteQuantity">
				<br/>
				<xsl:text>Количество упаковок, поддонов: </xsl:text>
				<xsl:value-of select="catESAD_cu:PalleteQuantity"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:CargoDescriptionText">
				<br/>
				<xsl:text>Описание: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:CargoDescriptionText"/>
			</xsl:if>
		<!--/div-->
	</xsl:template>
	<!-- Шаблон для типа gtshd:TIRIDType -->
	<xsl:template match="gtshd:MDPNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="gtshd:TIRID"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Серия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="gtshd:TIRSeries"/>
					</td>
				</tr>
			</table>
			<xsl:if test="gtshd:TIRPageNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер листа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="gtshd:TIRPageNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="gtshd:RegistrationDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата регистрации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="gtshd:RegistrationDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:SubjectDetailsType -->
	<xsl:template match="gtshd:NextCarrier">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OrganizationName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ShortName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:ShortName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<!--xsl:if test="cat_ru:OrganizationLanguage">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OrganizationLanguage"/>
						</td>
					</tr>
				</table>
			</xsl:if-->
			<xsl:if test="cat_ru:RFOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
				<div>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RKOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
				<div>
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RBOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
				<div>
					<xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RAOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
				<div>
					<xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:KGOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
				<div>
					<xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryA2Code">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:CountryA2Code"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
				<div class="title marg-top">Кодовое обозначение организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:BusinessEntityTypeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:UITN">
				<div class="title marg-top">Уникальный идентификационный таможенный номер, присвоенный юридическому или физическому лицу</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:UITN">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:PersonId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Уникальный идентификатор физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:PersonId"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCard">
				<div class="title marg-top">Сведения о документе, удостоверяющем личность физического лица</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:IdentityCard">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:SubjectAddressDetails">
				<div class="title marg-top">Адрес(а)</div>
				<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
					<xsl:apply-templates select=".">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="RUScat_ru:CommunicationDetails">
				<div class="title marg-top">Контактный реквизит субъекта</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:CommunicationDetails">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="gtshd:ProvidedDocuments">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:value-of select="cat_ru:PrDocumentName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="cat_ru:PrDocumentNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа gtshd:RWStationType -->
	<xsl:template match="gtshd:RWStation">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код станции</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="gtshd:StationCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="gtshd:StationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование станции</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="gtshd:StationName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="gtshd:RailwayCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код железнодорожной дороги </td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="gtshd:RailwayCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа gtshd:RegDetailsType -->
	<xsl:template match="gtshd:RegDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="gtshd:DateReg">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="gtshd:DateReg"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="gtshd:CustomsReg">
				<div class="title marg-top">Код и наименование</div>
				<div>
					<xsl:apply-templates select="gtshd:CustomsReg">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="gtshd:CustomsPersonReg">
				<div class="title marg-top">Должностное лицо</div>
				<div>
					<xsl:apply-templates select="gtshd:CustomsPersonReg">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="gtshd:ChiefReg">
				<div class="title marg-top">Начальник</div>
				<div>
					<xsl:apply-templates select="gtshd:ChiefReg">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>

	<xsl:template mode="GTD_num" match="*">

		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="num_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
						
	</xsl:template>
	<!-- Шаблон для типа gtshd:ReloadPlaceType -->
	<xsl:template match="gtshd:ReloadPlace">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:Code"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:OfficeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OfficeName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="gtshd:Address">
				<div class="title marg-top">Адрес проведения грузовых и иных операций</div>
				<div>
					<xsl:apply-templates select="gtshd:Address">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="gtshd:BorderPointCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код пункта пропуска</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="gtshd:BorderPointCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="gtshd:TranshipmentKind">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Вид грузовых операций</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="gtshd:TranshipmentKind=0">
									<xsl:text>Разгрузка</xsl:text>
								</xsl:when>
								<xsl:when test="gtshd:TranshipmentKind=1">
									<xsl:text>Перегрузка</xsl:text>
								</xsl:when>
								<xsl:when test="gtshd:TranshipmentKind=2">
									<xsl:text>Замена ТС</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="gtshd:TranshipmentKind"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="gtshd:RWStation">
				<div class="title marg-top">ЖД станция на которой предполагаются грузовые операции</div>
				<div>
					<xsl:apply-templates select="gtshd:RWStation">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="gtshd:AdditionalPlaceInfo">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дополнительные сведения о зоне таможенного контроля</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="gtshd:AdditionalPlaceInfo">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа gtshd:SealType -->
	<xsl:template match="gtshd:Seal">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:value-of select="gtshd:IdentNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="gtshd:IdentKind=1">
							<xsl:text>пломба</xsl:text>
						</xsl:when>
						<xsl:when test="gtshd:IdentKind=2">
							<xsl:text>печать</xsl:text>
						</xsl:when>
						<xsl:when test="gtshd:IdentKind=3">
							<xsl:text>иное</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="gtshd:IdentKind"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="gtshd:Identprevious=0">
							<xsl:text>без снятия</xsl:text>
						</xsl:when>
						<xsl:when test="gtshd:Identprevious=1">
							<xsl:text>со снятием</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="gtshd:Identprevious"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="gtshd:IdentDesc"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="translate(gtshd:Quantity, '.', ',')"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="gtshd:TD">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CustomsCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:GTDNumber"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа gtshd:TransportInfoType -->
	<xsl:template match="gtshd:Transport">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:value-of select="cat_ru:VIN"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="cat_ru:TransportKindCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="cat_ru:TransportMarkCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="cat_ru:TransportIdentifier"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="cat_ru:TransportRegNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="gtshd:Mode"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа gtshd:TransportDocType -->
	<xsl:template match="gtshd:TransportDoc">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="gtshd:TD">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ТД</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates mode="GTD_num" select="gtshd:TD"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="gtshd:MDPNumber">
				<div class="title marg-top">Номер книжки МДП</div>
				<div>
					<xsl:apply-templates select="gtshd:MDPNumber">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="gtshd:CarnetNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер карнета АТА</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="gtshd:CarnetNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="gtshd:UIN">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CustomsCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:GTDNumber"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<xsl:template name="num_date">
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
