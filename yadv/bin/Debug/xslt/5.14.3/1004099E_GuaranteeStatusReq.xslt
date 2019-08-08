<?xml version="1.0" encoding="utf-8"?>
<!-- бланк в свободной форме -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gsreq="urn:customs.ru:Information:ExchangeDocuments:GuaranteeStatusReq:5.14.3">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="gsreq:GuaranteeStatusReq">
		<html>
			<head>
				<title>Запрос статуса процесса работы с дополнением к договору поручительства/ Запрос сведений о лицах, несущих солидарную ответственность / Запрос на резервирование(разрезервирование) средств по 7 млрд</title>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style type="text/css">
									body {
									background: #cccccc;
									}

									div
									{
									white-space: normal;
									}

									div.page {
									width: 180mm;
									max-width: 180mm;
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
									vertical-align:bottom;
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
					<table class="graphMain">
						<tbody>
							<tr>
								<td align="center" colspan="2" style="border:solid 0pt; padding-bottom:5mm">
									<font size="4">
										<b>
											<xsl:choose>
												<xsl:when test="gsreq:RequestKind=1">Запрос статуса процесса работы с дополнением к договору поручительства </xsl:when>
												<xsl:when test="gsreq:RequestKind=2">Запрос сведений о лицах, несущих солидарную ответственность</xsl:when>
												<xsl:when test="gsreq:RequestKind=3">Запрос на резервирование средств по 7 млрд</xsl:when>
												<xsl:when test="gsreq:RequestKind=4">Запрос на разрезервирование средств по 7 млрд</xsl:when>
												<xsl:when test="gsreq:RequestKind=5">Запрос сумм по договору поручительства</xsl:when>
												<xsl:otherwise>Запрос информации о документе обеспечения</xsl:otherwise>
											</xsl:choose>
										</b>
									</font>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<br/>
								</td>
							</tr>
							<xsl:if test="gsreq:CustomsDoc">
								<tr>
									<td width="50%" class="annot graphMain">Регистрационный номер ДТ/ТД</td>
									<td width="50%" class="value">
										<xsl:apply-templates select="gsreq:CustomsDoc"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="gsreq:GRN">
								<tr>
									<td width="50%" class="annot graphMain">Cсылочный номер гарантии в транзите</td>
									<td width="50%" class="value" valign="bottom">
										<xsl:value-of select="gsreq:GRN"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="gsreq:GuaranteeID">
								<tr>
									<td width="50%" class="annot graphMain">Уникальный идентификатор, присваиваемый дополнению к договору поручительства при регистрации</td>
									<td width="50%" class="value">
										<xsl:value-of select="gsreq:GuaranteeID/gsreq:AdditionalID"/>
									</td>
								</tr>
								<xsl:if test="gsreq:GuaranteeID/gsreq:ContractNumber">
									<tr>
										<td width="50%" class="annot graphMain">Номер договора поручительства</td>
										<td width="50%" class="value" valign="bottom">
											<xsl:value-of select="gsreq:GuaranteeID/gsreq:ContractNumber"/>
										</td>
									</tr>
								</xsl:if>
							</xsl:if>
							<xsl:if test="gsreq:CustomsReceiptRegNumber">
								<tr>
									<td width="50%" class="annot graphMain">Регистрационный номер таможенной расписки</td>
									<td width="50%" class="value" valign="bottom">
										<xsl:apply-templates select="gsreq:CustomsReceiptRegNumber"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="gsreq:INN_Carrier">
								<tr>
									<td width="50%" class="annot graphMain">ИНН перевозчика</td>
									<td width="50%" class="value" valign="bottom">
										<xsl:value-of select="gsreq:INN_Carrier"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="gsreq:INN_AEO">
								<tr>
									<td class="annot graphMain" width="50%">ИНН уполномоченного экономического оператора / декларанта</td>
									<td class="value" width="50%" valign="bottom">
										<xsl:value-of select="gsreq:INN_AEO"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="gsreq:Amount">
								<tr>
									<td width="50%" class="annot graphMain">Сумма резервирования</td>
									<td width="50%" class="value" valign="bottom">
										<xsl:value-of select="gsreq:Amount"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="gsreq:TermGuaranty">
								<tr>
									<td width="50%" class="annot graphMain">Предельный срок исполнения обязательства</td>
									<td width="50%" class="value" valign="bottom">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="gsreq:TermGuaranty"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="gsreq:ObligationCode">
								<tr>
									<td width="50%" class="annot graphMain">Код вида обязательства</td>
									<td width="50%" class="value" valign="bottom">
										<xsl:value-of select="gsreq:ObligationCode"/>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="document" match="*">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="gsreq:DocNumberPrefix"/>
		<xsl:value-of select="cat_ru:GTDNumber"/>
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
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
