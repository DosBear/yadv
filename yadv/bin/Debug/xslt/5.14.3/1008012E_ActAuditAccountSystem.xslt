<?xml version="1.0" encoding="utf-8"?>
<!-- Форма бланка на основании письма ГУТК №23-20/56511 от 09.10.2017 (устарело)
Проект Приказа Федеральной таможенной службы "Об утверждении формы акта проверки наличия системы учета товаров и ведения учета товаров, 
порядка ее заполнения и внесения изменений (дополнений) в такой акт" (подготовлен ФТС России 29.01.2018 г.) , Приложение 1
-->
<!-- 
Приложение (ГУТКПВТ 53522 Формы документов по ФЗ-289 (приложение).docx, форма 13) к Письму ГУТКПВТ от 24.09.2018 № 23-20/53522
-->
<!-- ИМО-000572 Письмо ФТС России от 19.10.2018 №01-54/66411-->
<!-- ИМО-000637 Приказ ФТС России от 28.01.2019 № 104 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:aaas="urn:customs.ru:Information:CustomsDocuments:ActAuditAccountSystem:5.14.3">
	<!-- Шаблон для типа ActAuditAccountSystemType -->
	<xsl:template match="aaas:ActAuditAccountSystem">
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

									.graphMain {
									font-family: Arial;
									font-size: 11pt;
									}

									.value
									{
									font-family: Arial;
									font-size: 11pt;
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

									.graphHeader
									{
									font-family: Arial;
									font-size: 11pt;
									font-weight:bold;
									}

									.underwrite{
									font-family: Arial;
									font-size: 7pt;
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
					<table class="w180 graphMain">
						<tbody>
							<tr>
								<td align="center">МИНИСТЕРСТВО ФИНАНСОВ ВОССИЙСКОЙ ФЕДЕРАЦИИ<br/>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</td>
							</tr>
							<tr>
								<td>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="value" align="center">
									<xsl:for-each select="aaas:AuditSubject[not(./cat_ru:Code = preceding-sibling::aaas:AuditSubject/cat_ru:Code)]">
										<xsl:choose>
											<xsl:when test="adt_cat:FullOfficeName">
												<xsl:value-of select="adt_cat:FullOfficeName"/>
											</xsl:when>
											<xsl:when test="cat_ru:OfficeName">
												<xsl:value-of select="cat_ru:OfficeName"/>
											</xsl:when>
										</xsl:choose>
										<xsl:if test="adt_cat:FullOfficeName or cat_ru:OfficeName">&#160;(</xsl:if>
										<xsl:value-of select="cat_ru:Code"/>
										<xsl:if test="adt_cat:FullOfficeName or cat_ru:OfficeName">)</xsl:if>
										<xsl:if test="position()!=last()">; </xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="underwrite" align="center">(наименование таможенного органа)</td>
							</tr>
							<tr>
								<td>
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w180 graphMain">
						<tbody align="left">
							<tr>
								<td width="50%"/>
								<td width="50%" class="graphMain">УТВЕРЖДАЮ</td>
							</tr>
							<tr class="delim">
								<td colspan="2"> </td>
							</tr>
							<tr>
								<td width="50%"/>
								<td width="50%" class="graphMain">Начальник (заместитель начальника) таможенного органа</td>
							</tr>
							<tr class="delim_3">
								<td colspan="2"> </td>
							</tr>
							<tr>
								<td width="50%"> </td>
								<td width="50%">
									<table>
										<tr align="left">
											<td width="34%" class="value"> </td>
											<td width="3%"> </td>
											<td width="63%" class="value">
												<xsl:apply-templates mode="ApproverPerson" select="aaas:Concordant"/>
												<br/>
											</td>
										</tr>
										<tr align="center">
											<td width="34%" class="underwrite">(подпись) </td>
											<td width="3%"> </td>
											<td width="63%" class="underwrite">фамилия, имя, отчество (при наличии)</td>
										</tr>
										<tr align="justify">
											<td colspan="3">
												<xsl:call-template name="DateGrid">
													<xsl:with-param name="date" select="aaas:Concordant/adt_cat:ApproverPerson/cat_ru:IssueDate"/>
												</xsl:call-template>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table class="w180">
						<tbody>
							<tr>
								<td class="graphMain" align="center">
									Акт<br/>проверки наличия системы учета товаров и ведения учета товаров
								</td>
							</tr>
							<tr>
								<td class="underwrite delim_3"/>
							</tr>
							<tr>
								<td class="graphMain" align="center">
									№ 
									<span class="value">
										<xsl:apply-templates select="aaas:ActNumber"/>
									</span>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr align="center">
								<td width="30%">
									<xsl:call-template name="DateGrid">
										<xsl:with-param name="date" select="aaas:ActNumber/ aaas:RegistrationDate"/>
									</xsl:call-template>
								</td>
								<td/>
								<td width="30%" class="value">
									<xsl:value-of select="aaas:AuditPlace"/>
								</td>
							</tr>
							<tr align="center">
								<td class="underwrite"/>
								<td/>
								<td class="underwrite">(место составления)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td class="graphMain">Должностным(ми) лицом(ами):</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates mode="ApproverPerson" select="aaas:AuditSubject"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="underwrite">(должность, структурное подразделение, фамилия, имя, отчество (при наличии)</td>
							</tr>
							<tr>
								<td class="delim"> </td>
							</tr>
							<tr>
								<td class="graphMain">
									c <xsl:call-template name="DateStr">
										<xsl:with-param name="date" select="aaas:BeginAuditPeriodDate"/>
									</xsl:call-template></td>
							</tr>
							<tr>
								<td style="text-align: justify" class="graphMain">
									в соответствии с частью 6 статьи 244  Федерального закона от 3 августа 2018 г. № 289-ФЗ «О  таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации» (Собрание законодательства Российской Федерации 2018, № 32, ст. 5082, № 49, ст. 7524) проведена  проверка наличия системы учета товаров и ведения учета товаров</td>
							</tr>
							<tr>
								<td class="delim_3"> </td>
							</tr>
							<tr>
								<td class="graphMain">
									в отношении</td>
							</tr>
							<tr>
								<td class="delim_3"> </td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="aaas:AuditOrganization"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="underwrite">(наименование, основной государственный регистрационный номер юридического лица, идентификационный номер налогоплательщика, код причины постановки на учет юридического лица / фамилия, имя, отчество (при наличии) индивидуального предпринимателя; место государственной регистрации, место фактического осуществления деятельности)</td>
							</tr>
							<tr>
								<td class="delim"> </td>
							</tr>
							<tr>
								<td style="text-align: justify" class="graphMain">
									за период с <xsl:call-template name="DateStr">
										<xsl:with-param name="date" select="aaas:AuditPeriod/aaas:StartDate"/>
									</xsl:call-template> 
									по <xsl:call-template name="DateStr">
										<xsl:with-param name="date" select="aaas:AuditPeriod/aaas:EndDate"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim"> </td>
							</tr>
							<tr>
								<td class="graphMain">на основании документов и сведений:</td>
							</tr>
							<tr>
								<td class="delim_3"> </td>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="aaas:LawArticle">
										<xsl:apply-templates mode="document" select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td align="center" class="underwrite">(реквизиты (дата и номер) и наименования документов, на основании которых формируются выводы о результатах проверки, и сведения о преставленной отчетности, в том числе в электронном виде)</td>
							</tr>
							<tr>
								<td class="delim"> </td>
							</tr>
							<tr>
								<td class="graphMain">
									В ходе проверки установлено:
								</td>
							</tr>
							<tr>
								<td class="delim_3"> </td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="aaas:ResultReviewDoc"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="underwrite">(информация, характеризующая систему учета товаров, порядок ведения учета товаров, информация о выявленных фактах нарушения требований права Евразийского экономического союза и законодательства Российской Федерации о таможенном регулировании со ссылками на нормативные правовые акты)</td>
							</tr>
							<tr>
								<td class="delim"> </td>
							</tr>
							<tr class="graphMain">
								<td>
									Сведения о наименовании и версии программного средства, используемого проверяемым лицом для ведения учета:
								</td>
							</tr>
							<tr>
								<td class="delim_3"> </td>
							</tr>
							<tr>
								<td class="value">
									<xsl:if test="aaas:PSAccount">
										<xsl:value-of select="aaas:PSAccount/aaas:PSName"/>, версия <xsl:value-of select="aaas:PSAccount/aaas:PSVersion"/>
									</xsl:if>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="delim"> </td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td class="graphMain" width="30%">Результат проверки:</td>
												<td width="70%" class="value">
													<xsl:choose>
														<xsl:when test="aaas:ResultCheck = 'true' or aaas:ResultCheck = 't' or aaas:ResultCheck = '1'">&#160;&#160;&#160;&#160;соблюдено</xsl:when>
														<xsl:otherwise>&#160;&#160;&#160;&#160;не соблюдено</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											<tr>
												<td width="30%"/>
												<td width="70%" class="underwrite" align="center">(соблюдено / не соблюдено)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim"> </td>
							</tr>
							<tr>
								<td class="graphMain">
									Сведения о выявленных нарушениях:
								</td>
							</tr>
							<tr>
								<td class="delim_3"> </td>
							</tr>
							<tr>
								<td class="value">
									<xsl:choose>
										<xsl:when test="aaas:DetectedViolationsInfo">
											<xsl:apply-templates select="aaas:DetectedViolationsInfo"/>
										</xsl:when>
										<xsl:otherwise>нарушения отсутствуют</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td align="center" class="underwrite">(информация о выявленных нарушениях со ссылками на нормативные правовые акты) (либо отсутствии нарушений)</td>
							</tr>
							<tr>
								<td class="delim"> </td>
							</tr>
							<tr>
								<td class="graphMain">
									Предложения:
								</td>
							</tr>
							<tr>
								<td class="delim_3"> </td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="aaas:Resolution"/>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="graphMain">
									Должностное(ые) лицо(а), проводившее(ие) проверку
								</td>
							</tr>
							<tr>
								<td class="delim_3"> </td>
							</tr>
						</tbody>
					</table>
					<xsl:for-each select="aaas:AuditSubject/adt_cat:ApproverPerson">
						<table class="w180">
							<tbody>
								<tr valign="bottom">
									<td width="30%"/>
									<td width="24%" class="value"/>
									<td width="2%"/>
									<td width="44%" class="value" align="center">
										<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
										<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>.
										<xsl:if test="cat_ru:PersonMiddleName">
											&#160;<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>.
										</xsl:if>
									</td>
								</tr>
								<tr align="center">
									<td/>
									<td class="underwrite">(подпись)</td>
									<td/>
									<td class="underwrite">фамилия, имя, отчество (при наличии)</td>
								</tr>
							</tbody>
						</table>
					</xsl:for-each>
					<br/>
					<table>
						<tbody>
							<tr>
								<td class="graphMain">
									Второй экземпляр акта получил (проверяемое лицо или его представитель)
								</td>
							</tr>
							<tr>
								<td class="delim_3"> </td>
							</tr>
						</tbody>
					</table>
					<table class="w180">
						<tbody>
							<tr valign="bottom">
								<td width="30%"/>
								<td width="24%" class="value"/>
								<td width="2%"/>
								<td width="44%" class="value" align="center">
									<xsl:value-of select="aaas:SecondExempReceived/cat_ru:PersonSurname"/>&#160;
										<xsl:value-of select="substring(aaas:SecondExempReceived/cat_ru:PersonName,1,1)"/>.
										<xsl:if test="aaas:SecondExempReceived/cat_ru:PersonMiddleName">
											&#160;<xsl:value-of select="substring(aaas:SecondExempReceived/cat_ru:PersonMiddleName,1,1)"/>.
										</xsl:if>
									<xsl:if test="aaas:SecondExempReceived/cat_ru:PersonPost">
											&#160;<xsl:value-of select="aaas:SecondExempReceived/cat_ru:PersonPost"/>&#160;</xsl:if>
									<br>
										<xsl:if test="aaas:SecondExempReceived/adt_cat:Passport">
											<xsl:apply-templates select="aaas:SecondExempReceived/adt_cat:Passport" mode="passport"/>
										</xsl:if>
									</br>
								</td>
							</tr>
							<tr align="center">
								<td/>
								<td class="underwrite">(подпись)</td>
								<td/>
								<td class="underwrite">фамилия, имя, отчество (при наличии)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w180">
						<tbody>
							<tr valign="bottom">
								<td width="50%" class="graphMain">
									Второй экземпляр акта направлен по почте заказным письмом
								</td>
								<td width="50%" class="value" align="center">
									<xsl:if test="aaas:SecondExempPost/aaas:RegNumberPosr">
										<xsl:text>№ </xsl:text>
										<xsl:value-of select="aaas:SecondExempPost/aaas:RegNumberPosr"/>
									</xsl:if>
									<xsl:if test="aaas:SecondExempPost/aaas:ExecutionDate">
										<xsl:text> от </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="aaas:SecondExempPost/aaas:ExecutionDate"/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
							<tr align="center">
								<td/>
								<td class="underwrite">(дата и № исходящего документа)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w180">
						<tbody>
							<tr valign="bottom">
								<td width="50%" class="graphMain">
									Второй экземпляр акта направлен проверяемому лицу в электронном виде
								</td>
								<td width="50%" class="value" align="center">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="aaas:SecondExempEmail"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr align="center">
								<td/>
								<td class="underwrite">(дата)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w180">
						<tbody>
							<tr>
								<td class="graphMain">
									Приложение на 
									<u>&#160;<xsl:choose>
											<xsl:when test="aaas:AddSheetNumber">
												<xsl:value-of select="aaas:AddSheetNumber"/>
											</xsl:when>
											<xsl:otherwise>0</xsl:otherwise>
										</xsl:choose>&#160;</u>&#160;л.
								</td>
							</tr>
							<tr>
								<td>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="graphMain">
									Примечание:
								</td>
							</tr>
							<tr>
								<td class="delim_3"> </td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="aaas:Comments"/>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
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
	</xsl:template>
	<xsl:template match="aaas:DetectedViolationsInfo">
		<xsl:if test="aaas:CasesQuantity">
			<xsl:text>Количество дел об АП: </xsl:text>
			<xsl:value-of select="aaas:CasesQuantity"/>; 
		</xsl:if>
		<xsl:if test="aaas:ArticleNumber">
			<xsl:text>Номера статей КОАП РФ: </xsl:text>
			<xsl:for-each select="aaas:ArticleNumber">
				<xsl:apply-templates select="."/>
				<xsl:if test="position() != last()">, </xsl:if>
			</xsl:for-each>;
		</xsl:if>
		<xsl:if test="aaas:OtherInfo">
			<xsl:apply-templates select="aaas:OtherInfo"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="aaas:AuditOrganization">
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
		<xsl:if test="aaas:OKPO">
			<span class="normal">, </span>
			<span class="italic">ОКПО</span>
			<span class="normal">: </span>
			<xsl:value-of select="aaas:OKPO"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<span class="normal">, </span>
			<span class="italic">Код страны</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<span class="normal">, </span>
			<span class="italic">ОПФ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">,&#160;<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<span class="normal">, </span>
			<span class="italic">УИ ФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:PersonId"/>
		</xsl:if>
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
		<xsl:if test="aaas:FactAddressDetails">
			<span class="normal">
				<br/>
			</span>
			<span class="italic">Фактический адрес</span>
			<span class="normal">: </span>
			<xsl:for-each select="aaas:FactAddressDetails">
				<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<span class="normal">
				<xsl:for-each select="RUScat_ru:CommunicationDetails">
					<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
				</xsl:for-each>
			</span>
		</xsl:if>
		<xsl:if test="aaas:RegionCustoms">
			<span class="normal">,&#160;</span>
			<span class="italic">Региональное таможенное управление:&#160;</span>
			<xsl:if test="aaas:RegionCustoms/adt_cat:FullOfficeName">
				<xsl:value-of select="aaas:RegionCustoms/adt_cat:FullOfficeName"/>
			</xsl:if>
			<xsl:if test="aaas:RegionCustoms/cat_ru:OfficeName">
				<xsl:if test="string-length(aaas:RegionCustoms/adt_cat:FullOfficeName) &gt; 0">
					<span class="normal"> (</span>
				</xsl:if>
				<xsl:value-of select="aaas:RegionCustoms/cat_ru:OfficeName"/>
				<xsl:if test="string-length(aaas:RegionCustoms/adt_cat:FullOfficeName) &gt; 0">
					<span class="normal">)</span>
				</xsl:if>
			</xsl:if>
			<xsl:if test="aaas:RegionCustoms/cat_ru:Code">&#160; (<xsl:value-of select="aaas:RegionCustoms/cat_ru:Code"/>)&#160;</xsl:if>
		</xsl:if>
		<xsl:if test="aaas:Person">,&#160;<xsl:apply-templates mode="person"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="RUScat_ru:SubjectAddressDetails" match="RUScat_ru:SubjectAddressDetails">
		<xsl:for-each select="RUScat_ru:PostalCode|RUScat_ru:CountryCode|RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
		<xsl:if test="position()!=last()">; </xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>, ОГРН: </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
			<xsl:text>, ИНН: </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
			<xsl:text>, КПП: </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="passport">
		<xsl:if test="RUScat_ru:IdentityCardName">
			<xsl:value-of select="RUScat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="string-length(RUScat_ru:IdentityCardSeries) &gt; 0 or string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
			,&#160;
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries">
			серия&#160;
			<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
			<xsl:if test="string-length(RUScat_ru:IdentityCardNumber) &gt; 0">&#160;</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardNumber">
			№&#160;
			<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
		</xsl:if>
		<xsl:if test="string-length(RUScat_ru:IdentityCardDate) &gt; 0 or string-length(RUScat_ru:OrganizationName) &gt; 0">
			, выдан&#160;
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="RUScat_ru:OrganizationName">	
			&#160;<xsl:value-of select="RUScat_ru:OrganizationName"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="ApproverPerson" match="*">
		<xsl:if test="position()!=1">
			<br/>
		</xsl:if>
		<xsl:if test="adt_cat:ApproverPerson/cat_ru:PersonPost">
			<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonPost"/>&#160;
								</xsl:if>
		<xsl:if test="aaas:Rank">
			<xsl:value-of select="aaas:Rank"/>,&#160;</xsl:if>
		<xsl:if test="adt_cat:CustomsSubUnit">
			<xsl:value-of select="adt_cat:CustomsSubUnit"/>,&#160;</xsl:if>
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:if test="cat_ru:Code">
			<span class="normal">&#160;(</span>
		</xsl:if>
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:Code">
			<span class="normal">)&#160;</span>
		</xsl:if>
		<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonSurname"/>&#160;
								<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonName"/>&#160;
								<xsl:if test="adt_cat:ApproverPerson/cat_ru:PersonMiddleName">
			<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonMiddleName"/>,&#160;</xsl:if>
		<xsl:if test="aaas:PersonCustomsID">&#160;номер служебного удостоверения:&#160;<xsl:value-of select="aaas:PersonCustomsID"/>,&#160;</xsl:if>
		<xsl:if test="aaas:LNP">&#160;ЛНП:&#160;<xsl:value-of select="aaas:LNP"/>,</xsl:if>
		<xsl:if test="aaas:Note">&#160;<xsl:value-of select="aaas:Note"/>&#160;</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<span class="normal">, </span>
		<span class="italic">Код ОПФ: </span>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<span class="normal"> (</span>
			<span class="italic"> по справ. </span>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
			<span class="normal">)</span>
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
	<xsl:template match="aaas:AuditSubject">
		<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonSurname"/>&#160;
		<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonName"/>
		<xsl:if test="adt_cat:ApproverPerson/cat_ru:PersonMiddleName">
			&#160;<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonMiddleName"/>
		</xsl:if>
		<xsl:if test="adt_cat:ApproverPerson/cat_ru:PersonPost">
			,&#160;<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonPost"/>
		</xsl:if>
		,&#160;
		<xsl:value-of select="adt_cat:CustomsSubUnit"/>
		&#160;(<xsl:value-of select="cat_ru:Code"/>&#160;)
	</xsl:template>
	<xsl:template name="RUScat_ru:CommunicationDetails" match="RUScat_ru:CommunicationDetails">
		<span class="normal">, </span>
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
	<xsl:template mode="person" match="*">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonMiddleName"/>
	</xsl:template>

	<xsl:template match="aaas:ActNumber">
		<xsl:value-of select="aaas:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="aaas:CustomsStructureCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="num_date">
			<xsl:with-param name="dateIn" select="aaas:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="concat('А',aaas:Number)"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="aaas:AddNumber"/>
	</xsl:template>

	<xsl:template name="num_date">
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
	<xsl:template name="DateGrid">
		<xsl:param name="date"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">&#171;</td>
					<td width="13%" class="value">
						<xsl:value-of select="substring($date,9,2)"/>
					</td>
					<td width="2%" align="left">&#187;</td>
					<td width="3%"> </td>
					<td width="58%" class="value">
						<xsl:variable name="month" select="substring($date, 6, 2)"/>
						<xsl:choose>
							<xsl:when test="$month=1">января</xsl:when>
							<xsl:when test="$month=2">февраля</xsl:when>
							<xsl:when test="$month=3">марта</xsl:when>
							<xsl:when test="$month=4">апреля</xsl:when>
							<xsl:when test="$month=5">мая</xsl:when>
							<xsl:when test="$month=6">июня</xsl:when>
							<xsl:when test="$month=7">июля</xsl:when>
							<xsl:when test="$month=8">августа</xsl:when>
							<xsl:when test="$month=9">сентября</xsl:when>
							<xsl:when test="$month=10">октября</xsl:when>
							<xsl:when test="$month=11">ноября</xsl:when>
							<xsl:when test="$month=12">декабря</xsl:when>
						</xsl:choose> 					
					</td>
					<td width="5%"> </td>
					<td width="2%" align="right">
						<xsl:value-of select="substring($date,1,2)"/>
					</td>
					<td width="9%" class="value" align="left">
						<xsl:value-of select="substring($date,3,2)"/>
					</td>
					<td width="4%"> </td>
					<td width="2%"> г.</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>
		&#171;<u>&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</u>&#187;
		&#160;&#160;<u>&#160;
		<xsl:choose>
				<xsl:when test="$month=1">января</xsl:when>
				<xsl:when test="$month=2">февраля</xsl:when>
				<xsl:when test="$month=3">марта</xsl:when>
				<xsl:when test="$month=4">апреля</xsl:when>
				<xsl:when test="$month=5">мая</xsl:when>
				<xsl:when test="$month=6">июня</xsl:when>
				<xsl:when test="$month=7">июля</xsl:when>
				<xsl:when test="$month=8">августа</xsl:when>
				<xsl:when test="$month=9">сентября</xsl:when>
				<xsl:when test="$month=10">октября</xsl:when>
				<xsl:when test="$month=11">ноября</xsl:when>
				<xsl:when test="$month=12">декабря</xsl:when>
			</xsl:choose> 					
		</u>&#160;&#160;<xsl:value-of select="substring($date,1,2)"/>
		<u>
			<xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;г.&#160;
	</xsl:template>
</xsl:stylesheet>
