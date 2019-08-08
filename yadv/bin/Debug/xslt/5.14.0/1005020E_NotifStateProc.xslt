<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catExch_ru="urn:customs.ru:Information:ExchangeDocuments:ExchangeCommonAggregateTypes:5.13.1" xmlns:nsp="urn:customs.ru:Information:EArchDocuments:NotifStateProc:5.13.1" xmlns:ct="urn:customs.ru:Information:EArchDocuments:EADCommonTypes:5.13.1" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа NotifStateProcType -->
	<xsl:template match="nsp:NotifStateProc">
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
					border-bottom: solid 1px gray;
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
					font-size: 11pt;
					}
					td.value.graphMain
					{
					vertical-align:bottom;
					/*font-size: 10pt;*/
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
										<b>Уведомление о состояниях процесса оформления</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ct:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="ct:RefDocumentID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="ct:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<br/>
					<xsl:if test="nsp:AgreementParticipants">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:30%">Реквизиты Соглашения</td>
								<td class="value graphMain"><xsl:apply-templates select="nsp:AgreementParticipants"/></td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="nsp:AgreementINN">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:30%">ИНН участника Соглашения</td>
								<td class="value graphMain"><xsl:value-of select="nsp:AgreementINN"/></td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="nsp:DTNum">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:30%">Регистрационный номер ДТ</td>
								<td class="value graphMain"><xsl:apply-templates select="nsp:DTNum"/></td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="nsp:ProcInformation">
						<div class="title marg-top">Информация о процессе</div>
						<xsl:apply-templates select="nsp:ProcInformation"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ct:AgreementNumType -->
	<xsl:template match="nsp:AgreementParticipants">
		<xsl:if test="cat_ru:PrDocumentName"><xsl:value-of select="cat_ru:PrDocumentName"/><xsl:text> </xsl:text></xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">№ <xsl:value-of select="cat_ru:PrDocumentNumber"/><xsl:text> </xsl:text></xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:text> ИД: </xsl:text>
		<xsl:value-of select="catExch_ru:UniqueID"/>
	</xsl:template>
	<!-- Шаблон для типа ct:GTDIDType -->
	<xsl:template match="nsp:DTNum">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа nsp:EventListType -->
	<xsl:template match="nsp:EventList">
		<!-- Параметры сообщения -->
		<td class="graphMain bordered">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50mm">Сообщение</td>
					<td class="value graphMain">
						(<xsl:value-of select="nsp:MessageCode"/>) <xsl:value-of select="nsp:MessageDescription"/>
					</td>
				</tr>
				<xsl:if test="nsp:ProcState or nsp:StateDescription">
					<tr>
						<td class="annot graphMain" style="width:50mm">Статус процесса после обработки сообщения</td>
						<td class="value graphMain">
							<xsl:value-of select="nsp:ProcState"/>
							<xsl:if test="nsp:StateDescription"> - <xsl:value-of select="nsp:StateDescription"/></xsl:if>
						</td>
					</tr>	
				</xsl:if>
				<xsl:if test="nsp:RecvDateTime">
					<tr>
						<td class="annot graphMain" style="width:50mm">Дата/время приема</td>
						<td class="value graphMain">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="nsp:RecvDateTime"/>
							</xsl:call-template>
							<xsl:text> </xsl:text>
							<xsl:value-of select="substring(nsp:RecvDateTime,12,8)"/>
						</td>
					</tr>	
				</xsl:if>
				<xsl:if test="nsp:SendDateTime">
					<tr>
						<td class="annot graphMain" style="width:50mm">Дата/время отправки</td>
						<td class="value graphMain">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="nsp:SendDateTime"/>
							</xsl:call-template>
							<xsl:text> </xsl:text>
							<xsl:value-of select="substring(nsp:SendDateTime,12,8)"/>
						</td>
					</tr>	
				</xsl:if>
				<xsl:if test="nsp:MessageID">
					<tr>
						<td class="annot graphMain" style="width:50mm">ИД сообщения</td>
						<td class="value graphMain">
							<xsl:value-of select="nsp:MessageID"/>
						</td>
					</tr>	
				</xsl:if>
				<xsl:if test="nsp:MsgInitialEnvelopeID">
					<tr>
						<td class="annot graphMain" style="width:50mm">Ссылочный идентификатор</td>
						<td class="value graphMain">
							<xsl:value-of select="nsp:MsgInitialEnvelopeID"/>
						</td>
					</tr>	
				</xsl:if>
				<xsl:if test="nsp:MsgPreparationDateTime">
					<tr>
						<td class="annot graphMain" style="width:50mm">Дата/время создания</td>
						<td class="value graphMain">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="nsp:MsgPreparationDateTime"/>
							</xsl:call-template>
							<xsl:text> </xsl:text>
							<xsl:value-of select="substring(nsp:MsgPreparationDateTime,12,8)"/>
						</td>
					</tr>	
				</xsl:if>
			</table>
		</td>
		<!-- Параметры документа -->
		<td class="graphMain bordered">
			<table class="w190">
				<xsl:if test="nsp:DocumentCode or nsp:DocumentDescription">
					<tr>
						<td class="annot graphMain" style="width:50mm">Вид документа</td>
						<td class="value graphMain">
							<xsl:if test="nsp:DocumentCode">(код: <xsl:value-of select="nsp:DocumentCode"/>)&#160;</xsl:if>
							<xsl:value-of select="nsp:DocumentDescription"/>
						</td>
					</tr>	
				</xsl:if>
				<xsl:if test="nsp:MsgDocumentID">
					<tr>
						<td class="annot graphMain" style="width:50mm">ИД документа</td>
						<td class="value graphMain">
							<xsl:value-of select="nsp:MsgDocumentID"/>
						</td>
					</tr>	
				</xsl:if>
				<xsl:if test="nsp:MsgRefDocumentID">
					<tr>
						<td class="annot graphMain" style="width:50mm">Ссылочный идентификатор</td>
						<td class="value graphMain">
							<xsl:value-of select="nsp:MsgRefDocumentID"/>
						</td>
					</tr>	
				</xsl:if>
				<xsl:for-each select="nsp:DocumentResult">
					<tr>
						<td class="annot graphMain" style="width:50mm"><xsl:if test="position()=1">Результат обработки</xsl:if></td>
						<td class="value graphMain">
							<xsl:value-of select="nsp:ResultCode"/>
							<xsl:if test="nsp:DocumentID"> ID док-та: <xsl:value-of select="nsp:DocumentID"/></xsl:if>
						</td>
					</tr>	
				</xsl:for-each>
			</table>	
		</td>
	</xsl:template>
	<!-- Шаблон для типа nsp:ProcInformationType -->
	<xsl:template match="nsp:ProcInformation">
		<xsl:if test="nsp:ProcState">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:30%">Текущий статус процесса</td>
					<td class="value graphMain"><xsl:value-of select="nsp:ProcState"/></td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:30%">Идентификатор процесса</td>
				<td class="value graphMain"><xsl:value-of select="nsp:ProcessID"/></td>
			</tr>
		</table>
		<xsl:if test="nsp:StateDescription">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:30%">Описание статусного состояния</td>
					<td class="value graphMain"><xsl:value-of select="nsp:StateDescription"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="nsp:SoftVersion">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:30%">Версия программного обеспечения</td>
					<td class="value graphMain"><xsl:value-of select="nsp:SoftVersion"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="nsp:EventList">
			<div class="title marg-top">Информация о событиях / сообщениях</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered" align="center" style="width:5mm"/>
						<td class="graphMain bordered" align="center" style="width:150mm">Параметры сообщения</td>
						<td class="graphMain bordered" align="center" style="width:115mm">Параметры документа</td>
					</tr>
					<xsl:for-each select="nsp:EventList">
						<tr>
							<td class="graphMain bordered"><xsl:value-of select="position()"/>.</td>
							<xsl:apply-templates select="."/>
						</tr>
					</xsl:for-each>
				</tbody>
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
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise><xsl:value-of select="$dateIn"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
