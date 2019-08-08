<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:mpoa="urn:customs.ru:Information:CustomsDocuments:MPOArrive:5.14.3" xmlns:mpco="urn:customs.ru:Information:CustomsDocuments:MPOCommon:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">

	<!-- Шаблон для типа MPOArriveType -->
	<xsl:template match="mpoa:MPOArrive">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
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
												<xsl:when test="mpoa:DocType=0">
													<xsl:text>Сведения о фактическом прибытии МПО</xsl:text>
												</xsl:when>
												<xsl:when test="mpoa:DocType=1">
													<xsl:text>Декларирование возвращаемого МПО</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="mpoa:DocType"/>
												</xsl:otherwise>
											</xsl:choose>
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<xsl:if test="mpoa:Reestr_ID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный номер реестра</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="mpoa:Reestr_ID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoa:MPOReestr"/>
					<xsl:if test="mpoa:MPOReestr">
						<div class="title marg-top">Регистрационный номер реестра МПО</div>
					</xsl:if>
					<xsl:apply-templates select="mpoa:MPOReestr"/>
					<xsl:if test="mpoa:MPO_Registration">
						<div class="title marg-top">Регистрационный номер МПО</div>
					</xsl:if>
					<xsl:apply-templates select="mpoa:MPO_Registration"/>
					<xsl:if test="mpoa:DocDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата и время формирования документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mpoa:DocDate"/></xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(mpoa:DocDate, 12, 8)"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoa:FactDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата фактического прибытия</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="mpoa:FactDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoa:FeedBillAgency">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Учреждение  подачи</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="mpoa:FeedBillAgency"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoa:CustAmount">
						<div class="title marg-top">Расчитанные таможенные платежи по видам</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Кодовое обозначение вида налогов, сборов или иного платежа</td>
									<td class="graphMain bordered">Сумма платежа</td>
									<td class="graphMain bordered">Цифровой код валюты суммы</td>
								</tr>
								<xsl:for-each select="mpoa:CustAmount">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="mpoa:TotalAmount">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Общая сумма таможенных платежей в рублях</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="translate(mpoa:TotalAmount, '.', ',')"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoa:Return">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Признак необходимости возврата МПО</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="mpoa:Return='true'">
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
					<xsl:if test="mpoa:ReasonReturn">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Причина возврата товаров отправителю</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="mpoa:ReasonReturn"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoa:Inspection"/>
					<xsl:if test="mpoa:Inspection">
						<div class="title marg-top">Результаты осмотра МПО</div>
					</xsl:if>
					<xsl:apply-templates select="mpoa:Inspection"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа mpoa:AmountDetailsType -->
	<xsl:template match="mpoa:CustAmount">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="mpoa:CustomsTaxModeCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(mpoa:PaymentAmount, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="mpoa:PaymentCurrencyCode"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:CustomsPersonDetails -->
	<xsl:template match="mpoa:CustomsPerson">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Фамилия</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonSurname"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Имя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:PersonMiddleName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Отчество</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PersonPost">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Должность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:LNP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:LNP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CustomsCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, указанный на оттиске ЛНП</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:CustomsCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа mpoa:InspectionType -->
	<xsl:template match="mpoa:Inspection">
		<xsl:if test="mpoa:CustomsPerson">
			<div class="title marg-top">Должностное лицо ТО</div>
		</xsl:if>
		<xsl:apply-templates select="mpoa:CustomsPerson"/>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата и время проведения осмотра</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_datetime">
						<xsl:with-param name="dateIn" select="mpoa:InspectionTime"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<xsl:if test="mpoa:DisplayTime">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата и время предъявления МПО на осмотр</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_datetime">
							<xsl:with-param name="dateIn" select="mpoa:DisplayTime"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="mpoa:Perquisition">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Признак необходимости проведения досмотра</td>
					<td class="value graphMain" style="width:50%">
						<xsl:if test="mpoa:Perquisition='1' or mpoa:Perquisition='true'">есть</xsl:if>
						<xsl:if test="mpoa:Perquisition='0' or mpoa:Perquisition='false'">нет</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="mpoa:PackingState">
			<div class="title marg-top">Сведения об упаковке</div>
		</xsl:if>
		<xsl:apply-templates select="mpoa:PackingState"/>
		<xsl:if test="mpoa:Prohibited">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Признак наличия запрещенных вложений</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="mpoa:Prohibited='true'">
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
		<xsl:if test="mpoa:Comment">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Комментарии</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="mpoa:Comment">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа mpco:MPO_RegistrationType -->
	<xsl:template match="mpoa:MPOReestr">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">№</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="mpco:CustomsCode"/>
					<xsl:text>/</xsl:text>
					<xsl:call-template name="reestr_date">
						<xsl:with-param name="dateIn" select="mpco:RegistrationDate"/>
					</xsl:call-template>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="mpco:MPO_Number"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа mpco:MPO_RegistrationType -->
	<xsl:template match="mpoa:MPO_Registration">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="mpco:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="mpco:RegistrationDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Уникальный номер МПО</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="mpco:MPO_Number"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа mpco:PackingStateType -->
	<xsl:template match="mpoa:PackingState">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Нарушена или целостна</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="mpco:Value='false' or mpco:Value=0">
							<xsl:text>нарушена</xsl:text>
						</xsl:when>
						<xsl:when test="mpco:Value='true' or mpco:Value=1">
							<xsl:text>целостна</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="mpco:Value"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<xsl:if test="mpco:Remark">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Пояснение</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="mpco:Remark"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="reestr_date">
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
	<xsl:template name="russian_datetime">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text>   </xsl:text>
				<xsl:value-of select="substring($dateIn,12,8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
