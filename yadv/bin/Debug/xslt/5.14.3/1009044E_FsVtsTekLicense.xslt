<?xml version="1.0" encoding="UTF-8"?>
<!-- бланк 1: 	Указ президента РФ от 10.09.2005 № 1062-ч7 Приложение №1 к Положению о порядке лицензирования в РФ ввоза  вывоза продукции военного назначения; 
					Письмо ФТС №14-153/46547 от 14.09.2016 Приложение №6 -->
<!-- бланк 2: 	Постановление правительства РФ от 15.09.2008 № 691 Приложение №2 к Положению о лицензировании внешнеэкономических операций с товарами, информацией, работами, услугами, результатами интеллектуальной деятельности (правами на них), в отношении которых установлен экспортный контроль;
					Письмо ФТС №14-153/46547 от 14.09.2016 Приложение №3 -->
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:vtstek="urn:customs.ru:Information:SQDocuments:FsVtsTekLicense:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:template name="russian_date">
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
	<xsl:template name="russian_month_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>"</xsl:text>
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>" </xsl:text>
				<xsl:variable name="month" select="substring($dateIn,6,2)"/>
				<xsl:choose>
					<xsl:when test="$month='01'">января</xsl:when>
					<xsl:when test="$month='02'">февраля</xsl:when>
					<xsl:when test="$month='03'">марта</xsl:when>
					<xsl:when test="$month='04'">апреля</xsl:when>
					<xsl:when test="$month='05'">мая</xsl:when>
					<xsl:when test="$month='06'">июня</xsl:when>
					<xsl:when test="$month='07'">июля</xsl:when>
					<xsl:when test="$month='08'">августа</xsl:when>
					<xsl:when test="$month='09'">сентября</xsl:when>
					<xsl:when test="$month='10'">октября</xsl:when>
					<xsl:when test="$month='11'">ноября</xsl:when>
					<xsl:when test="$month='12'">декабря</xsl:when>
				</xsl:choose>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="date_time">
		<xsl:param name="dateTimeIn"/>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring($dateTimeIn,12,5)"/>
	</xsl:template>
	<xsl:template match="vtstek:FsVtsTekLicense">
		<html>
			<head>
				<title>
					<xsl:choose>
						<xsl:when test="vtstek:KindLicense='1'">Лицензия ФСВТС России</xsl:when>
						<xsl:when test="vtstek:KindLicense='2'">Лицензия ФСТЭК России</xsl:when>
						<xsl:otherwise>Лицензия ФСВТС России / Лицензия ФСТЭК России</xsl:otherwise>
					</xsl:choose>
				</title>
				<!--meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/-->
				<style type="text/css">
			body {
				background: #cccccc;
			}

			div.page {
				width: 210mm;
				max-width: 210mm;
				margin: auto;
				margin-top: 6pt;
				margin-bottom: 6pt;
				padding: 10mm;
				background: #ffffff;
				border: solid 1pt #000000;
			}
			
			div.album_page {
				width: 297mm;
				margin: auto;
				margin-top: 6pt;
				margin-bottom: 6pt;
				padding: 10mm;
				background: #ffffff;
				border: solid 1pt #000000;
			}

			h3 {
				text-align:center;
				font: 20 ;
				font-family: Arial, serif;
			}
			
			.remark {
				text-align:right;
				font: 15;
				font-family: Arial, serif;
				text-decoration: underline;
			}
			
			.header {
				
				margin-top:20px;
				font: bold;
				
			}
			
			 table {
				width: 100%;
				border: 0;
				empty-cells: show;
				border-collapse: collapse;
				margin-top: 1px;
			}

			table.FsTek td {
				border: 1px solid;
				font-family: Arial;
				font-size:10pt;
				vertical-align:top;
			}
			
			.low {
				font: 12;
				font-family: Arial, serif;
			}
			
			.auxiliary tbody tr td {
				border: 0;
			}
		</style>
			</head>
			<body>
				<xsl:if test="not(vtstek:KindLicense) or vtstek:KindLicense='2'">
					<div class="page">
						<h3>РОССИЙСКАЯ ФЕДЕРАЦИЯ</h3>
						<table style="border:1px solid;" class="w190 FsTek">
							<tbody>
								<tr align="center" style="height:15mm;">
									<td colspan="2" valign="middle" style="font-size:12pt;"><b><br/>Федеральная служба по техническому и экспортному контролю</b></td>
								</tr>
								<tr>
									<td width="50%">1. Заявитель
										<br/>
										(наименование и адрес)
										<br/>
										<xsl:apply-templates select="vtstek:LicenseOwner/RUScat_ru:OrganizationName"/>
										<xsl:if test="not(vtstek:LicenseOwner/RUScat_ru:OrganizationName)"><xsl:value-of select="vtstek:LicenseOwner/RUScat_ru:ShortName"/></xsl:if>
										<br/>
										<xsl:value-of select="vtstek:LicenseOwner/RUScat_ru:Address"/>
									</td>
									<td width="50%">
										<table width="100%" cellpadding="0" cellspacing="0">
											<tbody>
												<tr>
													<td style="border-top:0; border-left:0; border-right:0; border-bottom:1px solid;">
														<b>2. Лицензия № <xsl:value-of select="vtstek:License/cat_ru:PrDocumentNumber"/></b>
														<xsl:choose>
															<xsl:when test="vtstek:License/vtstek:Status=1"><span> (действует)</span></xsl:when>
															<xsl:when test="vtstek:License/vtstek:Status=2"><span style="color: red"> (аннулирована)</span></xsl:when>
															<xsl:when test="vtstek:License/vtstek:Status=3"><span style="color: red"> (действие приостановлено)</span></xsl:when>
															<xsl:when test="vtstek:License/vtstek:Status=4"><span> (действие возобновлено)</span></xsl:when>
															<xsl:when test="vtstek:License/vtstek:Status=5"><span> (действие завершено)</span></xsl:when>
														</xsl:choose>
													</td>
												</tr>
												<tr>
													<td style="border-top:0; border-left:0; border-right:0; border-bottom:1px solid;">
														3. Тип лицензии<br/>
														<xsl:choose>
															<xsl:when test="vtstek:License/vtstek:LicenseTypeKod='0'">разовая экспорт</xsl:when>
															<xsl:when test="vtstek:License/vtstek:LicenseTypeKod='1'">разовая импорт</xsl:when>
															<xsl:when test="vtstek:License/vtstek:LicenseTypeKod='2'">генеральная</xsl:when>
														</xsl:choose>
													</td>
												</tr>
												<tr>
													<td style="border:0;">
														4. Срок действия лицензии
														<br/>
														до <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="vtstek:License/vtstek:EndDate"/></xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										5. Покупатель/продавец
										<br/>
										(наименование и адрес)
										<br/>
										<xsl:apply-templates select="vtstek:ImpExp/RUScat_ru:OrganizationName"/>
										<xsl:if test="not(vtstek:ImpExp/RUScat_ru:OrganizationName)"><xsl:value-of select="vtstek:ImpExp/RUScat_ru:ShortName"/></xsl:if>
										<br/>
										<xsl:value-of select="vtstek:ImpExp/RUScat_ru:Address"/>
									</td>
									<td>
										<table width="100%" cellpadding="0" cellspacing="0">
											<tbody>
												<tr>
													<td style="border-top:0; border-left:0; border-right:0; border-bottom:1px solid;">
														6. Контракт (договор)
														<br/>
														<xsl:if test="vtstek:ContractDetails/vtstek:Date">
															от <xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="vtstek:ContractDetails/vtstek:Date"/>
																</xsl:call-template>
															&#160;	
														</xsl:if>	
														№ <xsl:value-of select="vtstek:ContractDetails/vtstek:Number"/>
														<xsl:if test="vtstek:ContractDetails/vtstek:ExpirationDate">
															&#160;(действует до 
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="vtstek:ContractDetails/vtstek:ExpirationDate"/>
															</xsl:call-template>)
														</xsl:if>
													</td>
												</tr>
												<tr>
													<td style="border-top:0; border-left:0; border-right:0; border-bottom:1px solid;">
														7. Страна происхождения
														<br/>
														<xsl:value-of select="vtstek:CountryOrigin"/>
													</td>
												</tr>
												<tr>
													<td style="border:0;">
														8. Страна покупателя/продавца
														<br/>
														<xsl:value-of select="vtstek:CountryDeparture"/>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										9. Конечный пользователь
										<br/>
										(наименование и адрес)
										<br/>
										<xsl:apply-templates select="vtstek:EndUser/RUScat_ru:OrganizationName"/>
										<xsl:if test="not(vtstek:EndUser/RUScat_ru:OrganizationName)"><xsl:value-of select="vtstek:EndUser/RUScat_ru:ShortName"/></xsl:if>
										<br/>
										<xsl:value-of select="vtstek:EndUser/RUScat_ru:Address"/>
									</td>
									<td>
										<table width="100%" cellpadding="0" cellspacing="0">
											<tbody>
												<tr>
													<td style="border-top:0; border-left:0; border-right:0; border-bottom:1px solid;">
														10. Страна конечного пользователя
														<br/>
														<xsl:value-of select="vtstek:CountryEndUse"/>
													</td>
												</tr>
												<tr>
													<td style="border:0;">
														11. Страна (страны) транзита
														<br/>
														<xsl:text> - </xsl:text>
														<!--xsl:value-of select="vtstek:CountryDeparture"/-->
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										12. Наименование и характеристика (описание) продукции
										<br/>
										<xsl:for-each select="vtstek:GoodsDescription">
											<xsl:for-each select="vtstek:GoodsDescription">
												<xsl:value-of select="."/>
											</xsl:for-each>
											<xsl:if test="vtstek:ProductDetail"><br/><xsl:value-of select="vtstek:ProductDetail"/></xsl:if>
										</xsl:for-each>
									</td>
									<td>
										<table width="100%">
											<tbody>
												<tr>
													<td colspan="2" style="border-left:0;border-top:0;border-right:1px solid; border-bottom:1px solid;">
														13. Код ТН ВЭД ЕАЭС
														<br/>
														<xsl:value-of select="vtstek:GoodsDescription/vtstek:GoodsTNVEDCode"/>
													</td>
													<td colspan="2" style="border-left:0;border-top:0;border-right:1px solid; border-bottom:1px solid;">
														14. Код Списка
														<br/>
													</td>
													<td colspan="2" style="border-left:0;border-top:0;border-right:0; border-bottom:1px solid;">
														15. Позиция списка
														<br/>
													</td>
												</tr>
												<tr>
													<td colspan="3" style="border-left:0;border-top:0;border-right:1px solid; border-bottom:1px solid;">
														16. Единица измерения
														<br/>
														<xsl:value-of select="vtstek:GoodsDescription/vtstek:Quantity/RUScat_ru:MeasureUnitQualifierName"/>
														<xsl:if test="vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:MeasureUnitQualifierName">														
															<xsl:choose>
																<xsl:when test="not (vtstek:GoodsDescription/vtstek:Quantity/RUScat_ru:MeasureUnitQualifierName)">
																	<br/><xsl:value-of select="vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:MeasureUnitQualifierName"/>
																</xsl:when>
																<xsl:when test="(vtstek:GoodsDescription/vtstek:Quantity/RUScat_ru:MeasureUnitQualifierName) and 
																						 (vtstek:GoodsDescription/vtstek:Quantity/RUScat_ru:MeasureUnitQualifierName!=vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:MeasureUnitQualifierName)">
																	<br/><xsl:value-of select="vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:MeasureUnitQualifierName"/>
																</xsl:when>
																<xsl:when test="(vtstek:GoodsDescription/vtstek:Quantity/RUScat_ru:GoodsQuantity) and (vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:GoodsQuantity)
																						 and (vtstek:GoodsDescription/vtstek:Quantity/RUScat_ru:GoodsQuantity!=vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:GoodsQuantity)">
																	<br/><xsl:value-of select="vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:MeasureUnitQualifierName"/>
																</xsl:when>
																<xsl:when test="(vtstek:GoodsDescription/vtstek:Quantity/RUScat_ru:GoodsQuantity) and
																                         not(vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:GoodsQuantity)">
																	<br/><xsl:value-of select="vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:MeasureUnitQualifierName"/>
																</xsl:when>
																<xsl:when test="not(vtstek:GoodsDescription/vtstek:Quantity/RUScat_ru:GoodsQuantity) and
																                         (vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:GoodsQuantity)">
																	<br/><xsl:value-of select="vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:MeasureUnitQualifierName"/>
																</xsl:when>
															</xsl:choose>
														</xsl:if>
													</td>
													<td colspan="3" style="border-left:0;border-top:0;border-right:0; border-bottom:1px solid;">
														17. Количество
														<br/>
														<xsl:value-of select="vtstek:GoodsDescription/vtstek:Quantity/RUScat_ru:GoodsQuantity"/>
														<xsl:if test="vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:GoodsQuantity">														
															<xsl:choose>
																<xsl:when test="not (vtstek:GoodsDescription/vtstek:Quantity/RUScat_ru:GoodsQuantity)">
																	<br/><xsl:value-of select="vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:GoodsQuantity"/>
																</xsl:when>
																<xsl:when test="(vtstek:GoodsDescription/vtstek:Quantity/RUScat_ru:GoodsQuantity) and 
																						 (vtstek:GoodsDescription/vtstek:Quantity/RUScat_ru:GoodsQuantity!=vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:GoodsQuantity)">
																	<br/><xsl:value-of select="vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:GoodsQuantity"/>
																</xsl:when>
																<xsl:when test="(vtstek:GoodsDescription/vtstek:Quantity/RUScat_ru:MeasureUnitQualifierName) and (vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:MeasureUnitQualifierName)
																						 and (vtstek:GoodsDescription/vtstek:Quantity/RUScat_ru:MeasureUnitQualifierName!=vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:MeasureUnitQualifierName)">
																	<br/><xsl:value-of select="vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:GoodsQuantity"/>
																</xsl:when>
																<xsl:when test="(vtstek:GoodsDescription/vtstek:Quantity/RUScat_ru:MeasureUnitQualifierName) and
																                         not(vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:MeasureUnitQualifierName)">
																	<br/><xsl:value-of select="vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:GoodsQuantity"/>
																</xsl:when>
																<xsl:when test="not(vtstek:GoodsDescription/vtstek:Quantity/RUScat_ru:MeasureUnitQualifierName) and
																                         (vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:MeasureUnitQualifierName)">
																	<br/><xsl:value-of select="vtstek:GoodsDescription/vtstek:SupplementaryQuantity/RUScat_ru:GoodsQuantity"/>
																</xsl:when>
															</xsl:choose>
														</xsl:if>
													</td>
												</tr>
												<tr>
													<td colspan="3" style="border-left:0;border-top:0;border-right:1px solid; border-bottom:0;">
														18. Валюта контракта
														<br/>
														<xsl:value-of select="vtstek:ContractCurrency"/>
													</td>
													<td colspan="3" style="border-left:0;border-top:0;border-right:0; border-bottom:0;">
														19. Статистическая стоимость
														<br/>
														<xsl:value-of select="vtstek:GoodsDescription/vtstek:StatisticalCost"/>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										20. Конечное использование продукции
										<br/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										21. Основание для выдачи лицензии
										<br/>
										<xsl:value-of select="vtstek:LisenceIssue"/>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										22. Дополнительная информация для целей контроля
										<br/>
										<xsl:value-of select="vtstek:AdditionalInfo"/>
									</td>
								</tr>
								<tr>
									<td>
										23. Таможенный орган Российской Федерации
										<br/>
										<xsl:value-of select="vtstek:AuthorizedPerson/vtstek:CustomsCode"/>
									</td>
									<td>
										24. Уполномоченное лицо, выдавшее лицензию
										<br/><br/>
										Ф.И.О.: <xsl:value-of select="vtstek:AuthorizedPerson/vtstek:FIO"/>
										<br/><br/>
										Должность: <xsl:value-of select="vtstek:AuthorizedPerson/vtstek:PersonPost"/>
										<br/><br/><br/>
										Подпись, печать <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text><xsl:call-template name="russian_month_date"><xsl:with-param name="dateIn" select="vtstek:License/vtstek:BeginDate"/></xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--div class="page">
						<h4 align="right">
							Приложение №1<br/>к лицензии ФСТЭК России<br/>
							<xsl:for-each select="vtstek:License">
								от&#32;
								<xsl:choose>
									<xsl:when test="cat_ru:PrDocumentDate">
										<u>&#32;
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
										</xsl:call-template>
										&#32;</u>
									</xsl:when>
									<xsl:otherwise>"___"___________20__г.</xsl:otherwise>
								</xsl:choose>
								&#160;№&#32; 
								<xsl:choose>
									<xsl:when test="cat_ru:PrDocumentNumber"><u>&#32;<xsl:value-of select="cat_ru:PrDocumentNumber"/>&#32;</u></xsl:when>
									<xsl:otherwise>_____</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</h4>
						<table>
							<tr align="center">
								<td style="border: 1px solid gray">№ п/п</td>
								<td style="border: 1px solid gray">Наименование товара / страны</td>
								<td style="border: 1px solid gray">Обозначение (ГОСТ, ТУ, артикул, серийный номер и др.)</td>
								<td style="border: 1px solid gray">Количество продукции, ед.изм.</td>
							</tr>
							<tr align="center">
								<td style="border: 1px solid gray">1</td>
								<td style="border: 1px solid gray">2</td>
								<td style="border: 1px solid gray">3</td>
								<td style="border: 1px solid gray">4</td>
							</tr>
							<xsl:for-each select="vtstek:GoodsDescription">
								<tr>
									<td style="border: 1px solid gray">1.</td>
									<td style="border: 1px solid gray">
										<xsl:apply-templates select="vtstek:GoodsDescription"/>
										<xsl:if test="../vtstek:CountryOrigin"> / <xsl:value-of select="../vtstek:CountryOrigin"/></xsl:if>
									</td>
									<td style="border: 1px solid gray"><xsl:value-of select="vtstek:ProductDetail"/></td>
									<td style="border: 1px solid gray">
										<xsl:apply-templates select="vtstek:Quantity"/>
										<xsl:if test="vtstek:SupplementaryQuantity">; <xsl:apply-templates select="vtstek:SupplementaryQuantity"/></xsl:if>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</div-->
				</xsl:if>
				<xsl:if test="vtstek:KindLicense='1'">
					<div class="page" style="font-family: Courier New;">
						<table class="w190">
							<tbody>
								<tr align="center">
									<td>
										ЛИЦЕНЗИЯ
										<br/>
										№ <xsl:value-of select="vtstek:License/cat_ru:PrDocumentNumber"/>
										<xsl:choose>
											<xsl:when test="vtstek:License/vtstek:Status=1"><span> (действует)</span></xsl:when>
											<xsl:when test="vtstek:License/vtstek:Status=2"><span style="color: red"> (аннулирована)</span></xsl:when>
											<xsl:when test="vtstek:License/vtstek:Status=3"><span style="color: red"> (действие приостановлено)</span></xsl:when>
											<xsl:when test="vtstek:License/vtstek:Status=4"><span> (действие возобновлено)</span></xsl:when>
											<xsl:when test="vtstek:License/vtstek:Status=5"><span> (действие завершено)</span></xsl:when>
										</xsl:choose>
										<br/>
										на ввоз (вывоз) продукции военного назначения
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<table width="100%">
											<tr>
												<td style="width:20mm">Из (в)</td>
												<td style="border-bottom:1px solid;"><xsl:value-of select="vtstek:CountryDeparture"/></td>
											</tr>
											<tr align="center">
												<td/>
												<td style="font-size:8pt">(наименование иностранного государства)</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tr>
												<td style="width:20mm">Выдана</td>
												<td style="border-bottom:1px solid;">
													<xsl:for-each select="vtstek:LicenseOwner">
														<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
														<xsl:if test="not(RUScat_ru:OrganizationName)"><xsl:value-of select="RUScat_ru:ShortName"/></xsl:if>
														<xsl:if test="RUScat_ru:Address">
															<xsl:text>, </xsl:text>
															<xsl:value-of select="RUScat_ru:Address"/>
														</xsl:if>
													</xsl:for-each>
												</td>
											</tr>
											<tr align="center">
												<td/>
												<td style="font-size:8pt">(наименование и юридический адрес организации-заявителя)</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tr>
												<td style="width:40mm">по заявлению от</td>
												<td style="width:80mm;border-bottom:1px solid;">&#160;</td>
												<td style="width:10mm" align="center">№</td>
												<td style="border-bottom:1px solid;">&#160;</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tr>
												<td style="width:45mm">в соответствии с</td>
												<td style="border-bottom:1px solid;">
													<xsl:for-each select="vtstek:ContractDetails">
														№ <xsl:value-of select="vtstek:Number"/>&#160;
														<xsl:if test="vtstek:Date">
															от <xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="vtstek:Date"/>
																</xsl:call-template>
															&#160;
														 </xsl:if>
														<xsl:if test="vtstek:ExpirationDate">
															срок действия <xsl:call-template name="russian_date">
																						<xsl:with-param name="dateIn" select="vtstek:Date"/>
																					</xsl:call-template>
														</xsl:if>
													</xsl:for-each>
												</td>
											</tr>
											<tr align="center">
												<td/>
												<td style="font-size:8pt">(контракт, дополнительное соглашение, номер, дата и т.д.)</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tr>
												<td style="width:52mm">Категория продукции:</td>
												<td style="border-bottom:1px solid;"><xsl:value-of select="vtstek:GoodsDescription/vtstek:ProductDetail"/></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tr>
												<td style="width:83mm">Стоимость продукции по лицензии:</td>
												<td style="border-bottom:1px solid;"><xsl:value-of select="vtstek:GoodsDescription/vtstek:CustomsCost"/></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tr>
												<td style="width:48mm">Действительна до:</td>
												<td style="border-bottom:1px solid;">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="vtstek:License/vtstek:EndDate"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr align="center">
												<td/>
												<td style="font-size:8pt">(число, месяц, год)</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tr>
												<td style="width:62mm">Срок возврата продукции:</td>
												<td style="border-bottom:1px solid;">&#160;</td>
											</tr>
											<tr align="center">
												<td/>
												<td style="font-size:8pt">(число, месяц, год)</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tr>
												<td style="width:53mm">Выдана на основании:</td>
												<td style="border-bottom:1px solid;"><xsl:value-of select="vtstek:LisenceIssue"/></td>
											</tr>
											<tr align="center">
												<td/>
												<td style="font-size:8pt">(Решение Президента Российской Федерации, Правительства Российской Федерации <br/>или Федеральной службыпо военно-техническому сотрудничеству)</td>
											</tr>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table class="w190">
							<tr valign="top">
								<td width="30%">
									<xsl:call-template name="russian_month_date"><xsl:with-param name="dateIn" select="vtstek:License/cat_ru:PrDocumentDate"/></xsl:call-template>
								</td>
								<td width="70%" style="border-bottom:1px solid;" align="center">
									<xsl:if test="vtstek:AuthorizedPerson/vtstek:PersonPost"><xsl:value-of select="vtstek:AuthorizedPerson/vtstek:PersonPost"/>, </xsl:if>
									<xsl:value-of select="vtstek:AuthorizedPerson/vtstek:FIO"/>
								</td>
							</tr>
							<tr valign="top">
								<td/>
								<td style="font-size:8pt" align="center">(должность, Ф.И.О., подпись)</td>
							</tr>
							<tr>
								<td/>
								<td><br/>М.П.</td>
							</tr>
						</table>
						<br/><br/>
					</div>
					<div class="page" style="font-family: Courier New;">
						<h4 align="right">
							Приложение № 1<br/>
							к лицензии ФСВТС России&#32; 
							<xsl:for-each select="vtstek:License">
								№&#32; 
								<xsl:choose>
									<xsl:when test="cat_ru:PrDocumentNumber"><u>&#32;<xsl:value-of select="cat_ru:PrDocumentNumber"/>&#32;</u></xsl:when>
									<xsl:otherwise>___ </xsl:otherwise>
								</xsl:choose>
								<br/>на ввоз (вывоз) продукции<br/>военного назначения<br/>
							</xsl:for-each>
						</h4>
						<br/>
						<table>
							<tr>
								<td style="width:72mm">Производитель (разработчик):</td>
								<td style="border-bottom:1px solid;">
									<xsl:for-each select="vtstek:ImpExp">
										<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
										<xsl:if test="not(RUScat_ru:OrganizationName)"><xsl:value-of select="RUScat_ru:ShortName"/></xsl:if>
										<xsl:if test="RUScat_ru:Address">
											<xsl:text>, </xsl:text>
											<xsl:value-of select="RUScat_ru:Address"/>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr align="center">
								<td/>
								<td style="font-size:8pt">(наименование, юридический адрес)</td>
							</tr>
							<tr>
								<td style="width:72mm">Потребитель (получатель):</td>
								<td style="border-bottom:1px solid;">
									<xsl:for-each select="vtstek:EndUser">
										<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
										<xsl:if test="not(RUScat_ru:OrganizationName)"><xsl:value-of select="RUScat_ru:ShortName"/></xsl:if>
										<xsl:if test="RUScat_ru:Address">
											<xsl:text>, </xsl:text>
											<xsl:value-of select="RUScat_ru:Address"/>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr align="center">
								<td/>
								<td style="font-size:8pt">(наименование, юридический адрес)</td>
							</tr>
						</table>
						<br/>
						<table width="100%">
								<tr align="center">
									<td>Перечень<br/>продукции военного назначения</td>
								</tr>
						</table>
						<br/>
						<table class="FsTek" style="font-family:Courier New;font-size:10pt;">
							<tbody>
								<tr align="center" valign="top">
									<td width="45%">Наименование продукции военного назначения</td>
									<td width="35%">Категория продукции военного назначения</td>
									<td width="10%">Единица измерения</td>
									<td width="10%">Количество</td>
								</tr>
								<xsl:for-each select="vtstek:GoodsDescription">
									<tr>
										<td>
											<xsl:apply-templates select="vtstek:GoodsDescription"/>
										</td>
										<td><xsl:value-of select="vtstek:ProductDetail"/></td>
										<td align="center">
											<xsl:value-of select="vtstek:SupplementaryQuantity/RUScat_ru:MeasureUnitQualifierName"/>
										</td>
										<td align="center">
											<xsl:value-of select="vtstek:SupplementaryQuantity/RUScat_ru:GoodsQuantity"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
						<table>
							<tr>
								<td style="width:92mm">Стоимость продукции у производителя:</td>
								<td style="border-bottom:1px solid;"><xsl:value-of select="sum(vtstek:GoodsDescription/vtstek:StatisticalCost)"/> USD</td>
							</tr>
						</table>
						<table>	
							<tr>
								<td style="width:42mm">Особые условия:</td>
								<td style="border-bottom:1px solid;"><xsl:value-of select="vtstek:AdditionalInfo"/></td>
							</tr>
						</table>
						<br/>
						<table class="w190">
							<tr valign="top">
								<td width="30%">
									<xsl:call-template name="russian_month_date"><xsl:with-param name="dateIn" select="vtstek:License/cat_ru:PrDocumentDate"/></xsl:call-template>
								</td>
								<td width="70%" style="border-bottom:1px solid;" align="center">
									<xsl:if test="vtstek:AuthorizedPerson/vtstek:PersonPost"><xsl:value-of select="vtstek:AuthorizedPerson/vtstek:PersonPost"/>, </xsl:if>
									<xsl:value-of select="vtstek:AuthorizedPerson/vtstek:FIO"/>
								</td>
							</tr>
							<tr valign="top">
								<td/>
								<td style="font-size:8pt" align="center">(должность, Ф.И.О., подпись)</td>
							</tr>
							<tr>
								<td/>
								<td><br/>М.П.</td>
							</tr>
						</table>
						<br/><br/>
					</div>
				</xsl:if>
				<xsl:if test="vtstek:ConslusionsDocument">
					<div class="page">
						<table width="100%" class="w190 FsTek">
							<xsl:variable name="cnt_doc" select="count(vtstek:ConslusionsDocument)"/>
							<tr valign="top">
								<td>Электронные документы, прикрепленные к лицензии:</td>
							</tr>
							<tr valign="top">
								<td><br/></td>
							</tr>
							<xsl:for-each select="vtstek:ConslusionsDocument">
								<tr valign="top">
									<td>
										<xsl:if test="position() &gt; 1"><br/></xsl:if>
										<xsl:if test="$cnt_doc &gt; 1"><xsl:value-of select="position()"/><xsl:text>) </xsl:text></xsl:if>
										<xsl:value-of select="vtstek:DocumentName"/>&#160;
										добавлен <xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="vtstek:DocumentDate"/>
										</xsl:call-template>
										<br/>файл в БД: <xsl:value-of select="vtstek:DocumentNameBD"/>
										<br/>файл в выгрузке: <xsl:value-of select="vtstek:FileName"/>
										<xsl:if test="vtstek:FileData">
											<br/>Данные файла  в кодировке BASE64: есть
										</xsl:if>
									</td>
								</tr>
								<xsl:if test="vtstek:FileData">
									<xsl:variable name="lower">
										pngjeg
									</xsl:variable>
									 <xsl:variable name="upper">
										PNGJEG
									 </xsl:variable>
									<xsl:variable name="f_ex4">
										<xsl:value-of select="translate(substring(vtstek:DocumentNameBD,string-length(vtstek:DocumentNameBD)-3,4),$upper,$lower)"/>
									</xsl:variable>
									<xsl:variable name="f_ex5">
										<xsl:value-of select="translate(substring(vtstek:DocumentNameBD,string-length(vtstek:DocumentNameBD)-4,5),$upper,$lower)"/>
									</xsl:variable>
		
									<xsl:variable name="ftype">
										<xsl:choose>
											<xsl:when test="$f_ex4='.jpg' or $f_ex5='.jpeg'">
												<xsl:value-of select="'data:image/jpeg;base64,'"/>
											</xsl:when>
											<xsl:when test="$f_ex4='.png'">
												<xsl:value-of select="'data:image/png;base64,'"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="'button'"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="$ftype='button'">
											<tr valign="top">
												<td>
													<table width="190">
														<tbody>
															<tr>
																<td align="center">
																	<xsl:variable name="fileName" select="vtstek:DocumentNameBD"/>
											<xsl:for-each select="vtstek:FileData">
																		<input filename="{$fileName}" type="button" value="Просмотр" OnClick="1006110E" Hint="Просмотр содержимого файла"></input>
																		<div class="data" style="display:none;"><xsl:value-of select="."/></div>
																	</xsl:for-each>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</xsl:when>
										<xsl:otherwise>
											<tr valign="top">
												<td>
													<table width="190">
														<tbody>
															<tr>
																<td align="center">
																	<img>
																		<xsl:attribute name="src">
																			<xsl:value-of select="concat($ftype,vtstek:FileData)"/>
																		</xsl:attribute>
																	</img>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
							</xsl:for-each>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="vtstek:Quantity | vtstek:SupplementaryQuantity">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:if test="RUScat_ru:MeasureUnitQualifierName"> <xsl:value-of select="RUScat_ru:MeasureUnitQualifierName"/></xsl:if>
		<xsl:if test="RUScat_ru:MeasureUnitQualifierCode"> (код: <xsl:value-of select="RUScat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
	</xsl:template>
</xsl:stylesheet>
