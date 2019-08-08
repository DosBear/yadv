<?xml version="1.0" encoding="utf-8"?>
<!-- Форма бланка на основании письма ГУТК №23-20/56511 от 09.10.2017 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.13.2" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.0" xmlns:aaas="urn:customs.ru:Information:CustomsDocuments:ActAuditAccountSystem:5.13.0">
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
									.underwrite{
										font-size: 8pt;
									}
								</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
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
									<xsl:for-each select="aaas:AuditSubject/ adt_cat:CustomsDept/*">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text> </xsl:text>
										</xsl:if>
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
							<tr>
								<td align="center">
									Акт
									<br/>проверки наличия системы учета товаров и ведения учета товаров
									<br/>№ 
									<span class="value">
										<xsl:apply-templates select="aaas:ActNumber"/>
									</span>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr align="center">
								<td width="30%" class="value">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="aaas:ActNumber/ aaas:RegistrationDate"/>
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
								<td>Должностным лицом:</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="aaas:AuditSubject"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="underwrite">(должность, структурное подразделение, Ф.И.О.)</td>
							</tr>
							<tr>
								<td>
									c <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="aaas:BeginAuditPeriodDate"/></xsl:call-template>г. в соответствии со статьей 350 Таможенного кодекса ЕАЭС и статьей 243 Федерального закона от _________ №______ «…» проведена проверка наличия системы учета товаров и ведения учета товаров у
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="aaas:AuditOrganization"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="underwrite">(наименование, ОГРН, ИНН, КПП, место государственной регистрации)</td>
							</tr>
							<tr>
								<td>
									<xsl:text>за период с  </xsl:text>
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="aaas:AuditPeriod/aaas:StartDate"/></xsl:call-template>
									<xsl:text>г.  по  </xsl:text>
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="aaas:AuditPeriod/aaas:EndDate"/></xsl:call-template>
									<xsl:text>г . на основании документов:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates mode="document" select="aaas:LawArticle"/>
									<xsl:if test="aaas:DocSabmit">
										<xsl:text>, </xsl:text>
										<xsl:for-each select="aaas:DocSabmit">
											<xsl:apply-templates mode="document" select="."/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td align="center" class="underwrite">(перечень документов)</td>
							</tr>
							<tr>
								<td>
									В результате проверки установлено:
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="aaas:ResultReviewDoc"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="underwrite">(описание проверяемых объектов контроля, выявленных фактов (признаков) нарушения права ЕАЭС и законодательства Российской Федерации со ссылкой на положения нормативных правовых актов, требования которых нарушены, либо об отсутствии фактов (признаков) нарушения)</td>
							</tr>
							<tr>
								<td>
									Выводы:
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="aaas:Resolution"/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/><br/>
					<table class="w190">
						<tbody>
							<tr valign="bottom">
								<td width="38%">
									Должностное лицо, проводившее проверку
								</td>
								<td></td>
								<td width="20%" class="value"></td>
								<td></td>
								<td width="20%" class="value" align="center">
									<xsl:apply-templates mode="person" select="aaas:Actor/adt_cat:ApproverPerson"/>
								</td>
								<td></td>
								<td width="20%" class="value" align="center">
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="aaas:Actor/adt_cat:ApproverPerson/cat_ru:IssueDate"/></xsl:call-template>
								</td>
							</tr>
							<tr align="center">
								<td></td>
								<td></td>
								<td class="underwrite">(подпись)</td>
								<td></td>
								<td class="underwrite">(Ф.И.О.)</td>
								<td></td>
								<td class="underwrite">(дата подписания)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					СОГЛАСОВАНО:
					<table class="w190">
						<tbody>
							<tr valign="bottom">
								<td width="38%">
									Начальник (заместитель начальника)<br/>подразделения таможенного органа,<br/>проводившего проверку
								</td>
								<td></td>
								<td width="20%" class="value"></td>
								<td></td>
								<td width="20%" class="value" align="center">
									<xsl:apply-templates mode="person" select="aaas:Concordant/adt_cat:ApproverPerson"/>
								</td>
								<td></td>
								<td width="20%" class="value" align="center">
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="aaas:Concordant/adt_cat:ApproverPerson/cat_ru:IssueDate"/></xsl:call-template>
								</td>
							</tr>
							<tr align="center">
								<td></td>
								<td></td>
								<td class="underwrite">(подпись)</td>
								<td></td>
								<td class="underwrite">(Ф.И.О.)</td>
								<td></td>
								<td class="underwrite">(дата подписания)</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr valign="bottom">
								<td width="38%">
									Второй экземпляр акта получил<br/>(представитель проверяемого лица)
								</td>
								<td></td>
								<td width="20%" class="value"></td>
								<td></td>
								<td width="20%" class="value" align="center">
									<xsl:apply-templates mode="person" select="aaas:SecondExempReceived"/>
								</td>
								<td></td>
								<td width="20%" class="value"></td>
							</tr>
							<tr align="center">
								<td></td>
								<td></td>
								<td class="underwrite">(подпись)</td>
								<td></td>
								<td class="underwrite">(Ф.И.О.)</td>
								<td></td>
								<td class="underwrite">(дата подписания)</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr valign="bottom">
								<td width="38%">
									Второй экземпляр акта направлен по почте
								</td>
								<td></td>
								<td width="61%" class="value" align="center">
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
								<td></td>
								<td class="underwrite">( № и дата исходящего документа )</td>
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
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="adt_cat:CustomsDept">
			<xsl:for-each select="adt_cat:CustomsDept/*">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text> </xsl:text>
				</xsl:if>
			</xsl:for-each>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates mode="person" select="."/>
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
		<xsl:value-of select="aaas:Number"/>
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
</xsl:stylesheet>
