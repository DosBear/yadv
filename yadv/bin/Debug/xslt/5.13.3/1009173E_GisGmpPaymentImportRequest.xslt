<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pi_req="urn:customs.ru:Information:SQDocuments:GisGmpPaymentImportRequest:5.13.1">
	<!-- Шаблон для типа GisGmpPaymentImportRequestType -->
	<xsl:template match="pi_req:GisGmpPaymentImportRequest">
		<html>
			<head>
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
										<b>Импорт начислений (запрос)</b>
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
					</xsl:if>
					<xsl:if test="pi_req:Package">
						<div class="title marg-top">Пакет, содержащий начисления либо платежи </div>
					</xsl:if-->
					<xsl:apply-templates select="pi_req:Package"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа pi_req:AccountType -->
	<xsl:template match="pi_req:Account">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер банковского счёта</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pi_req:AccountNumber"/>
				</td>
			</tr>
		</table>
		<xsl:if test="pi_req:Bank">
			<div class="title marg-top">Данные банка, в котором открыт счёт</div>
		</xsl:if>
		<xsl:apply-templates select="pi_req:Bank"/>
	</xsl:template>
	<!-- Шаблон для типа pi_req:AdditionalDataType -->
	<xsl:template match="pi_req:AdditionalData">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="pi_req:Name"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="pi_req:Value"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа pi_req:BankType -->
	<xsl:template match="pi_req:Bank">
		<xsl:if test="pi_req:Name">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование структурного подразделениякредитной организации или  подразделения Банка России, в котором открыт счет</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pi_req:Name"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">БИК структурного подразделения  кредитной организации или  подразделения Банка России, в котором открыт счет</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pi_req:BIK"/>
				</td>
			</tr>
		</table>
		<xsl:if test="pi_req:CorrespondentBankAccount">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер корреспондентского счета кредитной организации, открытый в подразделении Банка России</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pi_req:CorrespondentBankAccount"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pi_req:ChargeType -->
	<xsl:template match="pi_req:Charge">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор, необходимый для наложения ЭП в формате XadES</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pi_req:Id"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">УИН</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pi_req:supplierBillID"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата и время начисления суммы, подлежащей уплате плательщиком</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pi_req:billDate"/>
				</td>
			</tr>
		</table>
		<xsl:if test="pi_req:ValidUntil">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата, вплоть до которой актуально начисление</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="pi_req:ValidUntil"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pi_req:DocDispatchDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата отсылки (вручения) плательщику предусмотренных договором документов</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="pi_req:DocDispatchDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pi_req:MainSupplierBillIDList"/>
		<xsl:if test="pi_req:MainSupplierBillIDList">
			<div class="title marg-top">Идентификаторы начислений, на основании которых выставлено данное начисление</div>
		</xsl:if>
		<xsl:apply-templates select="pi_req:MainSupplierBillIDList"/>
		<xsl:if test="pi_req:SupplierOrgInfo">
			<div class="title marg-top">Данные организации, являющейся получателем средств</div>
		</xsl:if>
		<xsl:apply-templates select="pi_req:SupplierOrgInfo"/>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Назначение платежа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pi_req:BillFor"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Сумма начисления (в копейках)</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(pi_req:TotalAmount, '.', ',')"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Статус изменения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pi_req:ChangeStatus"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">КБК или код операции</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pi_req:KBK"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код по ОКТМО получателя средств</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pi_req:OKTMO"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дополнительные реквизиты платежа, предусмотренные приказом Минфина России от 12 ноября 2013 г. №107н</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pi_req:BudgetIndex"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор плательщика ЮЛ или ИП</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pi_req:UnifiedPayerIdentifier"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор плательщика ФЛ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pi_req:AltPayerIdentifier"/>
				</td>
			</tr>
		</table>
		<xsl:if test="pi_req:TreasureBranch">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Сокращенное наименование ТОФК</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pi_req:TreasureBranch"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pi_req:TOFK">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код ТОФК, в котором открыт лицевой счет получателю или финансовому органу</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pi_req:TOFK"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pi_req:FOName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Сокращенное наименование финансового органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pi_req:FOName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pi_req:LSvUFK">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер лицевого счета получателя или финансового органа в ТОФК</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pi_req:LSvUFK"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pi_req:LSvFO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер лицевого счета получателя в финансовом органе</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pi_req:LSvFO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pi_req:AcptTerm">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Количество дней для получения акцепта плательщика (от 1 до 9 дней)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pi_req:AcptTerm"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pi_req:PaytCondition">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Условие оплаты. Возможные значения:
 1 - заранее данный акцепт плательщика;
 2 - требуется получение акцепта плательщика</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="pi_req:PaytCondition=1">
								<xsl:text>заранее данный акцепт плательщика</xsl:text>
							</xsl:when>
							<xsl:when test="pi_req:PaytCondition=2">
								<xsl:text>требуется получение акцепта плательщика</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="pi_req:PaytCondition"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pi_req:Origin">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Флаг происхождения предварительного начисления</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pi_req:Origin"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pi_req:AdditionalData">
			<div class="title marg-top">Дополнительные поля начисления</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Наименование поля</td>
						<td class="graphMain bordered">Значение поля</td>
					</tr>
					<xsl:for-each select="pi_req:AdditionalData">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Данные ЭП xml-документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pi_req:Signature"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа pi_req:DocumentType -->
	<xsl:template match="pi_req:Document">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="pi_req:OriginatorID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="pi_req:Charge"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа pi_req:MainSupplierBillIDListType -->
	<xsl:template match="pi_req:MainSupplierBillIDList">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">УИН, на основании которого выставлено данное начисление (УИН связанного начисления)</td>
				<td class="graphMain value" style="width:50%">
					<xsl:for-each select="pi_req:MainSupplierBillID">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа pi_req:PackageType -->
	<xsl:template match="pi_req:Package">
		<div class="title marg-top">Документ</div>
		<table class="bordered w190">
			<tbody>
				<tr class="title">
					<td class="graphMain bordered">УРН организации, сформировавшей сущность</td>
					<td class="graphMain bordered">Начисление</td>
				</tr>
				<xsl:for-each select="pi_req:Document">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа pi_req:OrganizationType -->
	<xsl:template match="pi_req:SupplierOrgInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Сокращенное наименование организации</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pi_req:Name"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">ИНН организации</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pi_req:INN"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">КПП организации</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pi_req:KPP"/>
				</td>
			</tr>
		</table>
		<xsl:if test="pi_req:OGRN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ОГРН организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pi_req:OGRN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pi_req:Account">
			<div class="title marg-top">Реквизиты счета организации</div>
		</xsl:if>
		<xsl:apply-templates select="pi_req:Account"/>
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
