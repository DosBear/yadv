<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:ResPUI="urn:customs.ru:Information:SQDocuments:ResPlaceUnsheduleInsp:5.13.1">
	<!-- Шаблон для типа ResPlaceUnsheduleInspType -->
	<xsl:template match="ResPUI:ResPlaceUnsheduleInsp">
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
					width: 270mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
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
					font-family: Verdana;
					font-size: 9pt;
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
										<b>Ответ на запрос на размещение внеплановой проверки (первичное, корректировка, результаты)</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
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
					<!--xsl:if test="ResPUI:Response">
						<div class="title marg-top">Ответ на запрос к системе АС ЕРП</div>
					</xsl:if-->
					<xsl:apply-templates select="ResPUI:Response"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ResPUI:ERPResponseType -->
	<xsl:template match="ResPUI:ERPResponse| ResPUI:ACT_DATE_CREATE| ResPUI:ACT_TIME_CREATE| ResPUI:ACT_WAS_READ| ResPUI:DECISION_DATE| ResPUI:DURATION| ResPUI:END_DATE| ResPUI:INJUNCTION_DATE_CREATE| ResPUI:INJUNCTION_DEADLINE| ResPUI:INN| ResPUI:LAST_VIOLATION_DATE| ResPUI:NOTICE_DATE| ResPUI:OGRN| ResPUI:ORDER_DATE| ResPUI:ORDER_NUM| ResPUI:REQUEST_DATE| ResPUI:REQUEST_NUM| ResPUI:START_DATE| ResPUI:TOTAL_VALID">
		<td class="graphMain bordered">
			<xsl:value-of select="ResPUI:ValidationCode"/>
		</td>
		<td class="graphMain bordered">
			<xsl:value-of select="ResPUI:ValidationMessage"/>
		</td>
		<td class="graphMain bordered">
			<xsl:value-of select="ResPUI:ValidationWrongValue"/>
		</td>
	</xsl:template>
	<!-- Шаблон для типа ResPUI:InspectionResult294Type -->
	<xsl:template match="ResPUI:InspectionResult294">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор нарушения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ResPUI:ID"/>
				</td>
			</tr>
			<xsl:if test="ResPUI:ACT_DATE_CREATE or ResPUI:ACT_TIME_CREATE">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата и время составления акта проведения проверки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="ResPUI:ACT_DATE_CREATE"/>
						</xsl:call-template>
						<xsl:text> </xsl:text>
						<xsl:value-of select="substring(ResPUI:ACT_TIME_CREATE, 1,8)"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:ACT_PLACE_CREATE">
				<tr>
					<td class="annot graphMain" style="width:50%">Место составления акта проведения проверки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:ACT_PLACE_CREATE"/>
					</td>
				</tr>
			</xsl:if>
		</table>
		<xsl:if test="ResPUI:ACT_WAS_READ">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Отметка об отказе в ознакомлении с актом проверки</td>
					<td class="graphMain bordered" style="width:5%" align="center">
						<xsl:choose>
							<xsl:when test="ResPUI:ACT_WAS_READ='true' or ResPUI:ACT_WAS_READ=1"> V </xsl:when>
							<xsl:otherwise> </xsl:otherwise>
						</xsl:choose>
					</td>
					<td class="annot graphMain" style="width:45%"/>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<xsl:if test="ResPUI:WRONG_DATA_REASON_SEC_I">
				<tr>
					<td class="annot graphMain" style="width:50%">Несоответствие поданных сведений о начале осущ. предпринимательской деятельности</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:WRONG_DATA_REASON_SEC_I"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:WRONG_DATA_ANOTHER">
				<tr>
					<td class="annot graphMain" style="width:50%">Другие несоответствия поданных сведений</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:WRONG_DATA_ANOTHER"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:NAME_OF_OWNER">
				<tr>
					<td class="annot graphMain" style="width:50%">ФИО уполномоченного представителя проверяемого лица, присутствовавших при проведении проверки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:NAME_OF_OWNER"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:UNIMPOSSIBLE_REASON_I">
				<tr>
					<td class="annot graphMain" style="width:50%">Информация о причинах невозможности проведения проверки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:UNIMPOSSIBLE_REASON_I"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:START_DATE">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата и время проведения проверки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="ResPUI:START_DATE"/>
						</xsl:call-template>
						<xsl:text> </xsl:text>
						<xsl:value-of select="substring(ResPUI:START_DATE, 12, 8)"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:DURATION">
				<tr>
					<td class="annot graphMain" style="width:50%">Продолжительность проведения проверки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:DURATION"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:ADR_INSPECTION">
				<tr>
					<td class="annot graphMain" style="width:50%">Место проведения проверки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:ADR_INSPECTION"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:INSPECTORS">
				<tr>
					<td class="annot graphMain" style="width:50%">ФИО и должности должностного лица или должностных лиц, проводивших проверку</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:INSPECTORS"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:UNDOIG_SEC_I">
				<tr>
					<td class="annot graphMain" style="width:50%">Информация об отмене результатов проверки в случае, если такая отмена была произведена</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:UNDOIG_SEC_I"/>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ResPUI:InspectionViolation294Type -->
	<xsl:template match="ResPUI:InspectionViolation294">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор нарушения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ResPUI:VIOLATION_ID"/>
				</td>
			</tr>
			<xsl:if test="ResPUI:VIOLATION_NOTE">
				<tr>
					<td class="annot graphMain" style="width:50%">Характер выявленного нарушения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:VIOLATION_NOTE"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:VIOLATION_ACT">
				<tr>
					<td class="annot graphMain" style="width:50%">Положение нарушенного провового акта</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:VIOLATION_ACT"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:VIOLATION_ACTORS_NAME">
				<tr>
					<td class="annot graphMain" style="width:50%">Список лиц допустивших нарушение</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:VIOLATION_ACTORS_NAME"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:INJUNCTION_CODES">
				<tr>
					<td class="annot graphMain" style="width:50%">Реквизиты выданного предписания</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:INJUNCTION_CODES"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:INJUNCTION_NOTE">
				<tr>
					<td class="annot graphMain" style="width:50%">Cодержание предписания</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:INJUNCTION_NOTE"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:INJUNCTION_DATE_CREATE">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата вынесения предписания</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="ResPUI:INJUNCTION_DATE_CREATE"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:INJUNCTION_DEADLINE">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата предельного срока исполнения вынесенного предписания</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="ResPUI:INJUNCTION_DEADLINE"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
		</table>
		<xsl:if test="ResPUI:INJUNCTION_IS_REFUSED">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Отметка о невыполнении выданного предписания</td>
					<td class="graphMain bordered" style="width:5%" align="center">
						<xsl:choose>
							<xsl:when test="ResPUI:INJUNCTION_IS_REFUSED='true' or ResPUI:INJUNCTION_IS_REFUSED=1"> V </xsl:when>
							<xsl:otherwise> </xsl:otherwise>
						</xsl:choose>
					</td>
					<td class="annot graphMain" style="width:45%"/>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<xsl:if test="ResPUI:INJUNCTION_EXECUTION">
				<tr>
					<td class="annot graphMain" style="width:50%">Информация о выполнении предписания об устранении выявленных нарушений</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:INJUNCTION_EXECUTION"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:LAWSUIT_SEC_I">
				<tr>
					<td class="annot graphMain" style="width:50%">Информация о направлении материалов о выявленных нарушениях в компетентные органы</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:LAWSUIT_SEC_I"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:LAWSUIT_SEC_II">
				<tr>
					<td class="annot graphMain" style="width:50%">Примененные меры обеспечения производства по делу об административном правонарушении</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:LAWSUIT_SEC_II"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:LAWSUIT_SEC_III">
				<tr>
					<td class="annot graphMain" style="width:50%">Привлеченые к административной ответственности виновные лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:LAWSUIT_SEC_III"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:LAWSUIT_SEC_IV">
				<tr>
					<td class="annot graphMain" style="width:50%">Приостановление или аннулирование ранее выданных разрешений, имеющих разрешительный характер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:LAWSUIT_SEC_IV"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:LAWSUIT_SEC_V">
				<tr>
					<td class="annot graphMain" style="width:50%">Информация об исполнении постановления по делу об административном правонарушении</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:LAWSUIT_SEC_V"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:LAWSUIT_SEC_VI">
				<tr>
					<td class="annot graphMain" style="width:50%">Информация об обжаловании в вышестоящем органе суде решений контроля</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:LAWSUIT_SEC_VI"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:LAWSUIT_SEC_VII">
				<tr>
					<td class="annot graphMain" style="width:50%">Информация об отзыве продукции</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:LAWSUIT_SEC_VII"/>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ResPUI:LawBook294Type -->
	<xsl:template match="ResPUI:LawBook294">
		<table class="w190">
			<xsl:if test="ResPUI:Law_I">
				<xsl:for-each select="ResPUI:Law_I">
					<tr>
						<td class="annot graphMain" style="width:50%">
							<xsl:if test="position()=1">Проверки по 294 ФЗ в отношении ЮЛ и ИП</xsl:if>
						</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="."/>
						</td>
					</tr>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="ResPUI:Law_II">
				<xsl:for-each select="ResPUI:Law_II">
					<tr>
						<td class="annot graphMain" style="width:50%">
							<xsl:if test="position()=1">136ФЗ (Земельный кодекс) в отношении ЮЛ / ИП ( по основанию 294 ФЗ)</xsl:if>
						</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="."/>
						</td>
					</tr>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="ResPUI:Law_III">
				<xsl:for-each select="ResPUI:Law_III">
					<tr>
						<td class="annot graphMain" style="width:50%">
							<xsl:if test="position()=1">136ФЗ (Земельный кодекс) в отношении ОГВ</xsl:if>
						</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="."/>
						</td>
					</tr>
				</xsl:for-each>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ResPUI:LawType -->
	<xsl:template match="ResPUI:Law_I | ResPUI:Law_II | ResPUI:Law_III">
		<xsl:value-of select="ResPUI:FORMULATION"/> - <xsl:value-of select="ResPUI:LAW_BASE"/>
	</xsl:template>
	<!-- Шаблон для типа ResPUI:KOUserType -->
	<xsl:template match="ResPUI:Mailer">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование предприятия получателя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ResPUI:Name"/>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП.</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ResPUI:OGRN"/>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Номер огранизации в федеральном реестре гос. услуг контролирующего органа - потребителя СМЭВ </td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ResPUI:FRGU_ORG_ID"/>
				</td>
			</tr>
			<xsl:if test="ResPUI:FRGU_SERV_ID">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер услуги (сервиса) в федеральном реестре гос. услуг контролирующего органа - потребителя СМЭВ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:FRGU_SERV_ID"/>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ResPUI:MessageFromERP294Type -->
	<xsl:template match="ResPUI:Message294">
		<!--table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Фиксированное значение = "20150201" </td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ResPUI:InfoModel"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Фиксированное значение = "0" </td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ResPUI:PreviousInfoModel"/>
				</td>
			</tr>
		</table-->
		<xsl:if test="ResPUI:Mailer">
			<div class="title marg-top">Отправитель сообщения</div>
			<xsl:apply-templates select="ResPUI:Mailer"/>
		</xsl:if>
		<xsl:if test="ResPUI:UplanUnregular294Response">
			<div class="title marg-top">Результат валидадии размещенной ранее внеплановой проверки</div>
			<xsl:apply-templates select="ResPUI:UplanUnregular294Response" mode="basic1"/>
		</xsl:if>
		<xsl:if test="ResPUI:UplanUnregular294Notification">
			<div class="title marg-top">Уведомление о состоянии внеплановой проверки</div>
			<xsl:apply-templates select="ResPUI:UplanUnregular294Notification" mode="full2"/>
		</xsl:if>
		<xsl:if test="ResPUI:UplanResult294Notification">
			<div class="title marg-top">Результат валидации размещенного раннее результата проведения внепланововй проверки 294 ФЗ</div>
			<xsl:apply-templates select="ResPUI:UplanResult294Notification"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ResPUI:MessageFromERPCommonType -->
	<xsl:template match="ResPUI:MessageCommon">
		<!--table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Фиксированное значение = "20150201" </td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ResPUI:InfoModel"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Фиксированное значение = "0" </td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ResPUI:PreviousInfoModel"/>
				</td>
			</tr>
		</table-->
		<xsl:text>Ответ о неудачной валидации прикладного XML:</xsl:text>
		<table class="bordered w190">
			<tr class="title">
				<td class="graphMain bordered">Код валидации</td>
				<td class="graphMain bordered">Сообщение валидации</td>
				<td class="graphMain bordered">Невалидируемое значение</td>
			</tr>
			<xsl:for-each select="ResPUI:ERPResponse">
				<tr><xsl:apply-templates select="."/></tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ResPUI:ResponseType -->
	<xsl:template match="ResPUI:Response">
		<xsl:if test="ResPUI:MessageCommon">
			<xsl:text>В результате обработки запроса возникла ошибка. </xsl:text>
			<xsl:apply-templates select="ResPUI:MessageCommon"/>
		</xsl:if>
		<xsl:if test="ResPUI:Message294">
			<xsl:apply-templates select="ResPUI:Message294"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ResPUI:UinspectionResult294NotificationType -->
	<xsl:template match="ResPUI:UinspectionResult294Notification">
		<xsl:if test="ResPUI:LOCATION">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Локация результата проверки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:LOCATION"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<div class="marg-top">
			<i>Результат проведения проверки 294 ФЗ (плановой или внеплановой)</i>
		</div>
		<xsl:apply-templates select="ResPUI:InspectionResult294"/>
		<div class="marg-top">
			<i>Результат валидации алгоритмом операций</i>
		</div>
		<table class="bordered w190">
			<tr class="title">
				<td class="graphMain bordered">Объект валидации</td>
				<td class="graphMain bordered">Код валидации</td>
				<td class="graphMain bordered">Сообщение валидации</td>
				<td class="graphMain bordered">Невалидируемое значение</td>
			</tr>
			<tr>
				<td class="graphMain bordered">Общий результат</td>
				<xsl:apply-templates select="ResPUI:TOTAL_VALID"/>
			</tr>
			<xsl:if test="ResPUI:ACT_DATE_CREATE">
				<tr>
					<td class="graphMain bordered">поле ACT_DATE_CREATE (дата составления акта)</td>
					<xsl:apply-templates select="ResPUI:ACT_DATE_CREATE"/>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:ACT_TIME_CREATE">
				<tr>
					<td class="graphMain bordered">поле ACT_TIME_CREATE (время составления акта)</td>
					<xsl:apply-templates select="ResPUI:ACT_TIME_CREATE"/>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:ACT_WAS_READ">
				<tr>
					<td class="graphMain bordered">поле ACT_WAS_READ (отметка об отказе в ознакомлении с актом)</td>
					<xsl:apply-templates select="ResPUI:ACT_WAS_READ"/>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:START_DATE">
				<tr>
					<td class="graphMain bordered">поле START_DATE (дата-время проведения проверки)</td>
					<xsl:apply-templates select="ResPUI:START_DATE"/>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:DURATION">
				<tr>
					<td class="graphMain bordered">поле DURATION (продолжительность проверки)</td>
					<xsl:apply-templates select="ResPUI:DURATION"/>
				</tr>
			</xsl:if>
		</table>
		<xsl:if test="ResPUI:UinspectionViolation294Notification">
			<div class="marg-top">
				<i>Результат валидации аттрибутов выявленных нарушений при проведении плановой или внеплановой проверки по 294 ФЗ</i>
			</div>
			<table class="bordered w190">
				<xsl:for-each select="ResPUI:UinspectionViolation294Notification">
					<tr>
						<td class="annot graphMain" style="width:5%; border-top: 1px solid gray">
							<xsl:value-of select="position()"/>
						</td>
						<td class="annot graphMain" style="border-top: 1px solid gray">
							<xsl:apply-templates select="."/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ResPUI:UinspectionUnregular294Type -->
	<xsl:template match="ResPUI:UinspectionUnregular294">
		<xsl:if test="ResPUI:ID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер места проведения внеплановой проверки в системе АС ЕРП</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:ID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:ORG_NAME">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование проверяемой организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:ORG_NAME"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:INN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН проверяемой организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:INN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:OGRN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ОГРН проверяемой организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:OGRN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:ADR_SEC_I">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Место нахождения проверяемой организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:ADR_SEC_I"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:ADR_SEC_II">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Фактический адрес проведения проверки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:ADR_SEC_II"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:LAST_VIOLATION_DATE">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата предыдущего выявленного нарушения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="ResPUI:LAST_VIOLATION_DATE"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:CORRELATION_ID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификатор потребителя
                    </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:CORRELATION_ID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ResPUI:UinspectionUnregular294NotificationType -->
	<xsl:template match="ResPUI:UinspectionUnregular294Notification" mode="app2">
		<xsl:apply-templates select="." mode="basic2"/>
		<xsl:if test="ResPUI:UinspectionViolation294Notification">
			<div class="marg-top">
				<i>Результат валидации аттрибутов выявленных нарушений при проведении плановой или внеплановой проверки по 294 ФЗ</i>
			</div>
			<table class="w190">
				<xsl:for-each select="ResPUI:UinspectionViolation294Notification">
					<tr>
						<td class="annot graphMain" style="width:5%; border-top: 1px solid gray">
							<xsl:value-of select="position()"/>
						</td>
						<td class="annot graphMain" style="border-top: 1px solid black">
							<xsl:apply-templates select="."/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ResPUI:UinspectionUnregular294ResponseType -->
	<xsl:template match="ResPUI:UinspectionUnregular294Response | ResPUI:UinspectionUnregular294Notification" mode="basic2">
		<xsl:if test="ResPUI:UinspectionUnregular294">
			<div class="marg-top">
				<i>Место проведения внеплановой проверки 294 ФЗ (Базовый тип)</i>
			</div>
			<xsl:apply-templates select="ResPUI:UinspectionUnregular294"/>
		</xsl:if>
		<div class="marg-top">
			<i>Результат валидации алгоритмом операций</i>
		</div>
		<table class="bordered w190">
			<tr class="title">
				<td class="graphMain bordered">Объект валидации</td>
				<td class="graphMain bordered">Код валидации</td>
				<td class="graphMain bordered">Сообщение валидации</td>
				<td class="graphMain bordered">Невалидируемое значение</td>
			</tr>
			<tr>
				<td class="graphMain bordered">Общий результат</td>
				<xsl:apply-templates select="ResPUI:TOTAL_VALID"/>
			</tr>
			<xsl:if test="ResPUI:INN">
				<tr>
					<td class="graphMain bordered">поле INN (ИНН проверяемой организации)</td>
					<xsl:apply-templates select="ResPUI:INN"/>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:OGRN">
				<tr>
					<td class="graphMain bordered">поле OGRN (ОГРН проверяемой организации)</td>
					<xsl:apply-templates select="ResPUI:OGRN"/>
				</tr>
			</xsl:if>
		</table>
		<br/>
	</xsl:template>
	<!-- Шаблон для типа ResPUI:InspectionViolation294ResponseType -->
	<xsl:template match="ResPUI:UinspectionViolation294Notification">
		<div class="marg-top">
			<i>Выявленные нарушения</i>
		</div>
		<xsl:apply-templates select="ResPUI:InspectionViolation294"/>
		<div class="marg-top">
			<i>Результат валидации алгоритмом операций</i>
		</div>
		<table class="bordered w190">
			<tr class="title">
				<td class="graphMain bordered">Объект валидации</td>
				<td class="graphMain bordered">Код валидации</td>
				<td class="graphMain bordered">Сообщение валидации</td>
				<td class="graphMain bordered">Невалидируемое значение</td>
			</tr>
			<tr>
				<td class="graphMain bordered">Общий результат</td>
				<xsl:apply-templates select="ResPUI:TOTAL_VALID"/>
			</tr>
			<xsl:if test="ResPUI:INJUNCTION_DATE_CREATE">
				<tr>
					<td class="graphMain bordered">поле INJUNCTION_DATE_CREATE (дата вынесения предписания)</td>
					<xsl:apply-templates select="ResPUI:INJUNCTION_DATE_CREATE"/>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:INJUNCTION_DEADLINE">
				<tr>
					<td class="graphMain bordered">поле INJUNCTION_DEADLINE (предельный срок исполнения предписания)</td>
					<xsl:apply-templates select="ResPUI:INJUNCTION_DEADLINE"/>
				</tr>
			</xsl:if>
		</table>
		<br/>
	</xsl:template>
	<!-- Шаблон для типа ResPUI:UplanResult294Notification -->
	<xsl:template match="ResPUI:UplanResult294Notification">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор проверки</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ResPUI:ID"/>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Год проверки</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ResPUI:YEAR"/>
				</td>
			</tr>
		</table>
		<div class="marg-top">
			<i>Статус результата внеплановой проверки по месту проведения</i>
		</div>
		<table class="w190">
			<xsl:for-each select="ResPUI:UinspectionResult294Notification">
				<tr>
					<td class="annot graphMain" style="width:5%; border-top: 1px solid black">
						<xsl:value-of select="position()"/>
					</td>
					<td class="annot graphMain" style="border-top: 1px solid black">
						<xsl:apply-templates select="."/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ResPUI:UplanUnregular294Type -->
	<xsl:template match="ResPUI:UplanUnregular294">
		<xsl:if test="ResPUI:ID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИД внеплановой проверки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:ID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:apply-templates select="ResPUI:LawBook294"/>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование контролирующего органа, проводящего или проводившего проверку</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ResPUI:KO_NAME"/>
				</td>
			</tr>
		</table>
		<xsl:if test="ResPUI:REQUEST_NUM">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер заявления</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:REQUEST_NUM"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:REQUEST_DATE">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата заявления</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="ResPUI:REQUEST_DATE"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:START_DATE">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Согласованная дата начала проведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="ResPUI:START_DATE"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:END_DATE">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Согласованная дата окончания проведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="ResPUI:END_DATE"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:DECISION_DATE">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата вынесения решения о согласовании/отказе</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="ResPUI:DECISION_DATE"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:ORDER_NUM or ResPUI:ORDER_DATE">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Приказ о согласовании/отказе в проведении</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:ORDER_NUM"/>
						<xsl:if test="ResPUI:ORDER_DATE">
							<xsl:text> от </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="ResPUI:ORDER_DATE"/>
							</xsl:call-template>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:REASON_SEC_I_DENY or ResPUI:REASON_SEC_II_DENY or ResPUI:REASON_SEC_III_DENY or ResPUI:REASON_SEC_IV_DENY or ResPUI:REASON_SEC_V_DENY or ResPUI:REASON_SEC_VI_DENY or ResPUI:REASON_SEC_VII_DENY">
			<table class="w190">
				<tr>
					<td class="annot graphMain" colspan="13">Причина отказа</td>
				</tr>
				<tr>
					<td class="annot graphMain" style="width:20%" align="right" colspan="2">подпункт 1</td>
					<td class="annot graphMain" style="width:2%"/>
					<td class="graphMain bordered" style="width:3%" align="center">
						<xsl:if test="ResPUI:REASON_SEC_I_DENY='true' or ResPUI:REASON_SEC_I_DENY=1">V</xsl:if>
					</td>
					<td class="annot graphMain" style="width:20%" align="right">подпункт 2</td>
					<td class="annot graphMain" style="width:2%"/>
					<td class="graphMain bordered" style="width:3%" align="center">
						<xsl:if test="ResPUI:REASON_SEC_II_DENY='true' or ResPUI:REASON_SEC_II_DENY=1">V</xsl:if>
					</td>
					<td class="annot graphMain" style="width:20%" align="right">подпункт 3</td>
					<td class="annot graphMain" style="width:2%"/>
					<td class="graphMain bordered" style="width:3%" align="center">
						<xsl:if test="ResPUI:REASON_SEC_III_DENY='true' or ResPUI:REASON_SEC_III_DENY=1">V</xsl:if>
					</td>
					<td class="annot graphMain" style="width:20%" align="right">подпункт 4</td>
					<td class="annot graphMain" style="width:2%"/>
					<td class="graphMain bordered" style="width:3%" align="center">
						<xsl:if test="ResPUI:REASON_SEC_IV_DENY='true' or ResPUI:REASON_SEC_IV_DENY=1">V</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="annot graphMain" colspan="13">
						<br/>
					</td>
				</tr>
				<tr>
					<td class="annot graphMain" style="width:20%" align="right" colspan="2">подпункт 5</td>
					<td class="annot graphMain" style="width:2%"/>
					<td class="graphMain bordered" style="width:3%" align="center">
						<xsl:if test="ResPUI:REASON_SEC_V_DENY='true' or ResPUI:REASON_SEC_V_DENY=1">V</xsl:if>
					</td>
					<td class="annot graphMain" style="width:20%" align="right">подпункт 6</td>
					<td class="annot graphMain" style="width:2%"/>
					<td class="graphMain bordered" style="width:3%" align="center">
						<xsl:if test="ResPUI:REASON_SEC_VI_DENY='true' or ResPUI:REASON_SEC_VI_DENY=1">V</xsl:if>
					</td>
					<td class="annot graphMain" style="width:45%" align="right" colspan="4">по дополнительной мотивировке</td>
					<td class="annot graphMain" style="width:2%"/>
					<td class="graphMain bordered" style="width:3%" align="center">
						<xsl:if test="ResPUI:REASON_SEC_VII_DENY">V</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="annot graphMain" colspan="13">
						<br/>
					</td>
				</tr>
				<xsl:if test="ResPUI:REASON_SEC_VII_DENY">
					<tr>
						<td class="annot graphMain" style="width:13%"/>
						<td class="value graphMain" style="width:87%" colspan="12">
							<xsl:value-of select="ResPUI:REASON_SEC_VII_DENY"/>
						</td>
					</tr>
				</xsl:if>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:INSP_TARGET">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Предмет проверки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:INSP_TARGET"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:REASON_SEC_I">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Правовое основание проведения проверки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:REASON_SEC_I"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:KIND_OF_INSP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Тип проверки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:KIND_OF_INSP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:SIGNER_TITLE">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Должность подписанта</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:SIGNER_TITLE"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:SIGNER_NAME">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ФИО подписанта</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:SIGNER_NAME"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:KO_ADDRESS">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес контролирующего органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:KO_ADDRESS"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:KO_RECIPIENT_TITLE">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кому адресовано</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:KO_RECIPIENT_TITLE"/>
						<xsl:if test="not(ResPUI:KO_RECIPIENT_TITLE)">
							<xsl:value-of select="ResPUI:KO_RECIPIENT_TITLE_DC"/>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<!--xsl:if test="ResPUI:KO_RECIPIENT_TITLE_DC">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кому адресовано (должность получателя со стороны КО) дательный падеж</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:KO_RECIPIENT_TITLE_DC"/>
					</td>
				</tr>
			</table>
		</xsl:if-->
		<xsl:if test="ResPUI:KO_RECIPIENT_NAME">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ФИО получателя со стороны КО</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:KO_RECIPIENT_NAME"/>
						<xsl:if test="not(ResPUI:KO_RECIPIENT_NAME)">
							<xsl:value-of select="ResPUI:KO_RECIPIENT_NAME_DC"/>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<!--xsl:if test="ResPUI:KO_RECIPIENT_NAME_DC">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">(ФИО получателя со стороны КО) дательный падеж</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:KO_RECIPIENT_NAME_DC"/>
					</td>
				</tr>
			</table>
		</xsl:if-->
		<xsl:if test="ResPUI:DECISION_PLACE">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Место вынесения решения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:DECISION_PLACE"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:YEAR">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Год проведения проверки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:YEAR"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:FRGU_NUM">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Реестровый номер функции ФРГУ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:FRGU_NUM"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:NOTICE_DATE">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата уведомления о проведении проверки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="ResPUI:NOTICE_DATE"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:NOTICE_WAY">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Способы уведомления о проведении проверки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:NOTICE_WAY"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:USER_NOTE">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Комментарий контролирующего органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:USER_NOTE"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ResPUI:TYPE_OF_INSP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Вид внеплановой проверки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="ResPUI:TYPE_OF_INSP='Заявление КО'">"Заявление КО" - требует согласования с прокурором</xsl:when>
							<xsl:when test="ResPUI:TYPE_OF_INSP='Уведомление'">"Уведомление" - НЕ требует согласования с прокурором</xsl:when>
							<xsl:when test="ResPUI:TYPE_OF_INSP='Требование прокуратуры'">"Требование прокуратуры" - НЕ требует согласования с прокурором (т.к. инициатором является прокуратура)</xsl:when>
							<xsl:when test="ResPUI:TYPE_OF_INSP='Без уведомления'">"Без уведомления" - НЕ требует согласования с прокурором (эти проверки проводятся для проверки выполнения ранее выписанных ЮЛ/ИП предписаний)</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="ResPUI:TYPE_OF_INSP"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ResPUI:UplanUnregular294NotificationType -->
	<xsl:template match="ResPUI:UplanUnregular294Notification" mode="full2">
		<xsl:if test="ResPUI:LOCATION">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Локация внеплановой проверки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ResPUI:LOCATION"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:apply-templates select="." mode="basic1"/>
		<xsl:if test="ResPUI:UinspectionUnregular294Notification">
			<div class="marg-top">
				<i>Результат валидации аттрибутов места проведения внеплановой проверки 294 ФЗ</i>
			</div>
			<table class="w190">
				<xsl:for-each select="ResPUI:UinspectionUnregular294Notification">
					<tr>
						<td class="annot graphMain" style="width:5%; border-top:1px solid black">
							<xsl:value-of select="position()"/>.</td>
						<td class="annot graphMain" style="border-top:1px solid black">
							<xsl:apply-templates select="." mode="app2"/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ResPUI:UplanUnregular294ResponseType -->
	<xsl:template match="ResPUI:UplanUnregular294Response| ResPUI:UplanUnregular294Notification" mode="basic1">
		<div class="marg-top">
			<i>Внеплановая проверка 294 ФЗ (Базовый тип)</i>
		</div>
		<xsl:apply-templates select="ResPUI:UplanUnregular294"/>
		<br/>
		<div class="marg-top">
			<i>Результат валидации алгоритмом операций</i>
		</div>
		<table class="bordered w190">
			<tr class="title">
				<td class="graphMain bordered">Объект валидации</td>
				<td class="graphMain bordered">Код валидации</td>
				<td class="graphMain bordered">Сообщение валидации</td>
				<td class="graphMain bordered">Невалидируемое значение</td>
			</tr>
			<tr>
				<td class="graphMain bordered">Общий результат</td>
				<xsl:apply-templates select="ResPUI:TOTAL_VALID"/>
			</tr>
			<xsl:if test="ResPUI:REQUEST_DATE">
				<tr>
					<td class="graphMain bordered">поле REQUEST_DATE (дата заявления)</td>
					<xsl:apply-templates select="ResPUI:REQUEST_DATE"/>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:ORDER_DATE">
				<tr>
					<td class="graphMain bordered">поле ORDER_DATE (дата приказа о согласовании/отказе в проведении)</td>
					<xsl:apply-templates select="ResPUI:ORDER_DATE"/>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:START_DATE">
				<tr>
					<td class="graphMain bordered">поле START_DATE (дата начала проведения проверки)</td>
					<xsl:apply-templates select="ResPUI:START_DATE"/>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:END_DATE">
				<tr>
					<td class="graphMain bordered">поле END_DATE (дата окончания проведения проверки)</td>
					<xsl:apply-templates select="ResPUI:END_DATE"/>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:DECISION_DATE">
				<tr>
					<td class="graphMain bordered">поле DECISION_DATE (дата вынесения решения о согласовании/отказе в проведении)</td>
					<xsl:apply-templates select="ResPUI:DECISION_DATE"/>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:ORDER_NUM">
				<tr>
					<td class="graphMain bordered">поле ORDER_NUM (номер приказа о согласовании/отказе в проведении)</td>
					<xsl:apply-templates select="ResPUI:ORDER_NUM"/>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:REQUEST_NUM">
				<tr>
					<td class="graphMain bordered">поле REQUEST_NUM (номер заявления )</td>
					<xsl:apply-templates select="ResPUI:REQUEST_NUM"/>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:NOTICE_DATE">
				<tr>
					<td class="graphMain bordered">поле NOTICE_DATE (дата уведомления о проведении проверки)</td>
					<xsl:apply-templates select="ResPUI:NOTICE_DATE"/>
				</tr>
			</xsl:if>
			<xsl:if test="ResPUI:LAST_VIOLATION_DATE">
				<tr>
					<td class="graphMain bordered">поле LAST_VIOLATION_DATE (дата предыдущего выявленного нарушения)</td>
					<xsl:apply-templates select="ResPUI:LAST_VIOLATION_DATE"/>
				</tr>
			</xsl:if>
		</table>
		<xsl:if test="ResPUI:UinspectionUnregular294Response">
			<div class="marg-top">
				<i>Результат валидации аттрибутов места проведения внеплановой проверки 294 ФЗ</i>
			</div>
			<table class="w190">
				<xsl:for-each select="ResPUI:UinspectionUnregular294Response">
					<tr>
						<td class="annot graphMain" style="width:5%; border-top:1px solid black">
							<xsl:value-of select="position()"/>.</td>
						<td class="annot graphMain" style="border-top:1px solid black">
							<xsl:apply-templates select="." mode="basic2"/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
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
