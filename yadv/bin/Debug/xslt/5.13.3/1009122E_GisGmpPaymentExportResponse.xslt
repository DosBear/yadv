<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pe_res="urn:customs.ru:Information:SQDocuments:GisGmpPaymentExportResponse:5.12.0">
	<!-- Шаблон для типа GisGmpPaymentExportResponseType -->
	<xsl:template match="pe_res:GisGmpPaymentExportResponse">
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
										<b>Ответ на запрос на экспорт платежей</b>
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
					<xsl:if test="pe_res:Payments">
						<div class="title marg-top">Перечень платежей</div>
						<xsl:apply-templates select="pe_res:Payments"/>
					</xsl:if>
					<xsl:if test="pe_res:Quittances">
						<div class="title marg-top">Перечень квитанций</div>
						<xsl:apply-templates select="pe_res:Quittances"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа pe_res:BankType -->
	<xsl:template match="pe_res:Bank">
		<table class="w190">
			<xsl:if test="pe_res:BankName">	
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование структурного подразделения кредитной организации или  подразделения Банка России, в котором открыт счет</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="pe_res:BankName"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="pe_res:BICID">
				<tr>
					<td class="annot graphMain" style="width:50%">БИК банка</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pe_res:BICID"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="pe_res:SWIFTID">	
				<tr>
					<td class="annot graphMain" style="width:50%">SWIFT код банка</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="pe_res:SWIFTID"/></td>
				</tr>
			</xsl:if>	
			<xsl:if test="pe_res:CorrespondentBankAccount">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер корреспондентского счета кредитной организации, открытый в подразделении Банка России</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="pe_res:CorrespondentBankAccount"/></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа pe_res:PaymentIdentificationDataType -->
	<xsl:template match="pe_res:PaymentIdentificationData">
		<xsl:if test="pe_res:Bank">
			<div class="title marg-top">Данные банка плательщика</div>
			<xsl:apply-templates select="pe_res:Bank"/>
		</xsl:if>
		<xsl:if test="pe_res:Other">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Признак, означающий иные способы проведения платежа</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="pe_res:Other"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pe_res:UFK">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">УРН участника (не банка), проведшего платеж, присвоенный при регистрации в ГИС ГМП. Если платеж проведен ТОФК, то элемент должен быть заполнен значением четырехсимвольного кода ТОФК</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="pe_res:UFK"/></td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">УРН участника (не банка), проведшего платеж, присвоенный при регистрации в ГИС ГМП. Если платеж проведен ТОФК, то элемент должен быть заполнен значением четырехсимвольного кода ТОФК</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="pe_res:SystemIdentifier"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа pe_res:PaymentInfoType -->
	<xsl:template match="pe_res:PaymentInfo">
		<tr bgcolor="#e3e3e3">
			<td class="annot graphMain" style="width:50%; border-top: 1px solid grey">Данные платежа, полученные при импорте от АП/ГАП</td>
			<td class="value graphMain" style="width:50%; border-top: 1px solid grey"><xsl:value-of select="pe_res:PaymentData"/></td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">Данные файла ЭП платежа, переданного в ГИС ГМПАП/ГАП</td>
			<td class="value graphMain" style="width:50%"><xsl:value-of select="pe_res:PaymentSignature"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<xsl:if test="pe_res:PaymentStatus">
					<div class="title marg-top">Признак "Сквитировано с начислением"</div>
					<table class="bordered w190">
							<tr class="title">
								<tr>
									<td class="graphMain bordered">Обозначение</td>
									<td class="graphMain bordered">Код, уточнение</td>
								</tr>
							</tr>
							<xsl:for-each select="pe_res:PaymentStatus">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
					</table>
				</xsl:if>
				<br/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа pe_res:PaymentsType -->
	<xsl:template match="pe_res:Payments">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Признак недостижения конца выборки</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="pe_res:HasMore='true' or pe_res:HasMore='1'">
							<xsl:text>после последней выгруженной сущности в выборке имеются другие</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>достигнут конец выборки</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<xsl:if test="pe_res:NeedReRequest">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Признак необходимости перезапроса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="pe_res:NeedReRequest='true' or pe_res:NeedReRequest='1'">
								<xsl:text>Требуется перезапрос. В случае если для получения ответа задействуются внешняя система и ответ от неё не был получен (внешняя  система недоступна либо поучена ошибка)</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>нет</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pe_res:PaymentInfo">
			<div class="title marg-top">Информация о платежах</div>
			<table class="bordered w190">
				<tbody>
					<!--tr class="title">
						<td class="graphMain bordered">Данные платежа, полученные при импорте от АП/ГАП</td>
						<td class="graphMain bordered">Данные файла ЭП платежа, переданного в ГИС ГМПАП/ГАП</td>
						<td class="graphMain bordered">Признак "Сквитировано с начислением"</td>
					</tr-->
					<xsl:for-each select="pe_res:PaymentInfo">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pe_res:PaymentStatusType -->
	<xsl:template match="pe_res:PaymentStatus">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="pe_res:Name"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="pe_res:Value"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа pe_res:QuittanceType -->
	<xsl:template match="pe_res:Quittance">
		<tr bgcolor="#e3e3e3">
			<td class="annot graphMain" style="width:50%; border-top: 1px solid grey">УИН</td>
			<td class="value graphMain" style="width:50%; border-top: 1px solid grey"><xsl:value-of select="pe_res:SupplierBillID"/></td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">Дата создания</td>
			<td class="value graphMain" style="width:50%">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="pe_res:CreationDate"/>
				</xsl:call-template>
			</td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">Статус</td>
			<td class="value graphMain" style="width:50%">
				<xsl:choose>
					<xsl:when test="pe_res:BillStatus='1'">
						<xsl:text>cквитировано</xsl:text>
					</xsl:when>
					<xsl:when test="pe_res:BillStatus='2'">
						<xsl:text>предварительно сквитировано</xsl:text>
					</xsl:when>
					<xsl:when test="pe_res:BillStatus='3'">
						<xsl:text>не сквитировано</xsl:text>
					</xsl:when>
					<xsl:when test="pe_res:BillStatus='4'">
						<xsl:text>сквитировано с отсутствующим платежом</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="pe_res:BillStatus"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
		<xsl:if test="pe_res:PayeeINN">
			<tr>
				<td class="annot graphMain" style="width:50%">ИНН получателя</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="pe_res:PayeeINN"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="pe_res:PayeeKPP">
			<tr>
				<td class="annot graphMain" style="width:50%">КПП получателя</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="pe_res:PayeeKPP"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="pe_res:KBK">
			<tr>
				<td class="annot graphMain" style="width:50%">КБК</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="pe_res:KBK"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="pe_res:OKTMO">
			<tr>
				<td class="annot graphMain" style="width:50%">Код ОКТМО</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="pe_res:OKTMO"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="pe_res:Balance">
			<tr>
				<td class="annot graphMain" style="width:50%">Разность</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="pe_res:Balance"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="pe_res:PayerIdentifier">
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор плательщика</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="pe_res:PayerIdentifier"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="pe_res:AccountNumber">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер счета получателя</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="pe_res:AccountNumber"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="pe_res:BIK">
			<tr>
				<td class="annot graphMain" style="width:50%">БИК банка</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="pe_res:BIK"/></td>
			</tr>
		</xsl:if>
		<tr>
			<td colspan="2"><xsl:apply-templates select="pe_res:PaymentIdentificationData"/></td>
		</tr>
		<tr><td colspan="2"><br/></td></tr>
		<xsl:if test="pe_res:IsRevoked">
			<tr>
				<td class="annot graphMain" style="width:50%">Признак аннулированной квитанции</td>
				<td class="value graphMain" style="width:50%">
				<xsl:choose>
					<xsl:when test="pe_res:IsRevoked='true' or pe_res:IsRevoked='1'">
						<xsl:text>квитанция аннулирована</xsl:text>
					</xsl:when>
					<xsl:when test="pe_res:IsRevoked='false' or pe_res:IsRevoked='0'">
						<xsl:text>квитанция действующая</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="pe_res:IsRevoked"/>
					</xsl:otherwise>
				</xsl:choose>
				</td>
			</tr>
			<tr><td colspan="2"><br/></td></tr>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pe_res:QuittancesType -->
	<xsl:template match="pe_res:Quittances">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Признак недостижения конца выборки</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="pe_res:HasMore='true'">
							<xsl:text>после последней выгруженной сущности в выборке имеются другие</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>достигнут конец выборки</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<xsl:if test="pe_res:Quittance">
			<div class="title marg-top">Данные созданной квитанции</div>
			<table class="w190">
					<!--tr class="title">
						<td class="graphMain bordered">УИН</td>
						<td class="graphMain bordered">Дата создания</td>
						<td class="graphMain bordered">Статус</td>
						<td class="graphMain bordered">ИНН получателя</td>
						<td class="graphMain bordered">КПП получателя</td>
						<td class="graphMain bordered">КБК</td>
						<td class="graphMain bordered">Код ОКТМО</td>
						<td class="graphMain bordered">Разность</td>
						<td class="graphMain bordered">Идентификатор плательщика</td>
						<td class="graphMain bordered">Номер счета получателя</td>
						<td class="graphMain bordered">БИК банка</td>
						<td class="graphMain bordered">Данные</td>
						<td class="graphMain bordered">Признак аннулированной квитанции</td>
					</tr-->
				<xsl:for-each select="pe_res:Quittance">
					<xsl:apply-templates select="."/>
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
