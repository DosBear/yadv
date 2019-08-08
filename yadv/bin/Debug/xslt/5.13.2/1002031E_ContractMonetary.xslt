<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonLeafTypesCust:5.8.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.0" xmlns:cmo="urn:customs.ru:Information:CommercialFinanceDocuments:ContractMonetary:5.13.1">
	<!-- Шаблон для типа ContractMonetaryType -->
	<xsl:template match="cmo:ContractMonetary">
		<html>
			<head>
				<style type="text/css">
					div.page {
						width: 297mm;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding:	10mm;
						padding-left:	20mm;
						background: #ffffff;
						border: solid 1pt #000000;
					}
						
					h1 {
						font-size: 25;
					}
					
					.resident {
						width:100%;
						/*border: 1px solid black; */
					}
						
					.resident tr {
						height:30px;
					}
					
					.column {
						width:100%; 
						border: 1px solid black; 
						border-collapse: collapse;
					}					
					
					.column td {
						padding: 5px; /* Поля вокруг содержимого ячеек */
						border: 1px solid black; /* Граница вокруг ячеек */
					}
					
					.tab {
						width: 20px;	
					}
					
				</style>
			</head>
			<body>
				<div class="page">
					<table width="100%">
						<tbody>
							<tr align="center" valign="middle">
								<td style="border:1px solid;">
									<xsl:value-of select="cmo:BankName"/>
								</td>
							</tr>
							<tr align="center" valign="middle">
								<td>
								Наименование банка ПС
							</td>
							</tr>
						</tbody>
					</table>
					<span>
						<xsl:text>Уникальный номер контракта </xsl:text>
						<xsl:apply-templates select="cmo:PSNumber"/>
						<span class="tab"/>
						<xsl:if test="cmo:Date">
							<xsl:text> от </xsl:text>
							<xsl:call-template name="russian_date_gtd">
								<xsl:with-param name="dateIn" select="cmo:Date"/>
							</xsl:call-template>
						</xsl:if>
					</span>
					<xsl:call-template name="Resident">
						<xsl:with-param name="value" select="cmo:ResidentInfo"/>
						<xsl:with-param name="punkt" select="number(1)"/>
					</xsl:call-template>
					<xsl:if test="cmo:NonresidentInfo">
						<p>
							<b>2. Реквизиты нерезидента (нерезидентов)</b>
						</p>
						<table class="column">
							<tr>
								<td rowspan="2">Наименование</td>
								<td colspan="2">Страна</td>
							</tr>
							<tr>
								<td>наименование</td>
								<td>код</td>
							</tr>
							<xsl:apply-templates select="cmo:NonresidentInfo"/>
						</table>
					</xsl:if>
					<p>
						<b>3. Общие сведения о контракте</b>
					</p>
					<table class="column">
						<tr>
							<td rowspan="2">N</td>
							<td rowspan="2">Дата</td>
							<td colspan="2">Валюта контракта</td>
							<td rowspan="2">Сумма контракта</td>
							<td rowspan="2" style="width:30%">Дата завершения исполнения обязательств по контракту</td>
						</tr>
						<tr>
							<td>Наименование</td>
							<td>Код</td>
						</tr>
						<xsl:apply-templates select="cmo:CommonContractInfo"/>
					</table>
					<xsl:if test="cmo:AdditionalInfo">
						<p>
							<b>4. Сведения о постановке на учет, переводе и снятии с учета контракта</b>
						</p>
						<table class="column">
							<tr align="center">
								<td style="width:5%">N п/п</td>
								<td>Регистрационный номер банка УК</td>
								<td>Дата принятия паспорта сделки при его переводе</td>
								<td>Дата закрытия паспорта сделки при его переводе</td>
								<td>Основание закрытия паспорта сделки</td>
							</tr>
							<tr align="center">
								<td>1</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td>5</td>
							</tr>
							<xsl:apply-templates select="cmo:AdditionalInfo"/>
						</table>
					</xsl:if>
					<xsl:if test="cmo:UpdatingInfo">
						<p>
							<b>5. Сведения о внесении изменений в раздел I "Учетная информация"</b>
						</p>
						<table class="column">
							<tr>
								<td rowspan="2">N п/п</td>
								<td rowspan="2">Дата</td>
								<td colspan="2">Документ на основании которого внесены изменения в раздел I "Учетная информация"</td>
							</tr>
							<tr>
								<td>N</td>
								<td>дата</td>
							</tr>
							<xsl:for-each select="cmo:UpdatingInfo">
								<xsl:sort select="cmo:Number"/>
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</table>
					</xsl:if>
					<xsl:if test="cmo:PreviousPSNumber">
						<table style="width:100%; margin-top:20px;">
							<tr>
								<td style="width:50%">
									<b>6. Сведения о ранее присвоенном контракту уникальном номере</b>
								</td>
								<td align="right">
									<xsl:apply-templates select="cmo:PreviousPSNumber"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<!--p>
						<b>7. Справочная информация</b>
					</p>
					<xsl:apply-templates select="cmo:DocumentRegistrationType"/>
					<xsl:apply-templates select="cmo:CompletedDocumentType"/-->
					<table style="width:100%; margin-top: 20px;">
						<tbody>
							<tr valign="top">
								<td width="30%">
									<b>7. Особые условия контракта</b>
								</td>
								<td width="25%">
									7.1. Признак наличия в контракте условий, соответствующих пункту 8.5 настоящей Инструкции
								</td>
								<td>
									<div style="width:10mm;height:10mm;border: 1px solid black;"> </div>
								</td>
								<td width="25%">
									7.2. Код периодичности платежей
								</td>
								<td>
									<div style="width:10mm;height:10mm;border: 1px solid black;"> </div>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:call-template name="Resident">
						<xsl:with-param name="value" select="cmo:GrantResident"/>
						<xsl:with-param name="punkt" select="number(8)"/>
					</xsl:call-template>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="cmo:DocumentRegistrationType">
		<table style="width:100%; margin-top:20px;">
			<tr>
				<td style="width:70%">7.1. Способ и дата представления резидентом документов для оформления (переоформления, принятия на обслуживание, закрытия) паспорта сделки</td>
				<td>
					<xsl:if test="cmo:DocumentType='1'">
						<td align="right" style="width:5%">1</td>
					</xsl:if>
					<xsl:if test="cmo:DocumentType='2'">
						<td align="right" style="width:5%">2</td>
					</xsl:if>
				</td>
				<td align="right" style="width:15%">
					<xsl:call-template name="russian_date_gtd">
						<xsl:with-param name="dateIn" select="cmo:Date"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="cmo:CompletedDocumentType">
		<table style="width:100%; margin-top:20px;">
			<tr>
				<td style="width:70%">7.2 Способ и дата направления резиденту оформленного (переоформленного, принятого на обслуживание, закрытого) паспорта сделки</td>
				<td>
					<xsl:if test="cmo:DocumentType='1'">
						<td align="right" style="width:5%">1</td>
					</xsl:if>
					<xsl:if test="cmo:DocumentType='2'">
						<td align="right" style="width:5%">2</td>
					</xsl:if>
				</td>
				<td align="right" style="width:15%">
					<xsl:call-template name="russian_date_gtd">
						<xsl:with-param name="dateIn" select="cmo:Date"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="cmo:UpdatingInfo">
		<tr>
			<td>
				<xsl:value-of select="cmo:Number"/>
			</td>
			<td>
				<xsl:call-template name="russian_date_gtd">
					<xsl:with-param name="dateIn" select="cmo:Restructuring"/>
				</xsl:call-template>
			</td>
			<td>
				<xsl:value-of select="cmo:ReasonsDocuments/cat_ru:PrDocumentName"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="cmo:ReasonsDocuments/cat_ru:PrDocumentNumber"/>
			</td>
			<td>
				<xsl:call-template name="russian_date_gtd">
					<xsl:with-param name="dateIn" select="cmo:ReasonsDocuments/cat_ru:PrDocumentDate"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="cmo:AdditionalInfo">
		<tr>
			<td>
				<xsl:value-of select="position()"/>
			</td>
			<td>
				<xsl:value-of select="cmo:BankRegistrationNumber"/>/
				<xsl:value-of select="cmo:AffilianceRegistrationNumber"/>
			</td>
			<td>
				<xsl:call-template name="russian_date_gtd">
					<xsl:with-param name="dateIn" select="cmo:TransferDate"/>
				</xsl:call-template>
			</td>
			<td>
				<xsl:call-template name="russian_date_gtd">
					<xsl:with-param name="dateIn" select="cmo:ClosingDate"/>
				</xsl:call-template>
			</td>
			<td>
				<xsl:value-of select="cmo:ClosingReasons"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="cmo:CommonContractInfo">
		<tr>
			<td>
				<xsl:value-of select="cmo:Number"/>
			</td>
			<td>
				<xsl:call-template name="russian_date_gtd">
					<xsl:with-param name="dateIn" select="cmo:MostLaterDate"/>
				</xsl:call-template>
			</td>
			<td>
				<xsl:value-of select="cmo:CurrencyName"/>
			</td>
			<td>
				<xsl:value-of select="cmo:CurrencyCode"/>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="cmo:ContractSum">
						<xsl:value-of select="cmo:ContractSum"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="cmo:NonContractSum"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:call-template name="russian_date_gtd">
					<xsl:with-param name="dateIn" select="cmo:CompletionDate"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="cmo:NonresidentInfo">
		<tr>
			<td>
				<xsl:value-of select="cmo:Name"/>
			</td>
			<td>
				<xsl:value-of select="cmo:CountryName"/>
			</td>
			<td>
				<xsl:value-of select="cmo:CountryCode"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="cmo:PSNumber|cmo:PreviousPSNumber">
		<xsl:variable name="firstFour">
			<xsl:call-template name="yymm">
				<xsl:with-param name="reg" select="cmo:RegistrationPeriod"/>
			</xsl:call-template>
		</xsl:variable>
		<!--xsl:value-of select="cmo:PSSerialNumber"/>/<xsl:value-of select="cmo:BankRegistrationNumber"/>/<xsl:value-of select="cmo:AffiliateSerialNumber"/>/<xsl:value-of select="cmo:ContractCode"/>/<xsl:value-of select="cmo:ResidentSign"/-->
		
		<table style="display:inline-table; border-collapse: collapse;">
			<tbody>
				<tr align="center">
					<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($firstFour,1,1)"/></td>
					<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($firstFour,2,1)"/></td>
					<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($firstFour,3,1)"/></td>
					<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($firstFour,4,1)"/></td>
					<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring(cmo:PSSerialNumber,1,1)"/></td>
					<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring(cmo:PSSerialNumber,2,1)"/></td>
					<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring(cmo:PSSerialNumber,3,1)"/></td>
					<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring(cmo:PSSerialNumber,4,1)"/></td>
					<td style="border:1px solid black;width:4mm;">/</td>
					<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring(cmo:BankRegistrationNumber,1,1)"/></td>
					<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring(cmo:BankRegistrationNumber,2,1)"/></td>
					<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring(cmo:BankRegistrationNumber,3,1)"/></td>
					<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring(cmo:BankRegistrationNumber,4,1)"/></td>
					<td style="border:1px solid black;width:4mm;">/</td>
					<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring(cmo:AffiliateSerialNumber,1,1)"/></td>
					<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring(cmo:AffiliateSerialNumber,2,1)"/></td>
					<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring(cmo:AffiliateSerialNumber,3,1)"/></td>
					<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring(cmo:AffiliateSerialNumber,4,1)"/></td>
					<td style="border:1px solid black;width:4mm;">/</td>
					<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring(cmo:ContractCode,1,1)"/></td>
					<td style="border:1px solid black;width:4mm;">/</td>
					<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring(cmo:ResidentSign,1,1)"/></td>
					<td style="border:1px solid black;width:4mm;">/</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="Resident">
		<xsl:param name="value"/>
		<xsl:param name="punkt"/>
		<p>
			<b>
				<xsl:value-of select="$punkt"/> . Сведения о резиденте
				<xsl:if test="$punkt=8">
					<xsl:text>, которому уступаются требования (на которого переводится долг) по контракту</xsl:text>
				</xsl:if>
			</b>
		</p>
		<p>
			<xsl:value-of select="$punkt"/>.1. Наименование
			<xsl:value-of select="$value/cat_ru:OrganizationName"/>
			<xsl:if test="$value/cmo:AffiliateName != '' ">
				, <xsl:value-of select="$value/cmo:AffiliateName"/>
			</xsl:if>
		</p>
		<xsl:call-template name="RUAddress">
			<xsl:with-param name="value" select="$value/cmo:RUAddress"/>
			<xsl:with-param name="punkt" select="$punkt"/>
		</xsl:call-template>
		<xsl:call-template name="RFOrganizationFeatures">
			<xsl:with-param name="value" select="$value/RUScat_ru:RFOrganizationFeatures"/>
			<xsl:with-param name="punkt" select="$punkt"/>
		</xsl:call-template>
		<xsl:if test="$punkt=8">
			<table width="100%">
				<tbody>
					<tr valign="top">
						<td width="30%">
							8.6. Справочно: N и дата документа, подтверждающего уступку требовани или перевод документа по контракту
						</td>
						<td align="right">
							<xsl:variable name="varDocDate">
								<xsl:call-template name="russian_date_gtd">
									<xsl:with-param name="dateIn" select="$value/cmo:DocGrant/cat_ru:PrDocumentDate"/>
								</xsl:call-template>
							</xsl:variable>
							<table style="display:inline-table; border-collapse: collapse;">
								<tbody>
									<tr align="center">
										<td style="border:1px solid black;width:28mm;"><xsl:value-of select="$value/cmo:DocGrant/cat_ru:PrDocumentNumber"/></td>
										<td style="width:4mm;"></td>
										<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varDocDate,1,1)"/></td>
										<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varDocDate,2,1)"/></td>
										<td style="border:1px solid black;width:4mm;">.</td>
										<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varDocDate,4,1)"/></td>
										<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varDocDate,5,1)"/></td>
										<td style="border:1px solid black;width:4mm;">.</td>
										<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varDocDate,7,1)"/></td>
										<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varDocDate,8,1)"/></td>
										<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varDocDate,9,1)"/></td>
										<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varDocDate,10,1)"/></td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="RFOrganizationFeatures">
		<xsl:param name="value"/>
		<xsl:param name="punkt"/>
		<table width="100%">
			<tbody>
				<tr>
					<td>
						<xsl:value-of select="$punkt"/>.3. Основной государственный регистрационный номер</td>
					<td align="right">
						<xsl:variable name="varOGRN">
							<xsl:choose>
								<xsl:when test="//cmo:AdditionalInfo/cmo:NotaryAttorneyRegNumber and (//cmo:AdditionalInfo/cmo:NotaryAttorneyRegNumber!='')">
									<xsl:value-of select="//cmo:AdditionalInfo/cmo:NotaryAttorneyRegNumber"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$value/cat_ru:OGRN"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<table style="display:inline-table; border-collapse: collapse;">
							<tbody>
								<tr align="center">
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRN,1,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRN,2,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRN,3,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRN,4,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRN,5,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRN,6,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRN,7,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRN,8,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRN,9,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRN,10,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRN,11,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRN,12,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRN,13,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRN,14,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRN,15,1)"/></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$punkt"/>.4. Дата внесения записи в государственный реестр
					</td>
					<td align="right">
						<xsl:variable name="varOGRNdate">
							<xsl:call-template name="russian_date_gtd">
								<xsl:with-param name="dateIn" select="$value/../cmo:ORGNDate"/>
							</xsl:call-template>
						</xsl:variable>
						<table style="display:inline-table; border-collapse: collapse;">
							<tbody>
								<tr align="center">
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRNdate,1,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRNdate,2,1)"/></td>
									<td style="border:1px solid black;width:4mm;">.</td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRNdate,4,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRNdate,5,1)"/></td>
									<td style="border:1px solid black;width:4mm;">.</td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRNdate,7,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRNdate,8,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRNdate,9,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($varOGRNdate,10,1)"/></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$punkt"/>.5. ИНН / КПП</td>
					<td align="right">
						<table style="display:inline-table; border-collapse: collapse;">
							<tbody>
								<tr align="center">
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($value/cat_ru:INN,1,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($value/cat_ru:INN,2,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($value/cat_ru:INN,3,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($value/cat_ru:INN,4,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($value/cat_ru:INN,5,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($value/cat_ru:INN,6,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($value/cat_ru:INN,7,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($value/cat_ru:INN,8,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($value/cat_ru:INN,9,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($value/cat_ru:INN,10,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($value/cat_ru:INN,11,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($value/cat_ru:INN,12,1)"/></td>
									<td style="border:1px solid black;width:4mm;">/</td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($value/cat_ru:KPP,1,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($value/cat_ru:KPP,2,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($value/cat_ru:KPP,3,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($value/cat_ru:KPP,4,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($value/cat_ru:KPP,5,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($value/cat_ru:KPP,6,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($value/cat_ru:KPP,7,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($value/cat_ru:KPP,8,1)"/></td>
									<td style="border:1px solid black;width:4mm;"><xsl:value-of select="substring($value/cat_ru:KPP,9,1)"/></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="RUAddress" match="cmo:RUAddress">
		<xsl:param name="value"/>
		<xsl:param name="punkt"/>
		<table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
			<tbody>
				<tr valign="top">
					<td>
						<p>
							<xsl:value-of select="$punkt"/>.2. Адрес:</p>
					</td>
					<td>
						<table class="resident">
							<tr>
								<td style="width:10%"/>
								<td style="width:40%">Субъект Российской Федерации</td>
								<td style="border:1px solid;">
									<xsl:value-of select="$value/RUScat_ru:CounryName"/>
								</td>
							</tr>
							<tr>
								<td style="width:10%"/>
								<td style="width:40%">Район</td>
								<td style="border:1px solid;">
									<xsl:value-of select="$value/RUScat_ru:Region"/>
								</td>
							</tr>
							<tr>
								<td/>
								<td>Город</td>
								<td style="border:1px solid;">
									<xsl:value-of select="$value/RUScat_ru:City"/>
								</td>
							</tr>
							<tr>
								<td/>
								<td>Населенный пункт</td>
								<td style="border:1px solid;">
							</td>
							</tr>
							<tr>
								<td/>
								<td>Улица (проспект, переулок и т.д.)</td>
								<td valign="top" style="border:1px solid;">
									<xsl:value-of select="$value/RUScat_ru:StreetHouse"/>
								</td>
							</tr>
							<tr align="right">
								<td colspan="2">
									<table cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
										<tbody>
											<tr>
												<td>Номер дома (владение)</td>
												<td style="border:1px solid; width:30%;"/>
											</tr>
										</tbody>
									</table>
								</td>
								<td>
									<table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
										<tbody>
											<tr>
												<td width="40%">корпус (строение)</td>
												<td width="10%" style="border:1px solid;"/>
												<td width="40%">офис (квартира)</td>
												<td width="10%" style="border:1px solid;"/>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="yymm">
		<xsl:param name="reg"/>
		<xsl:choose>
			<xsl:when test="substring($reg,5,1)='-' ">
				<xsl:value-of select="substring($reg,3,2)"/>
				<xsl:value-of select="substring($reg,6,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$reg"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
