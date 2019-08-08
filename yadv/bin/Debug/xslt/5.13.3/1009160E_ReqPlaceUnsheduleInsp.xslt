<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:ReqPUI="urn:customs.ru:Information:SQDocuments:ReqPlaceUnsheduleInsp:5.13.1">
	<!-- Шаблон для типа ReqPlaceUnsheduleInspType -->
	<xsl:template match="ReqPUI:ReqPlaceUnsheduleInsp">
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
						<tr>
							<td align="center" class="graphMain">
								<font size="4">
									<b>Запрос к системе АС ЕРП
									<xsl:choose>
										<xsl:when test="ReqPUI:KindRequest=1"> на первичное размещение внеплановой проверки</xsl:when>
										<xsl:when test="ReqPUI:KindRequest=2"> на размещение корректировки  внеплановой проверки</xsl:when>
										<xsl:when test="ReqPUI:KindRequest=3"> на первичное размещение результата внеплановой проверки с заложенной ошибкой форматно логического контроля</xsl:when>
										<xsl:when test="ReqPUI:KindRequest=4"> на повторное первичное размещение результатов внеплановой проверки с корректными данными</xsl:when>
										<xsl:otherwise> на размещение внеплановой проверки (первичное, корректировка, результаты)</xsl:otherwise>
									</xsl:choose>
									</b>
								</font>
							</td>
						</tr>
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
					<xsl:apply-templates select="ReqPUI:Request/ReqPUI:Message294"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ReqPUI:ProsecutorType -->
	<xsl:template match="ReqPUI:Addressee">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код прокуратуры</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ReqPUI:Code"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="ReqPUI:Name"/>
				</td>
			</tr>
		</table>
		<xsl:if test="ReqPUI:RegionsCode or ReqPUI:RegionsName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код федерального округа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ReqPUI:RegionsCode"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="ReqPUI:RegionsName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:FederalCentersCode or ReqPUI:FederalCentersName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код федерального центра</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ReqPUI:FederalCentersCode"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="ReqPUI:FederalCentersName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:LocalAreasCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код района по версии ЕРП</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ReqPUI:LocalAreasCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ReqPUI:LawBook294Type -->
	<xsl:template match="ReqPUI:LawBook294">
		<table class="w190">
			<xsl:if test="ReqPUI:Law_I">
				<xsl:for-each select="ReqPUI:Law_I">
					<tr>
						<td class="annot graphMain" style="width:50%">
							<xsl:if test="position()=1">Проверки по 294 ФЗ в отношении ЮЛ и ИП</xsl:if>
						</td>
						<td class="value graphMain" style="width:50%"><xsl:apply-templates select="."/></td>
					</tr>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="ReqPUI:Law_II">
				<xsl:for-each select="ReqPUI:Law_II">
					<tr>
						<td class="annot graphMain" style="width:50%">
							<xsl:if test="position()=1">136ФЗ (Земельный кодекс) в отношении ЮЛ/ИП ( по основанию 294 ФЗ)</xsl:if>
						</td>
						<td class="value graphMain" style="width:50%"><xsl:apply-templates select="."/></td>
					</tr>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="ReqPUI:Law_III">
				<xsl:for-each select="ReqPUI:Law_III">
					<tr>
						<td class="annot graphMain" style="width:50%">
							<xsl:if test="position()=1">136ФЗ (Земельный кодекс) в отношении ОГВ</xsl:if>
						</td>
						<td class="value graphMain" style="width:50%"><xsl:apply-templates select="."/></td>
					</tr>
				</xsl:for-each>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ReqPUI:LawType -->
	<xsl:template match="ReqPUI:Law_I | ReqPUI:Law_II | ReqPUI:Law_III">
		<xsl:value-of select="ReqPUI:FORMULATION"/> - <xsl:value-of select="ReqPUI:LAW_BASE"/>
	</xsl:template>
	<!-- Шаблон для типа ReqPUI:KOUserType -->
	<xsl:template match="ReqPUI:Mailer">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование предприятия получателя</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:Name"/></td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:OGRN"/></td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер организации в федеральном реестре гос.услуг потребителя СМЭВ </td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:FRGU_ORG_ID"/></td>
			</tr>
		</table>
		<xsl:if test="ReqPUI:FRGU_SERV_ID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер услуги (сервиса) в федеральном реестре гос.услуг потребителя СМЭВ</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:FRGU_SERV_ID"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ReqPUI:MessageToERP294Type -->
	<xsl:template match="ReqPUI:Message294">
		<!--table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Фиксированное значение = "20150201" </td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ReqPUI:InfoModel"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Фиксированное значение = "0" </td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ReqPUI:PreviousInfoModel"/>
				</td>
			</tr>
		</table-->
		<div class="title marg-top">Отправитель сообщения </div>
		<xsl:apply-templates select="ReqPUI:Mailer"/>
		<div class="title marg-top">Получатель сообщения </div>
		<xsl:apply-templates select="ReqPUI:Addressee"/>
		<xsl:if test="ReqPUI:UplanUnregular294Initialization">
			<div class="title marg-top">Первичное размещение внеплановой проверки 294 ФЗ</div>
			<xsl:apply-templates select="ReqPUI:UplanUnregular294Initialization"/>
		</xsl:if>
		<xsl:if test="ReqPUI:UplanUnregular294Correction">
			<div class="title marg-top">Размещение корректировки внеплановой проверки 294 ФЗ</div>
			<xsl:apply-templates select="ReqPUI:UplanUnregular294Correction"/>
		</xsl:if>
		<xsl:if test="ReqPUI:UplanResult294Initialization">
			<div class="title marg-top">Первичное размещение результатов проведения внеплановой проверки 294 ФЗ</div>
			<xsl:apply-templates select="ReqPUI:UplanResult294Initialization"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ReqPUI:UplanUnregular294Type -->
	<xsl:template match="*" mode="UplanUnregular294">
		<xsl:if test="ReqPUI:ID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИД внеплановой проверки</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:ID"/></td>
				</tr>
			</table>
		</xsl:if>
		<br/>
		<xsl:apply-templates select="ReqPUI:LawBook294"/>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование контролирующего органа</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:KO_NAME"/></td>
			</tr>
		</table>
		<xsl:if test="ReqPUI:REQUEST_NUM or ReqPUI:REQUEST_DATE">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Заявление</td>
					<td class="value graphMain" style="width:50%">
						<xsl:if test="ReqPUI:REQUEST_NUM">№ <xsl:value-of select="ReqPUI:REQUEST_NUM"/></xsl:if>
						<xsl:if test="ReqPUI:REQUEST_DATE">
							<xsl:text> от </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="ReqPUI:REQUEST_DATE"/>
							</xsl:call-template>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Согласованный период проведения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:text>с </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="ReqPUI:START_DATE"/>
					</xsl:call-template>
					<xsl:text> по </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="ReqPUI:END_DATE"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<xsl:if test="ReqPUI:DECISION_DATE">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата вынесения решения о согласовании/отказе</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="ReqPUI:DECISION_DATE"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:ORDER_NUM or ReqPUI:ORDER_DATE">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Приказ о согласовании/отказе в проведении</td>
					<td class="value graphMain" style="width:50%">
						<xsl:if test="ReqPUI:ORDER_NUM">№ <xsl:value-of select="ReqPUI:ORDER_NUM"/></xsl:if>
						<xsl:if test="ReqPUI:ORDER_DATE">
							<xsl:text> от </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="ReqPUI:ORDER_DATE"/>
							</xsl:call-template>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:REASON_SEC_I_DENY or ReqPUI:REASON_SEC_II_DENY or ReqPUI:REASON_SEC_III_DENY or ReqPUI:REASON_SEC_IV_DENY or ReqPUI:REASON_SEC_V_DENY or ReqPUI:REASON_SEC_VI_DENY or ReqPUI:REASON_SEC_VII_DENY">
			<table class="w190">
				<tr>
					<td class="annot graphMain" colspan="13">Причина отказа</td>
				</tr>
				<tr>
					<td class="annot graphMain" style="width:20%" align="right" colspan="2">подпункт 1</td>
					<td class="annot graphMain" style="width:2%"/>
					<td class="graphMain bordered" style="width:3%" align="center">
						<xsl:if test="ReqPUI:REASON_SEC_I_DENY='true' or ReqPUI:REASON_SEC_I_DENY=1">V</xsl:if>
					</td>
					<td class="annot graphMain" style="width:20%" align="right">подпункт 2</td>
					<td class="annot graphMain" style="width:2%"/>
					<td class="graphMain bordered" style="width:3%" align="center">
						<xsl:if test="ReqPUI:REASON_SEC_II_DENY='true' or ReqPUI:REASON_SEC_II_DENY=1">V</xsl:if>
					</td>
					<td class="annot graphMain" style="width:20%" align="right">подпункт 3</td>
					<td class="annot graphMain" style="width:2%"/>
					<td class="graphMain bordered" style="width:3%" align="center">
						<xsl:if test="ReqPUI:REASON_SEC_III_DENY='true' or ReqPUI:REASON_SEC_III_DENY=1">V</xsl:if>
					</td>
					<td class="annot graphMain" style="width:20%" align="right">подпункт 4</td>
					<td class="annot graphMain" style="width:2%"/>
					<td class="graphMain bordered" style="width:3%" align="center">
						<xsl:if test="ReqPUI:REASON_SEC_IV_DENY='true' or ReqPUI:REASON_SEC_IV_DENY=1">V</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="annot graphMain" colspan="13"><br/></td>
				</tr>
				<tr>
					<td class="annot graphMain" style="width:20%" align="right" colspan="2">подпункт 5</td>
					<td class="annot graphMain" style="width:2%"/>
					<td class="graphMain bordered" style="width:3%" align="center">
						<xsl:if test="ReqPUI:REASON_SEC_V_DENY='true' or ReqPUI:REASON_SEC_V_DENY=1">V</xsl:if>
					</td>
					<td class="annot graphMain" style="width:20%" align="right">подпункт 6</td>
					<td class="annot graphMain" style="width:2%"/>
					<td class="graphMain bordered" style="width:3%" align="center">
						<xsl:if test="ReqPUI:REASON_SEC_VI_DENY='true' or ReqPUI:REASON_SEC_VI_DENY=1">V</xsl:if>
					</td>
					<td class="annot graphMain" style="width:45%" align="right" colspan="4">по дополнительной мотивировке</td>
					<td class="annot graphMain" style="width:2%"/>
					<td class="graphMain bordered" style="width:3%" align="center">
						<xsl:if test="ReqPUI:REASON_SEC_VII_DENY">V</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="annot graphMain" colspan="13"><br/></td>
				</tr>
				<xsl:if test="ReqPUI:REASON_SEC_VII_DENY">
					<tr>
						<td class="annot graphMain" style="width:13%"/>
						<td class="value graphMain" style="width:87%" colspan="12"><xsl:value-of select="ReqPUI:REASON_SEC_VII_DENY"/></td>
					</tr>
				</xsl:if>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:INSP_TARGET">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Предмет проверки</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:INSP_TARGET"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:REASON_SEC_I">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Правовое основание проведения проверки</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:REASON_SEC_I"/></td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Тип проверки</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:KIND_OF_INSP"/></td>
			</tr>
		</table>
		<xsl:if test="ReqPUI:SIGNER_TITLE or ReqPUI:SIGNER_NAME">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Подписано</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ReqPUI:SIGNER_TITLE"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="ReqPUI:SIGNER_NAME"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:KO_ADDRESS">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес контролирующего органа</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:KO_ADDRESS"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:KO_RECIPIENT_TITLE or ReqPUI:KO_RECIPIENT_TITLE_DC or ReqPUI:KO_RECIPIENT_NAME or ReqPUI:KO_RECIPIENT_NAME_DC">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кому адресовано (должность получателя со стороны КО)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:if test="not(ReqPUI:KO_RECIPIENT_TITLE_DC)"><xsl:value-of select="ReqPUI:KO_RECIPIENT_TITLE"/></xsl:if>
						<xsl:value-of select="ReqPUI:KO_RECIPIENT_TITLE_DC"/>
						<xsl:text> </xsl:text>
						<xsl:if test="not(ReqPUI:KO_RECIPIENT_NAME_DC)"><xsl:value-of select="ReqPUI:KO_RECIPIENT_NAME"/></xsl:if>
						<xsl:value-of select="ReqPUI:KO_RECIPIENT_NAME_DC"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:DECISION_PLACE">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Место вынесения решения</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:DECISION_PLACE"/></td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Год проведения проверки</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:YEAR"/></td>
			</tr>
		</table>
		<xsl:if test="ReqPUI:FRGU_NUM">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Реестровый номер функции ФРГУ</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:FRGU_NUM"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:NOTICE_DATE or ReqPUI:NOTICE_WAY">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Уведомление о проведении проверки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ReqPUI:NOTICE_WAY"/>
						<xsl:if test="ReqPUI:NOTICE_DATE">
							<xsl:text> от </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="ReqPUI:NOTICE_DATE"/>
							</xsl:call-template>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:USER_NOTE">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Комментарий контролирующего органа</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:USER_NOTE"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:TYPE_OF_INSP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Вид внеплановой проверки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ReqPUI:TYPE_OF_INSP"/>
						<xsl:choose>
							<xsl:when test="ReqPUI:TYPE_OF_INSP='Заявление КО'"> (требует согласования с прокурором)</xsl:when>
							<xsl:when test="ReqPUI:TYPE_OF_INSP='Уведомление'"> (НЕ требует согласования с прокурором)</xsl:when>
							<xsl:when test="ReqPUI:TYPE_OF_INSP='Требование прокуратуры'"> (НЕ требует согласования с прокурором, т.к. инициатором является прокуратура)</xsl:when>
							<xsl:when test="ReqPUI:TYPE_OF_INSP='Без уведомления'"> (НЕ требует согласования с прокурором, т.к. проводятся для проверки выполнения ранее выписанных ЮЛ/ИП предписаний)</xsl:when>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ReqPUI:UinspectionResult294InitializationType -->
	<xsl:template match="ReqPUI:UinspectionResult294Initialization">
		<tr>
			<td class="annot graphMain" style="width:50%">Порядковый номер места проведения проверки в системе АС ЕРП</td>
			<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:ID"/></td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">Акт проведения проверки</td>
			<td class="value graphMain" style="width:50%">
				<xsl:text>составлен </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="ReqPUI:ACT_DATE_CREATE"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring(ReqPUI:ACT_TIME_CREATE, 12,8)"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="ReqPUI:ACT_PLACE_CREATE"/>
				<xsl:if test="ReqPUI:ACT_WAS_READ='true' or ReqPUI:ACT_WAS_READ=1"> (отказ в ознакомлении с актом)</xsl:if>
			</td>
		</tr>
		<xsl:if test="ReqPUI:WRONG_DATA_REASON_SEC_I">
			<tr>
				<td class="annot graphMain" style="width:50%">Несоответствие поданных сведений о начале осуществления предпринимательской деятельности</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:WRONG_DATA_REASON_SEC_I"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="ReqPUI:WRONG_DATA_ANOTHER">
			<tr>
				<td class="annot graphMain" style="width:50%">Другие несоответствия поданных сведений</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:WRONG_DATA_ANOTHER"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="ReqPUI:UNIMPOSSIBLE_REASON_I">
			<tr>
				<td class="annot graphMain" style="width:50%">Информация о причинах невозможности проведения проверки</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:UNIMPOSSIBLE_REASON_I"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="ReqPUI:NAME_OF_OWNER">
			<tr>
				<td class="annot graphMain" style="width:50%">Представитель проверяемого лица</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:NAME_OF_OWNER"/></td>
			</tr>	
		</xsl:if>
		<xsl:if test="ReqPUI:START_DATE or ReqPUI:DURATION">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата и время проведения проверки</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="ReqPUI:START_DATE"/>
					</xsl:call-template>
					<xsl:text> </xsl:text>
					<xsl:value-of select="substring(ReqPUI:START_DATE,12,8)"/>
					<xsl:if test="ReqPUI:DURATION">
						<xsl:text> продолжительность: </xsl:text>
						<xsl:value-of select="ReqPUI:DURATION"/>
					</xsl:if>
				</td>
			</tr>	
		</xsl:if>
		<xsl:if test="ReqPUI:ADR_INSPECTION">
			<tr>
				<td class="annot graphMain" style="width:50%">Место проведения проверки</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:ADR_INSPECTION"/></td>
			</tr>	
		</xsl:if>
		<xsl:if test="ReqPUI:INSPECTORS">
			<tr>
				<td class="annot graphMain" style="width:50%">Должностные лица, проводившие проверку</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:INSPECTORS"/></td>
			</tr>	
		</xsl:if>
		<xsl:if test="ReqPUI:UNDOIG_SEC_I">
			<tr>
				<td class="annot graphMain" style="width:50%">Информация об отмене результатов проверки</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:UNDOIG_SEC_I"/></td>
			</tr>	
		</xsl:if>
		<xsl:if test="ReqPUI:UinspectionViolation294Initialization">
			<tr>
				<td class="annot graphMain" colspan="2">
					<div class="marg-top">Выявленные нарушения по результатам проведения проверки 294 ФЗ плановой</div>
					<table class="bordered w190">
						<tr>
							<td class="graphMain bordered" style="font-size: 8pt">ИД нарушения</td>
							<td class="graphMain bordered" style="font-size: 8pt">Характер нарушения</td>
							<td class="graphMain bordered" style="font-size: 8pt">Положение нарушенного правового акта</td>
							<td class="graphMain bordered" style="font-size: 8pt">Список лиц, допустивших нарушение</td>
							<td class="graphMain bordered" style="font-size: 8pt">Выданное предписание</td>
							<td class="graphMain bordered" style="font-size: 8pt">Cрок исполнения</td>
							<td class="graphMain bordered" style="font-size: 8pt">Информация о выполнении предписания</td>
							<td class="graphMain bordered" style="font-size: 8pt">Прочая информация</td>
						</tr>
						<xsl:for-each select="ReqPUI:UinspectionViolation294Initialization">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</table>
				</td>
			</tr>
		</xsl:if>	
	</xsl:template>
	<!-- Шаблон для типа ReqPUI:InspectionViolation294Type -->
	<xsl:template match="ReqPUI:UinspectionViolation294Initialization">
		<tr>
			<td class="graphMain bordered" style="font-size: 8pt"><xsl:value-of select="ReqPUI:VIOLATION_ID"/></td>
			<td class="graphMain bordered" style="font-size: 8pt"><xsl:value-of select="ReqPUI:VIOLATION_NOTE"/></td>
			<td class="graphMain bordered" style="font-size: 8pt"><xsl:value-of select="ReqPUI:VIOLATION_ACT"/></td>
			<td class="graphMain bordered" style="font-size: 8pt"><xsl:value-of select="ReqPUI:VIOLATION_ACTORS_NAME"/></td>
			<td class="graphMain bordered" style="font-size: 8pt">
				<xsl:value-of select="ReqPUI:INJUNCTION_CODES"/>
				<xsl:if test="ReqPUI:INJUNCTION_NOTE"><br/><i><xsl:value-of select="ReqPUI:INJUNCTION_NOTE"/></i></xsl:if>
				<xsl:if test="ReqPUI:INJUNCTION_DATE_CREATE">
					<br/>дата вынесения: 
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="ReqPUI:INJUNCTION_DATE_CREATE"/>
					</xsl:call-template>
				</xsl:if>
			</td>
			<td class="graphMain bordered" style="font-size: 8pt">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="ReqPUI:INJUNCTION_DEADLINE"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered" style="font-size: 8pt">
				<xsl:if test="ReqPUI:INJUNCTION_IS_REFUSED='true' or ReqPUI:INJUNCTION_IS_REFUSED=1">
					<span style="color:red">(не выполнено!!!) </span>
				</xsl:if>
				<xsl:value-of select="ReqPUI:INJUNCTION_EXECUTION"/>
			</td>
			<td class="graphMain bordered" style="font-size: 8pt">
				<xsl:if test="ReqPUI:LAWSUIT_SEC_I">
					Информация о направлении материалов о выявленных нарушениях в компетентные органы: 
					<xsl:value-of select="ReqPUI:LAWSUIT_SEC_I"/><br/>
				</xsl:if>
				<xsl:if test="ReqPUI:LAWSUIT_SEC_II">
					Примененные меры обеспечения производства по делу об административном правонарушении: 
					<xsl:value-of select="ReqPUI:LAWSUIT_SEC_II"/><br/>
				</xsl:if>
				<xsl:if test="ReqPUI:LAWSUIT_SEC_III">
					Привлеченные к административной ответственности виновные лица: 
					<xsl:value-of select="ReqPUI:LAWSUIT_SEC_III"/><br/>
				</xsl:if>
				<xsl:if test="ReqPUI:LAWSUIT_SEC_IV">
					Приостановление или аннулирование ранее выданных разрешений, имеющих разрешительный характер: 
					<xsl:value-of select="ReqPUI:LAWSUIT_SEC_IV"/><br/>
				</xsl:if>
				<xsl:if test="ReqPUI:LAWSUIT_SEC_V">
					Информация об исполнении постановления по делу об административном правонарушении: 
					<xsl:value-of select="ReqPUI:LAWSUIT_SEC_V"/><br/>
				</xsl:if>
				<xsl:if test="ReqPUI:LAWSUIT_SEC_VI">
					Информация об обжаловании в вышестоящем органе суде решений контроля: 
					<xsl:value-of select="ReqPUI:LAWSUIT_SEC_VI"/><br/>
				</xsl:if>
				<xsl:if test="ReqPUI:LAWSUIT_SEC_VII">
					Информация об отзыве продукции: 
					<xsl:value-of select="ReqPUI:LAWSUIT_SEC_VII"/><br/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа ReqPUI:UinspectionUnregular294CorrectionType -->
	<xsl:template match="ReqPUI:UinspectionUnregular294Correction">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="ReqPUI:ID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ReqPUI:ORG_NAME"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ReqPUI:INN"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ReqPUI:OGRN"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ReqPUI:ADR_SEC_I"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ReqPUI:ADR_SEC_II"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="ReqPUI:LAST_VIOLATION_DATE"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ReqPUI:CORRELATION_ID"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа ReqPUI:UinspectionUnregular294InitializationType -->
	<xsl:template match="ReqPUI:UinspectionUnregular294Initialization">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="ReqPUI:ORG_NAME"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ReqPUI:INN"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ReqPUI:OGRN"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ReqPUI:ADR_SEC_I"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ReqPUI:ADR_SEC_II"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="ReqPUI:LAST_VIOLATION_DATE"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ReqPUI:CORRELATION_ID"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа ReqPUI:UplanResult294InitializationType -->
	<xsl:template match="ReqPUI:UplanResult294Initialization">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор проверки (присваивается при первичном размещении)</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ReqPUI:ID"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Год проверки</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ReqPUI:YEAR"/>
				</td>
			</tr>
		</table>
		<!--div class="marg-top">Результат валидации аттрибутов внеплановой проверки 294 ФЗ первичное размещение</div-->
		<table class="bordered w190">
			<xsl:for-each select="ReqPUI:UinspectionResult294Initialization">
				<tr class="title"><td class="value graphMain" colspan="2">Результат валидации # <xsl:value-of select="position()"/></td></tr>
				<xsl:apply-templates select="."/>
				<tr><td class="annot graphMain" colspan="2"><br/></td></tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ReqPUI:UplanUnregular294CorrectionType -->
	<xsl:template match="ReqPUI:UplanUnregular294Correction">
		<xsl:apply-templates mode="UplanUnregular294" select="."/>
		<div class="marg-top">Место проведения внеплановой проверки 294 ФЗ (размещение корректировки)</div>
		<table class="bordered w190">
			<tr class="title">
				<td class="graphMain bordered" rowspan="2">Порядковый номер места проведения проверки в системе АС ЕРП</td>
				<td class="graphMain bordered" colspan="4">Проверяемая организация</td>
				<td class="graphMain bordered" rowspan="2">Фактический адрес проведения проверки</td>
				<td class="graphMain bordered" rowspan="2">Дата предыдущего выявленного нарушения</td>
				<td class="graphMain bordered" rowspan="2">Идентификатор потребителя</td>
			</tr>
			<tr class="title">
				<td class="graphMain bordered">Наименование</td>
				<td class="graphMain bordered">ИНН</td>
				<td class="graphMain bordered">ОГРН</td>
				<td class="graphMain bordered">Адрес</td>
			</tr>
			<xsl:for-each select="ReqPUI:UinspectionUnregular294Correction">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</table>
		<br/>
		<xsl:if test="ReqPUI:KPI_ALL_I">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">KPI 1.1 Административная ответственность (ВСЕГО)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:KPI_ALL_I"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:KPI_ALL_II">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">KPI 2.1 Дисциплинарная ответственность (ВСЕГО)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:KPI_ALL_II"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:KPI_ALL_III">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">KPI 3.1  Отзыв лицензии (ВСЕГО)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:KPI_ALL_III"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:KPI_ALL_IV">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">KPI 4.1 Приостановление деятельности (ВСЕГО)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:KPI_ALL_IV"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:KPI_ALL_V">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">KPI 5.1 Предписание на устранение нарушений (ВСЕГО)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:KPI_ALL_V"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:KPI_ALL_VI">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">KPI 6.1 Иное (ВСЕГО)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:KPI_ALL_VI"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:KPI_I">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">KPI 1.2 Административная ответственность (Согласовано)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:KPI_I"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:KPI_II">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">KPI 2.2 Дисциплинарная ответственность (Согласовано)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:KPI_II"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:KPI_III">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">KPI 3.2  Отзыв лицензии (Согласовано)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:KPI_III"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:KPI_IV">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">KPI 4.2 Приостановление деятельности (Согласовано)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:KPI_IV"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:KPI_V">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">KPI 5.2 Предписание на устранение нарушений (Согласовано)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:KPI_V"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ReqPUI:KPI_VI">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">KPI 6.2 Иное (Согласовано)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ReqPUI:KPI_VI"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ReqPUI:UplanUnregular294InitializationType -->
	<xsl:template match="ReqPUI:UplanUnregular294Initialization">
		<xsl:apply-templates mode="UplanUnregular294" select="."/>
		<div class="marg-top">Место проведения внеплановой проверки 294 ФЗ (первичное размещение)</div>
		<table class="bordered w190">
			<tr class="title">
				<td class="graphMain bordered" colspan="4">Проверяемая организация</td>
				<td class="graphMain bordered" rowspan="2">Фактический адрес проведения проверки</td>
				<td class="graphMain bordered" rowspan="2">Дата предыдущего выявленного нарушения</td>
				<td class="graphMain bordered" rowspan="2">Идентификатор потребителя</td>
			</tr>
			<tr class="title">
				<td class="graphMain bordered">Наименование</td>
				<td class="graphMain bordered">ИНН</td>
				<td class="graphMain bordered">ОГРН</td>
				<td class="graphMain bordered">Адрес</td>
			</tr>
			<xsl:for-each select="ReqPUI:UinspectionUnregular294Initialization">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</table>
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
