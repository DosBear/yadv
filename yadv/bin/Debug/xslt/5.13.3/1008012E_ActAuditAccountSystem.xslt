<?xml version="1.0" encoding="utf-8"?>
<!-- Форма бланка на основании письма ГУТК №23-20/56511 от 09.10.2017 (устарело)
Проект Приказа Федеральной таможенной службы "Об утверждении формы акта проверки наличия системы учета товаров и ведения учета товаров, 
порядка ее заполнения и внесения изменений (дополнений) в такой акт" (подготовлен ФТС России 29.01.2018 г.) , Приложение 1
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.13.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:aaas="urn:customs.ru:Information:CustomsDocuments:ActAuditAccountSystem:5.13.3">
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
					<table class="w190 graphMain">
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
											<xsl:when test="adt_cat:FullOfficeName"><xsl:value-of select="adt_cat:FullOfficeName"/></xsl:when>
											<xsl:when test="cat_ru:OfficeName"><xsl:value-of select="cat_ru:OfficeName"/></xsl:when>
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

					<table class="w190 graphMain">
						<tbody align="left">
							<tr>
								<td width="50%"></td>
								<td width="50%" class="graphHeader">УТВЕРЖДАЮ</td>
							</tr>
							<tr class="delim"><td colspan="2"> </td></tr>
							<tr>
								<td width="50%"></td>
								<td width="50%" class="graphMain">Начальник (заместитель начальника) таможенного органа,</td>
							</tr>
							<tr class="delim_3"><td colspan="2"> </td></tr>
							<tr>
								<td width="50%"> </td>
								<td width="50%">
									<table>
										<tr align="center">
											<td width="34%" class="value"> </td>
											<td width="3%"> </td>
											<td width="63%" class="value">
												<xsl:value-of select="aaas:Concordant/adt_cat:ApproverPerson/cat_ru:PersonSurname"/>&#160;
												<xsl:value-of select="aaas:Concordant/adt_cat:ApproverPerson/cat_ru:PersonName"/>
												<xsl:if test="aaas:Concordant/adt_cat:ApproverPerson/cat_ru:PersonMiddleName">
													&#160;<xsl:value-of select="aaas:Concordant/adt_cat:ApproverPerson/cat_ru:PersonMiddleName"/>
												</xsl:if>	
												<xsl:if test="aaas:Concordant/adt_cat:ApproverPerson/cat_ru:PersonPost">
													,&#160;<xsl:value-of select="aaas:Concordant/adt_cat:ApproverPerson/cat_ru:PersonPost"/>
												</xsl:if>
												,&#160;
												<xsl:if test="aaas:Concordant/adt_cat:FullOfficeName or aaas:Concordant/cat_ru:OfficeName">
													<xsl:choose>
														<xsl:when test="aaas:Concordant/adt_cat:FullOfficeName"><xsl:value-of select="aaas:Concordant/adt_cat:FullOfficeName"/></xsl:when>
														<xsl:otherwise><xsl:value-of select="aaas:Concordant/cat_ru:OfficeName"/></xsl:otherwise>
													</xsl:choose>&#160;(
												</xsl:if>
												<xsl:value-of select="aaas:Concordant/cat_ru:Code"/>
												<xsl:if test="aaas:Concordant/adt_cat:FullOfficeName or aaas:Concordant/cat_ru:OfficeName">&#160;)</xsl:if>
												<br/>
											</td>
										</tr>
										<tr align="center">
											<td width="34%" class="underwrite">(подпись) </td>
											<td width="3%"> </td>
											<td width="63%" class="underwrite">(инициалы, фамилия)</td>
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
					<br/><br/>
					<table class="w190">
						<tbody>
							<tr>
								<td class="graphHeader" align="center">
									Акт<br/>проверки наличия системы учета товаров и ведения учета товаров
								</td>
							</tr>
							<tr><td class="underwrite delim_3"></td></tr>
							<tr>
								<td class="graphHeader" align="center">
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
								<td class="underwrite">(дата)</td>
								<td/>
								<td class="underwrite">(место составления)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>Должностным(ми) лицом(ами):</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="aaas:AuditSubject">
										<xsl:apply-templates select="."/>
										<xsl:if test="position() != last()"><br/></xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td align="center" class="underwrite">(должность, структурное подразделение, Ф.И.О.)</td>
							</tr>
							<tr><td class="delim"> </td></tr>
							<tr>
								<td>
									c <xsl:call-template name="DateStr"><xsl:with-param name="date" select="aaas:BeginAuditPeriodDate"/></xsl:call-template> в соответствии 
									с частью 5 статьи 244 Федерального закона от _________ №______ «О таможенном регулировании» (Собрание законодательства Российской Федерации, ___ ) 
									проведена проверка наличия системы учета товаров и ведения учета товаров у
								</td>
							</tr>
							<tr><td class="delim_3"> </td></tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="aaas:AuditOrganization"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="underwrite">(наименование (Ф.И.О.), место нахождение проверяемого лица, ОГРН, ИНН, КПП)</td>
							</tr>
							<tr><td class="delim"> </td></tr>
							<tr>
								<td>
									за период с <xsl:call-template name="DateStr"><xsl:with-param name="date" select="aaas:AuditPeriod/aaas:StartDate"/></xsl:call-template> 
									по <xsl:call-template name="DateStr"><xsl:with-param name="date" select="aaas:AuditPeriod/aaas:EndDate"/></xsl:call-template>
								</td>
							</tr>
							<tr><td class="delim"> </td></tr>
							<tr>
								<td>на основании документов и сведений:</td>
							</tr>
							<tr><td class="delim_3"> </td></tr>
							<tr>
								<td class="value">
									<xsl:for-each select="aaas:LawArticle">
										<xsl:apply-templates mode="document" select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr><td class="delim"> </td></tr>
							<tr>
								<td>
									В ходе проверки установлено:
								</td>
							</tr>
							<tr><td class="delim_3"> </td></tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="aaas:ResultReviewDoc"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="underwrite">(информация, характеризующая систему учета товаров, порядок ведения учета товаров, информация о выявленных фактах нарушения  требований права ЕАЭС и законодательства Российской Федерации о таможенном деле, со ссылками на нормативные правовые акты)</td>
							</tr>
							<tr><td class="delim"> </td></tr>
							<tr>
								<td>
									Сведения о наименовании и версии программного средства, используемого проверяемым лицом для ведения учета:
								</td>
							</tr>
							<tr><td class="delim_3"> </td></tr>
							<tr>
								<td class="value">
									<xsl:if test="aaas:PSAccount">
										<xsl:value-of select="aaas:PSAccount/aaas:PSName"/>, версия <xsl:value-of select="aaas:PSAccount/aaas:PSVersion"/>
									</xsl:if>
									<br/>
								</td>
							</tr>
							<tr><td class="delim"> </td></tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td width="30%">Результат проверки:</td>
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
							<tr><td class="delim"> </td></tr>
							<tr>
								<td>
									Сведения о выявленных нарушениях и их квалификация:
								</td>
							</tr>
							<tr><td class="delim_3"> </td></tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="aaas:DetectedViolationsInfo"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="underwrite">(информация о выявленных нарушениях (либо отсутствии нарушений) со ссылками на нормативные правовые акты)</td>
							</tr>
							<tr><td class="delim"> </td></tr>
							<tr>
								<td>
									Предложения:
								</td>
							</tr>
							<tr><td class="delim_3"> </td></tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="aaas:Resolution"/>
								</td>
							</tr>
							<tr><td><br/></td></tr>
							<tr>
								<td>
									Должностное(ые) лицо(а), проводившее(ие) проверку
								</td>
							</tr>
							<tr><td class="delim_3"> </td></tr>
						</tbody>
					</table>
					<xsl:for-each select="aaas:AuditSubject/adt_cat:ApproverPerson">
						<table class="w190">
							<tbody>
								<tr valign="bottom">
									<td width="50%"/>
									<td width="24%" class="value"></td>
									<td width="2%"></td>
									<td width="24%" class="value" align="center">
										<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
										<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>.
										<xsl:if test="cat_ru:PersonMiddleName">
											&#160;<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>.
										</xsl:if>	
									</td>
								</tr>
								<tr align="center">
									<td width="50%"></td>
									<td width="24%" class="underwrite">(подпись)</td>
									<td width="2%"></td>
									<td  width="24%" class="underwrite">(Ф.И.О.)</td>
								</tr>
							</tbody>
						</table>
					</xsl:for-each>	
					<br/>
					<table>
						<tbody>
							<tr>
								<td>
									Второй экземпляр акта получил (проверяемое лицо или его представитель)
								</td>
							</tr>
							<tr><td class="delim_3"> </td></tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr valign="bottom">
									<td width="50%"/>
									<td width="24%" class="value"></td>
									<td width="2%"></td>
									<td width="24%" class="value" align="center">
										<xsl:value-of select="aaas:SecondExempReceived/cat_ru:PersonSurname"/>&#160;
										<xsl:value-of select="substring(aaas:SecondExempReceived/cat_ru:PersonName,1,1)"/>.
										<xsl:if test="aaas:SecondExempReceived/cat_ru:PersonMiddleName">
											&#160;<xsl:value-of select="substring(aaas:SecondExempReceived/cat_ru:PersonMiddleName,1,1)"/>.
										</xsl:if>	
									</td>
							</tr>
								<tr align="center">
									<td width="50%"></td>
									<td width="24%" class="underwrite">(подпись)</td>
									<td width="2%"></td>
									<td  width="24%" class="underwrite">(Ф.И.О.)</td>
								</tr>
						</tbody>
					</table>
					<br/>
					<table class="w190">
						<tbody>
							<tr valign="bottom">
								<td width="50%">
									Второй экземпляр акта направлен по почте
								</td>
								<td width="50%" class="value" align="center">
									<xsl:if test="aaas:SecondExempPost/aaas:RegNumberPosr">
										<xsl:text>№ </xsl:text>
										<xsl:value-of select="aaas:SecondExempPost/aaas:RegNumberPosr"/>
									</xsl:if>
									<xsl:if test="aaas:SecondExempPost/aaas:ExecutionDate">
										<xsl:text> от </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="aaas:SecondExempPost/aaas:RegNumberPosr"/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
							<tr align="center">
								<td></td>
								<td class="underwrite">(дата и № исходящего документа)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w190">
						<tbody>
							<tr valign="bottom">
								<td width="50%">
									Второй экземпляр акта направлен проверяемому лицу в электронном виде
								</td>
								<td width="50%" class="value" align="center">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="aaas:SecondExempEmail"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr align="center">
								<td></td>
								<td class="underwrite">(дата)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w190">
						<tbody>
							<tr>
								<td>
									Примечание:
								</td>
							</tr>
							<tr><td class="delim_3"> </td></tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="aaas:Comments"/>
								</td>	
							</tr>
							<tr><td><br/></td></tr>
							<tr>
								<td>
									Приложение на 
									<u>&#160;<xsl:choose>
										<xsl:when test="aaas:AddSheetNumber"><xsl:value-of select="aaas:AddSheetNumber"/></xsl:when>
										<xsl:otherwise>0</xsl:otherwise>
									</xsl:choose>&#160;</u>&#160;л.
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
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/></xsl:call-template>
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
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text>, адрес: </xsl:text>
			<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:for-each select="RUScat_ru:PostalCode|RUScat_ru:CountryCode|RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
		<xsl:if test="position()!=last()">; </xsl:if>
	</xsl:template>

	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>, ОГРН: </xsl:text><xsl:value-of select="cat_ru:OGRN"/>
			<xsl:text>, ИНН: </xsl:text><xsl:value-of select="cat_ru:INN"/>
			<xsl:text>, КПП: </xsl:text><xsl:value-of select="cat_ru:KPP"/>
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
		<xsl:value-of select="aaas:CustomsControlCode"/>
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
					<td width="13%" class="value"><xsl:value-of select="substring($date,9,2)"/></td>
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
					<td width="2%" align="right"><xsl:value-of select="substring($date,1,2)"/></td>
					<td width="9%" class="value" align="left"><xsl:value-of select="substring($date,3,2)"/></td>
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
		</u>&#160;&#160;<xsl:value-of select="substring($date,1,2)"/><u><xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;г.&#160;
	</xsl:template>
</xsl:stylesheet>
