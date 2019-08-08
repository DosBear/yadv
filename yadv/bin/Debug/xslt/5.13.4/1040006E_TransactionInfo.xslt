<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_crd="urn:customs.ru:CardCommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:trinf="urn:customs.ru:CustomsCardDoc:TransactionInfo:5.13.4" xmlns:cltComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonLeafTypesCust:5.8.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа TransactionInfoType -->
	<xsl:template match="trinf:TransactionInfo">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									font-family:Arial;
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
					<table class="w180">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>Сведения о движении денежных средств<br/>на лицевом счете владельца таможенной карты</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w180">
						<tr>
							<td class="annot graphMain" style="width:100%" align="center">
								<xsl:if test="trinf:TYPEDOC='ПУ'">подтверждение уплаты таможенных пошлин, налогов</xsl:if>
								<xsl:if test="trinf:TYPEDOC='АО'">отчет о расходовании денежных средств, внесенных в качестве авансовых платежей</xsl:if>
								<br/>
								<br/>
							</td>
						</tr>
					</table>
					<table class="w180">
						<tr>
							<td class="annot graphMain" style="width:40%">Код таможенного органа</td>
							<td class="value graphMain" style="width:60%">
								<xsl:value-of select="trinf:CustomsOffice"/>
							</td>
						</tr>
					</table>
					<table class="w180">
						<tr>
							<td class="annot graphMain" style="width:40%">Начало запрашиваемого периода</td>
							<td class="value graphMain" style="width:60%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="trinf:PeroidBegin"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<table class="w180">
						<tr>
							<td class="annot graphMain" style="width:40%">Конец запрашиваемого периода</td>
							<td class="value graphMain" style="width:60%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="trinf:PeroidEnd"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<table class="w180">
						<tr>
							<td class="annot graphMain" style="width:40%">Дата отчета/ подтверждения уплаты таможенных пошлин, налогов</td>
							<td class="value graphMain" style="width:60%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="trinf:ReportDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<xsl:if test="trinf:DebitAmount">
						<table class="w180">
							<tr>
								<td class="annot graphMain" style="width:40%">Сумма, поступившая за указанный период</td>
								<td class="value graphMain" style="width:60%">
									<xsl:value-of select="translate(trinf:DebitAmount, '.', ',')"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="trinf:CreditAmount">
						<table class="w180">
							<tr>
								<td class="annot graphMain" style="width:40%">Сумма, зачтенная за указанный период</td>
								<td class="value graphMain" style="width:60%">
									<xsl:value-of select="translate(trinf:CreditAmount, '.', ',')"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="trinf:BalanceIn">
						<table class="w180">
							<tr>
								<td class="annot graphMain" style="width:40%">Входящий остаток денежных средств</td>
								<td class="value graphMain" style="width:60%">
									<xsl:value-of select="translate(trinf:BalanceIn, '.', ',')"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="trinf:BalanceOut">
						<table class="w180">
							<tr>
								<td class="annot graphMain" style="width:40%">Исходящий остаток денежных средств</td>
								<td class="value graphMain" style="width:60%">
									<xsl:value-of select="translate(trinf:BalanceOut, '.', ',')"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="trinf:Payer">
						<br/>
						<div class="title marg-top">Информация о плательщике</div>
					</xsl:if>
					<xsl:apply-templates select="trinf:Payer"/>
					<xsl:if test="trinf:PaymentInformation">
						<div class="title marg-top">Сведения о платеже</div>
						<table class="bordered w180">
							<tbody>
								<tr class="title" align="center">
									<td class="graphMain bordered">Документ,<br/>на основании которого<br/>уплачены таможенные пошлины, налоги</td>
									<td class="graphMain bordered">Дата<br/>операции</td>
									<td class="graphMain bordered">Сумма<br/>денежных средств по документу </td>
									<td class="graphMain bordered">КБК</td>
									<td class="graphMain bordered">Платежный<br/>документ</td>
									<td class="graphMain bordered">Tаможенный представитель</td>
									<td class="graphMain bordered">Ошибка</td>
								</tr>
								<xsl:for-each select="trinf:PaymentInformation">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа trinf:ErrorInfoType -->
	<xsl:template match="trinf:ErrorInfo">
		<table class="w180">
			<tr>
				<td class="annot graphMain">
					код:<xsl:value-of select="trinf:ErrorCode"/>;
					описание:<xsl:value-of select="trinf:ErrorDescription"/>
					<xsl:if test="trinf:TrabsactionName">
						транзакция:<xsl:value-of select="trinf:TrabsactionName"/>
					</xsl:if>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_crd:OrganizationBaseType -->
	<xsl:template match="trinf:Payer">
		<xsl:if test="cat_crd:OrganizationName">
			<table class="w180">
				<tr>
					<td class="annot graphMain" style="width:40%">Наименование организации</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_crd:OrganizationName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_crd:INN">
			<table class="w180">
				<tr>
					<td class="annot graphMain" style="width:40%">ИНН</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_crd:INN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_crd:KPP">
			<table class="w180">
				<tr>
					<td class="annot graphMain" style="width:40%">КПП</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_crd:KPP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа trinf:PaymentBaseDocumentType -->
	<xsl:template match="trinf:PaymentBaseDocument">
		№ <xsl:value-of select="trinf:PrDocumentNumber"/>
		<xsl:if test="trinf:PrDocumentDate">от <xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="trinf:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<br/>
		Платежи
		<xsl:for-each select="trinf:PaymentList">
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()">
				<br/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_crd:DocumentBaseType -->
	<xsl:template match="trinf:PaymentDocument">
		<table class="w180">
			<tr>
				<td>
					<xsl:value-of select="cat_crd:PrDocumentNumber"/>
					<xsl:if test="cat_crd:PrDocumentDate">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_crd:PrDocumentDate"/>
						</xsl:call-template>
					</xsl:if>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа trinf:PaymentInformationType -->
	<xsl:template match="trinf:PaymentInformation">
		<tr>
			<td class="graphMain bordered">
				<xsl:if test="trinf:OperationType='0' or trinf:OperationType='false' or trinf:OperationType='f'">списание </xsl:if>
				<xsl:if test="trinf:OperationType='1' or trinf:OperationType='true' or trinf:OperationType='t'">начисление </xsl:if>
				<br>
					<xsl:for-each select="trinf:PaymentBaseDocument">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()">
							<br/>
						</xsl:if>
					</xsl:for-each>
				</br>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param select="trinf:OperationDate" name="dateIn"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(trinf:Amount, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="trinf:CBC"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="trinf:PaymentDocument"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="trinf:AgentName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="trinf:ErrorInfo">
					<xsl:apply-templates select="trinf:ErrorInfo"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа trinf:CustomsDutiesType -->
	<xsl:template match="trinf:PaymentList">
		<xsl:if test="trinf:Duties">
			<xsl:value-of select="translate(trinf:Duties, '.', ',')"/>
		</xsl:if>
		<xsl:if test="trinf:PaymentModeCode"/> (<xsl:value-of select="trinf:PaymentModeCode"/>)</xsl:template>
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
